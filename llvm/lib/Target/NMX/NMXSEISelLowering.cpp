//===-- NMXSEISelLowering.cpp - NMXSE DAG Lowering Interface --*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Subclass of NMXTargetLowering specialized for NMX32.
//
//===----------------------------------------------------------------------===//
#include "NMXMachineFunctionInfo.h"
#include "NMXISelLowering.h"
#include "NMXSEISelLowering.h"

#include "NMXRegisterInfo.h"
#include "NMXTargetMachine.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegionInfo.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/CodeGen/TargetInstrInfo.h"

using namespace llvm;

#define DEBUG_TYPE "NMX-isel"

static cl::opt<bool>
EnableNMXTailCalls("enable-NMX-tail-calls", cl::Hidden,
                    cl::desc("NMX: Enable tail calls."),
                    cl::init(false));

NMXSETargetLowering::NMXSETargetLowering(const NMXTargetMachine &TM,
                                           const NMXSubtarget &STI)
    : NMXTargetLowering(TM, STI) {
  // Set up the register classes
  addRegisterClass(MVT::i32, &NMX::CPURegsRegClass);

  // Once all of the register classes are added, this allows us to compute
  // deirved properties we expose.
  computeRegisterProperties(Subtarget.getRegisterInfo());
}

SDValue NMXSETargetLowering::LowerOperation(SDValue Op,
                                             SelectionDAG &DAG) const {
  return NMXTargetLowering::LowerOperation(Op, DAG);
}

const NMXTargetLowering *
llvm::createNMXSETargetLowering(const NMXTargetMachine &TM,
                           const NMXSubtarget &STI) {
  return new NMXSETargetLowering(TM, STI);
}

bool NMXSETargetLowering::
isEligibleForTailCallOptimization(const NMXCC &NMXCCInfo,
                                  unsigned NextStackOffset,
                                  const NMXMachineFunctionInfo &FI) const {
  if (!EnableNMXTailCalls)
    return false;

  // Return false if either the callee or caller has a byval argument.
  if (NMXCCInfo.hasByValArg() || FI.hasByvalArg())
    return false;

  // Return true if the callee's argument area is no larger than the
  // calleer's.
  return NextStackOffset <= FI.getIncomingArgSize();
}

