#!/bin/bash

P4V=$1
PYTHON=$2
export PATH=$PATH:$PYTHON
echo $P4V

#################### PyInstaller Section ###################################
cd $P4V
export PYTHONPATH=$PYTHONPATH:$PWD/lib:$PWD/src
cp ../p4.ico .
cp ../p4v.spec .
cp ../hook-p4vasp.py .
python ../pyinstaller-2.0/pyinstaller.py -i p4.ico p4v.spec