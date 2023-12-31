//===-- NMXSubtarget.h - Define Subtarget for the NMX ---------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares the NMX specific subclass of TargetSubtargetInfo.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_NMX_NMXSUBTARGET_H
#define LLVM_LIB_TARGET_NMX_NMXSUBTARGET_H

#include "NMXFrameLowering.h"
#include "NMXISelLowering.h"
#include "NMXInstrInfo.h"
#include "llvm/CodeGen/SelectionDAGTargetInfo.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/MC/MCInstrItineraries.h"
#include "llvm/CodeGen/TargetSubtargetInfo.h"
#include <string>

#define GET_SUBTARGETINFO_HEADER
#include "NMXGenSubtargetInfo.inc"

extern bool NMXReserveGP;
extern bool NMXNoCpload;
/**
 * @brief 
 * 这段代码是LLVM项目中的一个名为NMXSubtarget的类的定义。以下是对代码的分析：

1. 该类位于`llvm`命名空间中。

1. `NMXSubtarget`类继承自`NMXGenSubtargetInfo`类。

1. 在类的定义中，包含了一些成员变量和成员函数。

   - 成员变量：

     - `NMXArchVersion`：NMX架构版本的枚举类型。
     - `IsLittle`：表示目标架构是否是小端（Little-Endian）。
     - `EnableOverflow`：是否启用溢出（overflow）。
     - `HasCmp`：是否支持`cmp`指令。
     - `HasSlt`：是否支持`slt`指令。
     - `InstrItins`：指令迭代数据。
     - `UseSmallSection`：是否使用小节（section）。
     - `TM`：对应的`NMXTargetMachine`对象。
     - `TargetTriple`：目标三元组（Triple）。
     - `TSInfo`：`SelectionDAGTargetInfo`对象。
     - `InstrInfo`：`NMXInstrInfo`对象的唯一指针。
     - `FrameLowering`：`NMXFrameLowering`对象的唯一指针。
     - `TLInfo`：`NMXTargetLowering`对象的唯一指针。

   - 成员函数：

     - `isPositionIndependent()`：判断目标架构是否是位置无关的。
     - `getABI()`：获取与目标架构相关的ABI信息。
     - `ParseSubtargetFeatures()`：解析子目标特性字符串，设置对应的子目标选项。
     - `isLittle()`：判断目标架构是否是小端。
     - `hasNMX32I()`、`isNMX32I()`、`hasNMX32II()`、`isNMX32II()`：判断目标架构是否支持NMX32I和NMX32II。
     - `enableOverflow()`、`disableOverflow()`、`hasCmp()`、`hasSlt()`：获取与特定指令相关的特性信息。
     - `useSmallSection()`：判断是否使用小节。
     - `abiUsesSoftFloat()`：判断ABI是否使用软件浮点。
     - `enableLongBranchPass()`：判断是否启用长分支优化。
     - `stackAlignment()`：获取栈对齐值。
     - `initializeSubtargetDependencies()`：初始化子目标的依赖项。
     - `getSelectionDAGInfo()`、`getInstrInfo()`、`getFrameLowering()`、`getRegisterInfo()`、`getTargetLowering()`、`getInstrItineraryData()`：获取与目标架构相关的信息对象。

1. 代码最后注释了`End llvm namespace`，表示代码中的`llvm`命名空间定义结束。

总体来说，这段代码定义了一个名为`NMXSubtarget`的类，用于表示LLVM项目中的某种目标架构的子目标。它包含了一些与目标架构相关的特性信息和功能函数。
 * 
 */
namespace llvm {
class StringRef;

class NMXTargetMachine;

class NMXSubtarget : public NMXGenSubtargetInfo {
  virtual void anchor();

protected:
  enum NMXArchEnum {
    NMX32I,
    NMX32II
  };

  // NMX architecture version
  // Controled by -mcpu in commandline
  NMXArchEnum NMXArchVersion;

  // IsLittle - The target is Little Endian
  bool IsLittle;

  bool EnableOverflow;

  // HasCmp - cmp instructions.
  bool HasCmp;

  // HasSlt - slt instructions.
  bool HasSlt;

  InstrItineraryData InstrItins;

  // Small section is used.
  bool UseSmallSection;

  const NMXTargetMachine &TM;

  Triple TargetTriple;

  const SelectionDAGTargetInfo TSInfo;

  std::unique_ptr<const NMXInstrInfo> InstrInfo;
  std::unique_ptr<const NMXFrameLowering> FrameLowering;
  std::unique_ptr<const NMXTargetLowering> TLInfo;

public:
  bool isPositionIndependent() const;
  const NMXABIInfo &getABI() const;

  // This constructor initializes the data members to match that
  // of the specified triple.
  NMXSubtarget(const Triple &TT, const std::string &CPU, const std::string &FS,
                bool little, const NMXTargetMachine &_TM);

  // Parses features string setting specified
  // subtarget options.  Definition of function is auto generated by tblgen.
  void ParseSubtargetFeatures(StringRef CPU, StringRef FS);

  bool isLittle() const { return IsLittle; }
  bool hasNMX32I() const { return NMXArchVersion >= NMX32I; }
  bool isNMX32I() const { return NMXArchVersion == NMX32I; }
  bool hasNMX32II() const { return NMXArchVersion >= NMX32II; }
  bool isNMX32II() const { return NMXArchVersion == NMX32II; }

  // Features related to the presence of specific instructions.
  bool enableOverflow() const { return EnableOverflow; }
  bool disableOverflow() const { return !EnableOverflow; }
  bool hasCmp()   const { return HasCmp; }
  bool hasSlt()   const { return HasSlt; }

  bool useSmallSection() const { return UseSmallSection; }

  bool abiUsesSoftFloat() const;

  bool enableLongBranchPass() const {
    return hasNMX32II();
  }

  unsigned stackAlignment() const { return 8; }

  NMXSubtarget &initializeSubtargetDependencies(StringRef CPU, StringRef FS,
                                                 const TargetMachine &TM);

  const SelectionDAGTargetInfo *getSelectionDAGInfo() const override {
    return &TSInfo;
  }
  const NMXInstrInfo *getInstrInfo() const override { return InstrInfo.get(); }
  const TargetFrameLowering *getFrameLowering() const override {
    return FrameLowering.get();
  }
  const NMXRegisterInfo *getRegisterInfo() const override {
    return &InstrInfo->getRegisterInfo();
  }
  const NMXTargetLowering *getTargetLowering() const override {
    return TLInfo.get();
  }
  const InstrItineraryData *getInstrItineraryData() const override {
    return &InstrItins;
  }
};
} // End llvm namespace

#endif
