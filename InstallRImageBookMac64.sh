#!/bin/sh
cd
sudo port selfupdate
sudo port upgrade outdated
sudo port install R
sudo port install ImageMagick
sudo port install gtk2
sudo port install fftw-3 tiff jpeg
sudo port install wget
sudo port install curl
sudo port install subversion
sudo port install cmake
sudo port install mesa
cd /usr/include
sudo ln -s /opt/local/include/fftw3.h
for x in /opt/local/include/j*.h; do sudo ln -s $x; done
for x in /opt/local/include/tiff*.h; do sudo ln -s $x; done
cd /usr/lib
for x in /opt/local/lib/libfftw3.*; do sudo ln -s $x; done
for x in /opt/local/lib/libjpeg.*; do sudo ln -s $x; done
for x in /opt/local/lib/libtiff.*; do sudo ln -s $x; done
cd
echo "install.packages(\"abind\", repos=\"http://cran.md.tsukuba.ac.jp\")" | sudo R --no-save
sudo wget http://www.bioconductor.org/packages/2.10/bioc/src/contrib/EBImage_3.11.2.tar.gz
sudo R CMD INSTALL EBImage_3.11.2.tar.gz
echo "install.packages(\"biOps\", repos=\"http://cran.md.tsukuba.ac.jp\")" | sudo R --no-save
cd
sudo curl -L http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.3.1/OpenCV-2.3.1a.tar.bz2/download -o "OpenCV-2.3.1a.tar.bz2"
sudo curl -O http://www.vtk.org/files/release/5.8/vtk-5.8.0.tar.gz
sudo curl -O http://www.vtk.org/files/release/5.8/vtkdata-5.8.0.tar.gz
sudo bzip2 -cd OpenCV-2.3.1a.tar.bz2 | tar xvf -
cd OpenCV-2.3.1
sudo mkdir release
cd release
sudo cmake -D BUILD_SHARED_LIBS=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=${HOME}/usr/ ..
sudo make -j 2
sudo make install
cd
sudo tar zxvf vtk-5.8.0.tar.gz
sudo tar zxvf vtkdata-5.8.0.tar.gz
cd VTK
sudo mkdir release
cd release
sudo cmake -D BUILD_SHARED_LIBS=ON -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=${HOME}/usr/ -D VTK_DATA_ROOT=../../VTKData ..
sudo make -j 2
sudo make install
cd
sudo svn checkout http://rimagebook.googlecode.com/svn/trunk/ rimagebook-read-only
cd rimagebook-read-only/RImageBook/src
sudo mv Makevars Makevars.old
sudo mv Makevars.sample Makevars
cd ..
sudo env DYLD_LIBRARY_PATH=~/VTK/release/bin/ bash ./build.sh
sudo env DYLD_LIBRARY_PATH=~/VTK/release/bin/ R
