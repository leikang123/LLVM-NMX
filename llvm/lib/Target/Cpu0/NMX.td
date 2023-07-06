//===-- NMX.td - Describe the NMX Target Machine ----*- tablegen -*-===//
//
//                  The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.

//
//===----------------------------------------------------------------------===//
// This is the top level entry point for the NMX target.
//===----------------------------------------------------------------------===//

// NMX.td, NMXRegisterInfo.td are included in NMXAsm.td 

//===----------------------------------------------------------------------===//
// Target-dependent interfaces
//===----------------------------------------------------------------------===//

// Calling Conversion
include "NMXSchedule.td"

// Instruction Description
include "NMXInstrInfo.td"

// Calling Convention
include "NMXCallingConv.td"

//===----------------------------------------------------------------------===//
// NMX SUbtarget features
//===----------------------------------------------------------------------===//

def FeatureCmp            : SubtargetFeature<"cmp", "HasCmp", "true",
                                             "Enable 'cmp' instructions.">;
def FeatureSlt            : SubtargetFeature<"slt", "HasSlt", "true",
                                             "Enable 'slt' instructions.">;
def FeatureCpu032I        : SubtargetFeature<"NMX32I", "NMXArchVersion",
                                             "NMX32I", "NMX032I ISA Support",
                                             [FeatureCmp]>;
def FeatureCpu032II       : SubtargetFeature<"NMX32II", "NMXArchVersion",
                                             "NMX32II", "NMX32II ISA Support",
                                             [FeatureCmp, FeatureSlt]>;

//===----------------------------------------------------------------------===//
// NMX processors supported
//===----------------------------------------------------------------------===//
class Proc<string Name, list<SubtargetFeature> Features>
  : Processor<Name, NMXGenericItineraries, Features>;

def : Proc<"NMX32I", [FeatureNMX32I]>;
def : Proc<"NMX32II", [FeatureNMX32II]>;

def NMXInstrInfo : InstrInfo;

def NMXAsmParser : AsmParser {
  let ShouldEmitMatchRegisterName = 0;
}

def NMXAsmParserVariant : AsmParserVariant {
  int Variant = 0;

  // Recognize hard coded registers.
  string RegisterPrefix = "$";
}

def NMX: Target {
 
  let InstructionSet = NMXInstrInfo;
  let AssemblyParsers = [NMXAsmParser];
  let AssemblyParserVariants = [NMXAsmParserVariant];
}
