//===- RegAllocBase.cpp - Register Allocator Base Class -------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines the RegAllocBase class which provides common functionality
// for LiveIntervalUnion-based register allocators.
//
//===----------------------------------------------------------------------===//

#include "RegAllocBase.h"
#include "Spiller.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/CodeGen/LiveInterval.h"
#include "llvm/CodeGen/LiveIntervals.h"
#include "llvm/CodeGen/LiveRegMatrix.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/TargetRegisterInfo.h"
#include "llvm/CodeGen/VirtRegMap.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/Timer.h"
#include "llvm/Support/raw_ostream.h"
#include <cassert>

using namespace llvm;

#define DEBUG_TYPE "regalloc"


/ 临时验证选项，直到我们可以将验证放入其中
// 机器验证器。
/**
 * @brief 
 * 这段代码声明了一个名为 `VerifyRegAlloc` 的静态变量，类型为 `cl::opt<bool, true>`，
 * 它是一个命令行选项，用于控制寄存器分配过程中的验证操作。

`cl::opt` 是 LLVM 提供的一个命令行选项解析库，用于解析命令行参数。它是一个类模板，
第一个模板参数指定变量类型，第二个参数指定是否需要设置默认值。

在这个例子中，第一个模板参数是 `bool`，表示该选项的值是一个布尔类型。第二个参数是 `true`，
表示该选项需要设置默认值。因此，这个选项在默认情况下是开启的。

`VerifyRegAlloc` 变量的初始化表达式使用了 `cl::location` 函数，
该函数将变量的地址作为参数，并返回一个 `cl::opt` 对象，该对象可以控制该变量的值。在这个例子中，
`RegAllocBase::VerifyEnabled` 是一个静态变量，它的地址作为参数传递给了 `cl::location` 函数，
所以 `VerifyRegAlloc` 将控制 `RegAllocBase::VerifyEnabled` 的值。

这个选项还包括一些其他的参数设置。`cl::Hidden` 表示这个选项在帮助信息中不会显示出来。`cl::desc`
 用于设置选项的描述信息。在这个例子中，描述信息是 `"Verify during register allocation"`，表示这个选项用于控制寄存器分配过程中的验证操作。
 * 
 */
static cl::opt<bool, true>
    VerifyRegAlloc("verify-regalloc", cl::location(RegAllocBase::VerifyEnabled),
                   cl::Hidden, cl::desc("Verify during register allocation"));

const char RegAllocBase::TimerGroupName[] = "regalloc";
const char RegAllocBase::TimerGroupDescription[] = "Register Allocation";
bool RegAllocBase::VerifyEnabled = false;

//===----------------------------------------------------------------------===//
//                         RegAllocBase Implementation
//===----------------------------------------------------------------------===//

// Pin the vtable to this file.
void RegAllocBase::anchor() {}
/**
 * @brief 
 * 
 * @param vrm 
 * @param lis 
 * @param mat 
 * 这段代码定义了一个名为 `RegAllocBase` 的类的成员函数 `init`，
 * 该函数接受三个参数：`vrm`、`lis` 和 `mat`，分别表示虚拟寄存器映射、活跃区间和寄存器矩阵。

在函数内部，`TRI`、`MRI`、`VRM`、`LIS` 和 `Matrix` 
这些成员变量都被初始化为参数传递进来的对象的地址。其中，`TRI` 
是目标机器的寄存器信息；`MRI` 是虚拟寄存器映射的注册信息；`VRM` 是虚拟寄存器映射；`LIS` 
是活跃区间；`Matrix` 是寄存器矩阵。

接下来，`MRI->freezeReservedRegs(vrm.getMachineFunction())` 调用了 `MRI` 
对象的 `freezeReservedRegs` 函数，该函数将保留寄存器标记为“冻结”，
表示它们不能被分配给虚拟寄存器。

最后，`RegClassInfo.runOnMachineFunction(vrm.getMachineFunction())` 
调用了 `RegClassInfo` 对象的 `runOnMachineFunction` 函数，
该函数用于在机器函数上运行目标寄存器类别信息（Target Register Class Info）。
这个函数可能会在目标机器上设置寄存器类别信息，以便在后续的寄存器分配过程中使用。
 */
void RegAllocBase::init(VirtRegMap &vrm,
                        LiveIntervals &lis,
                        LiveRegMatrix &mat) {
  TRI = &vrm.getTargetRegInfo();
  MRI = &vrm.getRegInfo();
  VRM = &vrm;
  LIS = &lis;
  Matrix = &mat;
  MRI->freezeReservedRegs(vrm.getMachineFunction());
  RegClassInfo.runOnMachineFunction(vrm.getMachineFunction());
}

/**
 * @brief 
 * 这段代码定义了一个名为 `RegAllocBase` 的类的成员函数 `seedLiveRegs`，
 * 用于将所有有活跃值的虚拟寄存器加入到工作列表（work list）中。

在函数内部，首先使用 `NamedRegionTimer` 定义了一个计时器 `T`，
用于记录该函数的执行时间。`NamedRegionTimer` 是 LLVM 提供的一个计时器类，
用于测量代码块的执行时间。

接下来，使用 `for` 循环遍历所有虚拟寄存器，对于每个虚拟寄存器，如果它没有调试信息并且有活跃值，
则将其对应的活跃区间加入到工作列表中。这里使用了 `MRI->getNumVirtRegs()` 获取虚拟寄存器的数量，
然后使用 `TargetRegisterInfo::index2VirtReg` 将虚拟寄存器的索引转换为虚拟寄存器的编号。

最后，`enqueue` 函数被调用，将活跃区间加入到工作列表中。`enqueue` 函数是 `RegAllocBase` 
类的一个纯虚函数，表示将一个活跃区间加入到工作列表中。这个函数的具体实现由派生类提供。
 * 
 */
void RegAllocBase::seedLiveRegs() {
  NamedRegionTimer T("seed", "Seed Live Regs", TimerGroupName,
                     TimerGroupDescription, TimePassesIsEnabled);
  for (unsigned i = 0, e = MRI->getNumVirtRegs(); i != e; ++i) {
    unsigned Reg = TargetRegisterInfo::index2VirtReg(i);
    if (MRI->reg_nodbg_empty(Reg))
      continue;
    enqueue(&LIS->getInterval(Reg));
  }
}

// Top-level driver to manage the queue of unassigned VirtRegs and call the
// selectOrSplit implementation.
void RegAllocBase::allocatePhysRegs() {
  seedLiveRegs();

  // Continue assigning vregs one at a time to available physical registers.
  while (LiveInterval *VirtReg = dequeue()) {
    assert(!VRM->hasPhys(VirtReg->reg) && "Register already assigned");

    // Unused registers can appear when the spiller coalesces snippets.
    if (MRI->reg_nodbg_empty(VirtReg->reg)) {
      LLVM_DEBUG(dbgs() << "Dropping unused " << *VirtReg << '\n');
      aboutToRemoveInterval(*VirtReg);
      LIS->removeInterval(VirtReg->reg);
      continue;
    }

    // Invalidate all interference queries, live ranges could have changed.
    Matrix->invalidateVirtRegs();

    // selectOrSplit requests the allocator to return an available physical
    // register if possible and populate a list of new live intervals that
    // result from splitting.
    LLVM_DEBUG(dbgs() << "\nselectOrSplit "
                      << TRI->getRegClassName(MRI->getRegClass(VirtReg->reg))
                      << ':' << *VirtReg << " w=" << VirtReg->weight << '\n');

    using VirtRegVec = SmallVector<unsigned, 4>;

    VirtRegVec SplitVRegs;
    unsigned AvailablePhysReg = selectOrSplit(*VirtReg, SplitVRegs);

    if (AvailablePhysReg == ~0u) {
      // selectOrSplit failed to find a register!
      // Probably caused by an inline asm.
      MachineInstr *MI = nullptr;
      for (MachineRegisterInfo::reg_instr_iterator
           I = MRI->reg_instr_begin(VirtReg->reg), E = MRI->reg_instr_end();
           I != E; ) {
        MachineInstr *TmpMI = &*(I++);
        if (TmpMI->isInlineAsm()) {
          MI = TmpMI;
          break;
        }
      }
      if (MI)
        MI->emitError("inline assembly requires more registers than available");
      else
        report_fatal_error("ran out of registers during register allocation");
      // Keep going after reporting the error.
      VRM->assignVirt2Phys(VirtReg->reg,
                 RegClassInfo.getOrder(MRI->getRegClass(VirtReg->reg)).front());
      continue;
    }

    if (AvailablePhysReg)
      Matrix->assign(*VirtReg, AvailablePhysReg);

    for (unsigned Reg : SplitVRegs) {
      assert(LIS->hasInterval(Reg));

      LiveInterval *SplitVirtReg = &LIS->getInterval(Reg);
      assert(!VRM->hasPhys(SplitVirtReg->reg) && "Register already assigned");
      if (MRI->reg_nodbg_empty(SplitVirtReg->reg)) {
        assert(SplitVirtReg->empty() && "Non-empty but used interval");
        LLVM_DEBUG(dbgs() << "not queueing unused  " << *SplitVirtReg << '\n');
        aboutToRemoveInterval(*SplitVirtReg);
        LIS->removeInterval(SplitVirtReg->reg);
        continue;
      }
      LLVM_DEBUG(dbgs() << "queuing new interval: " << *SplitVirtReg << "\n");
      assert(TargetRegisterInfo::isVirtualRegister(SplitVirtReg->reg) &&
             "expect split value in virtual register");
      enqueue(SplitVirtReg);
      ++NumNewQueued;
    }
  }
}

void RegAllocBase::postOptimization() {
  spiller().postOptimization();
  for (auto DeadInst : DeadRemats) {
    LIS->RemoveMachineInstrFromMaps(*DeadInst);
    DeadInst->eraseFromParent();
  }
  DeadRemats.clear();
}
