/*    Author:	Bill Scofield 
 *    Ctime:	2021-04-09
 *    Description:	
 */

#include <stdio.h>
#include <stdlib.h>

int main(void){

    int sum;

    for(int i=0 ; i < 11 ; i++ ){
        sum += i;
    }

    printf("sum is %d\n",sum);
}
