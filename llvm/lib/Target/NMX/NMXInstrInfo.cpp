//===-- NMXInstrInfo.cpp - NMX Instruction Information --------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the NMX implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

#include "NMXInstrInfo.h"

#include "NMXTargetMachine.h"
#include "NMXMachineFunctionInfo.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define GET_INSTRINFO_CTOR_DTOR
#include "NMXGenInstrInfo.inc"

// Pin the vtable to this file
void NMXInstrInfo::anchor() { }

NMXInstrInfo::NMXInstrInfo(const NMXSubtarget &STI)
  : NMXGenInstrInfo(NMX::ADJCALLSTACKDOWN, NMX::ADJCALLSTACKUP),
    Subtarget(STI) { }

const NMXInstrInfo *NMXInstrInfo::create(NMXSubtarget &STI) {
  return llvm::createNMXSEInstrInfo(STI);
}

unsigned NMXInstrInfo::GetInstSizeInBytes(const MachineInstr &MI) const {
  switch (MI.getOpcode()) {
    case TargetOpcode::INLINEASM: {
      const MachineFunction *MF = MI.getParent()->getParent();
      const char *AsmStr = MI.getOperand(0).getSymbolName();
      return getInlineAsmLength(AsmStr, *MF->getTarget().getMCAsmInfo());
    }
    default:
      return MI.getDesc().getSize();
  }
}

MachineMemOperand *
NMXInstrInfo::GetMemOperand(MachineBasicBlock &MBB, int FI,
                             MachineMemOperand::Flags Flags) const {
  MachineFunction &MF = *MBB.getParent();
  MachineFrameInfo &MFI = MF.getFrameInfo();
  unsigned Align = MFI.getObjectAlignment(FI);

  return MF.getMachineMemOperand(MachinePointerInfo::getFixedStack(MF, FI),
                                 Flags, MFI.getObjectSize(FI), Align);
}
