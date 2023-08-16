//===-- nmxMCTargetDesc.cpp - nmx Target Descriptions ---------*- C++ -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file provides nmx specific target descirptions.
//
//===----------------------------------------------------------------------===//

#include "nmxMCTargetDesc.h"
#include "InstPrinter/nmxInstPrinter.h"
#include "nmxAsmBackend.h"
#include "nmxELFStreamer.h"
#include "nmxMCAsmInfo.h"
#include "nmxTargetStreamer.h"
#include "llvm/ADT/Triple.h"
#include "llvm/MC/MCCodeEmitter.h"
#include "llvm/MC/MCELFStreamer.h"
#include "llvm/MC/MCInstrAnalysis.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCObjectWriter.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/MC/MachineLocation.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define GET_INSTRINFO_MC_DESC
#include "nmxGenInstrInfo.inc"

#define GET_SUBTARGETINFO_MC_DESC
#include "nmxGenSubtargetInfo.inc"

#define GET_REGINFO_MC_DESC
#include "nmxGenRegisterInfo.inc"

// Select the nmx Architecture Feature for the given triple and cpu name.
// The function will be called at command 'llvm-objdump -d' for nmx elf input.
static StringRef selectnmxArchFeature(const Triple &TT, StringRef CPU) {
  std::string nmxArchFeature;
  if (CPU.empty() || CPU == "generic") {
    if (TT.getArch() == Triple::nmx || TT.getArch() == Triple::nmxel) {
      if (CPU.empty() || CPU == "nmx32II") {
        nmxArchFeature = "+nmx32II";
      } else if (CPU == "nmx32I") {
        nmxArchFeature = "+nmx32I";
      }
    }
  }
  return nmxArchFeature;
}

static MCInstrInfo *createnmxMCInstrInfo() {
  MCInstrInfo *X = new MCInstrInfo();
  InitnmxMCInstrInfo(X); // defined in nmxGenInstrInfo.inc
  return X;
}

static MCRegisterInfo *createnmxMCRegisterInfo(const Triple &TT) {
  MCRegisterInfo *X = new MCRegisterInfo();
  InitnmxMCRegisterInfo(X, nmx::SW); // defined in nmxGenRegisterInfo.inc
  return X;
}

static MCSubtargetInfo *createnmxMCSubtargetInfo(const Triple &TT,
                                                  StringRef CPU, StringRef FS) {
  std::string ArchFS = selectnmxArchFeature(TT, CPU);
  if (!FS.empty()) {
    if (!ArchFS.empty()) {
      ArchFS = ArchFS + "," + FS.str();
    } else {
      ArchFS = FS;
    }
  }
  return createnmxMCSubtargetInfoImpl(TT, CPU, ArchFS);
  // createnmxMCSubtargetInfoImpl defined in nmxGenSubtargetInfo.inc
}

static MCAsmInfo *createnmxMCAsmInfo(const MCRegisterInfo &MRI,
                                      const Triple &TT) {
  MCAsmInfo *MAI = new nmxMCAsmInfo(TT);

  unsigned SP = MRI.getDwarfRegNum(nmx::SP, true);
  MCCFIInstruction Inst = MCCFIInstruction::createDefCfa(nullptr, SP, 0);
  MAI->addInitialFrameState(Inst);

  return MAI;
}

static MCInstPrinter *createnmxMCInstPrinter(const Triple &TT,
                                              unsigned SyntaxVariant,
                                              const MCAsmInfo &MAI,
                                              const MCInstrInfo &MII,
                                              const MCRegisterInfo &MRI) {
  return new nmxInstPrinter(MAI, MII, MRI);
}

static MCStreamer *createMCStreamer(const Triple &TT, MCContext &Context,
                                    std::unique_ptr<MCAsmBackend> &&MAB,
                                    std::unique_ptr<MCObjectWriter> &&OW,
                                    std::unique_ptr<MCCodeEmitter> &&Emitter,
                                    bool RelaxAll) {
  return createnmxELFStreamer(Context, std::move(MAB), std::move(OW),
                               std::move(Emitter), RelaxAll);
}

static MCTargetStreamer *createnmxAsmTargetStreamer(MCStreamer &S,
                                                     formatted_raw_ostream &OS,
                                                     MCInstPrinter *InstPrint,
                                                     bool isVerboseAsm) {
  return new nmxTargetAsmStreamer(S, OS);
}

namespace {
class nmxMCInstrAnalysis : public MCInstrAnalysis {
public:
  nmxMCInstrAnalysis(const MCInstrInfo *Info) : MCInstrAnalysis(Info) { }
};
}

static MCInstrAnalysis *createnmxMCInstrAnalysis(const MCInstrInfo *Info) {
  return new nmxMCInstrAnalysis(Info);
}
// 实现目标结构的功能函数生成库.a
extern "C" void LLVMInitializenmxTargetMC() {
  Target &ThenmxTarget = getThenmxTarget();
  Target &ThenmxelTarget = getThenmxelTarget();
  for (Target *T : {&ThenmxTarget, &ThenmxelTarget}) {
    // Register the MC asm info
    RegisterMCAsmInfoFn X(*T, createnmxMCAsmInfo);

    // Register the MC instruction info
    TargetRegistry::RegisterMCInstrInfo(*T, createnmxMCInstrInfo);

    // Register the MC register info
    TargetRegistry::RegisterMCRegInfo(*T, createnmxMCRegisterInfo);

    // Register the MC Subtarget info
    TargetRegistry::RegisterMCSubtargetInfo(*T, createnmxMCSubtargetInfo);

    // Register the MC instruction analyzer
    TargetRegistry::RegisterMCInstrAnalysis(*T, createnmxMCInstrAnalysis);

    // Register the MC instruction printer
    TargetRegistry::RegisterMCInstPrinter(*T, createnmxMCInstPrinter);

    // Register the elf streamer.
    TargetRegistry::RegisterELFStreamer(*T, createMCStreamer);

    // Register the asm target streamer.
    TargetRegistry::RegisterAsmTargetStreamer(*T, createnmxAsmTargetStreamer);
  }

  // Register the MC Code Emitter
  TargetRegistry::RegisterMCCodeEmitter(ThenmxTarget,
                                        createnmxMCCodeEmitterEB);
  TargetRegistry::RegisterMCCodeEmitter(ThenmxelTarget,
                                        createnmxMCCodeEmitterEL);

  // Register the asm backend
  TargetRegistry::RegisterMCAsmBackend(ThenmxTarget,
                                       createnmxAsmBackendEB32);
  TargetRegistry::RegisterMCAsmBackend(ThenmxelTarget,
                                       createnmxAsmBackendEL32);
}
