#include <stdio.h>
#include "gputimer.h"

#define NUM_THREADS 1000000
#define ARRAY_SIZE 10

#define BLOCK_WIDTH 1000

void print_array(int *array, int size) {
	for (int i = 0 ; i < size ; i++)
		printf("a[%d] = %d\n",i,array[i]);
}

__global__ void increment_naive(int *g) {
	// Which thread is this?
	int i = blockIdx.x * blockDim.x + threadIdx.x ;

	// each thread to increment consecutive element, wrapping at ARRAY_SIZE
	i = i % ARRAY_SIZE ;
	g[i] = g[i] + 1;
}


int main(int argc, char **argv) {
	GpuTimer timer;
	printf("%d total threads in %d blocks writing into %d array elements\n",
			NUM_THREADS, NUM_THREADS/BLOCK_WIDTH, ARRAY_SIZE);

	// declare and allocate host memmory
	int h_array[ARRAY_SIZE];
	const int ARRAY_BYTES = ARRAY_SIZE * sizeof(int);

	// declare, allocate and zero out GPU memory
	int *d_array;
	cudaMalloc((void**) &d_array, ARRAY_BYTES);
	cudaMemset((void*) d_array, 0, ARRAY_BYTES);


	// Benchmarking
	timer.Start();
	increment_naive<<<NUM_THREADS/BLOCK_WIDTH, BLOCK_WIDTH>>>(d_array);
	timer.Stop();

	// Copy back the array
	cudaMemcpy(h_array,d_array,ARRAY_BYTES,cudaMemcpyDeviceToHost);
 	print_array(h_array, ARRAY_SIZE);
	printf("Time lapsed = %g ms\n",timer.Elapsed());

	cudaFree(d_array);

	return 0;


}
