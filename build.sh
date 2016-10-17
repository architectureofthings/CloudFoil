#!/bin/bash

#  Modified from build.sh by:
#  Jacob Williams : 2/8/2014
#     - modified 6/23/2014

SRCDIR='src/'                #source directory
CMSRC='/Users/doughunsaker/Documents/XCodeProjects/CommonSource'       #common source directory
BUILDDIR='obj/'              #build directory for library
BINDIR='bin/'                #build directory for executable
FEXT='.f90'                  #fortran file extension
OBJEXT='.o'                  #object code extension
LIBEXT='.a'                  #static library extension
MODEXT='.mod'                #fortran module file extension
WC='*'                       #wildcard character
EXEOUT='CF.out'              #name of output program

#
# Always a clean build:
#

mkdir -p $BINDIR
mkdir -p $BUILDDIR

rm -f $BUILDDIR$WC$OBJEXT
rm -f $BUILDDIR$WC$MODEXT
rm -f $BUILDDIR$WC$LIBEXT

cd $SRCDIR
gfortran -static-libgfortran -fdefault-real-8 json.f90 math.f90 dataset.f90 atmosphere.f90 panel.f90 grid.f90 view.f90 su2.f90 main.f90 -o $EXEOUT
cd ..
mv $SRCDIR$WC$MODEXT $BUILDDIR
mv $SRCDIR$EXEOUT $BINDIR

