// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package runtime

// This file contains the implementation of Go select statements.

import (
	"runtime/internal/sys"
	"unsafe"
)

// For gccgo, use go:linkname to rename compiler-called functions to
// themselves, so that the compiler will export them.
//
//go:linkname newselect runtime.newselect
//go:linkname selectdefault runtime.selectdefault
//go:linkname selectsend runtime.selectsend
//go:linkname selectrecv runtime.selectrecv
//go:linkname selectgo runtime.selectgo

const debugSelect = false

const (
	// scase.kind
	caseNil = iota
	caseRecv
	caseSend
	caseDefault
)

// Select statement header.
// Known to compiler.
// Changes here must also be made in src/cmd/internal/gc/select.go's selecttype.
type hselect struct {
	tcase     uint16   // total count of scase[]
	ncase     uint16   // currently filled scase[]
	pollorder *uint16  // case poll order
	lockorder *uint16  // channel lock order
	scase     [1]scase // one per case (in order of appearance)
}

// Select case descriptor.
// Known to compiler.
// Changes here must also be made in src/cmd/internal/gc/select.go's selecttype.
type scase struct {
	elem        unsafe.Pointer // data element
	c           *hchan         // chan
	pc          uintptr        // return pc (for race detector / msan)
	kind        uint16
	receivedp   *bool // pointer to received bool, if any
	releasetime int64
}

var (
	chansendpc = funcPC(chansend)
	chanrecvpc = funcPC(chanrecv)
)

func selectsize(size uintptr) uintptr {
	selsize := unsafe.Sizeof(hselect{}) +
		(size-1)*unsafe.Sizeof(hselect{}.scase[0]) +
		size*unsafe.Sizeof(*hselect{}.lockorder) +
		size*unsafe.Sizeof(*hselect{}.pollorder)
	return round(selsize, sys.Int64Align)
}

func newselect(sel *hselect, selsize int64, size int32) {
	if selsize != int64(selectsize(uintptr(size))) {
		print("runtime: bad select size ", selsize, ", want ", selectsize(uintptr(size)), "\n")
		throw("bad select size")
	}
	if size != int32(uint16(size)) {
		throw("select size too large")
	}
	sel.tcase = uint16(size)
	sel.ncase = 0
	sel.lockorder = (*uint16)(add(unsafe.Pointer(&sel.scase), uintptr(size)*unsafe.Sizeof(hselect{}.scase[0])))
	sel.pollorder = (*uint16)(add(unsafe.Pointer(sel.lockorder), uintptr(size)*unsafe.Sizeof(*hselect{}.lockorder)))

	// For gccgo the temporary variable will not have been zeroed.
	memclrNoHeapPointers(unsafe.Pointer(&sel.scase), uintptr(size)*unsafe.Sizeof(hselect{}.scase[0])+uintptr(size)*unsafe.Sizeof(*hselect{}.lockorder)+uintptr(size)*unsafe.Sizeof(*hselect{}.pollorder))

	if debugSelect {
		print("newselect s=", sel, " size=", size, "\n")
	}
}

func selectsend(sel *hselect, c *hchan, elem unsafe.Pointer) {
	pc := getcallerpc()
	i := sel.ncase
	if i >= sel.tcase {
		throw("selectsend: too many cases")
	}
	sel.ncase = i + 1
	if c == nil {
		return
	}
	cas := (*scase)(add(unsafe.Pointer(&sel.scase), uintptr(i)*unsafe.Sizeof(sel.scase[0])))
	cas.pc = pc
	cas.c = c
	cas.kind = caseSend
	cas.elem = elem

	if debugSelect {
		print("selectsend s=", sel, " pc=", hex(cas.pc), " chan=", cas.c, "\n")
	}
}

func selectrecv(sel *hselect, c *hchan, elem unsafe.Pointer, received *bool) {
	pc := getcallerpc()
	i := sel.ncase
	if i >= sel.tcase {
		throw("selectrecv: too many cases")
	}
	sel.ncase = i + 1
	if c == nil {
		return
	}
	cas := (*scase)(add(unsafe.Pointer(&sel.scase), uintptr(i)*unsafe.Sizeof(sel.scase[0])))
	cas.pc = pc
	cas.c = c
	cas.kind = caseRecv
	cas.elem = elem
	cas.receivedp = received

	if debugSelect {
		print("selectrecv s=", sel, " pc=", hex(cas.pc), " chan=", cas.c, "\n")
	}
}

func selectdefault(sel *hselect) {
	pc := getcallerpc()
	i := sel.ncase
	if i >= sel.tcase {
		throw("selectdefault: too many cases")
	}
	sel.ncase = i + 1
	cas := (*scase)(add(unsafe.Pointer(&sel.scase), uintptr(i)*unsafe.Sizeof(sel.scase[0])))
	cas.pc = pc
	cas.c = nil
	cas.kind = caseDefault

	if debugSelect {
		print("selectdefault s=", sel, " pc=", hex(cas.pc), "\n")
	}
}

func sellock(scases []scase, lockorder []uint16) {
	var c *hchan
	for _, o := range lockorder {
		c0 := scases[o].c
		if c0 != nil && c0 != c {
			c = c0
			lock(&c.lock)
		}
	}
}

func selunlock(scases []scase, lockorder []uint16) {
	// We must be very careful here to not touch sel after we have unlocked
	// the last lock, because sel can be freed right after the last unlock.
	// Consider the following situation.
	// First M calls runtime??park() in runtime??selectgo() passing the sel.
	// Once runtime??park() has unlocked the last lock, another M makes
	// the G that calls select runnable again and schedules it for execution.
	// When the G runs on another M, it locks all the locks and frees sel.
	// Now if the first M touches sel, it will access freed memory.
	for i := len(scases) - 1; i >= 0; i-- {
		c := scases[lockorder[i]].c
		if c == nil {
			break
		}
		if i > 0 && c == scases[lockorder[i-1]].c {
			continue // will unlock it on the next iteration
		}
		unlock(&c.lock)
	}
}

func selparkcommit(gp *g, _ unsafe.Pointer) bool {
	// This must not access gp's stack (see gopark). In
	// particular, it must not access the *hselect. That's okay,
	// because by the time this is called, gp.waiting has all
	// channels in lock order.
	var lastc *hchan
	for sg := gp.waiting; sg != nil; sg = sg.waitlink {
		if sg.c != lastc && lastc != nil {
			// As soon as we unlock the channel, fields in
			// any sudog with that channel may change,
			// including c and waitlink. Since multiple
			// sudogs may have the same channel, we unlock
			// only after we've passed the last instance
			// of a channel.
			unlock(&lastc.lock)
		}
		lastc = sg.c
	}
	if lastc != nil {
		unlock(&lastc.lock)
	}
	return true
}

func block() {
	gopark(nil, nil, "select (no cases)", traceEvGoStop, 1) // forever
}

// selectgo implements the select statement.
//
// *sel is on the current goroutine's stack (regardless of any
// escaping in selectgo).
//
// selectgo returns the index of the chosen scase, which matches the
// ordinal position of its respective select{recv,send,default} call.
func selectgo(sel *hselect) int {
	if debugSelect {
		print("select: sel=", sel, "\n")
	}
	if sel.ncase != sel.tcase {
		throw("selectgo: case count mismatch")
	}

	scaseslice := slice{unsafe.Pointer(&sel.scase), int(sel.ncase), int(sel.ncase)}
	scases := *(*[]scase)(unsafe.Pointer(&scaseslice))

	var t0 int64
	if blockprofilerate > 0 {
		t0 = cputicks()
		for i := 0; i < int(sel.ncase); i++ {
			scases[i].releasetime = -1
		}
	}

	// The compiler rewrites selects that statically have
	// only 0 or 1 cases plus default into simpler constructs.
	// The only way we can end up with such small sel.ncase
	// values here is for a larger select in which most channels
	// have been nilled out. The general code handles those
	// cases correctly, and they are rare enough not to bother
	// optimizing (and needing to test).

	// generate permuted order
	pollslice := slice{unsafe.Pointer(sel.pollorder), int(sel.ncase), int(sel.ncase)}
	pollorder := *(*[]uint16)(unsafe.Pointer(&pollslice))
	for i := 1; i < int(sel.ncase); i++ {
		j := fastrandn(uint32(i + 1))
		pollorder[i] = pollorder[j]
		pollorder[j] = uint16(i)
	}

	// sort the cases by Hchan address to get the locking order.
	// simple heap sort, to guarantee n log n time and constant stack footprint.
	lockslice := slice{unsafe.Pointer(sel.lockorder), int(sel.ncase), int(sel.ncase)}
	lockorder := *(*[]uint16)(unsafe.Pointer(&lockslice))
	for i := 0; i < int(sel.ncase); i++ {
		j := i
		// Start with the pollorder to permute cases on the same channel.
		c := scases[pollorder[i]].c
		for j > 0 && scases[lockorder[(j-1)/2]].c.sortkey() < c.sortkey() {
			k := (j - 1) / 2
			lockorder[j] = lockorder[k]
			j = k
		}
		lockorder[j] = pollorder[i]
	}
	for i := int(sel.ncase) - 1; i >= 0; i-- {
		o := lockorder[i]
		c := scases[o].c
		lockorder[i] = lockorder[0]
		j := 0
		for {
			k := j*2 + 1
			if k >= i {
				break
			}
			if k+1 < i && scases[lockorder[k]].c.sortkey() < scases[lockorder[k+1]].c.sortkey() {
				k++
			}
			if c.sortkey() < scases[lockorder[k]].c.sortkey() {
				lockorder[j] = lockorder[k]
				j = k
				continue
			}
			break
		}
		lockorder[j] = o
	}
	/*
		for i := 0; i+1 < int(sel.ncase); i++ {
			if scases[lockorder[i]].c.sortkey() > scases[lockorder[i+1]].c.sortkey() {
				print("i=", i, " x=", lockorder[i], " y=", lockorder[i+1], "\n")
				throw("select: broken sort")
			}
		}
	*/

	// lock all the channels involved in the select
	sellock(scases, lockorder)

	var (
		gp     *g
		sg     *sudog
		c      *hchan
		k      *scase
		sglist *sudog
		sgnext *sudog
		qp     unsafe.Pointer
		nextp  **sudog
	)

loop:
	// pass 1 - look for something already waiting
	var dfli int
	var dfl *scase
	var casi int
	var cas *scase
	for i := 0; i < int(sel.ncase); i++ {
		casi = int(pollorder[i])
		cas = &scases[casi]
		c = cas.c

		switch cas.kind {
		case caseNil:
			continue

		case caseRecv:
			sg = c.sendq.dequeue()
			if sg != nil {
				goto recv
			}
			if c.qcount > 0 {
				goto bufrecv
			}
			if c.closed != 0 {
				goto rclose
			}

		case caseSend:
			if raceenabled {
				racereadpc(unsafe.Pointer(c), cas.pc, chansendpc)
			}
			if c.closed != 0 {
				goto sclose
			}
			sg = c.recvq.dequeue()
			if sg != nil {
				goto send
			}
			if c.qcount < c.dataqsiz {
				goto bufsend
			}

		case caseDefault:
			dfli = casi
			dfl = cas
		}
	}

	if dfl != nil {
		selunlock(scases, lockorder)
		casi = dfli
		cas = dfl
		goto retc
	}

	// pass 2 - enqueue on all chans
	gp = getg()
	if gp.waiting != nil {
		throw("gp.waiting != nil")
	}
	nextp = &gp.waiting
	for _, casei := range lockorder {
		casi = int(casei)
		cas = &scases[casi]
		if cas.kind == caseNil {
			continue
		}
		c = cas.c
		sg := acquireSudog()
		sg.g = gp
		sg.isSelect = true
		// No stack splits between assigning elem and enqueuing
		// sg on gp.waiting where copystack can find it.
		sg.elem = cas.elem
		sg.releasetime = 0
		if t0 != 0 {
			sg.releasetime = -1
		}
		sg.c = c
		// Construct waiting list in lock order.
		*nextp = sg
		nextp = &sg.waitlink

		switch cas.kind {
		case caseRecv:
			c.recvq.enqueue(sg)

		case caseSend:
			c.sendq.enqueue(sg)
		}
	}

	// wait for someone to wake us up
	gp.param = nil
	gopark(selparkcommit, nil, "select", traceEvGoBlockSelect, 1)

	sellock(scases, lockorder)

	gp.selectDone = 0
	sg = (*sudog)(gp.param)
	gp.param = nil

	// pass 3 - dequeue from unsuccessful chans
	// otherwise they stack up on quiet channels
	// record the successful case, if any.
	// We singly-linked up the SudoGs in lock order.
	casi = -1
	cas = nil
	sglist = gp.waiting
	// Clear all elem before unlinking from gp.waiting.
	for sg1 := gp.waiting; sg1 != nil; sg1 = sg1.waitlink {
		sg1.isSelect = false
		sg1.elem = nil
		sg1.c = nil
	}
	gp.waiting = nil

	for _, casei := range lockorder {
		k = &scases[casei]
		if k.kind == caseNil {
			continue
		}
		if sglist.releasetime > 0 {
			k.releasetime = sglist.releasetime
		}
		if sg == sglist {
			// sg has already been dequeued by the G that woke us up.
			casi = int(casei)
			cas = k
		} else {
			c = k.c
			if k.kind == caseSend {
				c.sendq.dequeueSudoG(sglist)
			} else {
				c.recvq.dequeueSudoG(sglist)
			}
		}
		sgnext = sglist.waitlink
		sglist.waitlink = nil
		releaseSudog(sglist)
		sglist = sgnext
	}

	if cas == nil {
		// We can wake up with gp.param == nil (so cas == nil)
		// when a channel involved in the select has been closed.
		// It is easiest to loop and re-run the operation;
		// we'll see that it's now closed.
		// Maybe some day we can signal the close explicitly,
		// but we'd have to distinguish close-on-reader from close-on-writer.
		// It's easiest not to duplicate the code and just recheck above.
		// We know that something closed, and things never un-close,
		// so we won't block again.
		goto loop
	}

	c = cas.c

	if debugSelect {
		print("wait-return: sel=", sel, " c=", c, " cas=", cas, " kind=", cas.kind, "\n")
	}

	if cas.kind == caseRecv && cas.receivedp != nil {
		*cas.receivedp = true
	}

	if raceenabled {
		if cas.kind == caseRecv && cas.elem != nil {
			raceWriteObjectPC(c.elemtype, cas.elem, cas.pc, chanrecvpc)
		} else if cas.kind == caseSend {
			raceReadObjectPC(c.elemtype, cas.elem, cas.pc, chansendpc)
		}
	}
	if msanenabled {
		if cas.kind == caseRecv && cas.elem != nil {
			msanwrite(cas.elem, c.elemtype.size)
		} else if cas.kind == caseSend {
			msanread(cas.elem, c.elemtype.size)
		}
	}

	selunlock(scases, lockorder)
	goto retc

bufrecv:
	// can receive from buffer
	if raceenabled {
		if cas.elem != nil {
			raceWriteObjectPC(c.elemtype, cas.elem, cas.pc, chanrecvpc)
		}
		raceacquire(chanbuf(c, c.recvx))
		racerelease(chanbuf(c, c.recvx))
	}
	if msanenabled && cas.elem != nil {
		msanwrite(cas.elem, c.elemtype.size)
	}
	if cas.receivedp != nil {
		*cas.receivedp = true
	}
	qp = chanbuf(c, c.recvx)
	if cas.elem != nil {
		typedmemmove(c.elemtype, cas.elem, qp)
	}
	typedmemclr(c.elemtype, qp)
	c.recvx++
	if c.recvx == c.dataqsiz {
		c.recvx = 0
	}
	c.qcount--
	selunlock(scases, lockorder)
	goto retc

bufsend:
	// can send to buffer
	if raceenabled {
		raceacquire(chanbuf(c, c.sendx))
		racerelease(chanbuf(c, c.sendx))
		raceReadObjectPC(c.elemtype, cas.elem, cas.pc, chansendpc)
	}
	if msanenabled {
		msanread(cas.elem, c.elemtype.size)
	}
	typedmemmove(c.elemtype, chanbuf(c, c.sendx), cas.elem)
	c.sendx++
	if c.sendx == c.dataqsiz {
		c.sendx = 0
	}
	c.qcount++
	selunlock(scases, lockorder)
	goto retc

recv:
	// can receive from sleeping sender (sg)
	recv(c, sg, cas.elem, func() { selunlock(scases, lockorder) }, 2)
	if debugSelect {
		print("syncrecv: sel=", sel, " c=", c, "\n")
	}
	if cas.receivedp != nil {
		*cas.receivedp = true
	}
	goto retc

rclose:
	// read at end of closed channel
	selunlock(scases, lockorder)
	if cas.receivedp != nil {
		*cas.receivedp = false
	}
	if cas.elem != nil {
		typedmemclr(c.elemtype, cas.elem)
	}
	if raceenabled {
		raceacquire(unsafe.Pointer(c))
	}
	goto retc

send:
	// can send to a sleeping receiver (sg)
	if raceenabled {
		raceReadObjectPC(c.elemtype, cas.elem, cas.pc, chansendpc)
	}
	if msanenabled {
		msanread(cas.elem, c.elemtype.size)
	}
	send(c, sg, cas.elem, func() { selunlock(scases, lockorder) }, 2)
	if debugSelect {
		print("syncsend: sel=", sel, " c=", c, "\n")
	}
	goto retc

retc:
	if cas.releasetime > 0 {
		blockevent(cas.releasetime-t0, 1)
	}

	// Check preemption, since unlike gc we don't check on every call.
	// A test case for this one is BenchmarkPingPongHog in proc_test.go.
	if dfl != nil && getg().preempt {
		checkPreempt()
	}

	return casi

sclose:
	// send on closed channel
	selunlock(scases, lockorder)
	panic(plainError("send on closed channel"))
}

func (c *hchan) sortkey() uintptr {
	// TODO(khr): if we have a moving garbage collector, we'll need to
	// change this function.
	return uintptr(unsafe.Pointer(c))
}

// A runtimeSelect is a single case passed to rselect.
// This must match ../reflect/value.go:/runtimeSelect
type runtimeSelect struct {
	dir selectDir
	typ unsafe.Pointer // channel type (not used here)
	ch  *hchan         // channel
	val unsafe.Pointer // ptr to data (SendDir) or ptr to receive buffer (RecvDir)
}

// These values must match ../reflect/value.go:/SelectDir.
type selectDir int

const (
	_             selectDir = iota
	selectSend              // case Chan <- Send
	selectRecv              // case <-Chan:
	selectDefault           // default
)

//go:linkname reflect_rselect reflect.rselect
func reflect_rselect(cases []runtimeSelect) (chosen int, recvOK bool) {
	// flagNoScan is safe here, because all objects are also referenced from cases.
	size := selectsize(uintptr(len(cases)))
	sel := (*hselect)(mallocgc(size, nil, true))
	newselect(sel, int64(size), int32(len(cases)))
	r := new(bool)
	for i := range cases {
		rc := &cases[i]
		switch rc.dir {
		case selectDefault:
			selectdefault(sel)
		case selectSend:
			selectsend(sel, rc.ch, rc.val)
		case selectRecv:
			selectrecv(sel, rc.ch, rc.val, r)
		}
	}

	chosen = selectgo(sel)
	recvOK = *r
	return
}

func (q *waitq) dequeueSudoG(sgp *sudog) {
	x := sgp.prev
	y := sgp.next
	if x != nil {
		if y != nil {
			// middle of queue
			x.next = y
			y.prev = x
			sgp.next = nil
			sgp.prev = nil
			return
		}
		// end of queue
		x.next = nil
		q.last = x
		sgp.prev = nil
		return
	}
	if y != nil {
		// start of queue
		y.prev = nil
		q.first = y
		sgp.next = nil
		return
	}

	// x==y==nil. Either sgp is the only element in the queue,
	// or it has already been removed. Use q.first to disambiguate.
	if q.first == sgp {
		q.first = nil
		q.last = nil
	}
}
