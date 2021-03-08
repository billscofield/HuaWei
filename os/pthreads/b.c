#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <pthread.h>

void* threadFunc(void* arg){
    sleep(2);
    printf("in NEW thread\n");
}

int main(){
    pthread_t tid;

    // 线程创建函数
    // Thread id address
    // Thread attribute address
    // Thread function address
    // Thread parameters address
    pthread_create(&tid, NULL, threadFunc, NULL);

    // 等待指定的县城结束
    // pthread_join(tid, NULL);    // 如同 wait

    printf("In main thread\n");

    return 0;
}



// gcc hellothread.c -o hellothread -pthread        推荐这种
// gcc hellothread.c -o hellothread -l pthread
