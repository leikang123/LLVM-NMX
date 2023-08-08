//===- RegAllocBase.h - basic regalloc interface and driver -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines the RegAllocBase class, which is the skeleton of a basic
// register allocation algorithm and interface for extending it. It provides the
// building blocks on which to construct other experimental allocators and test
// the validity of two principles:
//
// - If virtual and physical register liveness is modeled using intervals, then
// on-the-fly interference checking is cheap. Furthermore, interferences can be
// lazily cached and reused.
//
// - Register allocation complexity, and generated code performance is
// determined by the effectiveness of live range splitting rather than optimal
// coloring.
//
// Following the first principle, interfering checking revolves around the
// LiveIntervalUnion data structure.
//
// To fulfill the second principle, the basic allocator provides a driver for
// incremental splitting. It essentially punts on the problem of register
// coloring, instead driving the assignment of virtual to physical registers by
// the cost of splitting. The basic allocator allows for heuristic reassignment
// of registers, if a more sophisticated allocator chooses to do that.
//
// This framework provides a way to engineer the compile time vs. code
// quality trade-off without relying on a particular theoretical solver.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_CODEGEN_REGALLOCBASE_H
#define LLVM_LIB_CODEGEN_REGALLOCBASE_H

#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/CodeGen/RegisterClassInfo.h"

namespace llvm {

class LiveInterval;
class LiveIntervals;
class LiveRegMatrix;
class MachineInstr;
class MachineRegisterInfo;
template<typename T> class SmallVectorImpl;
class Spiller;
class TargetRegisterInfo;
class VirtRegMap;

/// RegAllocBase provides the register allocation driver and interface that can
/// be extended to add interesting heuristics.
///
/// Register allocators must override the selectOrSplit() method to implement
/// live range splitting. They must also override enqueue/dequeue to provide an
/// assignment order.
class RegAllocBase {
  virtual void anchor();

protected:
   // 目标机器的寄存器信息  
  const TargetRegisterInfo *TRI = nullptr;
  // 机器级别的寄存器信息
  MachineRegisterInfo *MRI = nullptr;
  // 虚拟寄存器映射
  VirtRegMap *VRM = nullptr;
  // 活跃区间信息
  LiveIntervals *LIS = nullptr;
  // 寄存器矩阵
  LiveRegMatrix *Matrix = nullptr;
  // 寄存器类信息
  RegisterClassInfo RegClassInfo;

  //对象指针的集合，大小为32，用于跟踪和管理可以安全的从程序中删除少量的机器级指令
  SmallPtrSet<MachineInstr *, 32> DeadRemats;

  RegAllocBase() = default;
  // 虚函数默认
  virtual ~RegAllocBase() = default;

  // A RegAlloc pass should call this before allocatePhysRegs.
  // 将分配结果更新到虚拟寄存器映射中
  void init(VirtRegMap &vrm, LiveIntervals &lis, LiveRegMatrix &mat);

   // 顶级驱动程序。 输出是我们更新的 VirtRegMap
   // 物理寄存器分配。
  void allocatePhysRegs();

    // 包括溢出后优化并删除由于以下原因而留下的无效定义
   // 重新物化。
  virtual void postOptimization();

  // Get a temporary reference to a Spiller instance.
  // 虚拟寄存器的溢出
  virtual Spiller &spiller() = 0;

  /// enqueue - Add VirtReg to the priority queue of unassigned registers.
  virtual void enqueue(LiveInterval *LI) = 0;

  /// dequeue - Return the next unassigned register, or NULL.
  virtual LiveInterval *dequeue() = 0;

  
  //实现虚拟寄存器分配，根据当前物理寄存器情况，返回可用的物理寄存器。
  virtual unsigned selectOrSplit(LiveInterval &VirtReg,
                                 SmallVectorImpl<unsigned> &splitLVRs) = 0;

  // 将此组名称用于 NamedRegionTimer。
  static const char TimerGroupName[];
  static const char TimerGroupDescription[];
/// 当分配器即将删除 LiveInterval 时调用的方法。 
  virtual void aboutToRemoveInterval(LiveInterval &LI) {}

public:
  /// VerifyEnabled - True when -verify-regalloc is given.
  // 是否开启寄存器分配验证
  static bool VerifyEnabled;

private:
  // 
  void seedLiveRegs();
};

} // end namespace llvm

#endif // LLVM_LIB_CODEGEN_REGALLOCBASE_H
