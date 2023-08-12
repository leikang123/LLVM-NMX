//===-- NMXRegisterInfo.h - NMX Register Information Impl -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the NMX implementation of the TargetRegisterInfo class.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_TARGET_NMXX_REGISTERINFO_H
#define LLVM_TARGET_NMXX_REGISTERINFO_H

#include "llvm/Target/TargetRegisterInfo.h"
#include "NMXXGenRegisterInfo.h.inc"

namespace llvm {

// forwards
class TargetInstrInfo;

struct NMXXRegisterInfo : NMXXGenRegisterInfo {

  const TargetInstrInfo &TII;

  NMXXRegisterInfo(const TargetInstrInfo &tii);

  // default class dtor
  ~NMXXRegisterInfo();

  const unsigned int *getCalleeSavedRegs(const MachineFunction *) const;

  const TargetRegisterClass* const *getCalleeSavedRegClasses(
    const MachineFunction *) const;

  BitVector getReservedRegs(const MachineFunction &MF) const;

  unsigned int getSubReg(unsigned int, unsigned int) const;

  bool requiresRegisterScavenging(const MachineFunction &MF) const;

  // NKIM, has changed for the llvm-versions higher than 2.7
  virtual void eliminateFrameIndex(MachineBasicBlock::iterator I,
                                   int SPAdj, RegScavenger *r = 0) const;


  //  NKIM, moved to FrameLowering class
  //    bool hasFP(const MachineFunction &MF) const;
  //    void emitPrologue(MachineFunction &MF) const;
  //    void emitEpilogue(MachineFunction &MF, MachineBasicBlock &MBB) const;

  /* Debug stuff, apparently */
  unsigned int getRARegister() const;
  unsigned int getFrameRegister(const MachineFunction &MF) const;
  int getDwarfRegNum(unsigned RegNum, bool isEH) const;
};

namespace NMXX {

  /// helper that returns the canonical RC for the side of the given RC.
  /// GPRegs cannot be resolved and will return GPRegs
  const TargetRegisterClass *resolveSide(const TargetRegisterClass *RC);

} // NMXX namespace

} // llvm namespace

#endif // LLVM_TARGET_NMXX_REGISTERINFO_H
