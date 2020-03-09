
#include <stdio.h>

using namespace std;

#define NUM_BLOCKS 16
#define BLOCK_WIDTH 1

__global__ void hello()
{
	printf("hello worlds! I'm thread in block %d\n", blockIdx.x);
}

int main(int argc, char **argv) {
	// Launching kernel
	hello << <NUM_BLOCKS, BLOCK_WIDTH >> > ();


	// Forceprint to flush
	cudaDeviceSynchronize();
	printf("THats's all!\n");

	return 0;
}
