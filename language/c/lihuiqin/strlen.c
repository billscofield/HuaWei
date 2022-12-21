#include <stdio.h>
#include <string.h>

// https://blog.csdn.net/weixin_53082714/article/details/124514745

int main(void)
{
    /*字符数组赋初值*/
    char cArr[] = {'I','L','O','V','E','C'};
    /*字符串赋初值*/
    char sArr[] = "ILOVEC";
    /*用sizeof（）求长度*/
    printf("cArr的长度=%d\n", sizeof(cArr));
    printf("sArr的长度=%d\n", sizeof(sArr));

    //*(cArr+6) = '\0';
    //*(cArr+7) = 'A';
    //*(cArr+8) = 'A';
    /*用strlen（）求长度*/
    printf("cArr的长度=%d\n", strlen(cArr));
    printf("sArr的长度=%d\n", strlen(sArr));
    /*用printf的%s打印内容*/
    printf("cArr的内容=%s\n", cArr);
    printf("sArr的内容=%s\n", sArr);
    return 0;
}
