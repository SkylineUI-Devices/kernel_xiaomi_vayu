#!/bin/bash

LGR='\033[1;32m'

$kernel_name="Your_Kernel_Name"
anykernel="AnyKernel3"

if [[ -f arch/arm64/boot/Image && arch/arm64/boot/dtbo.img ]]; then

    echo "Copying files to $anykernel dir"
    cp out/arch/arm64/boot/Image out/AnyKernel3 && cp out/arch/arm64/boot/dtbo.img out/AnyKernel3 && echo "Making zip" && zip -r $kernel_name-$(date +"%d%m%Y-%H%M").zip * && echo "Zip is ready at out/$anykernel, Enjoy!"

    else
        echo  "Images not found, Aborting..."
