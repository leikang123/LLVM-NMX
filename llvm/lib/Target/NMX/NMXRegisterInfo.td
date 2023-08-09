//===-- NMXRegisterInfo.td - NMX Register defs -----------*- tablegen -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.

//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Declarations that describe the NMX register file
//===----------------------------------------------------------------------===//

// We have banks of 16 registers each.
class NMXReg<bits<16> Enc, string n> : Register<n> {
  // For tablegen(... -gen-emitter) in CMakeLists.txt
  let HWEncoding = Enc;
  let Namespace = "NMX";
}

// NMX CPU Registers
class NMXGPRReg<bits<16> Enc, string n> : NMXReg<Enc, n>;

// Co-processor 0 Registers
class NMXC0Reg<bits<16> Enc, string n> : NMXReg<Enc, n>;

//===----------------------------------------------------------------------===//
//@Registers
//===----------------------------------------------------------------------===//
// The register string, such as "9" or "gp" will show on "llvm-objdump -d"
//@ All registers dfinition
let Namespace = "NMX" in {
  //@ General Purpose Registers
  def A0  : NMXGPRReg<0,"A0">, DwarfRegNum<[0]>;
  
def A1  : NMXGPRReg<1,"A1">, DwarfRegNum<[1]>;
def A2  : NMXGPRReg<2,"A2">, DwarfRegNum<[2]>;
def A3  : NMXGPRReg<3, "A3">, DwarfRegNum<[3]>;
def A4  : NMXGPRReg<4,"A4">, DwarfRegNum<[4]>;
def A5  : NMXGPRReg<5,"A5">, DwarfRegNum<[5]>;
def A6  : NMXGPRReg<6,"A6">, DwarfRegNum<[6]>;
def A7  : NMXGPRReg<7,"A7">, DwarfRegNum<[7]>;
def A8  : NMXGPRReg<8,"A8">, DwarfRegNum<[8]>;
def A9  : NMXGPRReg<9, "A9">, DwarfRegNum<[9]>;
def A10 : NMXGPRReg<10,"A10">, DwarfRegNum<[10]>;
def A11 : NMXGPRReg<11, "A11">, DwarfRegNum<[11]>;
def A12 : NMXGPRReg<12, "A12">, DwarfRegNum<[12]>;
def A13 : NMXGPRReg<13, "A13">, DwarfRegNum<[13]>;
def A14 : NMXGPRReg<14, "A14">, DwarfRegNum<[14]>;
def A15 : NMXGPRReg<15, "A15">, DwarfRegNum<[15]>;
def A16 : NMXGPRReg<16, "A16">, DwarfRegNum<[16]>;
def A17 : NMXGPRReg<17, "A17">, DwarfRegNum<[17]>;
def A18 : NMXGPRReg<18, "A18">, DwarfRegNum<[18]>;
def A19 : NMXGPRReg<19, "A19">, DwarfRegNum<[19]>;
def A20 : NMXGPRReg<20, "A20">, DwarfRegNum<[20]>;
def A21 : NMXGPRReg<21, "A21">, DwarfRegNum<[21]>;
def A22 : NMXGPRReg<22, "A22">, DwarfRegNum<[22]>;
def A23 : NMXGPRReg<23, "A23">, DwarfRegNum<[23]>;
def A24 : NMXGPRReg<24,"A24">, DwarfRegNum<[24]>;
def A25 : NMXGPRReg<25,"A25">, DwarfRegNum<[25]>;
def A26 : NMXGPRReg<26, "A26">, DwarfRegNum<[26]>;
def A27 : NMXGPRReg<27, "A27">, DwarfRegNum<[27]>;
def A28 : NMXGPRReg<28,"A28">, DwarfRegNum<[28]>;
def A29 : NMXGPRReg<29, "A29">, DwarfRegNum<[29]>;
def A30 : NMXGPRReg<30, "A30">, DwarfRegNum<[30]>;
def A31 : NMXGPRReg<31, "A31">, DwarfRegNum<[31]>;
def B0  : NMXGPRReg<32, "B0">, DwarfRegNum<[32]>;
def B1  : NMXGPRReg<33, "B1">, DwarfRegNum<[33]>;
def B2  : NMXGPRReg<34,"B2">, DwarfRegNum<[34]>;
def B3  : NMXGPRReg<35,"B3">, DwarfRegNum<[35]>;
def B4  : NMXGPRReg<36, "B4">, DwarfRegNum<[36]>;
def B5  : NMXGPRReg<37, "B5">, DwarfRegNum<[37]>;
def B6  : NMXGPRReg<38, "B6">, DwarfRegNum<[38]>;
def B7  : NMXGPRReg<39, "B7">, DwarfRegNum<[39]>;
def B8  : NMXGPRReg<40,"B8">, DwarfRegNum<[40]>;
def B9  : NMXGPRReg<41,"B9">, DwarfRegNum<[41]>;
def B10 : NMXGPRReg<42, "B10">, DwarfRegNum<[42]>;
def B11 : NMXGPRReg<43, "B11">, DwarfRegNum<[43]>;
def B12 : NMXGPRReg<44, "B12">, DwarfRegNum<[44]>;
def B13 : NMXGPRReg<45, "B13">, DwarfRegNum<[45]>;
def B14 : NMXGPRReg<46, "B14">, DwarfRegNum<[46]>;
def B15 : NMXGPRReg<47,  "B15">, DwarfRegNum<[47]>;
def B16 : NMXGPRReg<48, "B16">, DwarfRegNum<[48]>;
def B17 : NMXGPRReg<49, "B17">, DwarfRegNum<[49]>;
def B18 : NMXGPRReg<50,  "B18">, DwarfRegNum<[50]>;
def B19 : NMXGPRReg<51,  "B19">, DwarfRegNum<[51]>;
def B20 : NMXGPRReg<52, "B20">, DwarfRegNum<[52]>;
def B21 : NMXGPRReg<53, "B21">, DwarfRegNum<[53]>;
def B22 : NMXGPRReg<54,"B22">, DwarfRegNum<[54]>;
def B23 : NMXGPRReg<55,  "B23">, DwarfRegNum<[55]>;
def B24 : NMXGPRReg<56,  "B24">, DwarfRegNum<[56]>;
def B25 : NMXGPRReg<57, "B25">, DwarfRegNum<[57]>;
def B26 : NMXGPRReg<58,  "B26">, DwarfRegNum<[58]>;
def B27 : NMXGPRReg<59,  "B27">, DwarfRegNum<[59]>;
def B28 : NMXGPRReg<60,  "B28">, DwarfRegNum<[60]>;
def B29 : NMXGPRReg<61,  "B29">, DwarfRegNum<[61]>;
def B30 : NMXGPRReg<62,  "B30">, DwarfRegNum<[62]>;
def B31 : NMXGPRReg<63,  "B31">, DwarfRegNum<[63]>;

}

//===----------------------------------------------------------------------===//
// @Register Classes
//===----------------------------------------------------------------------===//

def CPURegs : RegisterClass<"NMX", [i32], 32, (add
  // Reserved
  ZERO, AT,
  // Return Values and Arguments
  V0, V1, A0, A1,
  // Not preserved across procedure calls
  T9, T0, T1,
  // Callee save
  S0, S1,
  // Reserved
  GP, FP,
  SP, LR, SW)>;

// @Status Registers class
def SR : RegisterClass<"NMX", [i32], 32, (add SW)>;

// @Co-processor 0 Registers class
def C0Regs : RegisterClass<"NMX", [i32], 32, (add PC, EPC)>;

def HILO   : RegisterClass<"NMX", [i32], 32, (add HI, LO)>;

