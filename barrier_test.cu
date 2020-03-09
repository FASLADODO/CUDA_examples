
#include <stdio.h>

using namespace std;

#define NUM_BLOCKS 1
#define BLOCK_WIDTH 128

__global__ void hello()
{
	printf("hello worlds! I'm thread %d in block %d\n", threadIdx.x, blockIdx.x);
	int idx = threadIdx.x ;
	__shared__ int array[128];
	array[idx] = threadIdx.x ;

	printf("Before::: Array val  : %d fot tid : %d\n", array[idx],threadIdx.x);
	__syncthreads();

	if(idx < 127) {
		int temp = array[idx+1] ;
	__syncthreads();
		array[idx] =temp;
	__syncthreads();
	}
	printf("After::: Array val  : %d fot tid : %d\n", array[idx],threadIdx.x);
}

int main(int argc, char **argv) {
	// Launching kernel
	hello << <NUM_BLOCKS, BLOCK_WIDTH >> > ();


	// Forceprint to flush
	cudaDeviceSynchronize();
	printf("THats's all!\n");

	return 0;
}
