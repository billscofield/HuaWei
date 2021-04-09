/*    Author:	Bill Scofield 
 *    Ctime:	2021-04-09
 *    Description:	
 */

#include <stdio.h>
#include <stdlib.h>

int main(void){
    int start,
        end = 10,
        sum = 0;

    printf("Plz input start number:\t");
    scanf("%d",&start);
    do{
        sum += start;
        start++;
    }while(start<end);


    printf("sum is %d\n",sum);
}
