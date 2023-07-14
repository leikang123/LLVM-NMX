//===-- NMXTargetMachine.h - Define TargetMachine for NMX -----*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares the NMX specific subclass of TargetMachine.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_NMX_NMXTARGETMACHINE_H
#define LLVM_LIB_TARGET_NMX_NMXTARGETMACHINE_H

#include "MCTargetDesc/NMXABIInfo.h"
#include "NMXSubtarget.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/SelectionDAGISel.h"
#include "llvm/CodeGen/TargetFrameLowering.h"
#include "llvm/Target/TargetMachine.h"

namespace llvm {
class formatted_raw_ostream;
class NMXRegisterInfo;

class NMXTargetMachine : public LLVMTargetMachine {
  bool isLittle;
  std::unique_ptr<TargetLoweringObjectFile> TLOF;
  NMXABIInfo ABI;
  NMXSubtarget DefaultSubtarget;

  mutable StringMap<std::unique_ptr<NMXSubtarget>> SubtargetMap;
public:
  NMXTargetMachine(const Target &T, const Triple &TT, StringRef CPU,
                    StringRef FS, const TargetOptions &Options,
                    Optional<Reloc::Model> RM, Optional<CodeModel::Model> CM,
                    CodeGenOpt::Level OL, bool JIT, bool isLittle);
  ~NMXTargetMachine() override;

  const NMXSubtarget *getSubtargetImpl() const {
    return &DefaultSubtarget;
  }

  // Can use this interface to fetch subtarget
  const NMXSubtarget *getSubtargetImpl(const Function &F) const override;

  // Pass Pipeline Configuration
  TargetPassConfig *createPassConfig(PassManagerBase &PM) override;

  TargetLoweringObjectFile *getObjFileLowering() const override {
    return TLOF.get();
  }
  bool isLittleEndian() const { return isLittle; }
  const NMXABIInfo &getABI() const { return ABI; }
};

// This is big endian type NMX32 target machine.
class NMXebTargetMachine : public NMXTargetMachine {
  virtual void anchor();
public:
  NMXebTargetMachine(const Target &T, const Triple &TT, StringRef CPU,
                      StringRef FS, const TargetOptions &Options,
                      Optional<Reloc::Model> RM,
                      Optional<CodeModel::Model> CM,
                      CodeGenOpt::Level OL, bool JIT);
};
// This is default little endian NMX32 target machine.
class NMXelTargetMachine : public NMXTargetMachine {
  virtual void anchor();
public:
  NMXelTargetMachine(const Target &T, const Triple &TT, StringRef CPU,
                      StringRef FS, const TargetOptions &Options,
                      Optional<Reloc::Model> RM,
                      Optional<CodeModel::Model> CM,
                      CodeGenOpt::Level OL, bool JIT);
};
} // End llvm namespace

#endif
