############################################################################
# <summary> CMakeLists.txt for OpenCV and CUDA. </summary>
# <date>    2012-02-07          </date>
# <author>  Quan Tran Minh. edit by Johannes Kast, Michael Sarahan </author>
# <email>   quantm@unist.ac.kr  kast.jo@googlemail.com msarahan@gmail.com</email>
############################################################################
# set(CMAKE_CUDA_COMPILER "C:/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v10.0/bin/nvcc.exe")
cmake_minimum_required(VERSION 3.14)
# project(HW2_CUDA LANGUAGES CXX CUDA)
# collect source files

file( GLOB  hdr *.hpp *.h )
file( GLOB  cu  *.cu)
SET (HW2_files main.cpp reference_calc.cpp compare.cpp)
    
ADD_EXECUTABLE(HW2 ${HW2_files} ${hdr} ${cu})
