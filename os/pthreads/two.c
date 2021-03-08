#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <pthread.h>
#include <time.h>
#include <stdlib.h>

void* hello(void* arg){
    for(int i=0;i<30;i++){
        printf("hello(%d)\n",rand()%100);
        sleep(1);
    }
}

void* world(void* arg){
    for(int i=0;i<30;i++){
        printf("world(%d)\n",rand()%100);
        sleep(1.5);
    }
}


int main(){

    srand(time(NULL));  // 种子
    pthread_t tid1,tid2;

    pthread_create(&tid1, NULL, hello, NULL);
    pthread_create(&tid2, NULL, world, NULL);

    // 等待指定的县城结束
    pthread_join(tid1, NULL);    // 如同 wait
    pthread_join(tid2, NULL);    // 如同 wait

    printf("In main thread\n");

    return 0;
}



// gcc hellothread.c -o hellothread -pthread        推荐这种
// gcc hellothread.c -o hellothread -l pthread
