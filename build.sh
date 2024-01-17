#!/bin/bash

kernel_dir="${PWD}"
CCACHE=$(command -v ccache)
objdir="${kernel_dir}/out"
builddir="${kernel_dir}/build"
ZIMAGE=$kernel_dir/out/arch/arm64/boot/Image
kernel_name="Skyline-Kernel-vayu"
zip_name="$kernel_name-$(date +"%d%m%Y-%H%M").zip"
TC_DIR=$HOME/tc
CLANG_DIR=$HOME/tc/clang-latest
export CONFIG_FILE="vayu_defconfig"
export ARCH="arm64"
export KBUILD_BUILD_HOST=gxc2356
export KBUILD_BUILD_USER=home

export PATH="$CLANG_DIR/bin:$PATH"

if ! [ -d "$CLANG_DIR" ]; then
    echo "Toolchain not found! Cloning to $CLANG_DIR..."
    if ! git clone -q --depth=1 --single-branch https://gitlab.com/crdroidandroid/android_prebuilts_clang_host_linux-x86_clang-r510928.git -b 14.0 $TC_DIR; then
        echo "Cloning failed! Aborting..."
        exit 1
    fi
fi

# Colors
NC='\033[0m'
RED='\033[0;31m'
LRD='\033[1;31m'
LGR='\033[1;32m'

make_defconfig()
{
    START=$(date +"%s")
    echo -e ${LGR} "########### Generating Defconfig ############${NC}"
    make -s ARCH=${ARCH} O=${objdir} ${CONFIG_FILE} -j$(nproc --all)
}
compile()
{
    cd ${kernel_dir}
    echo -e ${LGR} "######### Compiling kernel #########${NC}"
    make -j$(nproc --all) \
    O=out \
    ARCH=${ARCH}\
    CC="ccache clang" \
    CLANG_TRIPLE="aarch64-linux-gnu-" \
    CROSS_COMPILE="aarch64-linux-gnu-" \
    CROSS_COMPILE_ARM32="arm-linux-gnueabi-" \
    LLVM=1 \
    LLVM_IAS=1
}

completion()
{
    cd ${objdir}
    COMPILED_IMAGE=arch/arm64/boot/Image
    COMPILED_DTBO=arch/arm64/boot/dtbo.img
    if [[ -f ${COMPILED_IMAGE} && ${COMPILED_DTBO} ]]; then

        echo -e ${LGR} "############################################"
        echo -e ${LGR} "############# OkThisIsEpic!  ##############"
        echo -e ${LGR} "############################################${NC}"
    else
        echo -e ${RED} "############################################"
        echo -e ${RED} "##         This Is Not Epic :'(           ##"
        echo -e ${RED} "############################################${NC}"
        exit 1
    fi
}
make_defconfig
compile
completion
cd ${kernel_dir}
