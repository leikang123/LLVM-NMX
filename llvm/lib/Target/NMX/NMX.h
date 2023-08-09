#ifndef LLVM_LIB_TARGET_NMX_NMX_H
#define LLVM_LIB_TARGET_NMX_NMX_H

#include "MCTargetDesc/NMXMCTargetDesc.h"
#include "llvm/Target/TargetMachine.h"

namespace llvm {
  class NMXTargetMachine;
  class FunctionPass;

  FunctionPass *createNMXDelJmpPass(NMXTargetMachine &TM);
  FunctionPass *createNMXDelaySlotFillerPass(NMXTargetMachine &TM);
} // end namespace llvm

#define ENABLE_GPRESTORE

#endif
