############################################################################
# <summary> CMakeLists.txt for OpenCV and CUDA. </summary>
# <date>    2012-02-07          </date>
# <author>  Quan Tran Minh. edit by Johannes Kast, Michael Sarahan </author>
# <email>   quantm@unist.ac.kr  kast.jo@googlemail.com msarahan@gmail.com</email>
############################################################################
# cmake_minimum_required(VERSION 3.13.0)
cmake_minimum_required(VERSION 2.6 FATAL_ERROR)
project(cs344)
set(OpenCV_DIR "C:/Devtools/cv/opencv/build")
# set(CMAKE_GENERATOR_PLATFORM x64)
find_package(OpenCV REQUIRED)
find_package(CUDA REQUIRED)

link_libraries(${OpenCV_LIBS} )
# set(CMAKE_CUDA_COMPILER  "C:/Program Files/NVIDIA GPU Computing Toolkit/CUDA/v10.0/bin/nvcc.exe")
# collect source files

file( GLOB  hdr *.hpp *.h )
file( GLOB  cu  *.cu)
SET (HW1_files main.cpp reference_calc.cpp compare.cpp)

CUDA_ADD_EXECUTABLE(HW1 ${HW1_files} ${hdr} ${cu})