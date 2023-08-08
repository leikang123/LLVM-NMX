//===-- NMXTargetObjectFile.h - NMX Object Info ---------------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
#ifndef LLVM_LIB_TARGET_NMX_NMXTARGETOBJECTFILE_H
#define LLVM_LIB_TARGET_NMX_NMXTARGETOBJECTFILE_H

#include "NMXTargetMachine.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"

namespace llvm {
class NMXTargetMachine;
class NMXTargetObjectFile : public TargetLoweringObjectFileELF {
  MCSection *SmallDataSection;
  MCSection *SmallBSSSection;
  const NMXTargetMachine *TM;

  bool IsGlobalInSmallSection(const GlobalObject *GO,
                              const TargetMachine &TM, SectionKind Kind) const;
  bool IsGlobalInSmallSectionImpl(const GlobalObject *GO,
                                  const TargetMachine &TM) const;
public:
  void Initialize(MCContext &Ctx, const TargetMachine &TM) override;

  // Return true if this global address should be
  // placed into small data/bss section.
  bool IsGlobalInSmallSection(const GlobalObject *GO,
                              const TargetMachine &TM) const;

  MCSection *SelectSectionForGlobal(const GlobalObject *GO, SectionKind Kind,
                                    const TargetMachine &TM) const override;

};
} // end namespace llvm

#endif
