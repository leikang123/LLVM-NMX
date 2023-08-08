//===-- nmxSchedule.td - nmx Scheduling Definitions ------*- tablegen -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.

//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Functional units across chips sets. Based on GCC/nmx backend files
//===----------------------------------------------------------------------===//
def ALU     : FuncUnit;
def IMULDIV : FuncUnit;

//===----------------------------------------------------------------------===//
// Instruction Itinerary classes used for nmx
//===----------------------------------------------------------------------===//
def IIAlu              : InstrItinClass;
def IICLO              : InstrItinClass;
def IICLZ              : InstrItinClass;
def IILoad             : InstrItinClass;
def IIStore            : InstrItinClass;
def IIBranch           : InstrItinClass;
def IIPseudo           : InstrItinClass;

def IIHiLo             : InstrItinClass;
def IIImul             : InstrItinClass;
def IIIdiv             : InstrItinClass;

//===----------------------------------------------------------------------===//
// nmx Generic instruction itineraries
//===----------------------------------------------------------------------===//
def nmxGenericItineraries : ProcessorItineraries<[ALU, IMULDIV], [], [
  InstrItinData<IIAlu               ,  [InstrStage<1,   [ALU]>]>,
  InstrItinData<IICLO               ,  [InstrStage<1,   [ALU]>]>,
  InstrItinData<IICLZ               ,  [InstrStage<1,   [ALU]>]>,
  InstrItinData<IILoad              ,  [InstrStage<3,   [ALU]>]>,
  InstrItinData<IIStore             ,  [InstrStage<1,   [ALU]>]>,
  InstrItinData<IIBranch            ,  [InstrStage<1,   [ALU]>]>,

  InstrItinData<IIHiLo              ,  [InstrStage<1,   [IMULDIV]>]>,
  InstrItinData<IIImul              ,  [InstrStage<17,  [IMULDIV]>]>,
  InstrItinData<IIIdiv              ,  [InstrStage<38,  [IMULDIV]>]>

]>;
