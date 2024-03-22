#!/bin/bash

LGR='\033[1;32m'

make clean
make mrproper
cd out
rm -rf * -x AnyKernel3
cd ..
echo -e ${LGR} "#### clean has been completed successfully  ####"
