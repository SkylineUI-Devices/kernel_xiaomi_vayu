#!bin/bash

git pull && git submodule init && git submodule update --remote --merge
echo "Sync has been done"
