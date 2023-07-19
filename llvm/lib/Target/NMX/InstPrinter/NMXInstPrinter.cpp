//===-- NMXInstPrinter.cpp - Convert MCInst to assembly syntax -*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This class prints an NMX MCInst to an assembly file.
//
//===----------------------------------------------------------------------===//

#include "NMXInstPrinter.h"

#include "MCTargetDesc/NMXMCExpr.h"
#include "NMXInstrInfo.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
using namespace llvm;

#define DEBUG_TYPE "asm-printer"

#define PRINT_ALIAS_INSTR
#include "NMXGenAsmWriter.inc"

void NMXInstPrinter::printRegName(raw_ostream &OS, unsigned RegNo) const {
  // getRegisterName(RegNo) defiend in NMXGenAsmWriter.inc which indicate in NMX.td
  OS << '$' << StringRef(getRegisterName(RegNo)).lower();
}

void NMXInstPrinter::printInst(const MCInst *MI, raw_ostream &O,
                                StringRef Annot, const MCSubtargetInfo &STI) {
  // Try to print any aliases first
  if (!printAliasInstr(MI, O))
    // printInstruction(MI, O) defined in NMXGenAsmWriter.inc which came from
    // NMX.td indicate.
    printInstruction(MI, O);
  printAnnotation(O, Annot);
}

void NMXInstPrinter::printOperand(const MCInst *MI, unsigned OpNo,
                                   raw_ostream &O) {
  const MCOperand &Op = MI->getOperand(OpNo);
  if (Op.isReg()) {
    printRegName(O, Op.getReg());
    return;
  }

  if (Op.isImm()) {
    O << Op.getImm();
    return;
  }

  assert(Op.isExpr() && "unknown operand kind in printOperand");
  Op.getExpr()->print(O, &MAI, true);
}

void NMXInstPrinter::printUnsignedImm(const MCInst *MI, int OpNum,
                                       raw_ostream &O) {
  const MCOperand &MO = MI->getOperand(OpNum);
  if (MO.isImm())
    O << (unsigned short int)MO.getImm();
  else
    printOperand(MI, OpNum, O);
}

void NMXInstPrinter::printMemOperand(const MCInst *MI, int OpNum,
                                      raw_ostream &O) {
  // Load/Store memory operands => imm($reg)
  // If PIC target, the target is loaded as the
  // pattern => ld $t9, %call16(%gp)
  printOperand(MI, OpNum+1, O);
  O << "(";
  printOperand(MI, OpNum, O);
  O << ")";
}

void NMXInstPrinter::printMemOperandEA(const MCInst *MI, int opNum,
                                        raw_ostream &O) {
  // when using stack locations for not load/store instructions
  // print the same way as all normal 3 operand instructions.
  printOperand(MI, opNum, O);
  O << ", ";
  printOperand(MI, opNum+1, O);
  return;
}
