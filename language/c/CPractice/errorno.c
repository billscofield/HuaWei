#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

int main(void){
    FILE *fp;

    fp = fopen("a.txt","r");
    if(fp == NULL){
        fprintf(stderr,"fopen %s\n",strerror(errno));
        exit(1);
    }
    exit(0);

}

