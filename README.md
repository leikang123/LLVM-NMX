Low Level Virtual Machine (LLVM)
================================

This directory and its subdirectories contain source code for the Low Level
Virtual Machine, a toolkit for the construction of highly optimized compilers,
optimizers, and runtime environments.

LLVM is open source software. You may freely distribute it under the terms of
the license agreement found in LICENSE.txt.

Please see the HTML documentation provided in docs/index.html for further
assistance with LLVM.

If you're writing a package for LLVM, see docs/Packaging.html for our
suggestions.

--------------------------------

This branch contains a code generating backend for the TI C64x+ VLIW processor
(to be found in lib/Targets/TMS320C64X).

It is based on the initial contribution by Jeremy Morse[1], available at
git.srobo.org, though it now targets a COFF dialect compatible with TI's binary
tools.

Developed by members of the EPICOpt[2] team, at the Vienna University of
Technology.


LLVM backend for NMX 

###Prerequisites: install ninja, cmake

Build && install && compiler 
#git clone git://github.com/leikang123/llvm-nmx.git 

#cd llvm-nmx

#mkdir build

#cd build

#cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release ../llvm

#ninja -j4


####If you have any questions, please mention ISS and pr####
