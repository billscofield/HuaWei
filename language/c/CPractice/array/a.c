/*    Author:	Bill Scofield 
 *    Ctime:	2021-04-09
 *    Description:	
 */

#include <stdio.h>
#include <stdlib.h>

#define M   3

int main(void){

    int arr[M] = {1,2,3};

#if 0
    for (int i = 0; i<M; i++){
        //printf("%p -- > %d\n",&arr[i],arr[i]);
        scanf("%d",&arr[i]);
    }

    for (int i = 0; i<M; i++){
        printf("%p -- > %d\n",&arr[i],arr[i]);
    }
#endif



    printf("a[1] = %d",*(arr+1));
    exit(0);
}
