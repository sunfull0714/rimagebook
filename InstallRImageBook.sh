#!/bin/sh
cd
sudo apt-get update
yes | sudo apt-get upgrade
yes | sudo apt-get install r-base-dev
yes | sudo apt-get install pkg-config
yes | sudo apt-get install imagemagick
yes | sudo apt-get install libmagickcore-dev
yes | sudo apt-get install libmagickwand-dev
yes | sudo apt-get install libgtk2.0-dev
yes | sudo apt-get install gtk2-engines-pixbuf
yes | sudo apt-get install curl
yes | sudo apt-get install subversion
yes | sudo apt-get install cmake
yes | sudo apt-get install libglu1-mesa-dev freeglut3-dev mesa-common-dev libsdl1.2-dev
yes | sudo apt-get install libfftw3-dev libtiff4-dev libjpeg62-dev
pkg-config gtk+-2.0 --libs
Magick-config --libs
echo "install.packages(\"abind\", repos=\"http://cran.md.tsukuba.ac.jp\")" | sudo R --no-save
sudo wget http://www.bioconductor.org/packages/2.10/bioc/src/contrib/EBImage_3.11.0.tar.gz
sudo R CMD INSTALL EBImage_3.11.0.tar.gz
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
sudo cmake -D BUILD_SHARED_LIBS=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=${HOME}/usr/ -D VTK_DATA_ROOT=../../VTKData ..
sudo make -j 2
sudo make install
cd
sudo svn checkout http://rimagebook.googlecode.com/svn/trunk/ rimagebook-read-only
cd rimagebook-read-only/RImageBook/src
sudo mv Makevars Makevars.old
sudo mv Makevars.sample Makevars
cd ..
sudo bash ./build.sh
