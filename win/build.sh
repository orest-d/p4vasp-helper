#!/bin/bash

#################### Configuration #########################################

PYTHON=/c/Python27
#PYTHON=/z/home/orest/Python27-win

#################### Automatic configuration ###############################

export PATH=$PATH:$PYTHON

DISTR=../distributions/arch

cd $DISTR
TGZ=`ls -1v *.tgz|tail -n 1`
cd -
P4V=${TGZ%.tgz}

echo $P4V

cp $DISTR/$P4V.tgz .
tar -xvzf $P4V.tgz
echo "LIBS=  -L../odpdom -lODP \`../ext/bin/fltk-config --use-gl --ldstaticflags\` -lpthread  -lpython27" >Configuration.mk
echo "CFLAGS= -g -O0 -fpic  -Wall \$(FLAGS) \`../ext/bin/fltk-config --cxxflags\` \\" >>Configuration.mk
echo "        -I$PYTHON/include -Iinclude -I../odpdom/include" >>Configuration.mk
echo "LDFLAGS= -shared -L. -L$PYTHON/libs" >>Configuration.mk
cp Configuration.mk $P4V/src/Configuration.mk

#################### Building ##############################################

cd $P4V
make local
make
cd src
mv _cp4vasp.so _cp4vasp.pyd
cd ..
cd ..

#################### PyInstaller Section ###################################
bash makeexe.sh $P4V $PYTHON