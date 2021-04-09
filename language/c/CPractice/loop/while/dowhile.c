/*    Author:	Bill Scofield 
 *    Ctime:	2021-04-09
 *    Description:	
 */

#include <stdio.h>
#include <stdlib.h>

int main(void){
    int i = 1;
    int sum = 0;

    do{
        sum += i;
        i++;
    }while(i<101);

    printf("sum is %d\n",sum);
    exit(0);
}
