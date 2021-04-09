/*    Author:	Bill Scofield 
 *    Ctime:	2021-04-09
 *    Description:	
 */


#include <stdio.h>
#include <stdlib.h>

void fibonacci();


int main(void){

    //fibonacci数列
    fibonacci();


    exit(0);
}



void fibonacci(){
    //前10项

    int i;
    int fib[10] = {1,1};

    int fiblen = sizeof(fib)/sizeof(fib[0]);

    for(i = 2 ; i < fiblen ; i++){
        fib[i] = fib[i-2] + fib[i-1];
    }

    for(i=0; i < fiblen; i++){
        printf("%d ",fib[i]);
    }

    printf("\n");


    //逆序存储, 只要首尾元素互换位置即可，不用重新定义一个数组
    i = 0;
    int j = fiblen - 1;
    int temp;
    while(i<j){
        temp = fib[i];
        fib[i] = fib[j];
        fib[j] = temp;

        i++;
        j--;
    }

    for(i=0; i < fiblen; i++){
        printf("%d ",fib[i]);
    }

    printf("\n");
}
