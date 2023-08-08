//===-- NMXSEFrameLowering.h - NMXSE Frame Lowering --------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_NMX_NMXSEFRAMELOWERING_H
#define LLVM_LIB_TARGET_NMX_NMXSEFRAMELOWERING_H

#include "NMXFrameLowering.h"

namespace llvm {
class NMXSEFrameLowering : public NMXFrameLowering {
public:
  explicit NMXSEFrameLowering(const NMXSubtarget &STI);

  // These methods insert prolog and epilog code into the function.
  void emitPrologue(MachineFunction &MF, MachineBasicBlock &MBB) const override;
  void emitEpilogue(MachineFunction &MF, MachineBasicBlock &MBB) const override;

  bool hasReservedCallFrame(const MachineFunction &MF) const override;

  void determineCalleeSaves(MachineFunction &MF, BitVector &SavedRegs,
                            RegScavenger *RS) const override;
  bool spillCalleeSavedRegisters(MachineBasicBlock &MBB,
                                 MachineBasicBlock::iterator MI,
                                 const std::vector<CalleeSavedInfo> &CSI,
                                 const TargetRegisterInfo *TRI) const override;
};

} // End llvm namespace

#endif
