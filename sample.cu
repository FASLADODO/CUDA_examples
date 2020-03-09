#include <stdio.h>

__global__ void addk()
{ }

int main()
{
	//float out[], in[];
	addk<<<1,10>>>();
	printf("Hello world from CPU");
	return 0;
}
