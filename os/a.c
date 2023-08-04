#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(int argc, char const *argv[]){
    pid_t pid;
    pid_t cid;

    //printf("Before fork Process id: %d\n", getpid());

    cid = fork();

    if(cid == 0){ // child process
        //printf("Child process id is %d (parent id is %d)\n",getpid(),getppid());
        printf("sub\n");
        sleep(5);
    }else{
        printf("This is Parent process, parent id is %d\n",getpid());
        //printf("father\n");
        wait(NULL);
    }

    //printf("After fork Process id: %d\n", cid);
    //pause();

    return 0;

}
