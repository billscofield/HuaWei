/*    Author:	Bill Scofield 
 *    Ctime:	2021-04-09
 *    Description:	
 *    进制转换
 */


#include <stdio.h>
#include <stdlib.h>

static void maopao();

int main(void){

    int num,base;
    int n[100];
    int i = 0;

    printf("Plz input a num: ");
    scanf("%d",&num);

    printf("Plz input base: ");
    scanf("%d",&base);

    
    while(num !=0){
        n[i] = num % base;
        //printf("%d",n[i]);
        num = num / base;
        i++;
    }
    //printf("\n");


    for(i-- ; i>=0; i--){
        if(n[i]>=10){
            printf("%c",n[i]-10+'A');
        }
        else
            printf("%d",n[i]);
    }
    printf("\n");

}


