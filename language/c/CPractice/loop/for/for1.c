#include <stdio.h>
#include <string.h>

int main(){

    int data[4][4]={
        {1,2,3,4},
        {5,6,7,8},
        {9,10,11,12},
        {13,14,15,16}
    };

    int i=0;
    int j=0;

    for( ; j < 4; j++){
        for( ; i < 4; i++){
            printf("%d\t", data[i][j]);
        }
        i = 0;
        printf("\n");
    }
}
