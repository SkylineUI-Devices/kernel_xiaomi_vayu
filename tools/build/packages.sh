#!bin/bash

sudo apt-get update
          sudo apt-get install -y build-essential bc lld gcc-aarch64-linux-gnu gcc-arm-linux-gnueabi libssl-dev libfl-dev
          sudo apt-get install -y curl git ftp lftp wget libarchive-tools ccache python2 python2-dev
          sudo apt-get install -y zip unzip tar gzip bzip2 rar unrar cpio jq

echo "Installing packages has been done"
