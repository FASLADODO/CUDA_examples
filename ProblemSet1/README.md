# Important changes I needed for my setup are made in CMakeLists.txt

also one more difference building this project for my setup require to use only 64 bit compilation.

# I used below cmake option.

C:\Devtools\CUDA_by_hand\ProblemSet1\build> cmake -DCMAKE_GENERATOR_PLATFORM=x64 .. 

# Once this is build making code changes and compiling and testing is very easy.

PS C:\Devtools\CUDA_by_hand\ProblemSet1\build> cmake --build .
Microsoft (R) Build Engine version 15.8.169+g1ccb72aefa for .NET Framework
Copyright (C) Microsoft Corporation. All rights reserved.

  Building NVCC (Device) object CMakeFiles/HW1.dir/Debug/HW1_generated_student_func.cu.obj
  student_func.cu
C:/Devtools/CUDA_by_hand/ProblemSet1/student_func.cu(70): warning : variable "threadX" was declared but never referenced [C:\Devtools\CUDA_by_hand\P
roblemSet1\build\HW1.vcxproj]
  
C:/Devtools/CUDA_by_hand/ProblemSet1/student_func.cu(71): warning : variable "threadY" was declared but never referenced [C:\Devtools\CUDA_by_hand\P 
roblemSet1\build\HW1.vcxproj]
  
  student_func.cu
C:/Devtools/CUDA_by_hand/ProblemSet1/student_func.cu(70): warning C4267: 'initializing': conversion from 'size_t' to 'int', possible loss of data [C 
:\Devtools\CUDA_by_hand\ProblemSet1\build\HW1.vcxproj]
C:/Devtools/CUDA_by_hand/ProblemSet1/student_func.cu(70): warning C4267: 'initializing': conversion from 'size_t' to 'const int', possible loss of d 
ata [C:\Devtools\CUDA_by_hand\ProblemSet1\build\HW1.vcxproj]
C:/Devtools/CUDA_by_hand/ProblemSet1/student_func.cu(71): warning C4267: 'initializing': conversion from 'size_t' to 'int', possible loss of data [C 
:\Devtools\CUDA_by_hand\ProblemSet1\build\HW1.vcxproj]
C:/Devtools/CUDA_by_hand/ProblemSet1/student_func.cu(71): warning C4267: 'initializing': conversion from 'size_t' to 'const int', possible loss of d 
ata [C:\Devtools\CUDA_by_hand\ProblemSet1\build\HW1.vcxproj]
C:/Devtools/CUDA_by_hand/ProblemSet1/student_func.cu(78): warning C4244: 'argument': conversion from 'float' to 'unsigned int', possible loss of dat 
a [C:\Devtools\CUDA_by_hand\ProblemSet1\build\HW1.vcxproj]
C:/Devtools/CUDA_by_hand/ProblemSet1/student_func.cu(80): warning C4267: 'argument': conversion from 'size_t' to 'int', possible loss of data [C:\De 
vtools\CUDA_by_hand\ProblemSet1\build\HW1.vcxproj]
  HW1.vcxproj -> C:\Devtools\CUDA_by_hand\ProblemSet1\build\Debug\HW1.exe


  # While testing binary it is required to have bin folder for Opencv.dll file in system path