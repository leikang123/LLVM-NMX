//===-- NMXFrameLowering.h - Frame Information for NMX --------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_NMX_NMXFRAMELOWERING_H
#define LLVM_LIB_TARGET_NMX_NMXFRAMELOWERING_H

#include "NMX.h"
#include "llvm/CodeGen/TargetFrameLowering.h"
/// @brief 
/// 栈的管理，栈指针的原理和方法
namespace llvm {
class NMXSubtarget;

class NMXFrameLowering : public TargetFrameLowering {
protected:
  const NMXSubtarget &STI;

public:
  explicit NMXFrameLowering(const NMXSubtarget &sti, unsigned Alignment)
    : TargetFrameLowering(StackGrowsDown, Alignment, 0, Alignment),
      STI(sti) { }

  static const NMXFrameLowering *create(const NMXSubtarget &ST);
  /// 
  bool hasFP(const MachineFunction &MF) const override;

  MachineBasicBlock::iterator
  eliminateCallFramePseudoInstr(MachineFunction &MF,
                                MachineBasicBlock &MBB,
                                MachineBasicBlock::iterator I) const override;

};

// Create NMXFrameLowering objects.
const NMXFrameLowering *createNMXSEFrameLowering(const NMXSubtarget &ST);

} // End llvm namespace

#endif
