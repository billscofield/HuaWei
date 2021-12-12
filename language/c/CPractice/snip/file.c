#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

int main(void){

    FILE *fp;

    fp = fopen("word.txt","w+");

    if(fp == NULL){
        fprintf(stderr,"fopen(): %s\n",strerror(errno));
    }

    fprintf(fp,"%s","we are the world 2021");

    exit(0);

}
