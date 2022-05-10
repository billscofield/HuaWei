http://10.0.5.30:8020/webclient#/dc/inventory/computers/12313/summary

GNU C 库

    linux 内核开发者使用的 C 语言涵盖了 ISO C99 标准和 GNU C 扩展特性， GNU C
    扩展特性包括内联函数，内联汇编,分支声明等。

gcc -I
    -I目录

    -L目录
    -l库名


short, long, long long, unsigned 修饰符

long a = 100L;          因为100是 int 型的
long long a = 400LL;

char 没有规定是不是有符号的

float: 4bytes, 6位精度
    1           8       23
    符号位， 指数位，小数位


## 跨平台

|   让 int = long                       让 int = int
|   typedef long int32_t                typedef int int32_t
|   int32_t 是 long 的别名              int32_t 是 int 的别名
|   
|   A   int 2byte                       B   int 4byte
|       long 4byte                          long 8byte
|   
|   
|               int32_t j;
|               这样在所有平台都是32位了

指针

```
char *p = "abc";
printf("%p\n",p);       a的地址
printf("%p\n",p+1);     b的地址

```

printf("%hd\nt")   short     half
printf("%hhd\nt")  char      half half

没有出错的原始是字节序

我们是小端序的，所以没有出错


空字符串站一个字符


printf 变参函数, 取决于格式化个数



**键盘 -> kernel -> 标准 I/O 缓冲区 -> scanf("%d",&a); -> 放入指定的内存**

    scanf 搬运工，将字符从缓冲区搬到指定的内存

    正确搬走一个值则返回一个1, 搬走两个值则返回一个2

    如果输入的数据非法，搬运工scanf则立刻返回0, 数据没有被搬走

    ```
    int a;
    while(1){
        int ret = scanf("%d",&a);
        
        while(getchar() != '\n')
    }
    ```

    getchar: 不挑剔的搬运工


    ```
    #include <stdio.h>
    #include <stdlib.h>

    int main(int argc, char *argv[]){
        
        int a,b;
        
        while(1){
            int ret = scanf("%d%d",&a,&b);
            
            if(ret == 2){
                if(getchar() != '\n'){
                    printf("error again");
                }else{
                    break;
                }
            }else{
                printf("error, again\n");
                while(getchar() !='\n');
            }
        }
        printf("%d\n%d\n",a,b);
    }

    ```



## 格式化 IO 函数

### 1. printf

1. printf
    fprintf 的一个特例
    fprintf(stdout,xxx)
    fprintf(stderr,xxx)

2. int fprintf(FILE *stream, const char *format, ...);


3. int sprintf(char *str, const char *format, ...);

    输出到某块内存

4. int snprintf(char *str, size_t size, const char *format, ...);

    输出到某块内存

    **安全版本**




```
FILE *fp;       // FILE 结构体

fp = fopen("a.txt","w");    // "w" 只写，1.文件不存在则创建; 2.文件存在则清空内容
int i = 200;
fprintf(fp,"%d",i);         // 200 打印到文件中了
fclose(fp);
```



```
char *p = malloc(32);           // 堆上，会初始化吗？我是打印的全\0
snprintf(p,32,"%c","he");       // 只插入了两个字符h和e
printf("%s\n",p);
```


printf,snprintf ... 都是放的字符，而不是数字

[quotes](https://www.decodejava.com/c-sscanf-and-sprintf-function.htm)

As you may see in the code and its output, we have called the sprintf()
function, which **linearly** reads multiple values by specifying the matching
**format specifier** with their **variable names** and stores each all these
values in a char[] array named target.


### scanf

1. scanf

2. `int fscanf(FILE *stream, const char *format, ...);

```
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
    FILE *fp;
    fp = fopen("hello.txt","r");
    char *a;
    fscanf(fp,"%s",a);              // 从 fp 中读取到 a 中

    printf("%s\n",a);
}

---

char a[100];
fscanf(stdin,"%s",a);
printf("%s\n",a);
```

3. ` int sscanf(const char *str, const char *format, ...);
    
    从内存中读

    ```
    #include <stdio.h>
    #include <stdlib.h>

    int main(int argc, char* argv[]){
        char a[32];
        int i = 10;
        snprintf(a,32,"%d",i);
        
        int b;
        sscanf(a,"%d",&b);
        printf("%d\n",b);
    }

    ```

## 运算符

单目: 单个目标


## 

~   位逻辑反

&   位逻辑与

|   位逻辑或

^   位逻辑异或

    a^b -> c
    b^c -> a
    加密芯片

>>  右移

    13  = 2^3 + 2^2 + 2^0
    x13 = x8    x4    

    2 x 5
        2^2 + 2^0
    10  << 2        -> 1000
            10 << 0 ->   10
                       1010

    **算数右移**, 未规定的补位，为了保证符号不变，补1,0, 看编译器了

<<  左移


x = 100

    100 所在的内存，只能读，不能写，所以是常量


逗号运算符具有最低优先级
逗号表达式的运算顺序是从左到右
**整个逗号表达式的值取决于最右边的表达式的值**


```
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
    int i = 1;

    do{
        printf("%d\n",i);
        i++;
    }
        while(i < 10);
}

```
