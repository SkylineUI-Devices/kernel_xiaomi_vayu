#!/bin/bash

LGR='\033[1;32m'

sudo apt install git
git clone https://github.com/akhilnarang/scripts
cd scripts
. setup/android_build_env.sh
sudo apt install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-gtk3-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev python2 binutils-aarch64-linux-gnu cpio
cd ..
rm -rf scripts
echo -e ${LGR} "#### envirment setup has been completed successfully ####"
