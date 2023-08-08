//===-- NMXMCInstLower.cpp - Convert NMX MachineInstr to MCInst-*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains code to lower NMX MachineInstrs to their corresponding
// MCInst records.
//
//===----------------------------------------------------------------------===//

#include "NMXMCInstLower.h"

#include "NMXAsmPrinter.h"
#include "NMXInstrInfo.h"
#include "MCTargetDesc/NMXBaseInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/IR/Mangler.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"

using namespace llvm;

NMXMCInstLower::NMXMCInstLower(NMXAsmPrinter &asmprinter)
  : AsmPrinter(asmprinter) { }

void NMXMCInstLower::Initialize(MCContext *C) {
  Ctx = C;
}

MCOperand NMXMCInstLower::LowerSymbolOperand(const MachineOperand &MO,
                                              MachineOperandType MOTy,
                                              unsigned Offset) const {
  MCSymbolRefExpr::VariantKind Kind = MCSymbolRefExpr::VK_None;
  NMXMCExpr::NMXExprKind TargetKind = NMXMCExpr::CEK_None;
  const MCSymbol *Symbol;

  switch(MO.getTargetFlags()) {
  default:
    llvm_unreachable("Invalid target flag!");
  case NMXII::MO_NO_FLAG:
    break;
  case NMXII::MO_GPREL:
    TargetKind = NMXMCExpr::CEK_GPREL;
    break;
  case NMXII::MO_GOT:
    TargetKind = NMXMCExpr::CEK_GOT;
    break;
  case NMXII::MO_ABS_HI:
    TargetKind = NMXMCExpr::CEK_ABS_HI;
    break;
  case NMXII::MO_ABS_LO:
    TargetKind = NMXMCExpr::CEK_ABS_LO;
    break;
  case NMXII::MO_GOT_HI16:
    TargetKind = NMXMCExpr::CEK_GOT_HI16;
    break;
  case NMXII::MO_GOT_LO16:
    TargetKind = NMXMCExpr::CEK_GOT_LO16;
    break;
  case NMXII::MO_GOT_CALL:
    TargetKind = NMXMCExpr::CEK_GOT_CALL;
    break;
  }

  switch (MOTy) {
  case MachineOperand::MO_GlobalAddress:
    Symbol = AsmPrinter.getSymbol(MO.getGlobal());
    Offset += MO.getOffset();
    break;
  case MachineOperand::MO_MachineBasicBlock:
    Symbol = MO.getMBB()->getSymbol();
    break;
  case MachineOperand::MO_BlockAddress:
    Symbol = AsmPrinter.GetBlockAddressSymbol(MO.getBlockAddress());
    Offset += MO.getOffset();
    break;
  case MachineOperand::MO_JumpTableIndex:
    Symbol = AsmPrinter.GetJTISymbol(MO.getIndex());
    break;
  case MachineOperand::MO_ExternalSymbol:
    Symbol = AsmPrinter.GetExternalSymbolSymbol(MO.getSymbolName());
    Offset += MO.getOffset();
    break;
  default:
    llvm_unreachable("unknown operand type");
  }

  const MCExpr *Expr = MCSymbolRefExpr::create(Symbol, Kind, *Ctx);

  if (Offset) {
    // Assume offset is never negative.
    assert(Offset > 0);
    Expr = MCBinaryExpr::createAdd(Expr, MCConstantExpr::create(Offset, *Ctx), *Ctx);
  }

  if (TargetKind != NMXMCExpr::CEK_None)
    Expr = NMXMCExpr::create(TargetKind, Expr, *Ctx);

  return MCOperand::createExpr(Expr);
}

static void CreateMCInst(MCInst& Inst, unsigned Opc, const MCOperand& Operand0,
                         const MCOperand& Operand1,
                         const MCOperand& Operand2 = MCOperand()) {
  Inst.setOpcode(Opc);
  Inst.addOperand(Operand0);
  Inst.addOperand(Operand1);
  if (Operand2.isValid())
    Inst.addOperand(Operand2);
}

// Lower ".cpload $reg" to
//  "lui    $gp, %hi(_gp_disp)"
//  "addiu  $gp, $gp, %lo(_gp_disp)"
//  "addu   $gp, $gp, $t9"
void NMXMCInstLower::LowerCPLOAD(SmallVector<MCInst, 4>& MCInsts) {
  MCOperand GPReg = MCOperand::createReg(NMX::GP);
  MCOperand T9Reg = MCOperand::createReg(NMX::T9);
  StringRef SymName("_gp_disp");
  const MCSymbol *Sym = Ctx->getOrCreateSymbol(SymName);
  const NMXMCExpr *MCSym;

  MCSym = NMXMCExpr::create(Sym, NMXMCExpr::CEK_ABS_HI, *Ctx);
  MCOperand SymHi = MCOperand::createExpr(MCSym);
  MCSym = NMXMCExpr::create(Sym, NMXMCExpr::CEK_ABS_LO, *Ctx);
  MCOperand SymLo = MCOperand::createExpr(MCSym);

  MCInsts.resize(3);

  CreateMCInst(MCInsts[0], NMX::LUi, GPReg, SymHi);
  CreateMCInst(MCInsts[1], NMX::ORi, GPReg, GPReg, SymLo);
  CreateMCInst(MCInsts[2], NMX::ADD, GPReg, GPReg, T9Reg);
}

MCOperand NMXMCInstLower::LowerOperand(const MachineOperand &MO,
                                        unsigned offset) const {
  MachineOperandType MOTy = MO.getType();

  switch (MOTy) {
  default: llvm_unreachable("unknown operand type");
  case MachineOperand::MO_Register:
    // Ignore all implicit register operands
    if (MO.isImplicit()) break;
    return MCOperand::createReg(MO.getReg());
  case MachineOperand::MO_Immediate:
    return MCOperand::createImm(MO.getImm() + offset);
  case MachineOperand::MO_MachineBasicBlock:
  case MachineOperand::MO_JumpTableIndex:
  case MachineOperand::MO_BlockAddress:
  case MachineOperand::MO_GlobalAddress:
  case MachineOperand::MO_ExternalSymbol:
    return LowerSymbolOperand(MO, MOTy, offset);
  case MachineOperand::MO_RegisterMask:
    break;
  }

  return MCOperand();
}

void NMXMCInstLower::Lower(const MachineInstr *MI, MCInst &OutMCInst) const {
  OutMCInst.setOpcode(MI->getOpcode());

  for (unsigned i = 0, e = MI->getNumOperands(); i != e; ++i) {
    const MachineOperand &MO = MI->getOperand(i);
    MCOperand MCOp = LowerOperand(MO);

    if (MCOp.isValid())
      OutMCInst.addOperand(MCOp);
  }
}
