#!/bin/bash

NAME=p4vasp
VERSION=0.3.30
RELEASE=1
DEVELDIR=../p4vasp
NV="$NAME-$VERSION"
NVR="$NAME-$VERSION-$RELEASE"

DISTRIBUTIONDIR=$PWD
EXTSRC=../ext
EXTDEST=$NV/ext
EXT1=fltk-1.3.0-source.tar.gz

CHANGE_LOG="""
* Sun Aug 16 2015 Orest Dubay <dubay@danubiananotech.com>
- Primitive structure and force constants
* Tue Feb 18 2014 Orest Dubay <dubay@danubiananotech.com>
- Crystal system wizard
* Sun Oct 20 2013 Orest Dubay <dubay@danubiananotech.com>
- Fixing crash related to Selection
* Sat Oct  5 2013 Orest Dubay <dubay@danubiananotech.com>
- Fix after swig update - thanks to Graham Inggs
* Thu Aug 24 2013 Orest Dubay <dubay@danubiananotech.com>
- K-points viewer applet
* Thu Apr 11 2013 Orest Dubay <dubay@danubiananotech.com>
- Exporter introduced - allows to export geometries and isosurfaces to povray
* Wed Dec 12 2012 Orest Dubay <dubay@danubiananotech.com>
- minor fixes (IPR, wait in mainloop)
* Sat Sep 23 2012 Orest Dubay <dubay@danubiananotech.com>
- static package builder, pysqlite removed from the embedded packages
* Sun Aug 12 2012 Orest Dubay <dubay@danubiananotech.com>
- Install scripts updated + work in progress - not released
* Sun Mar 25 2012 Orest Dubay <dubay@danubiananotech.com>
- IPR, MD speed, VAC fixes, numpy support, dielectrict function fix, other fixes
* Sat Mar 10 2012 Orest Dubay <dubay@danubiananotech.com>
- Several minor corrections, Participation function display in Electronic applet
* Sat Feb 26 2011 Orest Dubay <dubay@danubiananotech.com>
- Bug in painting of the dielectric function fixed.
* Sat Feb 13 2010 Orest Dubay <dubay@danubiananotech.com>
- fltk updated
* Fri Oct 26 2007  Orest Dubay <p4vasp@danubiananotech.com>
- Repackaging, minor corrections (reduced updating in graph applets), preparation for v0.4
* Sun Jul 8 2007  Orest Dubay <odu@atomistix.com>
- Database support continued - restricted saving, LDOS, Info applet
* Sat Mar 10 2007  Orest Dubay <odu@atomistix.com>
- Database support is improving (total DOS, INCAR, KPOINTS-file)
* Sat Mar 10 2007  Orest Dubay <odu@atomistix.com>
- Database support is improving...
* Tue Oct 8 2006  Orest Dubay <odu@atomistix.com>
- File selection for isosurface drawing
* Tue Aug 1 2006  Orest Dubay <dubay@ap.univie.ac.at>
- Quick commit
* Sat Jul 15 2006  Orest Dubay <dubay@ap.univie.ac.at>
- Drawing of isosurfaces as points, fix (?) of the pin and external button icon handling
* Fri May 12 2006 Orest Dubay <orest.dubay@univie.ac.at>
- horizontal lines bugfix, the PySwigObject issue, corelation->correlation
* Mon Apr 24 2006 Orest Dubay <orest.dubay@univie.ac.at>
- Some bugfixes, an experimental database support (MySQL)
* Thu Mar 24 2006 Orest Dubay <orest.dubay@univie.ac.at>
- Reload option, contrast/brightness in STM, STM button
* Thu Mar 16 2006 Orest Dubay <orest.dubay@univie.ac.at>
- LORBIT=12 fix was wrong => fix removed + automatic path to python in Makefiles
* Thu Mar 9 2006 Orest Dubay <orest.dubay@univie.ac.at>
- LORBIT=12 processing in ElectronicApplet
* Wed Nov 9 2005 Orest Dubay <dubay@ap.univie.ac.at>
- Dielectric function applet
* Mon Oct 10 2005 Orest Dubay <dubay@ap.univie.ac.at>
- Velocities in p4vasp.SystemPM.XMLSystemPM
* Thu Jul 28 2005 Orest Dubay <dubay@ap.univie.ac.at>
- Structure in STM, reading DOSCAR file (no spin info, no local DOS)
* Fri Jun 10 2005 Orest Dubay <dubay@ap.univie.ac.at>
- Resize bug of structure window fixed (size_range in VisFLWindow)
* Mon May 2 2005 Orest Dubay <dubay@ap.univie.ac.at>
- Downsampling in the structure viewer
* Thu Mar 31 2005 Orest Dubay <dubay@ap.univie.ac.at>
- dielectric function in XMLSystemPM
* Tue Mar 15 2005 Orest Dubay <dubay@ap.univie.ac.at>
- 'from __future__ import generators' fix in STM and VAC
* Fri Mar 11 2005 Orest Dubay <dubay@ap.univie.ac.at>
- Minor changes/improvements/bugfixes in VAC and DOS viewer
* Mon Mar 7 2005 Orest Dubay <dubay@ap.univie.ac.at>
- VAC applet from Tomas Bucko added, CSTRUCTURE_SEQUENCE_L, vertical lines in graph
* Fri Jan 28 2005 Orest Dubay <dubay@ap.univie.ac.at>
- STM applet improved
* Fri Jan 14 2005 Orest Dubay <dubay@ap.univie.ac.at>
- STM applet added
* Mon Jan 10 2005 Orest Dubay <dubay@ap.univie.ac.at>
- Structure update by text->table view in Builder
* Fri Oct 29 2004 Orest Dubay <dubay@ap.univie.ac.at>
- Minor bugfixes and RotationApplet
* Fri Oct 22 2004 Orest Dubay <dubay@ap.univie.ac.at>
- Minor bugfixes and feature enhancements, mainly in Electronic applet
* Tue Oct 19 2004 Orest Dubay <dubay@ap.univie.ac.at>
- Minor bugfixes and feature enhancements
* Thu Oct 14 2004 Orest Dubay <dubay@ap.univie.ac.at>
- Major bugfixes and feature enhancements
* Thu Aug 10 2004 Orest Dubay <dubay@ap.univie.ac.at>
- Builder fixes
* Thu Jul 29 2004 Orest Dubay <dubay@ap.univie.ac.at>
- p4vasp strongly reorganized, atom selection improved, included the builder applet
* Fri May 7 2004 Orest Dubay <dubay@ap.univie.ac.at>
- Several bugfixes
* Wed Apr 28 2004 Orest Dubay <dubay@ap.univie.ac.at>
- Isosurfaces visualisation, progress bars
* Tue Apr  6 2004 Orest Dubay <dubay@ap.univie.ac.at>
- p4vasp.store improved
* Wed Mar 31 2004 Orest Dubay <dubay@ap.univie.ac.at>
- minor bugfix in Local Bands applet
* Wed Mar 26 2004 Orest Dubay <dubay@ap.univie.ac.at>
- p4vasp reorganized and RPM built
"""

echo "CREATE $NAME-$VERSION-$RELEASE.spec"
echo """Summary: A visualisation program for the Vienna Ab-initio Simulation Package (VASP).
Name: $NAME
Version: $VERSION
Release: $RELEASE
Copyright: GPL,LGPL
Group: Applications/Productivity
Source0: $NAME-$VERSION.tgz
BuildRoot: /tmp/buildroot_$NAME
Requires: python >= 2.2, python-gtk, fltk, python-numeric

%description
P4vasp is a visualization suite for the Vienna Ab-initio Simulation
Package (VASP). It contains an extensible GUI framework, that can be used to view
material structure, density of states, band-structure and more.
It provides a python library, that greatly simplifies
the process of manipulation of the VASP input and output data in python scripts.
P4vasp utilizes also many handy routines and objects e.g. for creating 2D graphs,
data storage (xml,DOM) or simple matrix library.

For the convenience, two packages are embedded in this distribution:
a slightly modified piddle package (http://piddle.sourceforge.net)
and the ODPdom library (http://www.sourceforge.net/projects/odpdom).
ODPdom a simple XML-DOM parser capable of reading large (~100MB) xml files.
%prep
%setup
#%patch -p1 -b .buildroot

%build
make
%install
rm -rf          \$RPM_BUILD_ROOT

P4VASP_HOME=\"\$RPM_BUILD_ROOT/usr/lib/p4vasp\"
SITE_PACKAGES=\"\$RPM_BUILD_ROOT/usr/lib/python/site-packages\"
BINDIR=\"\$RPM_BUILD_ROOT/usr/bin\"
INCLUDEDIR=\"\$RPM_BUILD_ROOT/usr/include\"
LIBDIR=\"\$RPM_BUILD_ROOT/usr/lib\"

mkdir -p                                 \$SITE_PACKAGES/p4vasp
cp -R         lib/p4vasp                 \$SITE_PACKAGES
chmod  -R 755                            \$SITE_PACKAGES/p4vasp
chmod     644                            \$SITE_PACKAGES/p4vasp/*
chmod  -R 755                            \$SITE_PACKAGES/p4vasp/applet
chmod  -R 644                            \$SITE_PACKAGES/p4vasp/applet/*
chmod  -R 755                            \$SITE_PACKAGES/p4vasp/paint3d
chmod  -R 644                            \$SITE_PACKAGES/p4vasp/paint3d/*
chmod  -R 755                            \$SITE_PACKAGES/p4vasp/export
chmod  -R 644                            \$SITE_PACKAGES/p4vasp/export/*
chmod  -R 755                            \$SITE_PACKAGES/p4vasp/piddle
install -m644 src/cp4vasp.py             \$SITE_PACKAGES
install -m755 src/_cp4vasp.so            \$SITE_PACKAGES

mkdir -p                                 \$P4VASP_HOME
cp -R         data                       \$P4VASP_HOME
cp -R         utils                      \$P4VASP_HOME
chmod  -R 755                            \$P4VASP_HOME/data
chmod     644                            \$P4VASP_HOME/data/*
chmod     755                            \$P4VASP_HOME/data/glade 
chmod     644                            \$P4VASP_HOME/data/glade/*
chmod     755                            \$P4VASP_HOME/data/glade/pixmaps
chmod     644                            \$P4VASP_HOME/data/glade/pixmaps/*
chmod     755                            \$P4VASP_HOME/data/glade2 
chmod     644                            \$P4VASP_HOME/data/glade2/*
chmod     755                            \$P4VASP_HOME/data/glade2/pixmaps
chmod     644                            \$P4VASP_HOME/data/glade2/pixmaps/*
chmod     755                            \$P4VASP_HOME/data/graphs
chmod     644                            \$P4VASP_HOME/data/graphs/*
chmod     755                            \$P4VASP_HOME/data/images
chmod     644                            \$P4VASP_HOME/data/images/*
chmod     755                            \$P4VASP_HOME/data/database
chmod     644                            \$P4VASP_HOME/data/database/*
chmod  -R 755                            \$P4VASP_HOME/utils
install -m644 BUGS FAQS LICENSE          \$P4VASP_HOME
install -m644 README Required.txt        \$P4VASP_HOME
install -m755 uninstall.sh               \$P4VASP_HOME/uninstall.sh
install -m755 diagnostic.py              \$P4VASP_HOME/diagnostic.py

mkdir -p                                 \$BINDIR
install -m755 p4v.py                     \$BINDIR/p4v.py
install -m755 p4v.py                     \$BINDIR/p4v

mkdir -p                                 \$P4VASP_HOME
cp -R         doc                        \$P4VASP_HOME
chmod  -R 755				 \$P4VASP_HOME/doc
chmod     644				 \$P4VASP_HOME/doc/*
chmod  -R 755				 \$P4VASP_HOME/doc/api
chmod     644				 \$P4VASP_HOME/doc/api/*
chmod  -R 755				 \$P4VASP_HOME/doc/api/c
chmod  -R 755				 \$P4VASP_HOME/doc/api/python
chmod  -R 755				 \$P4VASP_HOME/doc/intro
chmod     644				 \$P4VASP_HOME/doc/intro/*
	
mkdir -p                                 \$INCLUDEDIR/ODP
mkdir -p                                 \$INCLUDEDIR/p4vasp
cp -R         odpdom/include/ODP         \$INCLUDEDIR
cp -R         src/include/p4vasp         \$INCLUDEDIR
chmod     755                            \$INCLUDEDIR/ODP
chmod     755                            \$INCLUDEDIR/p4vasp
chmod     644                            \$INCLUDEDIR/ODP/*
chmod     644                            \$INCLUDEDIR/p4vasp/*

cp            src/libp4vasp.a            \$LIBDIR
cp            odpdom/libODP.a            \$LIBDIR
chmod     644                            \$LIBDIR/libp4vasp.a	
chmod     644                            \$LIBDIR/libODP.a	

%clean
rm -rf \$RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%doc README LICENSE FAQS BUGS Required.txt doc

/usr/bin/p4v.py
/usr/bin/p4v
/usr/lib/p4vasp
/usr/lib/libp4vasp.a
/usr/lib/libODP.a
/usr/include/p4vasp
/usr/include/ODP
/usr/lib/python/site-packages/p4vasp
/usr/lib/python/site-packages/cp4vasp.py
/usr/lib/python/site-packages/_cp4vasp.so

%changelog

$CHANGE_LOG
""">$NVR.spec


echo "COPY   $NV"
rm -Rf $NV
cp -R $DEVELDIR $NV
echo "CLEAN  $NV"
cd $NV
make cleanall
rm vasprun*
cd ..
echo "DOC    $NV"
cd $NV
make doc
cd ..
echo "MARK   DATE"
date +"%B %d %Y"
echo "$NAME Version $VERSION (Release $RELEASE)" >README
echo "Distribution built:">>README
date +"%B %d %Y" >>README
echo "">>README
cat $NV/README >>README
rm $NV/README
mv README $NV/README
echo """$CHANGE_LOG""" >$NV/ChangeLog
cp $NVR.spec $NV/$NVR.spec

echo "name       =\"$NAME\"" >vinfo.py
echo "version    =\"$VERSION\"">>vinfo.py
echo "release    =\"$RELEASE\"">>vinfo.py
echo "build_date =\"`date +\"%B %d %Y\"`\"">>vinfo.py
echo "">>vinfo.py
mv vinfo.py $NV/vinfo.py

######## EXT ################################
echo "EXT"
cp $EXTSRC/$EXT1 $EXTDEST
cd $EXTDEST
tar -xvzf $EXT1
rm $EXT1
cd $DISTRIBUTIONDIR

#############################################

echo "PACK   $NV"
tar -cvzf $NV.tgz $NV
echo "REMOVE $NV"
rm -Rf $NV


#echo "CREATE RPM and SRPM"
#cp $NV.tgz packages/SOURCES
#rpmbuild -ba $NVR.spec
#echo "COPY   DISTRIBUTIONS"
#mv packages/RPMS/i586/$NVR.i586.rpm arch
#mv packages/SRPMS/$NVR.src.rpm      arch
mv $NV.tgz                          arch
mv $NVR.spec                        arch

#cp arch/$NVR.i586.rpm ~
