//===-- RISCVAsmPrinter.cpp - RISCV LLVM assembly writer ------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains a printer that converts from our internal representation
// of machine-dependent LLVM code to the RISCV assembly language.
//
//===----------------------------------------------------------------------===//

#include "RISCV.h"
#include "InstPrinter/RISCVInstPrinter.h"
#include "MCTargetDesc/RISCVMCExpr.h"
#include "RISCVTargetMachine.h"
#include "llvm/CodeGen/AsmPrinter.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

#define DEBUG_TYPE "asm-printer"

namespace {
class RISCVAsmPrinter : public AsmPrinter {
public:
  explicit RISCVAsmPrinter(TargetMachine &TM,
                           std::unique_ptr<MCStreamer> Streamer)
      : AsmPrinter(TM, std::move(Streamer)) {}

  StringRef getPassName() const override { return "RISCV Assembly Printer"; }

  void EmitInstruction(const MachineInstr *MI) override;

  bool PrintAsmOperand(const MachineInstr *MI, unsigned OpNo,
                       unsigned AsmVariant, const char *ExtraCode,
                       raw_ostream &OS) override;
  bool PrintAsmMemoryOperand(const MachineInstr *MI, unsigned OpNo,
                             unsigned AsmVariant, const char *ExtraCode,
                             raw_ostream &OS) override;

  void EmitToStreamer(MCStreamer &S, const MCInst &Inst);
  bool emitPseudoExpansionLowering(MCStreamer &OutStreamer,
                                   const MachineInstr *MI);

  // Wrapper needed for tblgenned pseudo lowering.
  bool lowerOperand(const MachineOperand &MO, MCOperand &MCOp) const {
    return LowerRISCVMachineOperandToMCOperand(MO, MCOp, *this);
  }
};
}

#define GEN_COMPRESS_INSTR
#include "RISCVGenCompressInstEmitter.inc"
void RISCVAsmPrinter::EmitToStreamer(MCStreamer &S, const MCInst &Inst) {
  MCInst CInst;
  bool Res = compressInst(CInst, Inst, *TM.getMCSubtargetInfo(),
                          OutStreamer->getContext());
  AsmPrinter::EmitToStreamer(*OutStreamer, Res ? CInst : Inst);
}

// Simple pseudo-instructions have their lowering (with expansion to real
// instructions) auto-generated.
#include "RISCVGenMCPseudoLowering.inc"

int match_count = 0;
extern bool kenny_bounded; //bounded flag set in AsmPrinterInlineAsm.cpp L484 EmitInlineAsm()
extern unsigned kenny_regnum;
void RISCVAsmPrinter::EmitInstruction(const MachineInstr *MI) {
  // Do any auto-generated pseudo lowerings.
  if (emitPseudoExpansionLowering(*OutStreamer, MI))
    return;

  //kenny transform the standard load and store into bounded load and store depend on bounded flag
  if(kenny_bounded){
    
    //sanity check: we are inside bounded section but the regnum from bndr is 0? might come from lbd?
    if(kenny_regnum == 0)
      printf("ERROR: There is a bounded load/store without matching bndr or lbd\n");
    
    MCInst BndInst;
    LowerRISCVMachineInstrToMCInst(MI, BndInst, *this);
    
    if(MI->mayLoad()){
      //printf("load_reg: %d, %d, %d, %d.\nbnd_reg: %d\n", BndInst.getOperand(0).getReg(), BndInst.getOperand(1).getReg(), BndInst.getOperand(2).getReg(), BndInst.getOperand(3).getReg(), kenny_regnum);
      if(BndInst.getOperand(1).getReg()==kenny_regnum){
	match_count = match_count + 1;
	
	if(match_count >= 2)
	  {
	    if(match_count == 2){
	      printf("kenny warning: multiple load target matched to replace into bounded load\n");
	    }
	    OutStreamer->AddComment("kenny multiple load\n");
	    //BndInst.print(outs());
	    //outs() << "\n";
	    
	  }
	if (match_count < 2)
	  {
	    switch(BndInst.getOpcode())
	      {
	      case RISCV::LB:
		BndInst.setOpcode(RISCV::LB_B);
		break;
	      case RISCV::LH:
		BndInst.setOpcode(RISCV::LH_B);
		break;
	      case RISCV::LW:
		BndInst.setOpcode(RISCV::LW_B);
		break;
	      case RISCV::LD:
		BndInst.setOpcode(RISCV::LD_B);
		break;
	      case RISCV::LBU:
		BndInst.setOpcode(RISCV::LBU_B);
		break;
	      case RISCV::LHU:
		BndInst.setOpcode(RISCV::LHU_B);
		break;
	      case RISCV::LWU:
		BndInst.setOpcode(RISCV::LWU_B);
		break;
	      default:
		break;
	      }
	  }
      }
    }
    if(MI->mayStore()){
      //printf("store_reg: %d, %d, %d, %d.\nbnd_reg: %d\n", BndInst.getOperand(0).getReg(), BndInst.getOperand(1).getReg(), BndInst.getOperand(2).getReg(), BndInst.getOperand(3).getReg(), kenny_regnum);
      if(BndInst.getOperand(1).getReg()==kenny_regnum){
	match_count = match_count + 1;
	if(match_count >= 2)
	  {
	    if(match_count == 2){
	      printf("kenny warning: multiple store target matched to replace into bounded store\n"); //kenny only print once
	    }
	    OutStreamer->AddComment("kenny multiple store\n");
	    //BndInst.print(outs());
	    //outs() << "\n";
	  }
	if (match_count < 2)
	  {
	    
	    switch(BndInst.getOpcode())
	      {
	      case RISCV::SB:
		BndInst.setOpcode(RISCV::SB_B);
		break;
	      case RISCV::SH:
		BndInst.setOpcode(RISCV::SH_B);
		break;
	      case RISCV::SW:
		BndInst.setOpcode(RISCV::SW_B);
		break;
	      case RISCV::SD:
		BndInst.setOpcode(RISCV::SD_B);
		break;
	      default:
		break;
	      }
	  }
      }
    }
    EmitToStreamer(*OutStreamer, BndInst);
    return;  
  }
  match_count = 0;
  
  MCInst TmpInst;
  LowerRISCVMachineInstrToMCInst(MI, TmpInst, *this);
  EmitToStreamer(*OutStreamer, TmpInst);
  
}

bool RISCVAsmPrinter::PrintAsmOperand(const MachineInstr *MI, unsigned OpNo,
                                      unsigned AsmVariant,
                                      const char *ExtraCode, raw_ostream &OS) {
  if (AsmVariant != 0)
    report_fatal_error("There are no defined alternate asm variants");

  // First try the generic code, which knows about modifiers like 'c' and 'n'.
  if (!AsmPrinter::PrintAsmOperand(MI, OpNo, AsmVariant, ExtraCode, OS))
    return false;

  if (!ExtraCode) {
    const MachineOperand &MO = MI->getOperand(OpNo);
    switch (MO.getType()) {
    case MachineOperand::MO_Immediate:
      OS << MO.getImm();
      return false;
    case MachineOperand::MO_Register:
      OS << RISCVInstPrinter::getRegisterName(MO.getReg());
      return false;
    default:
      break;
    }
  }

  return true;
}

bool RISCVAsmPrinter::PrintAsmMemoryOperand(const MachineInstr *MI,
                                            unsigned OpNo, unsigned AsmVariant,
                                            const char *ExtraCode,
                                            raw_ostream &OS) {
  if (AsmVariant != 0)
    report_fatal_error("There are no defined alternate asm variants");

  if (!ExtraCode) {
    const MachineOperand &MO = MI->getOperand(OpNo);
    // For now, we only support register memory operands in registers and
    // assume there is no addend
    if (!MO.isReg())
      return true;

    OS << "0(" << RISCVInstPrinter::getRegisterName(MO.getReg()) << ")";
    return false;
  }

  return AsmPrinter::PrintAsmMemoryOperand(MI, OpNo, AsmVariant, ExtraCode, OS);
}

// Force static initialization.
extern "C" void LLVMInitializeRISCVAsmPrinter() {
  RegisterAsmPrinter<RISCVAsmPrinter> X(getTheRISCV32Target());
  RegisterAsmPrinter<RISCVAsmPrinter> Y(getTheRISCV64Target());
}
