#! /bin/bash

echo "Downloading raw ultrasound data,you may need wait minutes..."
wget http://campar.in.tum.de/files/goeblr/mockData_linearProbe.zip -o /dev/null
wget https://github.com/IFL-CAMP/supra/raw/master/config/configDemo.xml -o /dev/null

mkdir data

mv configDemo.xml data
mv mockData_linearProbe.zip data
cd data
unzip mockData_linearProbe.zip -d .
rm mockData_linearProbe.zip

echo "data ok!"