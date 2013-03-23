#include <stdio.h>
#include <pthread.h>

int main(int argc, char** argv)
{
	int i, n=1;

	for(i=0; i<10; i++){
		printf("Hello, I'm %d.\n", n);
	}
}

