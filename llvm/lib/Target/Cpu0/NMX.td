//===-- Cpu0.td - Describe the Cpu0 Target Machine ----*- tablegen -*-===//
//
//                  The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.

//
//===----------------------------------------------------------------------===//
// This is the top level entry point for the Cpu0 target.
//===----------------------------------------------------------------------===//

// NMX.td, Cpu0RegisterInfo.td are included in NMXAsm.td 

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

def Cpu0InstrInfo : InstrInfo;

def Cpu0AsmParser : AsmParser {
  let ShouldEmitMatchRegisterName = 0;
}

def Cpu0AsmParserVariant : AsmParserVariant {
  int Variant = 0;

  // Recognize hard coded registers.
  string RegisterPrefix = "$";
}

// Whill generate Cpu0GenAsmWrite.inc included by Cpu0InstPrinter.cpp, contents
// as follows,
// void Cpu0InstPrinter::printInstruction(const MCInst *MI, raw_ostream &O) {...}
// const char* Cpu0InstPrinter::getRegisterName(unsigned RegNo) {...}
def Cpu0 : Target {
  // def Cpu0InstrInfo : InstrInfo as before.
  let InstructionSet = Cpu0InstrInfo;
  let AssemblyParsers = [Cpu0AsmParser];
  let AssemblyParserVariants = [Cpu0AsmParserVariant];
}
