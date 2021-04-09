/*    Author:	Bill Scofield 
 *    Ctime:	2021-04-09
 *    Description:	
 */


#include <stdio.h>
#include <stdlib.h>

static void maopao();

int main(void){

    maopao();

    exit(0);
}


static void maopao(void){

    int a[] = {5,7,6,8,9,0,2,1,4,3};

    int arrlen = sizeof(a)/sizeof(a[0]);

    int temp;

    for(int i=0; i < arrlen; i++){
        for(int j = 0; j < arrlen - 1 -i; j++){
            if(a[j] > a[j+1]){
                temp = a[j];
                a[j] = a[j+1];
                a[j+1] = temp;
            }
        }

    }

    for(int i = 0; i<arrlen; i++){
        printf("%d ",a[i]);
    }

    printf("\n");
}
