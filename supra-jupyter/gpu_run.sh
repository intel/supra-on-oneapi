#! /bin/bash
source /opt/intel/inteloneapi/setvars.sh --force

cd supra/build
cp -r ../../data .
rm -rf RxBeamformer HilbertFirEnvelope LogCompressor ScanConverter
rm supra.log
mkdir RxBeamformer HilbertFirEnvelope LogCompressor ScanConverter

./src/CommandlineInterface/SUPRA_CMD data/configDemo.xml