//===-- NMXMCInstLower.h - Lower MachineInstr to MCInst --------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_NMX_NMXMCINSTLOWER_H
#define LLVM_LIB_TARGET_NMX_NMXMCINSTLOWER_H

#include "MCTargetDesc/NMXMCExpr.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/CodeGen/MachineOperand.h"
#include "llvm/Support/Compiler.h"

namespace llvm {
class MCContext;
class MCInst;
class MCOperand;
class MachineInstr;
class MachineFunction;
class NMXAsmPrinter;

class LLVM_LIBRARY_VISIBILITY NMXMCInstLower {
  typedef MachineOperand::MachineOperandType MachineOperandType;
  MCContext *Ctx;
  NMXAsmPrinter &AsmPrinter;
public:
  NMXMCInstLower(NMXAsmPrinter &asmprinter);
  void Initialize(MCContext *C);
  void Lower(const MachineInstr *MI, MCInst &OutMI) const;
  MCOperand LowerOperand(const MachineOperand &MO, unsigned offset = 0) const;
  void LowerCPLOAD(SmallVector<MCInst, 4>& MCInsts);
private:
  MCOperand LowerSymbolOperand(const MachineOperand &MO,
                               MachineOperandType MOTy, unsigned Offset) const;
};

} // end namespace llvm

#endif
