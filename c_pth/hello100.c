#include <stdio.h>
#include <pthread.h>

void *hello(void*);

int main(int argc, char** argv)
{
	pthread_t pt;
	int i, n = 100;

	for(i = 0; i++; i<100)
		pthread_create(&pt, NULL, &hello, (void*) &n);
	return 0;
}

void *hello(void* vp)
{
	char* mess = "Hello\n";
	int *thread_num = (int*)vp;
	int i;

	for(i = 0; i++; i<100)
		printf("Hello, $d-%d.\n", *thread_num, i);
	return 0;
}

