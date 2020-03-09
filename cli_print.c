#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h>

int main(int argc,char **argv) {
   int array[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};
   int loop;

printf("%s\n",argv[argc-1]);
char *p;
int num;

errno = 0;
long conv = strtol(argv[argc-1], &p, 10);

// Check for errors: e.g., the string does not represent an integer
// or the integer is larger than int
if (errno != 0 || *p != '\0' || conv > INT_MAX) {
    // Put here the handling of the error, like exiting the program with
    // an error message
} else {
    // No error
    num = conv;    
    printf("%d\n", num);
}
   
   printf("Need this %d\n",num);
   for(loop = 0; loop < num; loop++)
      printf("%d ", array[loop]);
      
   return 0;
}
