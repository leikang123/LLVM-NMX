//===-- NMXInstrFormats.td - NMX Instruction Formats -----*- tablegen -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.

///===----------------------------------------------------------------------===///
/// OPERAND DEFINITIONS 
///===-----------------------------------------------------------------------===///


// NKim, this operand is useful when dealing with indirect calls specific
// to the TI which does not natively support register calls. Now, as a work-
// around we create a label, push it into B3, issue a call, and then put
// the label right after the call-instruction

def LabelOperand : Operand<iPTR>;

// This input operand is used for the regular (non register) calls, which go
// to a global address or to an external symbol

def CallTargetOperand : Operand<i32>;

def BranchTargetOperand : Operand<OtherVT>;

class UnitSupport<bit l, bit s, bit m, bit d> {
  bits<4> units = { d, m, s, l };
}

def units_fixed : UnitSupport<0,0,0,0>;
def units_any   : UnitSupport<1,1,1,1>;
def units_l     : UnitSupport<1,0,0,0>;
def units_s     : UnitSupport<0,1,0,0>;
def units_m     : UnitSupport<0,0,1,0>;
def units_d     : UnitSupport<0,0,0,1>;
def units_notm  : UnitSupport<1,1,0,1>;

class Delay<bits<3> val> {
  bits<3> value = val;
}

class InstUnit<bits<2> u> {
  bits<2> unit = u;
}

def unit_l      : InstUnit<0>;
def unit_s      : InstUnit<1>;
def unit_m      : InstUnit<2>;
def unit_d      : InstUnit<3>;

// the form operand used to define flexible parts of an instruction.
// note: it does NOT define the cluster side, separate instructions are
// generated so that appropriate register classes can be used.
class InstructionForm<dag OpTypes, int default>
  : OptionalDefOperand<OtherVT, OpTypes, (ops (i32 default))> {
  let PrintMethod = "printFU";
}

// maps units to the encoding of the instruction form operand used in flexible
// instructions.
class FormEncoding<InstUnit iu> {
  // a 3-bit immediate where the upper 2 bits encode the functional unit and the
  // rightmost bit signals use of the xpath (datapath for loads/stores)
  bits<3> imm = 0;
  let imm{2-1} = iu.unit;
}

// the following can be used to define default units per instruction
def default_form : InstructionForm<(ops timm), -1>;
def l_form : InstructionForm<(ops timm), FormEncoding<unit_l>.imm>;
def s_form : InstructionForm<(ops timm), FormEncoding<unit_s>.imm>;
def m_form : InstructionForm<(ops timm), FormEncoding<unit_m>.imm>;
def d_form : InstructionForm<(ops timm), FormEncoding<unit_d>.imm>;


// here is me not being able to cast int to bit...
class InstSide<int si, bit sb> {
  int intval = si;
  bit bitval = sb;
}

def side_a : InstSide<0,0>;
def side_b : InstSide<1,1>;

def mem_operand	: Operand<i32> {
	let PrintMethod = "printMemOperand";
	let MIOperandInfo = (ops GPRegs, GPRegs);
}

// NKIM, for the time being we require the root-node to be supplied
def addr : ComplexPattern<i32, 2, "select_addr", [frameindex], [SDNPWantRoot]>;

// AJO: let select_addr defer to select_idxaddr internally (no more _idx instrs)
//def idxaddr : ComplexPattern<i32, 2, "select_idxaddr", [frameindex], [SDNPWantRoot]>;

def uconst4_xform : SDNodeXForm<imm, [{
	return CurDAG->getTargetConstant((int)N->getSExtValue(), MVT::i32);
}]>;
def uconst4 : PatLeaf<(imm), [{
	int val = (int)N->getSExtValue();
	return (val <= 15 && val >= 0);
}], uconst4_xform>;

def sconst5_xform : SDNodeXForm<imm, [{
	return CurDAG->getTargetConstant((int)N->getSExtValue(), MVT::i32);
}]>;
def sconst5 : PatLeaf<(imm), [{
	int val = (int)N->getSExtValue();
	return (val <= 15 && val >= -16);
}], sconst5_xform>;

def uconst5_xform : SDNodeXForm<imm, [{
	return CurDAG->getTargetConstant((int)N->getZExtValue(), MVT::i32);
}]>;
def uconst5 : PatLeaf<(imm), [{
	int val = (int)N->getZExtValue();
	return (val >= 0 && val < 32);
}], uconst5_xform>;

def uconst15_xform : SDNodeXForm<imm, [{
	return CurDAG->getTargetConstant((int)N->getZExtValue(), MVT::i32);
}]>;
def uconst15 : PatLeaf<(imm), [{
	int val = (int)N->getZExtValue();
	return (val < 0x7FF);
}], uconst15_xform>;

def sconst16_xform : SDNodeXForm<imm, [{
	return CurDAG->getTargetConstant((int)N->getZExtValue(), MVT::i32);
}]>;
def sconst16 : PatLeaf<(imm), [{
	int val = (int)N->getZExtValue();
	return (val >= -0x800 && val < 0x7FF);
}], sconst16_xform>;

def mvk_xform : SDNodeXForm<imm, [{
	return CurDAG->getTargetConstant((int)N->getSExtValue(), MVT::i32);
}]>;

// return true if the immediate falls into the sign-extended 16 bit range (i.e.
// hex 7FFF and -8000). Does semantically the same thing as the mvk_pred leaf,
// but has a much better readability

def isSigned16imm : PatLeaf<(imm), [{
  int val = (int)N->getSExtValue();
  return (val < 0x7FFF && val >= -0x8000);
}], mvk_xform>;

def mvk_pred : PatLeaf<(imm), [{
	int val = (int)N->getSExtValue();
	return (val < 0x7FFF && val >= -0x8000);
}], mvk_xform>;

def mvk_all_pred : PatLeaf<(imm), [{
	return (N == N); // Avoid unused N warning
}], NOOP_SDNodeXForm>;

// ~

def set_lo : PatLeaf<(imm), [{
	unsigned int val = N->getZExtValue();
	return ((val & 0xFFFF) == val);
}]>;

def set_hi : PatLeaf<(imm), [{
	unsigned int val = (unsigned)N->getZExtValue();
	return ((val & 0xFFFF0000) == val);
}]>;

def pred : PredicateOperand<OtherVT, (ops timm, PredRegs),
			(ops (i32 -1), (i32 zero_reg))> {
	// Predicate of -1 indicates that this is always-execute
}

def nodefault_pred : PredicateOperand<OtherVT, (ops timm, PredRegs),
			(ops)>;

def nodefault_zflag : PredicateOperand<i32, (ops timm), (ops)>;
def nodefault_reg : PredicateOperand<i32, (ops PredRegs), (ops)>;

// NKIM, supply the root-node to the func, not sure about parent or root
def predwrapper1 : ComplexPattern<i32, 1, "bounce_predicate", [], [SDNPWantRoot]>;

///===----------------------------------------------------------------------===///
// GENERIC instruction, this is a superclass all TMS machine instructions de-
// rive from. NOTE, this needs reworking for a more distinctive separation   
// from the side-specific instructions (see below) and more flexibility for  
// the cluster allocation                                                    
///===----------------------------------------------------------------------===///

class inst<dag outops,
           dag inops,
           string asm_str,
           list<dag> pattern,
           bit side,
           InstUnit u>
: Instruction {

  // All insns are conditional unless stated otherwise
  let isPredicable = 1;
  let CodeSize = 4;

  let Namespace = "TMS320NMXX";
  let OutOperandList = outops;

// NKIM, that causes tblgen crash for llvm higher than 2.7
//  let InOperandList = !con(ins, (ops pred:$s));
  let InOperandList = !con(inops, (ins pred:$s));
  let Itinerary = Default;

  let neverHasSideEffects = 1;
  let AsmString = asm_str;

  // Match nothing; set sched_pattern for a future tablegen backend
  // to play with. pseudo instrs over-ride this behavior.
  list<dag> sched_pattern = pattern;
  let Pattern = [];

  UnitSupport Supported = units_fixed;
  bits<3> DelaySlots = 0;
  bit MemAccess = 0;
  bits<2> MemShift = 0;
  bit MemLoadStore = 0;
  // default unit for 'mobile' (not units_fixed) instructions, otherwise
  // the single legal unit.
  InstUnit DefaultUnit = u;
  bit SideInst = 0; // no, this is a fixed/pseudo-fixed inst

  let TSFlags{3-0} = Supported.units; // unit support
  let TSFlags{4} = side; // cluster side (0: A, 1: B)
  let TSFlags{7-5} = DelaySlots; // (range: [0,5])
  let TSFlags{8} = MemAccess; // (instr is load/store)
  let TSFlags{10-9} = MemShift; // mem_shift_amt (XXX)
  let TSFlags{11} = MemLoadStore; // (0 for load, 1 for store)
  let TSFlags{13-12} = DefaultUnit.unit; // fixed/default unit
  let TSFlags{14} = SideInst; // inst or NMXsideinst
}

///===----------------------------------------------------------------------===///
/// side-specific instructions                                                
///===----------------------------------------------------------------------===///

class NMXsideinst<dag outops, dag inops, string mnemonic, InstSide side>
: Instruction
{
  // All insns are conditional unless stated otherwise
  let isPredicable = 1;
  let CodeSize = 4;

  let Namespace = "TMS320NMXX";

  let OutOperandList = outops;
  let InOperandList = !con(inops, (ins pred:$s, default_form:$fu));

  let Itinerary = Default;
  let neverHasSideEffects = 1;

  //string sidestr = !strconcat("\t.", !if(side.intval, "1", "0"));
  let AsmString = !strconcat(mnemonic, "\t.$fu\t$src1,\t$src2,\t$dst");

  // side-specific instructions don't match
  let Pattern = [];

  UnitSupport Supported = units_any; // different to inst class
  bits<3> DelaySlots = 0;
  bit MemAccess = 0;
  bits<2> MemShift = 0;
  bit MemLoadStore = 0;
  InstUnit DefaultUnit = InstUnit<0>; // not used for this inst kind
  bit SideInst = 1; // yes this is a flexible NMXsideinst

  let TSFlags{3-0} = Supported.units; // unit support
  let TSFlags{4} = side.bitval; // cluster side (0: A, 1: B)
  let TSFlags{7-5} = DelaySlots; // (range: [0,5])
  let TSFlags{8} = MemAccess; // (instr is load/store)
  let TSFlags{10-9} = MemShift; // mem_shift_amt (XXX)
  let TSFlags{11} = MemLoadStore; // (0 for load, 1 for store)
  let TSFlags{13-12} = DefaultUnit.unit; // fixed/default unit
  let TSFlags{14} = SideInst; // inst or NMXsideinst
}

class NMXnew<dag outops, dag inops, string mnemonic, InstructionForm format,
             InstSide side>
    : NMXsideinst<outops, inops, mnemonic, side> {

  let InOperandList = !con(inops, (ins pred:$s, format:$fu));
}

///===----------------------------------------------------------------------===///
/// NKim, this class has been provided to capture call instructions. These do  
/// currently execute on the S unit on the 2 side only. Also note, that having 
/// calls being defined this way removes anomalies about setting/non-setting   
///'isPredicable' flag (i.e. honor 'let isPredicable' now...)                 
////===----------------------------------------------------------------------===///

class callinst<dag outops, dag inops, string asmstr, list<dag> pat>
: inst<outops, inops, asmstr, pat, 1, unit_s>
{
  // NKim, do not require predicate-operands for regular call instructions,
  // this also solves the problem of proper values for 'isPredicable' flag
  let InOperandList = inops;

  let isCall = 1;
  let isPredicable = 0;
  let Pattern = sched_pattern;

  // B15: stack pointer. actually an implicit use (of an undefined reg).
  // don't know how to model that though
  let Defs = [A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A16, A17, A18, A19,
              A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31,
              B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B16, B17, B18, B19,
              B20, B21, B22, B23, B24, B25, B26, B27, B28, B29, B30, B31,
              B15];
}

// NKim, do not use for isel, provided for experiments (s.a. call-rewriting)
// to be custom inserted within post-isel optimization passes. Will eventually
// be removed in future after the effect-evaluation is done :-)

class callbranchinst<dag outops, dag inops, string asmstr, list<dag> pat>
: callinst<outops, inops, asmstr, pat>
{
  // calls as branches are actually predicable
  let InOperandList = !con(inops, (ins pred:$s));
  let Itinerary = Branch;
  let isPredicable = 1;
  let hasDelaySlot = 1;
  let DelaySlots = 5;
  let Uses = [B3];
}

///===----------------------------------------------------------------------===///
///class capturing regular branches, these can be issued on any side, but are 
///strictly tied to S units only                                              
///===----------------------------------------------------------------------===///

class branchinst<dag outops, dag inops, string asm, list<dag> pat, bit side>
: inst<outops, inops, asm, pat, side, unit_s>
{
  let isBranch = 1;
  let isBarrier = 1;
  let Itinerary = Branch;
  let isTerminator = 1;
  let DelaySlots = 5;
  let hasDelaySlot = 1;
  let Pattern = sched_pattern;
}

///===----------------------------------------------------------------------===///
/// multiclass template for ADD-variants using addressing modes, this greatly  
/// helps eliminating shift/add chains when scaling operands for memory loads
/// stores. We only support register variants for the time being.              
///===----------------------------------------------------------------------===///

multiclass add_addrmode <SDNode addOp, SDNode shiftOp, InstructionForm form> {

  // A-side add's using doubleword/word/halfword addressing modes

  def _d_1 : NMXnew<(outs ARegs:$dst),
               (ins ARegs:$src1, ARegs:$src2), "addad", form, side_a>
  {
    let Pattern = [(set ARegs:$dst,
      (addOp ARegs:$src1, (shiftOp ARegs:$src2, (i32 3))))];
  }

  def _w_1 : NMXnew<(outs ARegs:$dst),
               (ins ARegs:$src1, ARegs:$src2), "addaw", form, side_a>
  {
    let Pattern = [(set ARegs:$dst,
      (addOp ARegs:$src1, (shiftOp ARegs:$src2, (i32 2))))];
  }

  def _h_1 : NMXnew<(outs ARegs:$dst),
               (ins ARegs:$src1, ARegs:$src2), "addah", form, side_a>
  {
    let Pattern = [(set ARegs:$dst,
      (addOp ARegs:$src1, (shiftOp ARegs:$src2, (i32 1))))];
  }

  // B-side add's using doubleword/word/halfword addressing modes

  def _d_2 : NMXnew<(outs BRegs:$dst),
               (ins BRegs:$src1, BRegs:$src2), "addad", form, side_b>
  {
    let Pattern = [(set BRegs:$dst,
      (addOp BRegs:$src1, (shiftOp BRegs:$src2, (i32 3))))];
  }

  def _w_2 : NMXnew<(outs BRegs:$dst),
               (ins BRegs:$src1, BRegs:$src2), "addaw", form, side_b>
  {
    let Pattern = [(set BRegs:$dst,
      (addOp BRegs:$src1, (shiftOp BRegs:$src2, (i32 2))))];
  }

  def _h_2 : NMXnew<(outs BRegs:$dst),
               (ins BRegs:$src1, BRegs:$src2), "addah", form, side_b>
  {
    let Pattern = [(set BRegs:$dst,
      (addOp BRegs:$src1, (shiftOp BRegs:$src2, (i32 1))))];
  }
}

///===----------------------------------------------------------------------===///
/// SUB-variants using addressing modes. The same as for adds applies here too
///===----------------------------------------------------------------------===///
multiclass sub_addrmode <SDNode addOp, SDNode shiftOp, InstructionForm form > {

  // A-side sub's using word/halfword addressing mode. No dw here

  def _w_1 : NMXnew<(outs ARegs:$dst),
               (ins ARegs:$src1, ARegs:$src2), "subaw", form, side_a>
  {
    let Pattern = [(set ARegs:$dst,
      (addOp ARegs:$src1, (shiftOp ARegs:$src2, (i32 2))))];
  }

  def _h_1 : NMXnew<(outs ARegs:$dst),
               (ins ARegs:$src1, ARegs:$src2), "subah", form, side_a>
  {
    let Pattern = [(set ARegs:$dst,
      (addOp ARegs:$src1, (shiftOp ARegs:$src2, (i32 1))))];
  }

  // B-side add's using word/halfword addressing modes. No dw here

  def _w_2 : NMXnew<(outs BRegs:$dst),
               (ins BRegs:$src1, BRegs:$src2), "subaw", form, side_b>
  {
    let Pattern = [(set BRegs:$dst,
      (addOp BRegs:$src1, (shiftOp BRegs:$src2, (i32 2))))];
  }

  def _h_2 : NMXnew<(outs BRegs:$dst),
               (ins BRegs:$src1, BRegs:$src2), "subah", form, side_b>
  {
    let Pattern = [(set BRegs:$dst,
      (addOp BRegs:$src1, (shiftOp BRegs:$src2, (i32 1))))];
  }
}

///===----------------------------------------------------------------------===///
/// class for predicate-less pseudos for manual patching                       
///===----------------------------------------------------------------------===///

class pseudoinst<dag outops, dag inops, string asm, list<dag> pat>
: inst<outops, inops, asm, pat, 0, unit_d>
{
  let InOperandList = inops;
  let Pattern = pat;

  let Itinerary = NoItinerary;

  // emit them (as asm comments) for the time being
  //let isCodeGenOnly = 1;
}

///===----------------------------------------------------------------------===///
/// instruction class we will be using when messing around with software-pipe- 
/// lining buffer/instructions                                                 
///===----------------------------------------------------------------------===///

class sploopinst<dag inops, string asm>
: inst<(outs), inops, asm, [], 0, unit_d>
{
  // don't match yet
  let Pattern = [];
  let Itinerary = NoItinerary;
  let isCodeGenOnly = 1;
}

// Instruction class that makes predicate operands ($a, $b) available for
// matching. (eg. for conditional branches)
class nodefaultpred_inst<dag outops,
                         dag inops,
                         string mnemonic,
                         list<dag> pattern,
                         bit side,
                         InstUnit u>
: inst<outops, inops, mnemonic, pattern, side, u>
{
  let InOperandList = !con(inops, (ins nodefault_zflag:$a, nodefault_reg:$b));
}

class memload<dag outs,
              dag ins,
              list<dag> pattern,
              bit side,
              InstUnit u>
: inst<outs, ins, "", pattern, side, u>
{
  let DelaySlots = 4;
  let hasDelaySlot = 1;

  let MemAccess = 1;
  let MemLoadStore = 0;

  let Itinerary = Load;
  let Supported = units_d;

}

class memstore<dag outs,
               dag ins,
               list<dag> pattern,
               bit side,
               InstUnit u>
: inst<outs, ins, "", pattern, side, u> 
{
  let MemAccess = 1;
  let MemLoadStore = 1;
  let Supported = units_d;
}

class pseudo_rr<string mnemonic,
                string sidespec,
                InstUnit u, 
                SDNode op,
                int swap>
: inst<(outs ARegs:$dst), (ins ARegs:$src1, ARegs:$src2), "",
       [(set ARegs:$dst, (op ARegs:$src1, ARegs:$src2))], 0, u>
{
  string comb_mnemonic = !strconcat(!strconcat(mnemonic, "\t"), sidespec);
  let AsmString = !if(swap,

  !strconcat(comb_mnemonic,"\t$src2,\t$src1,\t$dst"),
  !strconcat(comb_mnemonic, "\t$src1,\t$src2,\t$dst"));

  let Pattern = sched_pattern;
}

class pseudo_ri<string mnemonic, string sidespec, dag imm, InstUnit u,
                SDNode op, int swap>
: inst<(outs ARegs:$dst), (ins ARegs:$src1, i32imm:$imm), "",
        [(set ARegs:$dst, (op ARegs:$src1, imm))], 0, u>
{
  string comb_mnemonic = !strconcat(!strconcat(mnemonic, "\t"), sidespec);
  let AsmString = !if(swap,
  !strconcat(comb_mnemonic, "\t$imm,\t$src1,\t$dst"),
  !strconcat(comb_mnemonic, "\t$src1,\t$imm,\t$dst"));
  let Pattern = sched_pattern;
}

///===----------------------------------------------------------------------===///
// this class has been provided to capture the mvkl/mvkh instruction variants.
// These instructions are supposed to be executed on the S-unit only. Since   
// there is no real instruction for loading a 32-bit immediate into a regis-  
// ter, this is done by decomposing it into a "move high" immediately after   
// the "move low" instruction. For that reason we do not specify a pattern,   
// but match the instruction explicitly later. NOTE, we do not restrict the   
// instruction by the register-side constraints                               
///===----------------------------------------------------------------------===///

class moveInstr<dag outs, dag ins, string asm, bit side, InstUnit u>
: inst<outs, ins, asm, [], side, u>;

///===----------------------------------------------------------------------===///
// AJO: these are legacy pseudo classes for load and store operations,
// superseded by NMXload and NMXstore.
///===----------------------------------------------------------------------===///


multiclass meminst_load_p<string mnemonic, PatFrag op> {

  def _load_p_addr : memload<(outs GPRegs:$dst), (ins mem_operand:$ptr),
                     [(set GPRegs:$dst, (op addr:$ptr))], 0, unit_d>
  {
    let Pattern = sched_pattern;
    let AsmString = !strconcat("ld",!strconcat(mnemonic, "\t\t$ptr,\t$dst"));
  }

  def _load_p_idx : memload<(outs GPRegs:$dst), (ins mem_operand:$ptr),
                    [(set GPRegs:$dst, (op addr:$ptr))], 0, unit_d>
  {
    let Pattern = sched_pattern;
    let AsmString = !strconcat("ld",!strconcat(mnemonic, "\t\t$ptr,\t$dst"));
  }
}

multiclass meminst_store_p<string mnemonic, PatFrag op> {

  def _store_p_addr : memstore<(outs), (ins mem_operand:$ptr,GPRegs:$reg),
                      [(op GPRegs:$reg, addr:$ptr)], 0, unit_d>
  {
    let Pattern = sched_pattern;
    let AsmString = !strconcat("st",!strconcat(mnemonic, "\t\t$reg,\t$ptr"));
  }

  def _store_p_idx : memstore<(outs), (ins mem_operand:$ptr, GPRegs:$reg),
                     [(op GPRegs:$reg, addr:$ptr)], 0, unit_d>
  {
    let Pattern = sched_pattern;
    let AsmString = !strconcat("st",!strconcat(mnemonic, "\t\t$reg,\t$ptr"));
  }
}

multiclass meminst_p<string mnemonic, PatFrag loadop, PatFrag storeop> :
  meminst_load_p<mnemonic, loadop>,
  meminst_store_p<mnemonic, storeop>;

multiclass NMXinst<dag indag, string mnemonic> {
        def _1 : NMXsideinst<(outs ARegs:$dst), !con((ins ARegs:$src1), indag),
    mnemonic, side_a>;
        def _2 : NMXsideinst<(outs BRegs:$dst), !con((ins BRegs:$src1), indag),
    mnemonic, side_b>;
}

multiclass NMXrr<dag inDag, dag inOp, SDNode op, InstructionForm default,
                 string mnemonic> {
  def _1 : NMXnew<(outs ARegs:$dst), !con((ins ARegs:$src1), inOp),
                  mnemonic, default, side_a> {
    let Pattern = [(set ARegs:$dst, (op ARegs:$src1, inDag))];
  }
  def _2 : NMXnew<(outs BRegs:$dst), !con((ins BRegs:$src1), inOp),
                  mnemonic, default, side_b>;
}

// immediate version ($src2 is the immediate and and $src1 supports xpath)
multiclass NMXri<dag inDag, dag inOp, SDNode op, InstructionForm default,
                 string mnemonic> {
  def _1 : NMXnew<(outs ARegs:$dst), !con((ins GPRegs:$src1), inOp),
                       mnemonic, default, side_a> {
    let Pattern = [(set ARegs:$dst, (op GPRegs:$src1, inDag))];
  }
  def _2 : NMXnew<(outs BRegs:$dst), !con((ins GPRegs:$src1), inOp),
                       mnemonic, default, side_b>;
}

// same format as NMXrr, but without patterns, to be used for postisel opts
multiclass NMX_special<dag inOp, InstructionForm default, string mnemonic>
{
  def _1 : NMXnew<(outs ARegs:$dst), !con((ins ARegs:$src1), inOp),
                  mnemonic, default, side_a>; 
  def _2 : NMXnew<(outs BRegs:$dst), !con((ins BRegs:$src1), inOp),
                  mnemonic, default, side_b>;
}

// swapped version (src operands swapped for added confusion)
// used by instructions like shift: (TI's ASM reference) src2, src1, dst.
// LLVM has the src ops swapped and therefore $src2 must be side-fixed.
multiclass NMXswp<dag inDag, dag inOp, SDNode op, InstructionForm default,
                  string mnemonic> {
  def _1 : NMXnew<(outs ARegs:$dst), !con(inOp, (ins ARegs:$src2)),
                  mnemonic, default, side_a> {
    let Pattern = [(set ARegs:$dst, (op inDag, ARegs:$src2))];
  }
  def _2 : NMXnew<(outs BRegs:$dst), !con(inOp, (ins BRegs:$src2)),
                  mnemonic, default, side_b>;
}

multiclass NMXmvk<dag inOp, string mnemonic> {
  def _1 : NMXnew<(outs ARegs:$dst), inOp, "", s_form, side_a> {
    let AsmString = !strconcat(mnemonic, "\t.$fu\t$imm,\t$dst");
  }
  def _2 : NMXnew<(outs BRegs:$dst), inOp, "", s_form, side_b> {
    let AsmString = !strconcat(mnemonic, "\t.$fu\t$imm,\t$dst");
  }
}

// side-specific load/store

def mem_op_a: Operand<i32> {
        let PrintMethod = "printMemOperand";
        let MIOperandInfo = (ops ARegs, ARegs);
}

def mem_op_b: Operand<i32> {
        let PrintMethod = "printMemOperand";
        let MIOperandInfo = (ops BRegs, BRegs);
}

class NMXsideload<dag indag, dag outdag, string load, InstSide side> :
        NMXnew<outdag, indag, "", d_form, side> {
  let DelaySlots = 4;
  let hasDelaySlot = 1;
  let MemAccess = 1;
  let MemLoadStore = 0;
  let mayLoad = 1;
  let Itinerary = Load;

  // restrict to D unit (note: load/store is not fixed, as we assign sides)
  let Supported = units_d;

  let AsmString = !strconcat("ld",!strconcat(load, "\t.$fu\t$ptr,\t$dst"));
}

class NMXsidestore<dag indag, string store, InstSide side> :
        NMXnew<(outs), !con(indag, (ins GPRegs:$reg)), "", d_form, side> {
  let MemAccess = 1;
  let MemLoadStore = 1;
  let mayStore = 1;

  // restrict to D unit (note: load/store is not fixed, as we assign sides)
  let Supported = units_d;

  let AsmString = !strconcat("st",!strconcat(store,
        "\t.$fu\t$reg,\t$ptr"));
}

// non-restricted loads (not used in ISel)
multiclass NMXload<string width> {
  def _load_1 : NMXsideload<(ins mem_op_a:$ptr), (outs GPRegs:$dst), width, side_a>;
  def _load_2 : NMXsideload<(ins mem_op_b:$ptr), (outs GPRegs:$dst), width, side_b>;
}

multiclass NMXstrictload<string width, PatFrag op> {
  def _sload_1 : NMXsideload<(ins mem_op_a:$ptr), (outs ARegs:$dst), width, side_a> {
    let Pattern = [(set ARegs:$dst, (op addr:$ptr))];
  }
  def _sload_2 : NMXsideload<(ins mem_op_b:$ptr), (outs BRegs:$dst), width, side_b>;
}

multiclass NMXstore<string width, PatFrag op> {
  def _store_1 : NMXsidestore<(ins mem_op_a:$ptr), width, side_a> {
    let Pattern = [(op GPRegs:$reg, addr:$ptr)];
  }
  def _store_2 : NMXsidestore<(ins mem_op_b:$ptr), width, side_b>;
}