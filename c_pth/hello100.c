#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

void *hello(void*);

int main(int argc, char** argv)
{
	int n = 50;
	pthread_t (*pt)[n];
	int i;

	for(i=0; i<n; i++){
/*
int  pthread_create(pthread_t  *  thread,
                    pthread_attr_t * attr,
                    void * (*start_routine)(void *),
                    void * arg);
 */
		pthread_create(pt[i], NULL, &hello, (void*) &i);
		sleep(1);
	}
	sleep(60);
	return 0;
}

void *hello(void* vp)
{
	int *thread_num = (int*)vp;
	volatile int i;

	for(i=0; i<10; i++){
		/* TODO: flash printf */
		printf("Hello, I'm thread %d, and I've say %dth.\n",
		       *thread_num,
		       i);
		sleep(2);
	}
}

