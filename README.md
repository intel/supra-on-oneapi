# This project provides you the patches to enable SUPRA on Intel GPU using Intel(R) oneAPI Base Toolkit Golden 2021.3.0.(Intel(R) oneAPI DPC++/C++ Compiler 2021.3.0)
### Note:  This project based on Intel(R) oneAPI Base Toolkit Golden 2021.3.0. It should not be used for production.

### 2021.12.9, tested on Intel(R) oneAPI Base Toolkit Golden 2021.4.0, works well. (Download oneaAPI 2021.4.0: wget https://registrationcenter-download.intel.com/akdlm/irc_nas/18236/l_BaseKit_p_2021.4.0.3422_offline.sh)

## 1. Project Introduction
### (1) Envrionment setup 

Please make sure you have installed Intel GPU driver (very important), you can follow below links:
 
 https://www.intel.com/content/www/us/en/develop/documentation/installation-guide-for-intel-oneapi-toolkits-linux/top/prerequisites/install-intel-gpu-drivers.html
 
 https://dgpu-docs.intel.com/installation-guides/ubuntu/ubuntu-bionic.html

You need install Intel oneAPI, Please refer to Intel(R) oneAPI installation guide: https://software.intel.com/content/www/us/en/develop/articles/installation-guide-for-intel-oneapi-toolkits.html

OS: Ubuntu 18.04 or Ubuntu 20.04

Hardware: Intel CPU with Gen9 or Intel Tigerlake Iris Xe GPU.

This project was tested on Intel(R) i7-8700K CPU with Intel(R) UHD Graphics 630 , please refer https://ark.intel.com/content/www/us/en/ark/products/126684/intel-core-i7-8700k-processor-12m-cache-up-to-4-70-ghz.html

This project was tested on Intel(R) i7-1185G7E CPU with Intel(R) Iris Xe GPU, please refer https://ark.intel.com/content/www/us/en/ark/products/208076/intel-core-i7-1185g7e-processor-12m-cache-up-to-4-40-ghz.html



### (2) Patch information
    The patch 0001-* describes the Intel(R) DPC++ Compatibility Tool migrates CUDA file to DPC++ file. Apply patch 0001-*, you will see a oneapi/ folder which contains migrated DPC++ files and related header files.
    The patch 0002-* describes modification to the DPC++ files. Apply patch 0001-* and 0002-*, you can build and run SUPRA successfully.
    The patch 0003-* describes optimization to BeamformingNode and HilbertEnvelopeNode. Apply patch 0003-*, the BeamformingNode and HilbertEnvelopeNode performance will improve.
    The patch 0004-* do code clean, using sycl in file name and variable name.

### 

### Publications
We have a published paper on IEEE Xplore, You can get more detail about the code from it: https://ieeexplore.ieee.org/document/9460657

## 2 Project build steps
There are 2 ways you can build and run our project. the jupyter notebook provides simple and quick method to enable SUPRA. if you want to know complete build process, you can follow the Linux terminal method to compile and run, which also won't take too long.

### (1) Jupyter notebook 

Clone this repo to your local machine, go to supra-jupyter/ folder, launch your jupyter notebook and open supra-jupyter.ipynb in your jupyter notebook. Follow the 
hints, you will enable SUPRA with just few clicks.


### (2) Linux terminal

Install 3rd libraries in your machine:

`apt-get install cmake cmake-gui qt5-default libtbb-dev libopenigtlink-dev git`

Download this repo to your machine:

`git clone https://github.com/intel/supra-on-oneapi.git`

Download SUPRA form github:

`git clone https://github.com/IFL-CAMP/supra.git`

Enter supra folder:

`cd supra`

Check supra commit log:

`git log`



Find this commit message:

![avatar](https://github.com/intel/supra-on-oneapi/raw/master/images/Commit%20info.PNG)

Reset the supra commit HEAD, use 

`git reset --hard 73c930a08a7b1087f5be588863876a648a1add99`
![avatar](https://github.com/intel/supra-on-oneapi/raw/master/images/reset%20success%20modify.png)

Apply patches to SUPRA:

`git am ../supra-on-oneapi/*.patch`


Build and Run supra demo, in supra directory:

`mkdir build`


`cd build`


Setup eviroment:

`source /opt/intel/oneapi/setvars.sh`

For Intel(R) oneAPI Base Toolkit beta07 version, you need change the $PATH, follow this two steps:

`echo $PATH`

it will print:

![avatar](https://github.com/intel/supra-on-oneapi/raw/master/images/PATH%20modify.png)

copy the whole PATH value except the contents in <font size="3">  <font color="#dd0000"> Red Rectangle.</font> <br />

Reset PATH variable value with before copied content use this command:

`export PATH=`

it should like this:

![avatar](https://github.com/intel/supra-on-oneapi/raw/master/images/reset%20path.PNG)

(use your machine to print PATH content, don't copy from here)


Configure project:

`CC=clang CXX=dpcpp CXXFLAGS="-L${TBBROOT}/lib/intel64/gcc4.8" cmake ..`

Build:

`make -j4`

Download sample data, in build directory create data folder:

`mkdir data`

`cd data`

`wget http://campar.in.tum.de/files/goeblr/mockData_linearProbe.zip`

unzip the sample data:

`unzip mockData_linearProbe.zip`

Copy config file to data folder:

`cp ../../config/configDemo.xml .`

Run the SUPRA GUI, in build folder:

`src/GraphicInterface/SUPRA_GUI -c data/configDemo.xml -a`

the SUPRA GUI show like this:

![avatar](https://github.com/intel/supra-on-oneapi/raw/master/images/guie.PNG)

Check the performance, open supra.log in the build directory: 

`cat supra.log` 

it will show every node performance performance in Millisecond.

## 3. Additional Note
