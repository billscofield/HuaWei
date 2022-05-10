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
printf("%p\n",p);
printf("%p\n",p+1);

```

printf("%hd\nt")   short     half
printf("%hhd\nt")  char      half half

没有出错的原始是字节序

我们是小端序的，所以没有出错


