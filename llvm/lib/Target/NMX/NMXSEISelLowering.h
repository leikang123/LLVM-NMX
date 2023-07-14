//===-- NMXSEISelLowering.h - NMXSE DAG Lowering Interface ---*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_NMX_NMXSEISELLOWERING_H
#define LLVM_LIB_TARGET_NMX_NMXSEISELLOWERING_H

#include "NMXISelLowering.h"
#include "NMXRegisterInfo.h"

namespace llvm {
class NMXSETargetLowering : public NMXTargetLowering {
public:
  explicit NMXSETargetLowering(const NMXTargetMachine &TM,
                                const NMXSubtarget &STI);

  SDValue LowerOperation(SDValue Op, SelectionDAG &DAG) const override;
private:
  bool isEligibleForTailCallOptimization(const NMXCC &NMXCCInfo,
                                         unsigned NextStackOffset,
                           const NMXMachineFunctionInfo &FI) const override;
};
}// End llvm namespace

#endif
