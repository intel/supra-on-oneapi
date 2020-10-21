#! /bin/bash

git clone https://github.com/IFL-CAMP/supra.git


cd supra
git reset --hard 73c930a08a7b1087f5be588863876a648a1add99
git am --whitespace=nowarn ../../*.patch
git am --whitespace=nowarn ../../supra-jupyter/*.patch