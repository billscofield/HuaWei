/*    Author:	Bill Scofield 
 *    Ctime:	2021-04-09
 *    Description:	
 */


#include <stdio.h>
#include <stdlib.h>

static void maopao();

int main(void){

    int a[] = {5,7,6,8,9,8,2,1,4,3};

    int arrlen = sizeof(a)/sizeof(a[0]);


    int temp;
    for(int i = 0; i< arrlen; i++){
        for(int j = i+1; j<arrlen; j++){
            if(a[i] > a[j]){
                temp = a[i];
                a[i] = a[j];
                a[j] = temp;
            }
        }
    }

    for(int i = 0; i<arrlen; i++){
        printf("%d ",a[i]);
    }

    printf("\n");


    exit(0);
}


