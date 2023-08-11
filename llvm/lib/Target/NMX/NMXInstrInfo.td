//===-- NMXInstrInfo.td - NMX Instruction defs -----------*- tablegen -*-===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.

//
//===----------------------------------------------------------------------===//
//
// This fiel contains the NMX implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
/// Type constraints 
//===----------------------------------------------------------------------===//

// standard type constraint definitions for the call-sequence-start, call-seq-
// end the call node. NOTE, -1 specified for the call type-constraint signals,
// that the node may take a variable number of arguments

def SDT_call_seq_start : SDCallSeqStart<[SDTCisVT<0, i32>]>;
def SDT_call_seq_end : SDCallSeqEnd<[SDTCisVT<0, i32>, SDTCisVT<1, i32>]>;

// it seems, the -1 signaling a node being variadic doesn't really change much
// in llvm 2.9. With or without the node being explicitly declared as Variadic
// both, 1 and -1 work for us now. I leave it this way for compatibility

def SDT_call : SDTypeProfile<0, -1, [SDTCisVT<0, iPTR>]>;

// NKim, type constraints for the node corresponding to the loading of a label
// into a TI register (B3), to be able to return back from the subroutine which
// is called indirectly

def SDT_call_label_operand : SDTypeProfile<1, 1,
                                           [SDTCisVT<0, i32>,
                                            SDTCisVT<1, iPTR>]>;

// NKim, type constraints for the node which corresponds to the actual return
// node for the indirectly called subroutine. This is represented as a targets
// external symbol for now and represents a simple label

def SDT_call_return_label : SDTypeProfile<0, 1, [SDTCisVT<0, iPTR>]>;

// type constraints for the node corresponding to a conditional branch, this
// node does not produce anything, takes 3 arguments, a conditional chain, and
// two alternative outcomes

def SDT_brcond : SDTypeProfile<0, 3, [SDTCisVT<0, OtherVT>,
                                     SDTCisVT<1, i32>,
                                     SDTCisVT<2, i32>]>;

// type constraints for the target specific TI implementation of the select-
// instruction

def SDT_tmsselect : SDTypeProfile<1, 4, [SDTCisVT<0, i32>, SDTCisVT<1, i32>,
                                        SDTCisVT<2, i32>, SDTCisVT<3, i32>,
                                        SDTCisVT<4, i32>]>;

def SDT_Wrapper : SDTypeProfile<1, 1, [SDTCisSameAs<0, 1>, SDTCisPtrTy<0>]>;

def SDT_TSC : SDTypeProfile<1, 0, [SDTCisVT<0, i32>]>;

///====----------------------------------------------------------------===///
/// Node definitions 
///===-----------------------------------------------------------------===///

def brcond_node : SDNode<"TMSISD::BRCOND", SDT_brcond, [SDNPHasChain]>;

def callseq_start : SDNode<"ISD::CALLSEQ_START", SDT_call_seq_start,
				[SDNPHasChain, SDNPOutGlue]>;

def callseq_end : SDNode<"ISD::CALLSEQ_END", SDT_call_seq_end,
				[SDNPHasChain, SDNPOptInGlue, SDNPOutGlue]>;

// NKim, actual node corresponding to the node for moving a label into B3
// register for the subroutine to return to, example "move .tmpLabel, B3"

def call_label_operand_node : SDNode<"TMSISD::RETURN_LABEL_OPERAND",
                                      SDT_call_label_operand,
                                      [SDNPHasChain, SDNPOptInGlue,
                                      SDNPOutGlue, SDNPSideEffect]>;

// NKim, actual node corresponding to the label for returns from indirectly
// called subroutines, this label is to be emitted just after the actual
// branch (b) instruction has been issued

def call_return_label_node : SDNode<"TMSISD::RETURN_LABEL",
                                     SDT_call_return_label,
                                     [SDNPHasChain, SDNPOptInGlue,
                                     SDNPOutGlue, SDNPSideEffect]>;

def cmpeq_node : SDNode<"TMSISD::CMPEQ", SDTIntBinOp,
				[SDNPOutGlue, SDNPCommutative]>;
def cmpne_node : SDNode<"TMSISD::CMPNE", SDTIntBinOp,
				[SDNPOutGlue, SDNPCommutative]>;

def cmpgt_node : SDNode<"TMSISD::CMPGT", SDTIntBinOp, [SDNPOutGlue]>;

def cmpgtu_node : SDNode<"TMSISD::CMPGTU", SDTIntBinOp, [SDNPOutGlue]>;

def cmplt_node : SDNode<"TMSISD::CMPLT", SDTIntBinOp, [SDNPOutGlue]>;

def cmpltu_node : SDNode<"TMSISD::CMPLTU", SDTIntBinOp, [SDNPOutGlue]>;

def tmsselect : SDNode<"TMSISD::SELECT", SDT_tmsselect>;

def Wrapper : SDNode<"TMSISD::WRAPPER", SDT_Wrapper>;

def tsc_start : SDNode<"TMSISD::TSC_START", SDT_TSC, [SDNPHasChain]>;
def tsc_end : SDNode<"TMSISD::TSC_END", SDT_TSC, [SDNPHasChain]>;

def BUNDLE_END : pseudoinst<(outs), (ins), "${:comment} BUNDLE_END", []>;

def BR_PREPARE : pseudoinst<(outs), (ins), "${:comment} branch prepare", []> {
  // We store the opcode and operands of the original branch instructions in the
  // prepare operands, so we need to be considered variadic.
  let InOperandList = (ins variable_ops);
  let isPredicable = 0;
  let isBranch = 1;
  let Itinerary = Branch;
}
def BR_OCCURS : pseudoinst<(outs), (ins), "${:comment} branch occurs", []> {
  let isTerminator = 1;
  let isBarrier = 1;
}

// timestamp copying instructions
// XXX currently as pseudoinsts - should be inserted with a backend pass
def mvc_start : pseudoinst<(outs BRegs:$dst), (ins),
                           "MVC\t\t$dst,\tTSCL\n\t\tMVC\t\tTSCL,\t$dst", []>;
def mvc_end : pseudoinst<(outs BRegs:$dst), (ins), "MVC\t\tTSCL,\t$dst", []>;

def : Pat< (tsc_start), (mvc_start)>;
def : Pat< (tsc_end), (mvc_end)>;

// XXX These should probably be marked as for codegen modelling only.
// Don't have flexibility to test right now though.
def call_start_i : inst<(outs), (ins i32imm:$val), "sub\t.D2\tB15,\t$val,\tB15",
		[(callseq_start uconst5:$val)], 1, unit_d>
{
  let Pattern = sched_pattern;
  let neverHasSideEffects = 0;
  let hasSideEffects = 1;

  let Uses = [B15];
  let Defs = [B15];
}


def call_start_r : inst<(outs), (ins GPRegs:$val), "sub\t.D2X\tB15,\t$val,\tB15"
		,[(callseq_start GPRegs:$val)], 1, unit_d>
{
  let Pattern = sched_pattern;
  let neverHasSideEffects = 0;
  let hasSideEffects = 1;

  let Uses = [B15];
  let Defs = [B15];
}

def call_end_i : inst<(outs), (ins i32imm:$val, i32imm:$val2),
		"add\t.D2\t$val,\tB15,\tB15",
		[(callseq_end timm:$val, uconst5:$val2)], 1, unit_d>
{
  let Pattern = sched_pattern;
  let neverHasSideEffects = 0;
  let hasSideEffects = 1;

  let Uses = [B15];
  let Defs = [B15];
}

def call_end_r : inst<(outs), (ins GPRegs:$val, i32imm:$val2),
		"add\t.D2X\tB15,\t$val,\tB15",
		[(callseq_end GPRegs:$val, timm:$val2)], 1, unit_d>
{
  let Pattern = sched_pattern;
  let neverHasSideEffects = 0;
  let hasSideEffects = 1;

  let Uses = [B15];
  let Defs = [B15];
}

def TMS320NMXXcall : SDNode<"TMSISD::CALL", SDT_call,
                            [SDNPHasChain, SDNPOutGlue, SDNPOptInGlue,
                             SDNPVariadic]>;

def retflag : SDNode<"TMSISD::RETURN_FLAG", SDTNone,
                     [SDNPHasChain, SDNPOptInGlue]>;

// FIXME: mv can be in any s/d/l slot
let neverHasSideEffects = 1 in {
def noop : inst<(outs), (ins i32imm:$cycles), "nop\t\t$cycles", [],
                                0, unit_s>;
}

// Shifts and rotates

let Supported = units_fixed in {
// moved to flexible encoding
//def srl_p_rr : pseudo_rr<"shru", ".S1", unit_s, srl, 0>;
//def srl_p_ri : pseudo_ri<"shru", ".S1", (i32 uconst5:$imm), unit_s, srl, 0>;
}
def shl_p_rr : pseudo_rr<"shl", ".S1", unit_s, shl, 0>;
def shl_p_ri : pseudo_ri<"shl", ".S1", (i32 uconst5:$imm), unit_s, shl, 0>;
def shr_p_rr : pseudo_rr<"shr", ".S1", unit_s, sra, 0>;
def shr_p_ri : pseudo_ri<"shr", ".S1", (i32 uconst5:$imm), unit_s, sra, 0>;

let Itinerary = Multiply16,
    DelaySlots = 1,
    hasDelaySlot = 1 in
{
  def rotl_p_rr : pseudo_rr<"rotl", ".M1", unit_m, rotl, 0>;
  def rotl_p_ri : pseudo_ri<"rotl", ".M1", (i32 uconst5:$imm), unit_m, rotl, 0>;
}

//Some arithmatic and logic

// Instr definition (spru732h p94) states that when printing we should use
// src1, src2 if the xform is used (src2), and src2, src1 if we use the xform
// and a constant.
// XXX - for unit D, depending on the form the constant can be sign extended
// or zero extended; potential for datasheet bugs or data entry bugs here
let Supported = units_fixed in {
// moved to flexible encoding
//def add_p_rr : pseudo_rr<"add", ".L1", unit_l, add, 0>;
//def add_p_ri : pseudo_ri<"add", ".L1", (i32 sconst5:$imm), unit_l, add, 0>;
}

let Constraints = "$src1 = $dst", AsmString = "addk\t.S1\t$imm,\t$dst" in {
def addk_p : pseudo_ri<"addk", "", (i32 sconst16:$imm), unit_s, add, 0>;
}

def and_p_rr : pseudo_rr<"and", ".L1", unit_l, and, 0>;
def and_p_ri : pseudo_ri<"and", ".L1", (i32 sconst5:$imm), unit_l, and, 1>;

def or_p_rr : pseudo_rr<"or", ".D1", unit_d, or, 0>;
def or_p_ri : pseudo_ri<"or", ".D1", (i32 sconst5:$imm), unit_d, or, 1>;

def xor_p_rr : pseudo_rr<"xor", ".D1", unit_d, xor, 0>;
def xor_p_ri : pseudo_ri<"xor", ".D1", (i32 sconst5:$imm), unit_d, xor, 1>;

// def sub_p_rr : pseudo_rr<"sub", ".L1", unit_l, sub, 0>;
// def sub_p_ri : pseudo_ri<"sub", ".D1", (i32 uconst5:$imm), unit_d, sub, 0>;

// Prolog asm requires some special cases:

// The actual prolog itself now requires some insns to occur in parallel,
// which I haven't yet modelled for tablegen. So instead we have this fake
// instruction that the assembly printer will see and emit the parallel code
// for. Unpleasent, but saves a whole load of pain immediately.

// the terminator is a hack to keep the postRA scheduler from moving these
// (goes away once prolog/epilog gets disentangled)
let isTerminator = 1 in {
def prolog : inst<(outs), (ins i32imm:$stacksz), "", [], 0, unit_s>;

// Similar story for epilog
def epilog : inst<(outs), (ins), "", [], 0, unit_s> {
  let Defs = [B3];
}
}

///===----------------------------------------------------------------------===///
// MOVE instructions                                                         
///===----------------------------------------------------------------------===///

// mv instruction is not flexible, unit selection is left to the assembler
def mv : moveInstr<(outs GPRegs:$dst), (ins GPRegs:$src),
                   "mv\t$src,\t$dst", 0, unit_s>;

// mvd instruction can be issued on the M unit only. The instruction as such
// is not that important, since i doubt there will be many situations where it
// would be more profitable compared to a regular non-delayed move

let Itinerary = Multiply,
    DelaySlots = 3,
    hasDelaySlot = 1 in
{
  def mvd : moveInstr<(outs GPRegs:$dst), (ins GPRegs:$src),
                      "mvd\t.M1\t$src,\t$dst", 0, unit_m>;
}

// MVK FLEXIBLE ENCODING (using NMXinst and NMXmvk)
// FIXME, 5-bit immediates can be issued on an of the S, D, L units. 16-bit
// immediates only on S. For the time being we assign them to the S unit only.

let InOperandList = (ins i32imm:$src2, pred:$s, s_form:$fu),
    AsmString = "mvk\t.$fu\t$src2,\t$dst",
    isMoveImm = 1,
    Supported = units_s in {
  defm mvk : NMXinst<(ins), "mvk">;
}

// These always match the _1 variant of the flexible pair of mvks.
def : Pat<(i32 isSigned16imm:$val), (mvk_1 imm:$val)>;

let Supported = units_s,
    isMoveImm = 1 in {
  defm mvkl : NMXmvk<(ins i32imm:$imm), "mvkl">;
  defm mvkl_label : NMXmvk<(ins LabelOperand:$imm), "mvkl">;
}

let Supported = units_s,
    Constraints = "$src1 = $dst",
    isMoveImm = 1 in {
  defm mvkh : NMXmvk<(ins i32imm:$imm, GPRegs:$src1), "mvkh">;
  defm mvkh_label : NMXmvk<(ins LabelOperand:$imm, GPRegs:$src1), "mvkh">;
}

def : Pat<(i32 mvk_all_pred:$val),
          (mvkh_1 mvk_all_pred:$val,
            (mvkl_1 mvk_all_pred:$val))>;

def : Pat<(i32 (Wrapper tglobaladdr:$val)),
          (mvkh_1 tglobaladdr:$val,
            (mvkl_1 tglobaladdr:$val))>;

def : Pat<(i32 (Wrapper tjumptable:$dst)),
          (mvkh_1 tjumptable:$dst,
            (mvkl_1 tjumptable:$dst))>;

def : Pat<(i32 (Wrapper texternalsym:$dst)),
          (mvkh_1 texternalsym:$dst,
            (mvkl_1 texternalsym:$dst))>;

// FIXME: Work out what on earth to do with lea
def lea_fail : inst<(outs ARegs:$dst), (ins mem_operand:$ptr),
                "add\t.L1\t$ptr,\t$dst",
                [(set ARegs:$dst, addr:$ptr)],
                0, unit_l> {
        let Pattern = sched_pattern;
}

// Memory access: we can handle all post/pre inc/dec modes, and all indexing
// situations, with a) alignment limitation, b) offset limitation,
// c) sign extension

let MemShift = 0 in {
defm u_i1 : meminst_load_p<"bu", zextloadi1>;
}

// all moved to flexible encoding
//let MemShift = 0 in {
//defm byte : meminst_p<"b", sextloadi8, truncstorei8>;
//defm ubyte : meminst_load_p<"bu", zextloadi8>;
//}
//
//let MemShift = 1 in {
//defm hword : meminst_p<"h", sextloadi16, truncstorei16>;
//defm uhword : meminst_load_p<"hu", zextloadi16>;
//}
//
//let MemShift = 2 in {
//defm word : meminst_p<"w", load, store>;
//}

// Comparisons

def cmpeq_p_rr : pseudo_rr<"cmpeq", ".L1", unit_l, cmpeq_node, 0>;
def cmpeq_p_ri : pseudo_ri<"cmpeq", ".L1", (i32 sconst5:$imm), unit_l,
				cmpeq_node, 1>;

def : Pat<(cmpne_node GPRegs:$reg1, GPRegs:$reg2),
            (xor_p_ri (cmpeq_p_rr GPRegs:$reg1, GPRegs:$reg2), (i32 1))>;

// NOTE: Can't use any of the immediate forms of comparison instructions. LLVM
// always puts the constant operand on the right hand side of all operations,
// and TI instructions only allow constants on the left. That's fine and can
// be flipped, but that requires llvm to then go through all uses and invert
// the polarity of any tests/whatevers based on this. Not sure how to do that.
// Possibly it can't be done, we just have to handle it in some machdep fashion.

def cmpgt_p_rr : pseudo_rr<"cmpgt", ".L1", unit_l, cmpgt_node, 0>;
def cmpgtu_p_rr : pseudo_rr<"cmpgtu", ".L1", unit_l, cmpgtu_node, 0>;
def cmplt_p_rr : pseudo_rr<"cmplt", ".L1", unit_l, cmplt_node, 0>;
def cmpltu_p_rr : pseudo_rr<"cmpltu", ".L1", unit_l, cmpltu_node, 0>;

// Select - lowering loads one value into first reg, then we conditionally
// move the other value into it. Having a pair of instructions both move into
// the same register would achieve it with one cycle, but that involves touching
// parallel stuff, which we're avoiding for now

def mvselect : nodefaultpred_inst<(outs GPRegs:$dst),
                                  (ins GPRegs:$reg, GPRegs:$src1),
                                  "mv\t\t$reg,\t$dst", [], 0, unit_s>
{
  let Constraints = "$src1 = $dst";
}

def : Pat<
  (tmsselect GPRegs:$false, GPRegs:$true, timm:$trueimm, predwrapper1:$truereg),
  (mvselect GPRegs:$true, GPRegs:$false, imm:$trueimm, predwrapper1:$truereg)>;

///===---------------------------------------------------------------------===///
// ADD/SUB using addressing modes                                            
///===---------------------------------------------------------------------===///


// NKim, includes doubleword, word and halfword variants for both sides (A/B),
// this helps folding add/shift chains (as commonly produced by address scaling)
// into one single machine instruction

let Supported = units_d in {
defm add_am : add_addrmode<add, shl, d_form>;

// the same as for add instructions using addressing modes applies here too.
// The only difference is the lack of doubleword addressing

defm sub_am : sub_addrmode<sub, shl, d_form>;
}

///====----------------------------------------------------------------------===///
// SPECIAL instructions                                                      
///===-----------------------------------------------------------------------===///

// extract and sign-extend a bit field, this is quite useful for eliminating
// shift-left/arithmetic shift-right chains in order to sign-extend a field
// of bits

let Supported = units_s in {
  let AsmString = "ext\t.$fu\t$src1,\t$csta,\t$csta,\t$dst" in {
    defm ext : NMX_special<(ins i32imm:$csta), s_form, "">;
  }

  let AsmString = "extu\t.$fu\t$src1,\t$csta,\t$csta,\t$dst" in {
    defm extu : NMX_special<(ins i32imm:$csta), s_form, "">;
  }

  // variable variants, with csta and cstb being potentially different
  let AsmString = "ext\t.$fu\t$src1,\t$csta,\t$cstb,\t$dst" in {
    defm ext_v : NMX_special<(ins i32imm:$csta, i32imm:$cstb), s_form, "">;
  }

  let AsmString = "extu\t.$fu\t$src1,\t$csta,\t$cstb,\t$dst" in {
    defm extu_v : NMX_special<(ins i32imm:$csta, i32imm:$cstb), s_form, "">;
  }
}

// NKim, inreg-sign-extension is legal on NMX targets. Note, ext can be exp-
// loited for other stuff as well, i.e. csta/cstb do not need to be equal in
// general, therefore two immediates are provided for eventual extensions.
// For pure sign extension of native int types, both constants are the same

def : Pat<(i32 (sext_inreg ARegs:$src1, i1)),
            (ext_1 ARegs:$src1, (i32 31))>;
def : Pat<(i32 (sext_inreg BRegs:$src1, i1)),
            (ext_2 BRegs:$src1, (i32 31))>;

def : Pat<(i32 (sext_inreg ARegs:$src1, i8)),
            (ext_1 ARegs:$src1, (i32 24))>;
def : Pat<(i32 (sext_inreg BRegs:$src1, i8)),
            (ext_2 BRegs:$src1, (i32 24))>;

def : Pat<(i32 (sext_inreg ARegs:$src1, i16)),
            (ext_1 ARegs:$src1, (i32 16))>;
def : Pat<(i32 (sext_inreg BRegs:$src1, i16)),
            (ext_2 BRegs:$src1, (i32 16))>;

def : Pat<(i32
        (sra (shl ARegs:$src1, (i32 uconst5:$csta)), (i32 uconst5:$cstb))),
          (ext_v_1 ARegs:$src1, uconst5:$csta, uconst5:$cstb)>;

def : Pat<(i32
        (sra (shl BRegs:$src1, (i32 uconst5:$csta)), (i32 uconst5:$cstb))),
          (ext_v_2 BRegs:$src1, uconst5:$csta, uconst5:$cstb)>;

def : Pat<(i32
        (srl (shl ARegs:$src1, (i32 uconst5:$csta)), (i32 uconst5:$cstb))),
          (extu_v_1 ARegs:$src1, uconst5:$csta, uconst5:$cstb)>;

def : Pat<(i32
        (srl (shl BRegs:$src1, (i32 uconst5:$csta)), (i32 uconst5:$cstb))),
          (extu_v_2 BRegs:$src1, uconst5:$csta, uconst5:$cstb)>;

// TMS has a special instruction which is useful for some special cases, this
// instruction inverts one of the sources and performs a bitwise AND with the
// second source. This is currently matched for a couple of benchmarks and is
// also patched in during if-conversion when folding predicates

let Supported = units_notm in {
  defm andn_rr : NMX_special<(ins GPRegs:$src2), l_form, "andn">;
}

def : Pat<(i32 (and ARegs:$src1, (not ARegs:$src2))),
             (andn_rr_1 ARegs:$src1, ARegs:$src2)>;

def : Pat<(i32 (and BRegs:$src1, (not BRegs:$src2))),
             (andn_rr_2 BRegs:$src1, BRegs:$src2)>;

// arithmetic negation is done by 'neg', this will again be represented by
// assembler as 'sub 0, regX' and will probably do not have any performance
// benefits, however, it compacts and makes the assembler source more neat.
// This also helps eliminating moves introduced for the subtraction, that
// requires regs. Note, the instruction goes on L and S units, but for the
// time being we prefer L over S.

let Supported = units_s in {
  let AsmString = "neg\t.$fu\t$src1,\t$dst" in {
    defm neg : NMX_special<(ins), l_form, "neg">;
  }
}

def : Pat<(i32 (sub (i32 0), ARegs:$src1)), (neg_1 ARegs:$src1)>;
def : Pat<(i32 (sub (i32 0), BRegs:$src1)), (neg_1 BRegs:$src1)>;

// byte swap, see SPRU732 instruction description, can probably be represen-
// ted as a swap2/swap4 combo, and if possible, should be done so in order
// to avoid occupying the M unit. The number of cycles is two in both cases

def swap2 : inst<(outs GPRegs:$dst), (ins GPRegs:$src, pred:$predReg),
    "swap2\t.S1\t$src,\t$dst", [], 0, unit_s>;

// swap4 goes on L units only
def swap4 : inst<(outs GPRegs:$dst), (ins GPRegs:$src, pred:$predReg),
                 "swap4\t.L1\t$src,\t$dst", [], 0, unit_l>;

let Itinerary = Multiply16,
    hasDelaySlot = 1,
    DelaySlots = 1 in
{
  def bitr : inst<(outs GPRegs:$dst), (ins GPRegs:$src, pred:$predReg),
                  "bitr\t.M1\t$src,\t$dst", [], 0, unit_m>;
}

// using swap2/swap4 combo (if possible) for the byteswap instrinsic takes
// actually the same amount of cycles but does not occupy the M unit...

// def : Pat<(i32 (bswap GPRegs:$src)), (swap4 (swap2 GPRegs:$src))>;
def : Pat<(i32 (bswap GPRegs:$src)), (bitr GPRegs:$src)>;

// counting leading zeroes can be done pretty quickly by using lmbd, define
// matching patterns properly, eventhough ctlz, cttz, etc. are not matched
// yet for our selection of testing benchmarks

let Supported = units_l in {
  // i am not yet sure whether the reg/reg variant makes any sense
  defm lmbd_rr : NMX_special<(ins GPRegs:$src2), l_form, "lmbd">;
  defm lmbd_ri : NMX_special<(ins i32imm:$src2), l_form, "lmbd">;
}

def : Pat<(i32 (ctlz ARegs:$src1)), (lmbd_ri_1 ARegs:$src1, (i32 1))>;
def : Pat<(i32 (ctlz BRegs:$src1)), (lmbd_ri_2 BRegs:$src1, (i32 1))>;

// special 'pseudo'-instructions to be used within target optimizers utilizing
// targets hardware loops. following stuff is predicated, sploopw instruction
// is even required to use it

def sploop  : sploopinst<(ins i32imm:$initInterval), "sploop">;
def sploopd : sploopinst<(ins i32imm:$initInterval), "sploopd">;
def sploopw : sploopinst<(ins i32imm:$initInterval), "sploopw">;

// NKim, spkernel stuff, spmask instructions are still to come

def spkernelr : pseudoinst<(outs), (ins), "spkernelr", []>;
def spkernel  : pseudoinst<(outs), (ins i32imm:$fstg, i32imm:$fcyc),
                  "spkernel", []>;

///===-------------------------------------------------------------------===///
// BRANCH instructions                                                       
///===-------------------------------------------------------------------===///

// the following unconditional branches are barriers (ie. execution stops with
// the branch; as in other cases, this property does not (need to) hold after
// post-pass scheduling, b/c of delay slots)

def branch : branchinst<(outs), (ins BranchTargetOperand:$block),
                        "b\t$block", [], 0>;

def branch_A : branchinst<(outs), (ins BranchTargetOperand:$block),
                          "b\t.S1\t$block", [], 0>;

def branch_B : branchinst<(outs), (ins BranchTargetOperand:$block),
                          "b\t.S2\t$block", [], 1>;

def branch_reg : branchinst<(outs), (ins GPRegs:$reg),
                            "b\t.S2X\t$reg", [], 1>
{
  // NKim, this one is considered to be a barrier as well, additionally mark
  // to be an indirect branch. This eliminates bugs when querying machine-instr
  // descriptors for 'isConditionalBranch', 'isFallthrough', etc.
  let isIndirectBranch = 1;
}

// nodefaultpred_inst: predicate operands are added manually
def branch_cond : nodefaultpred_inst<(outs), (ins BranchTargetOperand:$block),
                    "b\t.S1\t$block",
                     [(brcond_node bb:$block, timm:$a, predwrapper1:$b)],
                     0, unit_s>
{
  let isBranch = 1;
  let Itinerary = Branch;
  let isTerminator = 1;
  let DelaySlots = 5;
  let hasDelaySlot = 1;
  let Pattern = sched_pattern;
  let isTerminator = 1;
  let isBarrier = 0;
}

// NKim, define matching patterns explicitly, this does not seem to have any
// serious effect beside removing nasty tblgen warnings, for regular non-reg
// branches match general (side-less) pattern only

def : Pat<(br bb:$block), (branch bb:$block)>;
def : Pat<(brind GPRegs:$dst), (branch_reg GPRegs:$dst)>;

///////////////////////////////////////////////////////////////////////////////
// CALL/RET instructions                                                     //
///////////////////////////////////////////////////////////////////////////////

def callp_global : callinst<(outs), (ins CallTargetOperand:$dst, variable_ops),
                            "callp\t.S2\t$dst,\tB3", []>;

def callp_extsym : callinst<(outs), (ins CallTargetOperand:$dst, variable_ops),
                            "callp\t.S2\t$dst,\tB3", []>;

def call_reg : callbranchinst<(outs), (ins GPRegs:$dst, variable_ops),
                              "b\t.S2X\t$dst", []>
{
  // when using the b-instruction, calls need to be treated as branches
  let isIndirectBranch = 1;
}

def call_branch : callbranchinst<(outs),
                                 (ins CallTargetOperand:$dst, variable_ops),
                                 "b\t.S2\t$dst", [ /* keep empty ! */ ]>
{
  // when using the b-instruction, calls need to be treated as branches
  let isBranch = 1;
}

def ret : inst<(outs), (ins), "b\t.S2\tB3", [], 1, unit_s> {

  // this drops predicate operands and makes the instruction non
  // predicable, which is potentially a source for subtle bugs...
  let InOperandList = (ins);

  let isReturn = 1;
  let isTerminator = 1;
  let isBarrier = 1;
  let isPredicable = 0;
  let Pattern = sched_pattern;

  // The implicit use of the return address in B3:
  // let Uses = [B3];
  // is not defined here but added when the epilogue is inserted.
  // Otherwise early phases would lack the respective def of B3.

  let Itinerary = Branch;
  let hasDelaySlot = 1;
  let DelaySlots = 5;
}

// NKim, instruction for emitting a returning pad for an indirectly called
// routine. I model this as a pseudo-instruction, since this correspond to
// a label. NOTE, we need to signal, that this pseudo-instruction may have
// side-effects in order to avoid elimination by the optimizers !

def call_return_label : pseudoinst<(outs), (ins LabelOperand:$label),
                                   "$label:\t\t${:comment} return label", []>
{
  let isCodeGenOnly = 0;
  let isPredicable = 0;
  let neverHasSideEffects = 0;
}

// defining matching patterns explicitly removes nasty tblgen warnings...
def : Pat<(TMS320NMXXcall tglobaladdr:$dst), (callp_global tglobaladdr:$dst)>;
def : Pat<(TMS320NMXXcall texternalsym:$dst), (callp_global texternalsym:$dst)>;
def : Pat<(TMS320NMXXcall GPRegs:$reg), (call_reg GPRegs:$reg)>;
def : Pat<(retflag), (ret)>;

def : Pat<(call_label_operand_node texternalsym:$label),
            (mvkh_label_1 texternalsym:$label,
              (mvkl_label_1 texternalsym:$label))>;

def : Pat<(call_return_label_node texternalsym:$label),
          (call_return_label texternalsym:$label)>;

///===--------------------------------------------------------------------===///
// side-specific instructions                                                
///===--------------------------------------------------------------------====///

let Supported = units_notm in {
  defm add_rr : NMXrr<(i32 GPRegs:$src2), (ins GPRegs:$src2), add, l_form, "add">;
  defm add_ri : NMXri<(i32 sconst5:$src2), (ins i32imm:$src2), add, l_form, "add">;

  // the same stuff applies to the sub instruction as well
  defm sub_rr : NMXrr<(i32 GPRegs:$src2), (ins GPRegs:$src2), sub, l_form, "sub">;
  defm sub_ri : NMXri<(i32 sconst5:$src2), (ins i32imm:$src2), sub, l_form, "sub">;
}

let Supported = units_s in {
  defm srl_rr : NMXswp<(i32 GPRegs:$src1), (ins GPRegs:$src1), srl, s_form, "shru">;
  defm srl_ri : NMXri<(i32 uconst5:$src2), (ins i32imm:$src2), srl, s_form, "shru">;
}

let DelaySlots = 3,
    hasDelaySlot = 1,
    Itinerary = Multiply,
    Supported = units_m in {
  defm mpy32 : NMXrr<(i32 GPRegs:$src2), (ins GPRegs:$src2), mul, m_form, "mpy32">;
}

///===---------------------------------------------------------------------===///
// side-specific loads/stores
///===---------------------------------------------------------------------===///
let MemShift = 0 in {
  defm byte  : NMXstrictload<"b", sextloadi8>;
  defm byte  : NMXstore<"b", truncstorei8>;
  defm ubyte : NMXstrictload<"bu", zextloadi8>;
}

let MemShift = 1 in {
  defm hword  : NMXstrictload<"h", sextloadi16>;
  defm hword  : NMXstore<"h", truncstorei16>;
  defm uhword : NMXstrictload<"hu", zextloadi16>;
}

let MemShift = 2 in {
  defm word : NMXload<"w">;
  defm word : NMXstrictload<"w", load>;
  defm word : NMXstore<"w", store>;
}