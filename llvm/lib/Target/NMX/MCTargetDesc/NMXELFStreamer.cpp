//===-- nmxELFStreamer.cpp - nmx ELF Object Output ------------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "nmxELFStreamer.h"
#include "nmxTargetStreamer.h"
#include "llvm/BinaryFormat/ELF.h"
#include "llvm/MC/MCAsmBackend.h"
#include "llvm/MC/MCAssembler.h"
#include "llvm/MC/MCCodeEmitter.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCObjectWriter.h"
#include "llvm/MC/MCSymbolELF.h"
#include "llvm/Support/Casting.h"

using namespace llvm;

nmxELFStreamer::nmxELFStreamer(MCContext &Context,
                                 std::unique_ptr<MCAsmBackend> MAB,
                                 std::unique_ptr<MCObjectWriter> OW,
                                 std::unique_ptr<MCCodeEmitter> Emitter)
    : MCELFStreamer(Context, std::move(MAB), std::move(OW),
                    std::move(Emitter)) {}

MCELFStreamer *llvm::createnmxELFStreamer(MCContext &Context,
                                           std::unique_ptr<MCAsmBackend> MAB,
                                           std::unique_ptr<MCObjectWriter> OW,
                                           std::unique_ptr<MCCodeEmitter> Emitter,
                                           bool RelaxAll) {
  return new nmxELFStreamer(Context, std::move(MAB), std::move(OW),
                             std::move(Emitter));
}