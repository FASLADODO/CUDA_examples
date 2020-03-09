cmake_minimum_required(VERSION 3.8)

find_package(CUDA REQUIRED)


# #Pass option to NVCC
# set(
#     CUDA_NVCC_FLAGS
#     ${CUDA_NVCC_FLAGS};
#     -O3  -gencode arch=compute_22, code=sm_22
# )

# Specify binary name and source file to build it from
cuda_add_executable(
    square
    src/square.cu)