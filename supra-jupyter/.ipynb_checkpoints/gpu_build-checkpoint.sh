#! /bin/bash

source /opt/intel/inteloneapi/setvars.sh --force
set -x
dpcpp --version

cd supra

echo "Remove old build folder..."
rm -rf build
echo "Remove done."

echo "Create image output folder..."
mkdir -p build 
echo "Create folder done."
cd build

export PATH=`echo ${PATH} | awk -v RS=: -v ORS=: '/vtune/ {next} {print}'`

CC=clang CXX=dpcpp cmake ..
make -j4 &> /dev/null

echo "Build done!"