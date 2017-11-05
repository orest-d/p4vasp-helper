#!/bin/bash


#################### Automatic configuration ###############################


DISTR=arch

cd $DISTR
TGZ=`ls -1v *.tgz|tail -n 1`
cd -
P4V=${TGZ%.tgz}

echo $P4V

cp $DISTR/$P4V.tgz .
tar -xvzf $P4V.tgz

#################### Building ##############################################

cd $P4V
make local
make
cd src
#mv _cp4vasp.so _cp4vasp.pyd # DONT DO IT IN LINUX
cd ..

#################### PyInstaller Section ###################################
export PYTHONPATH=$PWD/lib:$PWD/src
cp ../p4v.spec .
cp ../hook-p4vasp.py .
python ../pyinstaller-2.0/pyinstaller.py p4v.spec

#################### Packaging #############################################
cp dist/p4v.exe p4v
zip $P4V-static.zip p4v LICENSE README
mv $P4V-static.zip ../arch
