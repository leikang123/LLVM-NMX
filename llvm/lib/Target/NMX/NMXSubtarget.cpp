//===-- NMXSubtarget.cpp - NMX Subtarget Information --------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the NMX specific subclass of TargetSubtargetInfo.
//
//===----------------------------------------------------------------------===//

#include "NMXSubtarget.h"

#include "NMXMachineFunctionInfo.h"
#include "NMX.h"
#include "NMXRegisterInfo.h"

#include "NMXTargetMachine.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define DEBUG_TYPE "NMX-subtarget"

#define GET_SUBTARGETINFO_TARGET_DESC
#define GET_SUBTARGETINFO_CTOR
#include "NMXGenSubtargetInfo.inc"

extern bool FixGlobalBaseReg;

static cl::opt<bool> EnableOverflowOpt
                 ("NMX-enable-overflow", cl::Hidden, cl::init(false),
                  cl::desc("Use trigger overflow instructions add and sub \
                  instead of non-overflow instructions addu and subu"));

static cl::opt<bool> UseSmallSectionOpt
                 ("NMX-use-small-section", cl::Hidden, cl::init(false),
                  cl::desc("Use small section. Only work when -relocation-model="
                  "static. pic always not use small section."));

static cl::opt<bool> ReserveGPOpt
                 ("NMX-reserve-gp", cl::Hidden, cl::init(false),
                  cl::desc("Never allocate $gp to variable"));

static cl::opt<bool> NoCploadOpt
                 ("NMX-no-cpload", cl::Hidden, cl::init(false),
                  cl::desc("No issue .cpload"));

bool NMXReserveGP;
bool NMXNoCpload;

void NMXSubtarget::anchor() { }

NMXSubtarget::NMXSubtarget(const Triple &TT, const std::string &CPU,
                             const std::string &FS, bool little,
                             const NMXTargetMachine &_TM) :
  // NMXGenSubtargetInfo will display features by llc -march=NMX -mcpu=help
  NMXGenSubtargetInfo(TT, CPU, FS),
  IsLittle(little), TM(_TM), TargetTriple(TT), TSInfo(),
      InstrInfo(
          NMXInstrInfo::create(initializeSubtargetDependencies(CPU, FS, TM))),
      FrameLowering(NMXFrameLowering::create(*this)),
      TLInfo(NMXTargetLowering::create(TM, *this)) {

  EnableOverflow = EnableOverflowOpt;

  // Set UseSmallSection.
  UseSmallSection = UseSmallSectionOpt;
  NMXReserveGP = ReserveGPOpt;
  NMXNoCpload = NoCploadOpt;
#ifdef ENABLE_GPRESTORE
  if (!TM.isPositionIndependent() && !UseSmallSection && !NMXReserveGP)
    FixGlobalBaseReg = false;
  else
#endif
    FixGlobalBaseReg = true;

}

bool NMXSubtarget::isPositionIndependent() const {
  return TM.isPositionIndependent();
}

NMXSubtarget &
NMXSubtarget::initializeSubtargetDependencies(StringRef CPU, StringRef FS,
                                               const TargetMachine &TM) {
  if (TargetTriple.getArch() == Triple::NMX || TargetTriple.getArch() == Triple::NMXel) {
    if (CPU.empty() || CPU == "generic") {
      CPU = "NMX32II";
    }
    else if (CPU == "help") {
      CPU = "";
      return *this;
    }
    else if (CPU != "NMX32I" && CPU != "NMX32II") {
      CPU = "NMX32II";
    }
  }
  else {
    errs() << "!!!Error, TargetTriple.getArch() = " << TargetTriple.getArch()
           <<  "CPU = " << CPU << "\n";
    exit(0);
  }

  if (CPU == "NMX32I")
    NMXArchVersion = NMX32I;
  else if (CPU == "NMX32II")
    NMXArchVersion = NMX32II;

  if (isNMX32I()) {
    HasCmp = true;
    HasSlt = false;
  }
  else if (isNMX32II()) {
    HasCmp = true;
    HasSlt = true;
  }
  else {
    errs() << "-mcpu must be empty(default:NMX32II), NMX32I or NMX32II" << "\n";
  }

  // Parse features string.
  ParseSubtargetFeatures(CPU, FS);
  // Initialize scheduling itinerary for the specified CPU.
  InstrItins = getInstrItineraryForCPU(CPU);

  return *this;
}

bool NMXSubtarget::abiUsesSoftFloat() const {
//  return TM->Options.UseSoftFloat;
  return true;
}

const NMXABIInfo &NMXSubtarget::getABI() const { return TM.getABI(); }
