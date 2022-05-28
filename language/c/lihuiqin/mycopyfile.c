#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>


int main(int argc, char *argv[]){

    if(argc < 3){
        fprintf(stderr,"Usage: \n\t%s <source-file> <dest-file>\n",argv[0]);
        exit(1);
    }

    FILE *fps, *fpd;

    char *source = argv[1];
    char *dest = argv[2];

    fps = fopen(source,"r");
    if(fps == NULL){
        fprintf(stderr,"open %s failed:%s\n",source,strerror(errno));
    }

    fpd = fopen(dest,"w");
    if(fpd == NULL){
        fprintf(stderr,"open %s failed:%s\n",dest,strerror(errno));
        fclose(fps);
    }

    int source_char;

    source_char = fgetc(fps);

    while(source_char != EOF){
        if(source_char == EOF){
            fprintf(stderr,"read %s failed:%s\n",source,strerror(errno));
        }
        fputc(source_char,fpd);
        source_char = fgetc(fps);
    }

    fclose(fps);
    fclose(fpd);

}
