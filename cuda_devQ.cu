// Device qurey
#include <stdio.h>

int main()
{

	int nDevices;

	cudaGetDeviceCount(&nDevices);

	printf("Total number of devices %d\n", nDevices);
	for (int i = 0; i < nDevices; i++) {
		cudaDeviceProp prop;
		cudaGetDeviceProperties(&prop, i);
		printf("Device number: %d\n", i);
		printf("  Device name: %s\n", prop.name);
		printf("  Memory Clock Rate (KHz): %d\n",prop.memoryClockRate);
		printf("  Memory Bus Width (bits): %d\n",prop.memoryBusWidth);
		printf("  Peak Memory Bandwidth (GB/s): %f\n",
			2.0*prop.memoryClockRate*(prop.memoryBusWidth/8)/1.0e6);
		printf("  Number of multiprocessors:%d\n",prop.multiProcessorCount);
		printf("  Device major: %d\n", prop.major);
		printf("  Total number of cores: %d\n\n",prop.mPultiProcessorCount*128);
		printf("  Total global memory: %zu\n", prop.totalGlobalMem);
		printf("  Total amount of shared memory per block: %zu\n",prop.sharedMemPerBlock);
		printf("  Total registers per block: %d\n", prop.regsPerBlock);
		printf("  Warp size: %d\n", prop.warpSize);
		printf("  Maximum memory pitch: %u\n", prop.memPitch);
		printf("  Total amount of constant memory: %u\n", prop.totalConstMem);
	}
	return 0;
}