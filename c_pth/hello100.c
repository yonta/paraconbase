#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

void *hello(void*);

int main(int argc, char** argv)
{
	pthread_t pt;
	int i;

	for(i=0; i<100; i++){
		pthread_create(&pt, NULL, &hello, (void*) &i);
		sleep(0.1);
	}
	sleep(60);
	return 0;
}

void *hello(void* vp)
{
	char* mess = "Hello\n";
	int *thread_num = (int*)vp;
	int i;

	for(i=0; i<10; i++){
		printf("Hello, I'm thread %d, and I've say %dth.\n",
		       *thread_num, i);
		sleep(0.2);
	}
	return 0;
}

