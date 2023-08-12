//===-- NMXRegisterInfo.cpp - NMX Register Information -== --------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the NMX implementation of the TargetRegisterInfo class.
//
//===----------------------------------------------------------------------===//

#include "NMX.h"
#include "NMXRegisterInfo.h"
#include "NMXSubtarget.h"
#include "llvm/CodeGen/MachineFunction.h"

// include generated register description
#include "NMXGenRegisterInfo.inc"

// NKIM, bad, circular, but ok for now
#include "NMXInstrInfo.h"

// Actual register information
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/RegisterScavenging.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetOptions.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

//-----------------------------------------------------------------------------

NMXRegisterInfo::NMXRegisterInfo(const TargetInstrInfo &tii)
: NMXGenRegisterInfo(),
  TII(tii)
{}

//-----------------------------------------------------------------------------

NMXRegisterInfo::~NMXRegisterInfo() {}

//-----------------------------------------------------------------------------

BitVector
NMXRegisterInfo::getReservedRegs(const MachineFunction &MF) const {

  BitVector Reserved(getNumRegs());
  Reserved.set(NMX::B15);
  Reserved.set(NMX::A15);
  Reserved.set(NMX::A14);
  return Reserved;
}

//-----------------------------------------------------------------------------

const unsigned *
NMXRegisterInfo::getCalleeSavedRegs(const MachineFunction *MF) const {

  static const unsigned nonvolatileRegs[] = {
    NMX::A10,
    NMX::A11,
    NMX::A12,
    NMX::A13,
    NMX::B10,
    NMX::B11,
    NMX::B12,
    NMX::B13,
    0
  };

  return nonvolatileRegs;
}

//-----------------------------------------------------------------------------

const TargetRegisterClass* const*
NMXRegisterInfo::getCalleeSavedRegClasses(MachineFunction const*) const {
  // XXX not sure about the reg classes here...
  static const TargetRegisterClass *const calleeNonvolatileRegClasses[] ={
    &NMX::GPRegsRegClass, &NMX::GPRegsRegClass,
    &NMX::GPRegsRegClass, &NMX::GPRegsRegClass,
    &NMX::BRegsRegClass, &NMX::BRegsRegClass,
    &NMX::BRegsRegClass, &NMX::BRegsRegClass
  };

  return calleeNonvolatileRegClasses;
}

//-----------------------------------------------------------------------------

unsigned int
NMXRegisterInfo::getSubReg(unsigned int, unsigned int) const {
  llvm_unreachable("Unimplemented function getSubReg\n");
}

//-----------------------------------------------------------------------------

bool
NMXRegisterInfo::requiresRegisterScavenging(const MachineFunction&) const {
  return true;
}

//-----------------------------------------------------------------------------

void
NMXRegisterInfo::eliminateFrameIndex(MachineBasicBlock::iterator MBBI,
                                            int SPAdj, RegScavenger *r) const
{
  using namespace NMX;

  unsigned i, frame_index, reg, access_alignment;
  int offs;

  /* XXX - Value turned up in 2.7, I don't know what it does. */

  MachineInstr &MI = *MBBI;
  MachineFunction &MF = *MI.getParent()->getParent();
  MachineBasicBlock &MBB = *MI.getParent();

//  DebugLoc dl = DebugLoc::getUnknownLoc();

  DebugLoc dl;
  if (MBBI != MBB.end()) dl = MI.getDebugLoc();

  i = 0;

  // TODO, a weak break-condition !
  while (!MI.getOperand(i).isFI()) ++i;

  assert(i < MI.getNumOperands() && "No FrameIndex in eliminateFrameIdx");

  frame_index = MI.getOperand(i).getIndex();
  offs = MF.getFrameInfo()->getObjectOffset(frame_index);

  const TargetInstrDesc tid = MI.getDesc();
  access_alignment = (tid.TSFlags & NMXII::mem_align_amt_mask)
		      >> NMXII::mem_align_amt_shift;

  // Firstly, is this actually memory access? Might be lea (vomit)
  if (!(MI.getDesc().TSFlags & NMXII::is_memaccess)) {
    // If so, the candidates are sub and add - each of which
    // have an sconst5 range. If the offset doesn't fit in there,
    // need to scavenge a register
    if (NMXInstrInfo::check_sconst_fits(offs, 5)) {
      MI.getOperand(i).ChangeToImmediate(offs);
      return;
    }

    access_alignment = 0;

    // So for memory, will this frame index actually fit inside the
    // instruction field?
  }
  else if (NMXInstrInfo::check_uconst_fits(abs(offs),
                                      5 + access_alignment))
  {
    // Constant fits into instruction but needs to be scaled.

    MI.getOperand(i).ChangeToImmediate(offs >> access_alignment);
    return;
  }

  // Otherwise, we need to do some juggling to load that constant into
  // a register correctly. First of all, because of the highly-unpleasent
  // scaling feature of using indexing instructions we need to shift
  // the stack offset :|
  if (offs & ((1 << access_alignment) -1 ))
    llvm_unreachable("Unaligned stack access - should never occur");

  offs >>= access_alignment;

  const TargetRegisterClass *c;

  if (tid.TSFlags & NMXII::is_bside)
    c = NMX::BRegsRegisterClass;
  else c = NMX::ARegsRegisterClass;

  reg = r->FindUnusedReg(c);

  if (reg == 0) {
    // XXX - this kicks a register out and lets us use it but...
    // that'll lead to a store, to a stack slot, which will mean
    // this method is called again. Explosions?
    reg = r->scavengeRegister(c, MBBI, 0);
  }

  unsigned side_a = (c == NMX::ARegsRegisterClass);

  if (NMXInstrInfo::check_sconst_fits(offs, 16)) {
    // fits into one mvk
    NMXInstrInfo::addFormOp(
      NMXInstrInfo::addDefaultPred(
        BuildMI(MBB, MBBI, dl, TII.get(side_a ? mvk_1 : mvk_2))
          .addReg(reg, RegState::Define).addImm(offs)),
            NMXII::unit_s, false);
  } else {
    // needs a mvkh/mvkl pair
    NMXInstrInfo::addFormOp(
      NMXInstrInfo::addDefaultPred(
        BuildMI(MBB, MBBI, dl, TII.get(side_a ? mvkl_1 : mvkl_2))
          .addReg(reg, RegState::Define).addImm(offs)),
            NMXII::unit_s, false);
    NMXInstrInfo::addFormOp(
      NMXInstrInfo::addDefaultPred(
        BuildMI(MBB, MBBI, dl, TII.get(side_a ? mvkh_1 : mvkh_2))
          .addReg(reg, RegState::Define).addImm(offs)
            .addReg(reg)),
              NMXII::unit_s, false);
  }

  MI.getOperand(i).ChangeToRegister(reg, false, false, true);
}

const TargetRegisterClass*
llvm::NMX::resolveSide(const TargetRegisterClass *RC) {
  using namespace NMX;
  if (RC == ARegsRegisterClass || RC->hasSuperClass(ARegsRegisterClass))
    return ARegsRegisterClass;
  else if (RC == BRegsRegisterClass || RC->hasSuperClass(BRegsRegisterClass))
    return BRegsRegisterClass;
  assert(RC == GPRegsRegisterClass);
  return RC;
}


//-----------------------------------------------------------------------------

int
NMXRegisterInfo::getDwarfRegNum(unsigned reg_num, bool isEH) const {
  llvm_unreachable("Unimplemented function getDwarfRegNum\n");
}

//-----------------------------------------------------------------------------

unsigned int
NMXRegisterInfo::getRARegister() const {
  llvm_unreachable("Unimplemented function getRARegister\n");
}

//-----------------------------------------------------------------------------

unsigned int
NMXRegisterInfo::getFrameRegister(const MachineFunction &MF) const {
  llvm_unreachable("Unimplemented function getFrameRegister\n");
}
