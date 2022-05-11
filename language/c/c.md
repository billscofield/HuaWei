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

    **i 是一个局部变量，运行的时候才会分配内存，而初始化是在编译的时候就确定了, 所以变长数组是不能初始化的**

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

数组是不可以直接赋值的, 要么初始化的时候，要么一个个赋值
    a = "hello";        // wrong


任意数组名都是首元素的地址，**&数组名**是整个数组的地址


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
    和数组一样，* 是个指针标记, 要放一个地址到 q 里边

    一个什么样的地址呢? 
    int *   的地址



    一个变量的类型：在定义的位置，把变量本身去掉，就是他的类型

        int *p  的类型就是 int *



    float f[5] = {1,2,3,4,5};
    float f   [5] = {1,2,3,4,5};
    float *p [5];
    p = &f;                             // 指向的是整个 f[5]

    f[2] = 20;
    (*p)[2] = 20;

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

有内而外, 内部指向外部
    int *p;     p 指向 int 的地址
    int **p;    p 只想 int* 的地址



堆内存是没有名字的，唯一的途径就是通过指针



指针运算， 有单位的, n个相同的对象

+ 向高地址走
- 向低地址走

指针相加没有意义


数组运算都会转为指针运算



### void 指针

类型未确定的地址

void  可以赋值给任何类型

` double *p = malloc(20 * sizeof(double));



### 空指针

就是0地址

int *p = NULL;      // NULL 宏
int *p = 0;         // 


Linux 规定 0地址 - 0x0848000 不可访问，没有任何敏感数据


### 数组和指针的转换 + 多维数组

数组没有运算，那把数组当作指针

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


### 作用域 链接类型 存储期

1. 作用域(scope)
    
    1. 代码快作用域(局部变量)

    ```
    { int a = 10; }

    从定义开始到代码块结束


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



3. 存储期

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


readelf -S a.out

                                                                    +---------------------------------
                                                                    |   运行时栈
                                                                    |- - - - - - - - - - - - - ------
                                                                    |       |
                                                                    |      \|/
                                                                    |
                                                                    |
                                                                    |      /|\
                                                                    |       |
                                                                    |- - - - - - - - - - - - - -----
                                                                    |   运行时堆
                                                                    |
                                                                    |
.bss                                                                |
    自动生成的                                                      |
                                                                    |
    未初始化的静态数据                                              |
        全局变量                                                    |
        static修饰的局部变量                                        |
                                                                    |
        静态数据没有初始化的情况下，会被自动初始化为零              |
        char a[1000];                                               |
                                                                    |
---

4. .data                                                                程序运行时，1234 拷贝到内存
    已初始化的静态数据
        全局变量
        static修饰的局部变量

3. .rodata
    常量区

2. .text
    正文段，我们写的程序

1. .init
    启动代码，每个程序都一样的
    传递环境变量等给我们的程序



```





对于函数  exter 可写可不写
对于变量，一定要写
