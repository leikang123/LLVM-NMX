//===-- NMXInstrInfo.h - NMX Instruction Information ----------*- C++ -*-===//
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

#ifndef LLVM_LIB_TARGET_NMX_NMXINSTRINFO_H
#define LLVM_LIB_TARGET_NMX_NMXINSTRINFO_H

#include "NMX.h"
#include "NMXRegisterInfo.h"
#include "NMXAnalyzeImmediate.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/TargetInstrInfo.h"

#define GET_INSTRINFO_HEADER
#include "NMXGenInstrInfo.inc"

namespace llvm {

/// 指令相关的代码，描述指令完成和指令相关的动作
class NMXInstrInfo : public NMXGenInstrInfo {
  virtual void anchor();
protected:
  const NMXSubtarget &Subtarget;
public:
  explicit NMXInstrInfo(const NMXSubtarget &STI);

  static const NMXInstrInfo *create(NMXSubtarget &STI);

  // TargetInstrInfo is a superset of MRegister info. As such, whenever a client
  // has an instance of instruction info, it should always be able to get
  // register info as well (through this method).
  virtual const NMXRegisterInfo &getRegisterInfo() const = 0;

  // Return the number of bytes of code the specified instruction maybe.
  unsigned GetInstSizeInBytes(const MachineInstr &MI) const;

  void storeRegToStackSlot(MachineBasicBlock &MBB,
                           MachineBasicBlock::iterator MBBI,
                           unsigned SrcReg, bool isKill, int FrameIndex,
                           const TargetRegisterClass *RC,
                           const TargetRegisterInfo *TRI) const override {
    storeRegToStack(MBB, MBBI, SrcReg, isKill, FrameIndex, RC, TRI, 0);
  }

  void loadRegFromStackSlot(MachineBasicBlock &MBB,
                            MachineBasicBlock::iterator MBBI,
                            unsigned DestReg, int FrameIndex,
                            const TargetRegisterClass *RC,
                            const TargetRegisterInfo *TRI) const override {
    loadRegFromStack(MBB, MBBI, DestReg, FrameIndex, RC, TRI, 0);
  }

  virtual void storeRegToStack(MachineBasicBlock &MBB,
                               MachineBasicBlock::iterator MI,
                               unsigned SrcReg, bool isKill, int FrameIndex,
                               const TargetRegisterClass *RC,
                               const TargetRegisterInfo *TRI,
                               int64_t Offset) const = 0;

  virtual void loadRegFromStack(MachineBasicBlock &MBB,
                                MachineBasicBlock::iterator MI,
                                unsigned DestReg, int FrameIndex,
                                const TargetRegisterClass *RC,
                                const TargetRegisterInfo *TRI,
                                int64_t Offset) const = 0;

  virtual void adjustStackPtr(unsigned SP, int64_t Amount,
                              MachineBasicBlock &MBB,
                              MachineBasicBlock::iterator I) const = 0;

protected:
  MachineMemOperand *GetMemOperand(MachineBasicBlock &MBB, int FI,
                                   MachineMemOperand::Flags Flags) const;
};

const NMXInstrInfo *createNMXSEInstrInfo(const NMXSubtarget &STI);
}

#endif
