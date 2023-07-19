//===-- nmxTargetDesc.h - nmx Target Descriptions -------------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file provides nmx specific target descriptions.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_nmx_MCTARGETDESC_nmxMCTARGETDESC_H
#define LLVM_LIB_TARGET_nmx_MCTARGETDESC_nmxMCTARGETDESC_H

#include "llvm/Support/DataTypes.h"

#include <memory>

namespace llvm {
  class MCAsmBackend;
  class MCCodeEmitter;
  class MCContext;
  class MCInstrInfo;
  class MCObjectTargetWriter;
  class MCRegisterInfo;
  class MCSubtargetInfo;
  class MCTargetOptions;
  class StringRef;
  class Target;
  class Triple;
  class raw_ostream;
  class raw_pwrite_stream;

  Target &getThenmxTarget();
  Target &getThenmxelTarget();

  MCCodeEmitter *createnmxMCCodeEmitterEB(const MCInstrInfo &MCII,
                                           const MCRegisterInfo &MRI,
                                           MCContext &Ctx);
  MCCodeEmitter *createnmxMCCodeEmitterEL(const MCInstrInfo &MCII,
                                           const MCRegisterInfo &MRI,
                                           MCContext &Ctx);

  MCAsmBackend *createnmxAsmBackendEB32(const Target &T,
                                         const MCSubtargetInfo &STI,
                                         const MCRegisterInfo &MRI,
                                         const MCTargetOptions &Options);
  MCAsmBackend *createnmxAsmBackendEL32(const Target &T,
                                         const MCSubtargetInfo &STI,
                                         const MCRegisterInfo &MRI,
                                         const MCTargetOptions &Options);

  std::unique_ptr<MCObjectTargetWriter>
  createnmxELFObjectWriter(const Triple &TT);
}

// Defines symbolic names for nmx registers. This defines a mapping from
//  register name to register number.
#define GET_REGINFO_ENUM
#include "nmxGenRegisterInfo.inc"

// Defines symbolic names for nmx instructions.
#define GET_INSTRINFO_ENUM
#include "nmxGenInstrInfo.inc"

#define GET_SUBTARGETINFO_ENUM
#include "nmxGenSubtargetInfo.inc"

#endif
