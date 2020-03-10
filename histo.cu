#include <stdio.h>

#define BLOCK_WIDTH 1000
#define TOTAL_THREADS 1000000
#define BINS 4


__global__ void naive_histo(int *d_bins,const int *d_in, const int BINS_COUNT)
{
	int myId = threadIdx.x + blockDim.x * blockIdx.x ;
	int myItem = d_in[myId];
	int myBin = myItem % BINS_COUNT;
	d_bins[myBin]++;
}
__global__ void simple_histo(int *d_bins,const int *d_in, const int BINS_COUNT)
{
	int myId = threadIdx.x + blockDim.x * blockIdx.x ;
	int myItem = d_in[myId];
	int myBin = myItem % BINS_COUNT;
	atomicAdd(&d_bins[myBin],1);
}

int main(int argc, char **argv)
{
	// Array size is can be considered as number of measurements taken
	const int ARRAY_SIZE = 65536;
	const int ARRAY_BYTES = ARRAY_SIZE * sizeof(int);
	const int BIN_COUNT = 16;
	const int BIN_BYTES = BIN_COUNT * sizeof(int);
	
	// Generate the nput array on host (some random 655536 numbers)
        int h_histo[ARRAY_SIZE];
	for (int i = 0; i< ARRAY_SIZE ; i++) {
		h_histo[i] = bit_reverse(i, log2(ARRAY_SIZE));
	}
	int h_bins[BIN_COUNT];
	for (int i = 0; i< BIN_COUNT ; i++) {
		h_bins[i] = 0;
	}

	int d_bins*;
	cudaMalloc((void**)&d_bins, BIN_BYTES);
	cudaMemcpy(&d_bins, &h_bins, BIN_BYTES, cudaMemcpyHostToDevice);

	int d_in*;
	cudaMalloc((void**)&d_in, ARRAY_BYTES);
	cudaMemcpy(&d_in, &h_histo, ARRAY_BYTES, cudaMemcpyHostToDevice);



	// Kernel call
	naive_histo<<<1,16>>>(&d_bins,&d_in,BIN_COUNT);

	// Copy back data to host



	// Freeup gpu memory Before exit
	cudaFree(d_bins);
	cudaFree(d_in);

	return 0;
}
