//===-- NMXSEInstrInfo.h - NMX32/64 Instruction Information ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the NMX32/64 implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_NMX_NMXSEINSTRINFO_H
#define LLVM_LIB_TARGET_NMX_NMXSEINSTRINFO_H

#include "NMXInstrInfo.h"
#include "NMXSERegisterInfo.h"
#include "NMXMachineFunctionInfo.h"

namespace llvm {
/**
 * @brief 
 * 
 * 这段代码定义了LLVM的NMXSEInstrInfo类。
 * NMXSEInstrInfo类是LLVM的NMXInstrInfo类的派生类，它重载了基类的一些函数，
 * 提供了针对NMX目标机器的指令信息。

NMXSEInstrInfo类包含了一个NMXSERegisterInfo类型的常量成员变量RI，
它表示NMX目标机器的寄存器信息（Register Info）。
该类重载了NMXInstrInfo类的虚函数getRegisterInfo、copyPhysReg、
expandPostRAPseudo、storeRegToStack、loadRegFromStack、
adjustStackPtr和loadImmediate。

其中，getRegisterInfo函数返回NMX目标机器的寄存器信息对象，
copyPhysReg函数用于将一个物理寄存器的值复制到另一个物理寄存器中，
expandPostRAPseudo函数用于将伪指令扩展为真实的指令，
storeRegToStack函数用于将寄存器值存储到堆栈帧中，
loadRegFromStack函数用于从堆栈帧中加载寄存器值，
adjustStackPtr函数用于调整堆栈指针的值，loadImmediate函数用于加载立即数。

该代码所在的头文件中，还包含了NMXSERegisterInfo和NMXSubtarget类的声明。
NMXSERegisterInfo类是NMX目标机器的扩展寄存器信息类，它扩展了NMX目标机器的寄存器信息。NMXSubtarget类是NMX目标机器的子目标类，它包含了NMX目标机器的特定信息，如指令集、特性等。
 */
class NMXSEInstrInfo : public NMXInstrInfo {
  const NMXSERegisterInfo RI;

public:
  explicit NMXSEInstrInfo(const NMXSubtarget &STI);

  const NMXRegisterInfo &getRegisterInfo() const override;

  void copyPhysReg(MachineBasicBlock &MBB, MachineBasicBlock::iterator MI,
                   const DebugLoc &DL, unsigned DestReg, unsigned SrcReg,
                   bool KillSrc) const override;

  // Expand Pseudo instructions into real backend instructions
  bool expandPostRAPseudo(MachineInstr &MI) const override;

  void storeRegToStack(MachineBasicBlock &MBB,
                       MachineBasicBlock::iterator MI,
                       unsigned SrcReg, bool isKill, int FrameIndex,
                       const TargetRegisterClass *RC,
                       const TargetRegisterInfo *TRI,
                       int64_t Offset) const override;

  void loadRegFromStack(MachineBasicBlock &MBB,
                        MachineBasicBlock::iterator MI,
                        unsigned DestReg, int FrameIndex,
                        const TargetRegisterClass *RC,
                        const TargetRegisterInfo *TRI,
                        int64_t Offset) const override;

  // Adjust SP by Amount bytes.
  void adjustStackPtr(unsigned SP, int64_t Amount, MachineBasicBlock &MBB,
                      MachineBasicBlock::iterator I) const override;

  // Emit a series of instructions to load an immediate. If NewImm is a
  // non-NULL parameter, the last instruction is not emitted, but instead
  // its immediate operand is returned in NewImm.
  unsigned loadImmediate(int64_t Imm, MachineBasicBlock &MBB,
                         MachineBasicBlock::iterator II, const DebugLoc &DL,
                         unsigned *NewImm) const;

private:
  void expandRetLR(MachineBasicBlock &MBB, MachineBasicBlock::iterator I) const;
};

} // End llvm namespace

#endif
