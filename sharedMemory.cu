// (for clarity, hardcoding 128 threads/elements and omitting out-of-bounds checks)
__global__ void use_shared_memory_GPU(float *array)
{
	// local variable, private to each thread
	int i, index = threadIdx.x ;
	float average, sum = 0.0f;


	// __shared variables are visible to all threads in the thread block
	// and have the same lifetime as the thread block
	__shared__ float sh_arr[128];  

	// copy data from "array" in global memory to sh_arr in shared memory.
	// here, each thread is responsible for copying a single element.
	sh_arr[index] = array[index];

	__syncthreads();   // ensure all the writes to shared memory have completed

	// now, sh_arr is fully populated. Let's find average of all the previous elements
	for (i=0; i<index; i++) { sum += sh_arr[i];}
	average = sum / (index + 1.0f) ;

	// if array[index] is greater than the average of array[0..index-1], replace with average,
	if(array[index]>average){array[index]=average;}

	// Following code has NO EFFECT: it modifies shared memory, but
	// the resulting modified data is never copied back to global memory
	// and vanishes when the thread block completes
	sh_arr[index] = 3.14;

	__syncthreads();
}

int main(int argc,char * argv)
{
	float h_arr[128];  // convention: h_ variables live on host
	float *d_arr;      // convention: d_ variables live on the device (GPU global mem)
	
	// allocate global memory on the device, place result in "d_arr"
	cudaMalloc((void **) &d_arr, sizeof(float) * 128);

	// now copy data from host memory "h_arr" to device memory "d_arr"
	cudaMemCopy((void *)d_arr, (void *)h_arr, sizeof(float)*128, cudaMemcpyHostToDevice);
	
	// launch the kernel (1 block of 128 threads)
	use_shared_memory_GPU<<<1,128>>>(d_arr);

	// copy the modified array back to the host, overwriting contents of h_arr
	cudaMemCopy((void *)h_arr, (void *)d_arr, sizeof(float)*128, cudaMemcpyDeviceToHost);
	
	return 0;
}
