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

// Predicate registers: things that can be used for conditional execution
// in instructions: A0-2, B0-2.

def PredRegs : RegisterClass<"NMXNMXX", [i32], 32,
  [ A0, A1, A2, B0, B1, B2 ]>
{
let MethodProtos = [{
  iterator allocation_order_begin(const MachineFunction &MF) const;
  iterator allocation_order_end(const MachineFunction &MF) const;
}];
let MethodBodies = [{
  PredRegsClass::iterator
  PredRegsClass::allocation_order_begin(const MachineFunction &MF) const {
     return begin();
  }
  PredRegsClass::iterator
  PredRegsClass::allocation_order_end(const MachineFunction &MF) const {
    const TargetMachine &TM = MF.getTarget();
    const NMXNMXXSubtarget &ST = TM.getSubtarget<NMXNMXXSubtarget>();
    if (!ST.assignBSideRegisters())
      return end() - 3; // Don't allocate B predicate registers
    else
      return end();
  }
}];
}

def APredRegs : RegisterClass<"NMXNMXX", [i32], 32,
  [ A0, A1, A2 ]>;

def BPredRegs : RegisterClass<"NMXNMXX", [i32], 32,
  [ B0, B1, B2 ]>;

// Normal, general purpose 32 bit registers
def GPRegs : RegisterClass<"NMXNMXX", [i32], 32,
  [
    // A10-A15, B10-B15 are nonvolatile, B15 SP, A15 FP.
    // B14 is a data page pointer used by TIs C compiler for
    // the near memory model; we'll treat as reserved
    A3, A4, A5, A6, A7, A8, A9,
    A16, A17, A18, A19, A20, A21, A22, A23,
    A24, A25, A26, A27, A28, A29, A30, A31,
    /* Sparc and others put volatile / reserved registers at the
     * end to decrease likelyhood of being allocated */
    A0, A1, A2, //Predicate regs
    A10, A11, A12, A13, A14,

    // Until a reasonable instruction + register scheduler gets
    // generated that can cope with xpath requirements in insn
    // packets, limit register allocations to side A of the proc
    B0, B1, B2,                              // 3 conditional
    B3, B4, B5, B6, B7, B8, B9,              // 7
    B10, B11, B12, B13,                      // 4 callee saved
    B16, B17, B18, B19, B20, B21, B22, B23,  // 8
    B24, B25, B26, B27, B28, B29, B30, B31,  // 8
    A15, B14, B15                            // 3: SP, FP, DP
  ] >
{
let MethodProtos = [{
  iterator allocation_order_begin(const MachineFunction &MF) const;
  iterator allocation_order_end(const MachineFunction &MF) const;
}];
let MethodBodies = [{
  GPRegsClass::iterator
  GPRegsClass::allocation_order_begin(const MachineFunction &MF) const {
     return begin();
  }
  GPRegsClass::iterator
  GPRegsClass::allocation_order_end(const MachineFunction &MF) const {

    // Don't allocate SP/FP/DP
    GPRegsClass::iterator allocEnd = end() - 3;

    const TargetMachine &TM = MF.getTarget();
    const NMXNMXXSubtarget &ST = TM.getSubtarget<NMXNMXXSubtarget>();
    if (!ST.assignBSideRegisters())
      return allocEnd - 30; // Don't allocate any BRegs at all
    else
      return allocEnd;
  }
}];
}

// Same regiseters, but seperate into different sides
def ARegs : RegisterClass<"NMXNMXX", [i32], 32,
  [
    A3, A4, A5, A6, A7, A8, A9,
    A16, A17, A18, A19, A20, A21, A22, A23,
    A24, A25, A26, A27, A28, A29, A30, A31,
    A0, A1, A2,     // Predicate regs
    A10, A11, A12, A13, A14,  // Nonvolatile
    A15       // Reserved
  ] >
{
let MethodProtos = [{
  iterator allocation_order_begin(const MachineFunction &MF) const;
  iterator allocation_order_end(const MachineFunction &MF) const;
}];
let MethodBodies = [{
  ARegsClass::iterator
  ARegsClass::allocation_order_begin(const MachineFunction &MF)
                  const {
     return begin();
  }
  ARegsClass::iterator
  ARegsClass::allocation_order_end(const MachineFunction &MF)
                  const {
    return end()-1;
  }
}];
}

def BRegs : RegisterClass<"NMXNMXX", [i32], 32,
  [
    B3, B4, B5, B6, B7, B8,
    B16, B17, B18, B19, B20, B21, B22, B23,
    B24, B25, B26, B27, B28, B29, B30, B31,
    B0, B1, B2,     // Predicate regs
    B10, B11, B12, B13,   // Nonvolatilie regs
    B14, B15
  ] >
{
let MethodProtos = [{
  iterator allocation_order_begin(const MachineFunction &MF) const;
  iterator allocation_order_end(const MachineFunction &MF) const;
}];
let MethodBodies = [{
  BRegsClass::iterator
  BRegsClass::allocation_order_begin(const MachineFunction &MF)
                  const {
     return begin();
  }
  BRegsClass::iterator
  BRegsClass::allocation_order_end(const MachineFunction &MF)
                  const {
    return end()-2;
  }
}];
}

// Our general purpose registers, but in vector form
def VectorRegs : RegisterClass<"NMXNMXX", [v4i8,v2i16], 32,
  [
    /* See comments above */
    A3, A4, A5, A6, A7, A8, A9, B3, B4, B5, B6, B7, B8,
    A16, A17, A18, A19, A20, A21, A22, A23,
    A24, A25, A26, A27, A28, A29, A30, A31,
    B16, B17, B18, B19, B20, B21, B22, B23,
    B24, B25, B26, B27, B28, B29, B30, B31,
    A0, A1, A2, B0, B1, B2,
    A10, A11, A12, A13, A14,
    B10, B11, B12, B13,
    A15, B14, B15
  ] >
{
let MethodProtos = [{
  iterator allocation_order_begin(const MachineFunction &MF) const;
  iterator allocation_order_end(const MachineFunction &MF) const;
}];
let MethodBodies = [{
  VectorRegsClass::iterator
  VectorRegsClass::allocation_order_begin(const MachineFunction &MF)
                  const {
     return begin();
  }
  VectorRegsClass::iterator
  VectorRegsClass::allocation_order_end(const MachineFunction &MF)
                  const {
    /* See comment above */
    return end()-3;
  }
}];
}
