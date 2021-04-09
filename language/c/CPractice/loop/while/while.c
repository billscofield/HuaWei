/*    Author:	Bill Scofield 
 *    Ctime:	2021-04-09
 *    Description:	
 */

#include <stdio.h>
#include <stdlib.h>

int main(void){
    int i = 1;
    int sum = 0;
    while(i<101){
        sum += i;
        i++;
    }
    printf("sum is %d",sum);
    exit(0);
}
