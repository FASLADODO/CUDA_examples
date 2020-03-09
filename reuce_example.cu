// d_out and d_in is in global memory
__global__ void global_reduce_kernel(float * d_out, float * d_in)
{
	int myId = threadIdx.x + blockDim.x * blockIdx.x ;
	int tid  = threadIdx.x ;

	// do reduction in global memory
	// Say we have 1024*1024 data chunk in global memory. i.e. d_in
	// 1024 blocks with 1024 thread will reduce to d_out of 1024 result

	// each block is responsible for 1024 chunk of floats
	for(unsigned int s = blockDim.x/2; s>0 ){

	}
}