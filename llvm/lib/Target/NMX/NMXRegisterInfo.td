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
  def ZERO : NMXGPRReg<0,   "zero">, DwarfRegNum<[0]>;
  def AT   : NMXGPRReg<1,   "1">,    DwarfRegNum<[1]>;
  def V0   : NMXGPRReg<2,   "2">,    DwarfRegNum<[2]>;
  def V1   : NMXGPRReg<3,   "3">,    DwarfRegNum<[3]>;
  def A0   : NMXGPRReg<4,   "4">,    DwarfRegNum<[4]>;
  def A1   : NMXGPRReg<5,   "5">,    DwarfRegNum<[5]>;
  def T9   : NMXGPRReg<6,   "6">,    DwarfRegNum<[6]>;
  def T0   : NMXGPRReg<7,   "7">,    DwarfRegNum<[7]>;
  def T1   : NMXGPRReg<8,   "8">,    DwarfRegNum<[8]>;
  def S0   : NMXGPRReg<9,   "9">,    DwarfRegNum<[9]>;
  def S1   : NMXGPRReg<10,  "10">,   DwarfRegNum<[10]>;
  def GP   : NMXGPRReg<11,  "gp">,   DwarfRegNum<[11]>;
  def FP   : NMXGPRReg<12,  "fp">,   DwarfRegNum<[12]>;
  def SP   : NMXGPRReg<13,  "sp">,   DwarfRegNum<[13]>;
  def LR   : NMXGPRReg<14,  "lr">,   DwarfRegNum<[14]>;
  def SW   : NMXGPRReg<15,  "sw">,   DwarfRegNum<[15]>;

  def PC   : NMXC0Reg<0, "pc">,    DwarfRegNum<[20]>;
  def EPC  : NMXC0Reg<1, "epc">,   DwarfRegNum<[21]>;

  def HI   : NMXReg<0, "ac0">, DwarfRegNum<[18]>;
  def LO   : NMXReg<0, "ac0">, DwarfRegNum<[19]>;
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

