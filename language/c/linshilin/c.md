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
    符号位， 小数位，指数位


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

没有出错的原因是字节序

    我们是小端序的，所以没有出错


空字符串占一个字符


printf 变参函数, 取决于格式化个数
    int printf(const char *format, ...);



**键盘 -> kernel -> 标准 I/O 缓冲区 -> scanf("%d",&a); -> 放入指定的内存**

    scanf 搬运工，将字符从缓冲区搬到指定的内存

    正确搬走一个值则返回一个1, 搬走两个值则返回一个2

    如果输入的数据非法，搬运工 scanf 则立刻返回0, 数据没有被搬走

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

```

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
int main(int argc, char* argv[N]){
    int i = 1;

    do{
        printf("%d\n",i);
        i++;
    }
        while(i < 10);
}

```



switch(整型)
    case 常量


## goto

出错处理都是用的 goto

会破坏内存栈空间

    ```


    goto apple;



apple:
    printf("goto apple");
    printf("%d\n",__LINE__);
    ```

    出错处理
    ```
    if(ret == error1){
        goto err1;
    }else if(ret == error2){
        goto err2;
    }else{
        goto errdefault;
    }
    ```

程序出错的时候直接用goto 跳出来，肯能程序已经死掉了

## 数组的理解

**gcc 眼中的数组**

连续存放

int a[2]                // a 是这一块内存的名字


站在 gcc 的视角
    
    int a[3]
        a[3]        第一部分, 3个坑，
        int         第二部分, 这3个坑要放什么类型的数据

    我们把 a 称为存放了整型数据的一维数组

---

    int b[2][3]                                                 // 一个存放了一维数组的一维数组
        b[2]        第一部分, 两个坑
        int [3]     第二部分, 上边两个坑的数据类型是 int [3]     一维数组
        

    放了一个一维数组的一维数组, 数组都是一维的，没有二维等等, 简称二维数组

    金字塔最下一层，第二层，直到金字塔顶，看一共有多少层
    上下两层都是笛卡尔积

    我们把 b 称为存放了一维数组的一维数组

---


    ```
    char * c[3]         [] 最高优先级, 看到就分配3个坑, c[3]
        c[3]    第一部分
        char *  第二部分, 指针类型

        存放了指针的数组, 
        存放了 char* 指针的数组
        **简称 指针数组**

    char * argv[]
        argv[]          第一部分
        char *          第二部分
    ```
    
    存放 char 型指针的数组



---

    int a[3];

    我们把 a 称为存放了整型数据的数组，简称整型数组

    int a[100] = {[0 ... 49]=11, [50 ... 99]=200};          ... 表示范围，左右必须有空格, switch 也可以用

    switch()
        case 1 ... 10 :


    {1,3,4,5} 叫做初始化列表，必须只能出现在初始化的过程中


### 变长数组

用变量定义数组的长度

说的是定义的时候，数组的数量可以是一个变量，定义完之后，还是不能变的

应用场景

    接收数组的函数

    **变长数组是不可以初始化的**

    ```
    int i;
    scanf("%d",&i);

    int a[i] = {1,2,3};
    ```

    **i 是一个局部变量，运行的时候才会分配内存，而***初始化是在编译的时候就确定了***, 所以变长数组是不能初始化的**

    **不能初始化，不是说不能赋值**
    **初始化和赋值是不一样的**

    ```
    int i;
    scanf("%d",&i);
    int a[i];

    a[0] = 1;
    a[1] = 2;
    a[2] = 3;
    ```

### 柔性数组(0长数组)

int a[0];

一般是放在结构体的尾部

A,B 两方通信，一些信息是固定的，如 ip, 一些是不固定的，如"聊天的内容"

    固定的:   ip port
    非固定的: 聊天内容 msg[0]

    都是放在结构体中

    struct node{
        固定的，比如说50 bytes
        char msg[0] 不固定的
    }

        p->malloc(50+n),   // 50 用来存放固定数据, 后边还有n个字节方说的话
                           // 唯一的可以内存越界的情况, 这部分内存还是结构体的

```
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct node{
    int a;
    float b;
    char c;
    char msg[0];
};

int main(int argc, char* argv[]){

    char buf[100];
    fgets(buf,100,stdin);

    struct node *p = malloc(sizeof(struct node)+strlen(buf)+1);

    p->a = 100;
    p->b = 3.1;
    p->c = 'w';

    strncpy(p->msg,buf,strlen(buf)+1);

    printf("struct size solid: %ld\n",sizeof(*p));   // sizeof(*p) 就是固定的大小,
    printf("struct size variable: %ld\n",sizeof(struct node)+strlen(buf)+1);
    printf("msg: %s",p->msg);
}

```


### 字符串和字符数组

char a[5] = {'a','b','c','\0'};
char b[5] = {"abc"};                // 
char c[5] = "abc";                  // "abc" 是一个常量，在常量区, 常量区到栈空间

**数组是不可以直接赋值的, 要么初始化的时候，要么一个个赋值**
    a = "hello";        // wrong


任意数组名都是首元素的地址，**&数组名**是整个数组的地址

**任何数组都被视为一个指向其首元素的指针(sizeof 除外)**


"abc"  是一个**匿名数组**, **"abc" 可以看作数组名**
    b的地址: "abc" + 1
    b的值  : "abc"[1]


strlen(xxx)

strcpy(s1,s2)       将s2 拷贝到 s1
strncpy(s1,s2,5)

strcat(s1,s2)
strncat(s1,s2,5)



## 指针

    ```
    int *p;

    *p 要放一个 int 类型的地址


    int **q;

    *q
    和数组一样，* 是个**指针标记**, 要放一个(int *)地址到 q 里边

    一个什么样的地址呢? 
    int *   的地址



    一个变量的类型：在定义的位置，把变量本身去掉，就是他的类型

        int *p  的类型就是 int *



    float f[5] = {1,2,3,4,5};
    float f   [5] = {1,2,3,4,5};
    float (*p) [5];                     // **必须要有小括号**
    p = &f;                             // 指向的是整个 f[5]

    f[2] = 20;
    (*p)[2] = 20;

    ---
    float f[5] = {1,2,3,4,5};
    float *p = f;
    f[1];
    ```

### 函数指针(存放函数的指针)

```
int sump(int a, float b);
int (*p) (int a, flaot b);              // 和数组一样
p = &sump;

sump(1,2);
(*p)(1,2);
```


### 二级指针

```
int sump(int a, int b);
int (*p) (int a, int b);

p = &sump;
// p 的类型是int (*) (int a, int b);


int (*(*p2)) (int a, int b);
p2 = &p;

(* p   )(1,2)
(*(*p2))(1,2)

```

由内而外, 内部指向外部
    int *p;     p 指向 int 的地址
    int **p;    p 只想 int* 的地址



**堆内存是没有名字的，唯一的途径就是通过指针**


指针运算， 有单位的, n个相同的对象

+ 向高地址走
- 向低地址走

指针相加没有意义


**数组运算都会转为指针运算**


### void 指针

类型未确定的地址

void  可以赋值给任何类型

` double *p = malloc(20 * sizeof(double));



### 空指针

就是0地址

int *p = NULL;      // NULL 宏
int *p = 0;         // 

int *a = {1,2,3};   // 这样不行, why???, 直接这么样用，应该是一个块, 而不是数组，但是 "xsb" 这肯定是个数组


Linux 规定 0地址 - 0x08048000 (32bit)不可访问，没有任何敏感数据


### 数组和指针的转换 + 多维数组

数组没有运算操作，那把数组当作指针

**任何数组都被视为一个指向其首元素的指针(sizeof 除外)**

    ```
    int a[5] = {1,2,3,4,5};

    int *p = a;

    printf("%ld\n",sizeof(a));          // 20
    printf("%ld\n",sizeof(p));          // 4   指针就是指针

    其他都是一样的
    ```


### const

最不名副其实的关键字

const int a;        // 只读的变量
int const b;

```
char c = 'w';


1. 使得不能通过p 来修该其目标

const char *p = &c;         // const 就是来修饰 char 的
char const *p = &c;         // const 就是来修饰 char 的



const 修饰的是中间的箭头, **不能通过 p 来修改 c**

+------+            +-----+
|0xaaaa|----------->| 'w' |
+------+            +-----+
    p                  c



2. 使得 p 本身不能被修改

char *const p = &c;         // const 修饰 p 的

+-------------+
|   +------+  |         +-----+
|   |0xaaaa|--|-------->| 'w' |
|   +------+  |         +-----+
|       p     |            c
|             |
+-------------+
    const
```



### main 函数原型

```
#include <stdio.h>

int main(int argc, char *argv[]){

    pirntf("argc: %d\n",argc);

    printf("argv[0]: %s\n",argv[0]);
    printf("argv[1]: %s\n",argv[1]);
}


readelf -S a.out

1. 阶段1

    .init 段 会定义一个数组，程序名，参数1，参数2，..., NULL

    char * argv[] = {"ming ,","参数1", "参数2", ..., NULL}

2. 阶段2

    调用 main 函数


```


### 作用域 链接类型 存储期(生命周期)

1. 作用域(scope)
    
    1. 代码快作用域(局部变量)

    ```
    { int a = 10; }

    从定义开始到代码块结束

    从定义处开始到结束，叫潜在作用域

    {
        int a = 10;
        {
            int a = 20;
        }
    }
    ```

    2. 文件作用域(全局变量,在其它文件中也可见)

    3. 函数原型作用域
        
        int sump(int size, int weight); // 函数的声明,  仅仅作用于这一行
    
    4. 函数作用域

        goto 标签, 在函数内有效


2. 链接类型

    1. 外部链接

        .o  ->  链接  ->  elf

        ```
        main.c

        #include <stdio.h>

        extern int var;                 // 外面定义的，你放心用吧

        int main(int argc, char* argv[]){
            printf("%d\n",var);
        }
        ---
        a.c
        
        int var = 100;
        
        
        gcc main.c a.c 
        ```
        
        变量，函数 都可以
        
        静态数据,程序退出才会清空， 优先使用局部变量，堆内存

    2. 内部链接类型(仅仅本文件可见)
     
        1. 隐藏
        
        2. 防止冲突
```
static int var=2;
static ivoid say(void){;}
```

    3. 无链接类型
        
        运行时才确定的变量(局部变量)
        
        连接时就要确定地址，还没有运行，就已经存在了

    函数都是静态的
    变量可以使静态的也可以是动态的

    少用静态数据，程序结束才可以回收


3. 存储期(生命周期)

    什么时候分配的内存，什么时候回收的内存

    1. 自动存储期,被存放在栈上

    ```
    
    ```

    2. 静态存储期，被存放在**数据段中**

        全局变量, 加不加 static 都是静态数据，放在数据段
        
        static 局部变量

    3. 动态存储期，被存放在堆中

        malloc(20)
        free();



### 进程内存布局详细剖析

```
#include <stdio.h>
#include <stdlib.h>

int global1 = 30;   // .data 数据段
int global2;        // .bss 数据段

int main(int argc, char * argv[]){          // .text 正文段

    int a = 100;            // 栈
    int *p = malloc(20);    // 堆
    
    printf("hello");        // 标准 IO 缓冲区
    sleep(1);
    fflush(stdout);

    return 0;

}


nm - list symbols from object files

readelf -S a.out

|                                                                           +---------------------------------
|                                                                           |   运行时栈
|                                                                           |- - - - - - - - - - - - - ------
|                                                                           |       |
|                                                                           |      \|/
|                                                                           |
|                                                                           |
|                                                                           |      /|\
|                                                                           |       |
|                                                                           |- - - - - - - - - - - - - -----
|                                                                           |   运行时堆
|                                                                           |
|                                                                           |
|       .bss(Block Started by Symbol)                                                                |
|
|           BSS段属于静态内存分配
|
|           该段用于存储未初始化的全局变量或者是默认初始化为0的全局变量，
|           它不占用程序文件的大小，可是占用程序执行时的内存空间。
|
|           自动生成的                                                      |
|                                                                           |
|           未初始化的静态数据                                              |
|               全局变量                                                    |
|               static修饰的局部变量                                        |
|                                                                           |
|               静态数据没有初始化的情况下，会被自动初始化为零              |
|               char a[1000];                                               |
|                                                                           |
|       ---
|       
|       4. .data                                                                程序运行时，1234 拷贝到内存
|           已初始化的静态数据
|           
|           用于存储初始化的全局变量，初始化为0的全局变量出于编译优化的策略还是被保存在BSS段
|               全局变量
|               static修饰的局部变量
|       
|       3. .rodata
|           常量区
|           该段也叫常量区，用于存放常量数据，ro就是Read Only之意
|       
|       2. .text
|           正文段，我们写的程序
|       
|       1. .init
|           启动代码，每个程序都一样的
|           传递环境变量等给我们的程序
|       


```





对于函数  exter 可写可不写
对于变量，一定要写


## static

static 全局变量
    本文件私有

static 函数
    本文件私有



## 模块化编程

为什么不把 main 放在最下边

永远不能返回形参，局部变量的地址

argument, parameter



函数也有类型


## 变参的实现原理

使用的场合不是很多

了解栈是如何管理的

f(float f, short s, int a, char c);

    从右边开始入栈



+-------+   栈底
|       |   c = 'w' 分4个字节
|       |   a = 4   分4个字节
|       |   s = 8   分4个字节
|       |   f = 1.0 分8个字节
|       |
|       |   long double 是12个字节
+-------+   栈顶


第一个参数必须是确定的, 


f("...", ...)

+-------+   栈底
|  b    |   x1  <-------+
|  c    |   x2  <----+  |
|%d%f   |   "%d%f"---+--+
|       |            d  f       指针回溯
|       |
|       |
+-------+   栈顶


```实现自己的变参函数
#include <stdio.h>
#include <stdarg.h>

double sumup(char const *format, ...);

int main(void){
    int     i = 100;
    char    c = 'a';
    short   s = 88;
    float   f = 1.1;

    double answer = sumup("#i#c#s#f",i,c,s,f);
    printf("answer : %lf\n",answer);

}

sumup(char const *format, ...){

    va_list p;
    va_start(p,format);         // 将指针指向第一个参数, 进行回溯

    char args[10];              // "icsf"
    int i, arg_num = 0;         // arg_num 参数个数

    for(i = 0; format[i]!='\0';i++){
        if(format[i] =='#'){
            args[arg_num] = format[++i];
            arg_num++;
        }
    }

    double ans = 0;

    int arg_int;
    double arg_double;

    for(i=0; i<arg_num; i++){
        switch(args[i]){
            case 'i':
            case 'c':
            case 's':
                arg_int = va_arg(p,int);      // 告诉是个整型, p 回溯一次
                ans += arg_int;
                break;
            case 'f':
                arg_double = va_arg(p,double);
                ans += arg_double;
                break;
            default:
                printf("format error\n");
                
        }
    }

    va_end(p);

    return ans;
}

```



## static 函数

1. 静态局部变量, 修改存储期
2. 全局变量， 变为内部链接
3. 函数， 变为内部链接函数


### inline 函数(cpp中的概念)

http://c.biancheng.net/view/2201.html

CPU 在执行主调函数代码时如果遇到了被调函数，主调函数就会暂停，CPU 转而执行
被调函数的代码；被调函数执行完毕后再返回到主调函数，主调函数根据刚才的状态
继续往下执行。

一个 C/C++ 程序的执行过程可以认为是多个函数之间的相互调用过程，它们形成了一
个或简单或复杂的调用链条，这个链条的起点是 main()，终点也是 main()。当
main() 调用完了所有的函数，它会返回一个值（例如return 0;）来结束自己的生命，
从而结束整个程序。

**函数调用是有时间和空间开销的。**程序在执行一个函数之前需要做一些准备工作，
要将实参、局部变量、返回地址以及若干寄存器都压入栈中，然后才能执行函数体中
的代码；函数体中的代码执行完毕后还要清理现场，将之前压入栈中的数据都出栈，
才能接着执行函数调用位置以后的代码。

如果函数体代码比较多，需要较长的执行时间，那么函数调用机制占用的时间可以忽
略；如果函数只有一两条语句，那么大部分的时间都会花费在函数调用机制上，这种
时间开销就就不容忽视。

**为了消除函数调用的时空开销**，C++ 提供一种提高效率的方法，即在编译时将函
数调用处用函数体替换，类似于C语言中的宏展开。这种在函数调用处直接嵌入函数体
的函数称为内联函数（Inline Function），又称内嵌函数或者内置函数。

使用内联函数的缺点也是非常明显的，编译后的程序会存在多份相同的函数拷贝，如
果被声明为内联函数的函数体非常大，那么编译后的程序体积也将会变得很大，所以
再次强调，一般只将那些短小的、频繁调用的函数声明为内联函数。


在C++中， 为了解决一些频繁调用的小涵数大量消耗栈空间或者是叫栈内存的问题，
特别的引入了inline修饰符，表示为内联涵数。

```
inline void f3(void)
{
    printf("f3\n");
}

编译为二进制后直接插到调用处，和宏类似
inline 是 static 的
```

通常是将 inline 函数写在头文件中，用的时候 include , 因为是 static 的，只在
本文件中生效，不会引起多个文件的冲突

```
myhead.h
inline hello(void){
    printf("hello\n");
}

file1:
#include <stdio.h>
#include "myhead.h"

int main(void){
    hello();
}
```

1. 经常被调用
2. 尺寸比较小
    如果函数体内的代码比较长，使用内联将导致内存消耗代价较高

内联是以代码膨胀(复制)为代价，仅仅省去了函数调用的开销，从而提高函数的执行
效率。如果执行函数体内代码的时间，相比于函数调用的开销较大，那么效率的收获
会很少。


### 回调函数

man signal


## 递归的基本概念 递归函数 递归实例

1. 递归的基本概念
    
    解决问题的方法包含这这个问题，只是规模减小了


2. 递归函数


3. 递归实例


## 复杂声明

man signal
    Linux Programmer's Manual

man posix signal
    POSIX Programmer's Manual

man 3 posix signal
    centos 7 上成功

```
void (*signal(int sig, void (*func)(int)))(int);

1. 从左到右，找到第一个非关键字标识符, 本例是 signal

2. 括号优先级比 * 更高, 
    signal(int sig, void (*func)(int))      // signal 就是一个函数
    外边的就是返回值
        void (*)(int);

    void(* ( (*a) [3]))(int b);
             (*a)[3]
    void (*)(int b);

    3个指向函数的指针
```


```
void (*signal(int sig, void (*func)(int)))(int);

typedef void (*)(int) xxx;           // type 真 假(别名)


```


```
typedef int A[5];                   // typedef int[5] A
A b;                                // int b[5]


typedef void (*sighandle_t)(int);
sighandle_t p;                      // void (*p)(int);
```



## 复合数据类型基本概念 结构体入门 结构体语法

## 联合体的基本语法 枚举的概念 地址对齐的基本概念

```
联合体,共用体

表达的概念是互斥的, 只能有一个

union node              // 不能包含函数
{
    char a;
    int i;
    float f;

};

一般是放在结构体里边用

struct student
{
    int age;
    float score;
    char *name;

    union text
    {
        char a;
        int i;
        float f;
    }mytext;

};


int mian(void){
    struct student jack;
    jack.age = 20;
    jack.mytext.a = 'w';
}
```


### 地址对齐

结构体

对于 32bit CPU, 内存的最小单位是4字节的，



### 枚举

常量的3种使用方法

    1. 枚举
    2. 宏
    3. 直接使用

有限范围的整型

enum spectrum{ red, orange, yellow, green };     // 枚举常量列表{0,1,2,3}

enum spectrum color;                             // 在 c 中和 int color; 几乎一样, c++ 中是你想要的


```
enum { red, orange, yellow, green };     // 枚举常量列表{0,1,2,3}

#define red 0
#define orange 1
```



## 结构体的尺寸和成员布局 attribute 机制入门

也会导致移植性的问题

struct node
{
    char a;
    int b;
    short c;
};

printf("%d\n",sizeof(struct node));     // 

&a = 1 x N                              // a 的地址是 1 的整数倍
&b = 4 x N                              // 4 的整数倍，起始地址
&c = 2 x N                              // 起始地址是 2 的整数倍

一个结构体的 N 倍呢? 成员的最大值

a 是结构体的第一个成员，是结构体的地址，则必须是4的倍数
b 
c 

起始地址 和 大小

换一下成员的顺序，可能就会改变结构体的大小


## 宏

1. 被频繁调用
2. 足够小

```
#define MAX(a,b) (a)>(b)?(a):(b)

1. a, b 都是表达式，不是变量


1. define 必须写在一行或者一个逻辑行
2. {}复合语句是不能出现在赋值表达式右边的， = 右边必须是一个有值的表达式, ({}) 加一个括号称之为"语句表达式"

#define MAX(a,b) \
{ \
    int _a = a; \
    int _b = b; \
    (_a)>(_b)?(_a):(_b) \
}


#define MAX(a,b) \
{ \
    typeof(a)_a = a; \
    typeof(b)_b = b; \
    (void)(&_a == &_b)  \           // 如果a b 类型不同,???
    (_a)>(_b)?(_a):(_b) \
}


---

#define MACRO(data,i) \
        printf("%d\n",data##i)              // ## 粘帖

int data1 = 100;
int data2 = 200;

MACRO(data,1);                              // data1
MACRO(data,2);                              // data2
```


## 条件编译 头文件编写规范

```
1. 

#if 宏定义

#endif


#if A-100       还可以计算

#endif

---

2. 

#ifdef B

#endif

调试程序用，gcc -D 可以定义宏
#ifdef DEBUG
    printf("%d\n",__LINE__);
#endif

gcc a.c -o a.out -DDEBUG



#ifndef B    有没有定义 B 这个宏，有没有值无所谓

#endif

头文件格式
```

内核源码，有很多网卡芯片，比如要作内核裁剪，一般型号是这样的



头文件

```
#ifndef 1. 头文件变成大写; 2. 点变成下划线; 3.前面加下划线
#endif


<FILE:head.h>
#ifndef _HEAD_H
#define _HEAD_H

#include <stdio.h>

void f1();

struct node{
    int a;
};

#endif
```


### C工程文件组织 头文件

宏定义
函数声明
静态函数定义        如果不是静态函数， 两个源文件都用到这个函数，结合的时候就会重复定义
内联函数
全局变量的声明
    extern int global1;
结构体定义
联合体定义
枚举列表
    enum {..}
include


库文件
    .o 生成 静态库，动态库

    gcc a.c -o a.o -c

    动态库
        
        1. gcc -shared -fPIC -o libxx.so a.o
        2. gcc -shared -fPIC -o libxx.so a.o b.o
        3. gcc -shared -fPIC -o libxx.so *.o

    静态库
        
        ar rcs libxxx.a a.o
        ar rcs libxxx.a *.o
