/*    Author:	Bill Scofield 
 *    Ctime:	2021-04-09
 *    Description:	
 */

#include <stdio.h>
#include <stdlib.h>

int main(void){
    int i = 0;
    int sum = 0;

    loop:{
        sum += i;
        i++;
    }


    if(i < 11){
        goto loop;
    }

    printf("%d\n",sum);

    exit(0);
}
