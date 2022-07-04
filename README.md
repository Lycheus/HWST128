# HWST128: Memory Safety Accelerator on RISC-V with Metadata Compression

This is the repository for the accelerating pointer-based complete memory safety (both spatial and temporal) enforcement on RISC-V.
Please refer to the DAC 2021 paper (link: https://ieeexplore.ieee.org/abstract/document/9586293/) for detail of the implementation.

## Quickstart:

The project is using the RISC-V LLVM compiler to instrument memory safety operations into programs.
The tools include: 
  1) **GNU linux toolchain** for libraries; 
  2) **LLVM compiler (clang)** with HWST128 instrumentation;
  3) **RISC-V ISA simulator (SPIKE)** with HWST128 ISA extention;
  4) **Proxy kernel (PK)** with shadow space allocation

The following script is supported and verified on Ubuntu 20.04 LTS.

First, we shall keep the tool server updated.

```
sudo apt-get update
sudo apt-get -y dist-upgrade

sudo apt-get -y install \
  binutils build-essential libtool texinfo \
  gzip zip unzip patchutils curl git \
  make cmake ninja-build automake bison flex gperf \
  grep sed gawk python bc \
  zlib1g-dev libexpat1-dev libmpc-dev \
  libglib2.0-dev libfdt-dev libpixman-1-dev device-tree-compiler
```

Clone the HWST github
```
git clone --recursive https://github.com/Lycheus/HWST128.git
```

Next is to build the tools (it is a very lengthy process, prepare your coffee and cookie =))
```
cd HWST128
mkdir _install
export PATH=`pwd`/_install/bin:$PATH
export RISCV=`pwd`/_install/
hash -r

# gcc, binutils, newlib
pushd riscv-gnu-toolchain
./configure --prefix=`pwd`/../_install --with-cmodel=medany --enable-multilib
make linux -j`nproc`
popd

#LLVM
pushd hwst-llvm
mkdir _build
cd _build
cmake -G Ninja -DCMAKE_BUILD_TYPE="Release" \
  -DBUILD_SHARED_LIBS=True -DLLVM_USE_SPLIT_DWARF=True \
  -DCMAKE_INSTALL_PREFIX="../../_install" \
  -DLLVM_OPTIMIZED_TABLEGEN=True -DLLVM_BUILD_TESTS=False \
  -DDEFAULT_SYSROOT="../../_install/sysroot" \
  -DLLVM_DEFAULT_TARGET_TRIPLE="riscv64-unknown-gnu-linux" \
  -DLLVM_TARGETS_TO_BUILD="" -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD="RISCV" \
  -DCLANG_DEFAULT_LINKER="$RISCV/bin/riscv64-unknown-linux-gnu-gcc" \
  ../llvm
cmake --build . --target install

#build SBCETS runtime with HWST instrumentation
cd ../runtime
make
popd

# build spike (RISC-V ISA simulator)
pushd hwst-isa-sim
mkdir build
cd build
../configure --prefix=$RISCV --with-fesvr=$RISCV --enable-histogram
make -j$(nproc)
make install
popd

#build pk (proxy kernel)
pushd hwst-pk
mkdir build
cd build
../configure --prefix=$RISCV --host=riscv64-unknown-linux-gnu
make
mkdir -p ../../_install/riscv64-unknown-elf/bin
cp pk ../../_install/riscv64-unknown-elf/bin/
popd
```

Finally, we can test some program

```
# Sanity test your new RISC-V LLVM
cat >hello.c <<END
#include <stdio.h>

int main(){
  printf("Hello RISCV!\n");
  return 0;
}
END

clang -fsoftboundcets -c hello.c
riscv64-unknown-linux-gnu-gcc hello.o -o hello -L $RISCV/../hwst-llvm/runtime -lsoftboundcets_rt -lm -lrt -static -march=rv64imac -mabi=lp64 
spike pk hello
```

Or a slightly more complex program with differnt pointer manipulations
```
cd <hwst>/example
./run.sh
```

The hardware instrumentation is integrate with the softbound pointer analysis, therefore "-fsoftobundcets" will insert the HW accelerated security operations for metadata management.

The FPGA-ready rocketchip with memory safety ISA extension is avaliable in hwst-fpga folder.
Open the AMD Xilinx Vivado project file to synthesis to target FPGA. (Our team uses Zynq ZCU102)
Detailed instruction can be found in following link:
https://github.com/wmpmiles/rocket-chip


## Tips & Tricks

### For hwst-pk:
Be careful the default installation directory of pk is "unknown-linux-gnu" instead "_install", what make it worse is that the default pk used by spike is targeting "unknown-elf" directory instead "_install".
You can use absolute path for pk to solve this problem. 
```
e.g. "spike pk binaries" -> "spike ~/<hwst>/_install/pk binaries"
```

### Paper Citation
```
Wait until DAC 2022
```
