
d
Command: %s
53*	vivadotcl23
route_design -directive Explore2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2$
xczu9eg-ffvb11562default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2$
xczu9eg-ffvb11562default:defaultZ17-349h px? 
?
?The version limit for your license is '%s' and will expire in %s days. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
519*common2
2019.012default:default2
-12032default:defaultZ17-1223h px? 
y
Command: %s
53*	vivadotcl2H
4report_drc (run_mandatory_drcs) for: incr_eco_checks2default:defaultZ4-113h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
q
%s completed successfully
29*	vivadotcl23
report_drc (run_mandatory_drcs)2default:defaultZ4-42h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px? 
w
Command: %s
53*	vivadotcl2F
2report_drc (run_mandatory_drcs) for: router_checks2default:defaultZ4-113h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
q
%s completed successfully
29*	vivadotcl23
report_drc (run_mandatory_drcs)2default:defaultZ4-42h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px? 
^
Using Router directive '%s'.
20*	routeflow2
Explore2default:defaultZ35-270h px? 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
82default:defaultZ35-254h px? 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px? 
C
.Phase 1 Build RT Design | Checksum: 14e0a01f5
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:31 ; elapsed = 00:01:12 . Memory (MB): peak = 4227.188 ; gain = 149.293 ; free physical = 8532 ; free virtual = 119102default:defaulth px? 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px? 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px? 
B
-Phase 2.1 Create Timer | Checksum: 1ccea2490
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:32 ; elapsed = 00:01:13 . Memory (MB): peak = 4227.188 ; gain = 149.293 ; free physical = 8534 ; free virtual = 119122default:defaulth px? 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px? 
N
9Phase 2.2 Fix Topology Constraints | Checksum: 1ccea2490
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:32 ; elapsed = 00:01:14 . Memory (MB): peak = 4227.188 ; gain = 149.293 ; free physical = 8473 ; free virtual = 118522default:defaulth px? 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px? 
G
2Phase 2.3 Pre Route Cleanup | Checksum: 1ccea2490
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:32 ; elapsed = 00:01:14 . Memory (MB): peak = 4227.188 ; gain = 149.293 ; free physical = 8473 ; free virtual = 118522default:defaulth px? 
{

Phase %s%s
101*constraints2
2.4 2default:default2,
Global Clock Net Routing2default:defaultZ18-101h px? 
N
9Phase 2.4 Global Clock Net Routing | Checksum: 1d5988ed4
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:34 ; elapsed = 00:01:16 . Memory (MB): peak = 4259.520 ; gain = 181.625 ; free physical = 8453 ; free virtual = 118322default:defaulth px? 
p

Phase %s%s
101*constraints2
2.5 2default:default2!
Update Timing2default:defaultZ18-101h px? 
C
.Phase 2.5 Update Timing | Checksum: 1dbd60c6d
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:02:10 ; elapsed = 00:01:28 . Memory (MB): peak = 4274.520 ; gain = 196.625 ; free physical = 8442 ; free virtual = 118222default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.452  | TNS=0.000  | WHS=-0.055 | THS=-5.278 |
2default:defaultZ35-416h px? 
I
4Phase 2 Router Initialization | Checksum: 2a03334c2
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:02:34 ; elapsed = 00:01:34 . Memory (MB): peak = 4274.520 ; gain = 196.625 ; free physical = 8428 ; free virtual = 118082default:defaulth px? 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px? 
C
.Phase 3 Initial Routing | Checksum: 2ece2039b
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:03:20 ; elapsed = 00:01:49 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8376 ; free virtual = 117562default:defaulth px? 
=
Initial Estimated Congestion179*routeZ35-449h px? 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px? 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2K
7| WNS=-0.721 | TNS=-641.720| WHS=0.004  | THS=0.000  |
2default:defaultZ35-416h px? 
H
3Phase 4.1 Global Iteration 0 | Checksum: 1930cebf0
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:07:37 ; elapsed = 00:03:12 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8403 ; free virtual = 117832default:defaulth px? 
u

Phase %s%s
101*constraints2
4.2 2default:default2&
Global Iteration 12default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.351 | TNS=-74.883| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.2 Global Iteration 1 | Checksum: 1771436d9
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:08:48 ; elapsed = 00:03:49 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8393 ; free virtual = 117732default:defaulth px? 
u

Phase %s%s
101*constraints2
4.3 2default:default2&
Global Iteration 22default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.279 | TNS=-65.484| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.3 Global Iteration 2 | Checksum: 137270167
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:10:04 ; elapsed = 00:04:30 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8399 ; free virtual = 117792default:defaulth px? 
u

Phase %s%s
101*constraints2
4.4 2default:default2&
Global Iteration 32default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.239 | TNS=-50.592| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.4 Global Iteration 3 | Checksum: 1ee33106c
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:11:26 ; elapsed = 00:05:18 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8399 ; free virtual = 117802default:defaulth px? 
u

Phase %s%s
101*constraints2
4.5 2default:default2&
Global Iteration 42default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.144 | TNS=-8.304 | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.5 Global Iteration 4 | Checksum: 1a10f43e4
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:12:32 ; elapsed = 00:05:55 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8400 ; free virtual = 117812default:defaulth px? 
u

Phase %s%s
101*constraints2
4.6 2default:default2&
Global Iteration 52default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.161 | TNS=-2.860 | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.6 Global Iteration 5 | Checksum: 189f0c2e2
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:13:09 ; elapsed = 00:06:13 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8401 ; free virtual = 117812default:defaulth px? 


Phase %s%s
101*constraints2
4.7 2default:default20
Additional Timing Iterations2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
4.7.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 4.7.1 Update Timing | Checksum: 1f175e182
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:13:12 ; elapsed = 00:06:14 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8401 ; free virtual = 117812default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.144 | TNS=-8.304 | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
r

Phase %s%s
101*constraints2
4.7.2 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 4.7.2 Update Timing | Checksum: 22c06d1d5
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:13:13 ; elapsed = 00:06:15 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8400 ; free virtual = 117812default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.118 | TNS=-5.836 | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
s

Phase %s%s
101*constraints2
4.7.3 2default:default2"
Fast Budgeting2default:defaultZ18-101h px? 
F
1Phase 4.7.3 Fast Budgeting | Checksum: 2287506c4
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:13:16 ; elapsed = 00:06:17 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8396 ; free virtual = 117762default:defaulth px? 
?

Phase %s%s
101*constraints2
4.7.4 2default:default21
Additional Timing Iteration 02default:defaultZ18-101h px? 
t

Phase %s%s
101*constraints2
4.7.4.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
G
2Phase 4.7.4.1 Update Timing | Checksum: 15b3c8c86
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:15:01 ; elapsed = 00:07:09 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8400 ; free virtual = 117802default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.078 | TNS=-1.005 | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
t

Phase %s%s
101*constraints2
4.7.4.2 2default:default2!
Update Timing2default:defaultZ18-101h px? 
G
2Phase 4.7.4.2 Update Timing | Checksum: 241c2c9eb
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:15:03 ; elapsed = 00:07:10 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8399 ; free virtual = 117792default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.033 | TNS=-0.098 | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
u

Phase %s%s
101*constraints2
4.7.4.3 2default:default2"
Fast Budgeting2default:defaultZ18-101h px? 
H
3Phase 4.7.4.3 Fast Budgeting | Checksum: 20d7ace2f
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:15:05 ; elapsed = 00:07:13 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8397 ; free virtual = 117772default:defaulth px? 
U
@Phase 4.7.4 Additional Timing Iteration 0 | Checksum: 13ce99203
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:15:16 ; elapsed = 00:07:22 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8397 ; free virtual = 117772default:defaulth px? 
?

Phase %s%s
101*constraints2
4.7.5 2default:default21
Additional Timing Iteration 12default:defaultZ18-101h px? 
t

Phase %s%s
101*constraints2
4.7.5.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
G
2Phase 4.7.5.1 Update Timing | Checksum: 129c5d8be
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:16:57 ; elapsed = 00:08:11 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8398 ; free virtual = 117792default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.135 | TNS=-3.705 | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
U
@Phase 4.7.5 Additional Timing Iteration 1 | Checksum: 1bcceee21
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:16:57 ; elapsed = 00:08:11 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8400 ; free virtual = 117802default:defaulth px? 
R
=Phase 4.7 Additional Timing Iterations | Checksum: 1bcceee21
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:16:57 ; elapsed = 00:08:11 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8400 ; free virtual = 117802default:defaulth px? 
F
1Phase 4 Rip-up And Reroute | Checksum: 1bcceee21
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:16:58 ; elapsed = 00:08:11 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8400 ; free virtual = 117802default:defaulth px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 5.1.1 Update Timing | Checksum: 20e633e90
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:17:13 ; elapsed = 00:08:17 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8401 ; free virtual = 117812default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.078 | TNS=-1.005 | WHS=0.004  | THS=0.000  |
2default:defaultZ35-416h px? 
C
.Phase 5.1 Delay CleanUp | Checksum: 1c5e7aade
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:17:14 ; elapsed = 00:08:18 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8396 ; free virtual = 117762default:defaulth px? 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px? 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 1c5e7aade
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:17:15 ; elapsed = 00:08:18 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8396 ; free virtual = 117762default:defaulth px? 
O
:Phase 5 Delay and Skew Optimization | Checksum: 1c5e7aade
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:17:15 ; elapsed = 00:08:18 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8396 ; free virtual = 117762default:defaulth px? 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 6.1.1 Update Timing | Checksum: 153e47e19
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:17:25 ; elapsed = 00:08:22 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8398 ; free virtual = 117782default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=-0.078 | TNS=-1.005 | WHS=0.004  | THS=0.000  |
2default:defaultZ35-416h px? 
C
.Phase 6.1 Hold Fix Iter | Checksum: 16e743cf5
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:17:25 ; elapsed = 00:08:22 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8397 ; free virtual = 117782default:defaulth px? 
A
,Phase 6 Post Hold Fix | Checksum: 16e743cf5
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:17:25 ; elapsed = 00:08:22 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8397 ; free virtual = 117782default:defaulth px? 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px? 
B
-Phase 7 Route finalize | Checksum: 1e6e7c9b0
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:17:27 ; elapsed = 00:08:23 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8393 ; free virtual = 117732default:defaulth px? 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px? 
I
4Phase 8 Verifying routed nets | Checksum: 1e6e7c9b0
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:17:27 ; elapsed = 00:08:23 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8392 ; free virtual = 117732default:defaulth px? 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px? 
E
0Phase 9 Depositing Routes | Checksum: 1e6e7c9b0
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:17:31 ; elapsed = 00:08:27 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8396 ; free virtual = 117762default:defaulth px? 
n

Phase %s%s
101*constraints2
10 2default:default2 
Reset Design2default:defaultZ18-101h px? 
A
,Phase 10 Reset Design | Checksum: 1e6e7c9b0
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:17:31 ; elapsed = 00:08:27 . Memory (MB): peak = 4286.496 ; gain = 208.602 ; free physical = 8398 ; free virtual = 117782default:defaulth px? 
{

Phase %s%s
101*constraints2
11 2default:default2-
Leaf Clock Prog Delay Opt2default:defaultZ18-101h px? 
q

Phase %s%s
101*constraints2
11.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px? 
s

Phase %s%s
101*constraints2
11.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
F
1Phase 11.1.1 Update Timing | Checksum: 178e661e0
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:21:02 ; elapsed = 00:09:09 . Memory (MB): peak = 4687.590 ; gain = 609.695 ; free physical = 8230 ; free virtual = 116122default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.041  | TNS=0.000  | WHS=0.003  | THS=0.000  |
2default:defaultZ35-416h px? 
D
/Phase 11.1 Delay CleanUp | Checksum: 178e661e0
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:21:03 ; elapsed = 00:09:09 . Memory (MB): peak = 4687.590 ; gain = 609.695 ; free physical = 8230 ; free virtual = 116122default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.041  | TNS=0.000  | WHS=0.003  | THS=0.000  |
2default:defaultZ35-416h px? 
N
9Phase 11 Leaf Clock Prog Delay Opt | Checksum: 2068f1872
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:21:13 ; elapsed = 00:09:13 . Memory (MB): peak = 4687.590 ; gain = 609.695 ; free physical = 8242 ; free virtual = 116232default:defaulth px? 
s

Phase %s%s
101*constraints2
12 2default:default2%
Depositing Routes2default:defaultZ18-101h px? 
F
1Phase 12 Depositing Routes | Checksum: 2068f1872
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:21:17 ; elapsed = 00:09:17 . Memory (MB): peak = 4687.590 ; gain = 609.695 ; free physical = 8246 ; free virtual = 116282default:defaulth px? 
p

Phase %s%s
101*constraints2
13 2default:default2"
Route finalize2default:defaultZ18-101h px? 
C
.Phase 13 Route finalize | Checksum: 2068f1872
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:21:17 ; elapsed = 00:09:17 . Memory (MB): peak = 4687.590 ; gain = 609.695 ; free physical = 8246 ; free virtual = 116282default:defaulth px? 
t

Phase %s%s
101*constraints2
14 2default:default2&
Post Router Timing2default:defaultZ18-101h px? 
?
Post Routing Timing Summary %s
20*route2J
6| WNS=0.057  | TNS=0.000  | WHS=0.004  | THS=0.000  |
2default:defaultZ35-20h px? 
F
'The design met the timing requirement.
61*routeZ35-61h px? 
G
2Phase 14 Post Router Timing | Checksum: 1ea8b6ae4
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:21:47 ; elapsed = 00:09:24 . Memory (MB): peak = 4687.590 ; gain = 609.695 ; free physical = 8245 ; free virtual = 116262default:defaulth px? 
@
Router Completed Successfully
2*	routeflowZ35-16h px? 
?

%s
*constraints2?
?Time (s): cpu = 00:21:48 ; elapsed = 00:09:24 . Memory (MB): peak = 4687.590 ; gain = 609.695 ; free physical = 8585 ; free virtual = 119672default:defaulth px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1152default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
route_design: 2default:default2
00:21:562default:default2
00:09:272default:default2
4687.5902default:default2
617.6992default:default2
85852default:default2
119672default:defaultZ17-722h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:092default:default2
00:00:032default:default2
4711.6022default:default2
0.0002default:default2
85012default:default2
119672default:defaultZ17-722h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?/home/lycheus/rc-fpga-zcu/zcu102/zcu102_rocketchip_ZynqConfig/zcu102_rocketchip_ZynqConfig.runs/impl_1/rocketchip_wrapper_routed.dcp2default:defaultZ17-1381h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2&
write_checkpoint: 2default:default2
00:00:132default:default2
00:00:072default:default2
4711.6022default:default2
24.0122default:default2
85712default:default2
119742default:defaultZ17-722h px? 
?
Command: %s
53*	vivadotcl2?
~report_drc -file rocketchip_wrapper_drc_routed.rpt -pb rocketchip_wrapper_drc_routed.pb -rpx rocketchip_wrapper_drc_routed.rpx2default:defaultZ4-113h px? 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
?/home/lycheus/rc-fpga-zcu/zcu102/zcu102_rocketchip_ZynqConfig/zcu102_rocketchip_ZynqConfig.runs/impl_1/rocketchip_wrapper_drc_routed.rpt?/home/lycheus/rc-fpga-zcu/zcu102/zcu102_rocketchip_ZynqConfig/zcu102_rocketchip_ZynqConfig.runs/impl_1/rocketchip_wrapper_drc_routed.rpt2default:default8Z2-168h px? 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px? 
?
Command: %s
53*	vivadotcl2?
yreport_methodology -file rocketchip_wrapper_methodology_drc_routed.rpt -rpx rocketchip_wrapper_methodology_drc_routed.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
Y
$Running Methodology with %s threads
74*drc2
82default:defaultZ23-133h px? 
?
2The results of Report Methodology are in file %s.
450*coretcl2?
?/home/lycheus/rc-fpga-zcu/zcu102/zcu102_rocketchip_ZynqConfig/zcu102_rocketchip_ZynqConfig.runs/impl_1/rocketchip_wrapper_methodology_drc_routed.rpt?/home/lycheus/rc-fpga-zcu/zcu102/zcu102_rocketchip_ZynqConfig/zcu102_rocketchip_ZynqConfig.runs/impl_1/rocketchip_wrapper_methodology_drc_routed.rpt2default:default8Z2-1520h px? 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2(
report_methodology: 2default:default2
00:00:232default:default2
00:00:072default:default2
4807.6482default:default2
0.0002default:default2
83972default:default2
118022default:defaultZ17-722h px? 
?
Command: %s
53*	vivadotcl2?
?report_power -file rocketchip_wrapper_power_routed.rpt -pb rocketchip_wrapper_power_summary_routed.pb -rpx rocketchip_wrapper_power_routed.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px? 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px? 
?
?Detected over-assertion of set/reset/preset/clear net with high fanouts, power estimation might not be accurate. Please run Tool - Power Constraint Wizard to set proper switching activities for control signals.282*powerZ33-332h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1222default:default2
22default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
report_power: 2default:default2
00:00:442default:default2
00:00:222default:default2
4807.6482default:default2
0.0002default:default2
83322default:default2
117442default:defaultZ17-722h px? 
?
UpdateTimingParams:%s.
91*timing2O
; Speed grade: -2, Temperature grade: I, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
82default:defaultZ38-191h px? 


End Record