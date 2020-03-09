#include <stdio.h>


#define NUM_BLOCKS 16
#define BLOCK_WIDTH 1


__global__ void hello()
{
	printf("I'm thread in block %d\n",blockIdx.x);
}

int main()
{

	// Launch kernel
	hello<<<NUM_BLOCKS,BLOCK_WIDTH>>>();

	// Force the printf()s to flush
	cudaDeviceSynchronize();

	printf("That's all ;) ");

	return 0;
}