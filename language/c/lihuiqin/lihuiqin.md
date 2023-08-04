[link](https://www.bilibili.com/video/BV18p4y167Md)

## stdlib.h

    > #include <stdlib.h>   -> exit(0); 代替 return 0;   man 3 exit

    exit(0) 结束当前进程

    malloc()

    > #include <stdbool.h>
        false
        true

vim 中 ctrl p  自动补全

shift k : man 手册帮助

``` 注释0
#if 0

#endif
```

预处理
    gcc -E a.c >a.i
    处理所有注释行
编译
    gcc -S a.i -o a.s
汇编
    gcc -c a.s -o a.o
链接
    gcc a.c -o a.out


gcc -Wall


```
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

int main(void){
    FILE *fp;
    fp = fopen("tmp","r");
    if(fp == NULL){
        #int fprintf(FILE *stream, const char *format, ...);
        fprintf(stderr, "fopen():%s\n",strerror(errno));
    }
    puts("ok");
    exit(0);
}
```


算法: 流程图, NS图, 有限状态机FSM

防止写越界，防止内存泄漏

    int main(int argc, char **argv)
    void main(int argc, char **argv)


浮点数与0的比较
    if(fabs(f-0) < 1e-6)
        return 0


不同形式的零
    0
    '0'
    "0"
    '\0'

## math.h

gcc -c a.c -o a.o
gcc a.o -lm



WORD(双字节)    2字节
DWORD           4字节


## int

char            1
    **没有规定是有符号还是无符号的**
short           2
int             4
long            4
long long       8


unsigned

0
'0'
"0"
'\0'


## 可移植数据类型

float           4Byte, 默认6位小数, 准确能保证的是6位
double          8, 默认6位小数
long doulbe     12?


## 常量

整型常量
实型常量
字符常量
字符串常量
标识常量
    > #define

'\d' 八进制数
'\dd' 八进制数
'\ddd' 八进制数
'\xhh' 十六进制数   是一个字符常量

```
\x表示十六进制转义，'\xe0' 是一个字符，这个字符的值 = 0xE0 = 11100000，将其
赋值给 int c 的时候，会从1字节扩展到4字节，由于符号位（最高位）为1，那么扩展过
程中，高位全部填1，所以 c 的内存数据就被扩展成了 0xFFFFFFE0，0xFFFFFFE0 这是一
个补码，可以算出它的原码是0x80000020，转换为10进制，它的值是 -32,所以会输出 -32。
```

%hd     有符号short
%hu     无符号short
%ld     有符号long

## 带参数的宏

```
#define MAX(a,b)    (a > b ? a : b)

int a = 1, b = 2;
printf("%d\n",MAX(a,b))

MAX(i++,j++)

---

#define MAX(a,b)    ((a) > (b) ? (a) : (b))          // this is right

    比较 i++, 和 j++, 


#define MAX(a,b)    ({int A=a, B=b; ((A) > (B) ? (A) : (B));})

#define MAX(a,b)    ({typeof(a) A=a, B=b; ((A) > (B) ? (A) : (B));})

注意，重点:
max = ((a++) > (b++) ? (a++) : (b++));
        a++      b++           返回 b, 然后b++

#define MAX(a,b) ({int x = a; int y = b; ( (x) > (y) ? (x) : (y) );})
                           分号       分号(定义域)                  分号, 必须有小括号, 封闭整个宏定义，任何跟随宏扩展的分号都将被视为表达式的一部分而不是单独的语句

```

The code block is enclosed in parentheses and braces, which ensures that the
entire block of code is evaluated as a single expression. 

The braces also provide a scoping mechanism for the local variables A and B,
ensuring that they are only visible within the code block and do not interfere
with any other variables named A or B that may be defined elsewhere in the
program.


    #define MAX(a,b) {int A=a, B=b; ((A) > (B) ? (A):(B));}

The round brackets enclosing the entire expression are necessary because they
group the entire macro definition into a single expression, allowing the
expression to be evaluated correctly in all contexts.


---

Here's an example of what can happen if the entire macro definition is not enclosed in round brackets:

```
#include <stdio.h>

#define MAX(a,b) int A=a, B=b; ((A) > (B) ? (A):(B))

int main() {
    int a = 10;
    int b = 20;
    int c = 0;

    c = MAX(a, b);
    printf("The maximum value is %d\n", c);
    return 0;
}
```

In this example, the macro definition for `MAX` does not have the entire
expression enclosed in round brackets. As a result, the line `c = MAX(a, b);`
expands to:

    c = int A=a, B=b; ((A) > (B) ? (A):(B));;

This is because the semicolon after `((A) > (B) ? (A):(B))` is treated as a
separate statement, rather than as part of the expression. As a result, the
code will fail to compile with the following error:

    error: lvalue required as left operand of assignment

This is because the line `c = int A=a, B=b; ((A) > (B) ? (A):(B));;` is not a
valid expression, and the compiler is unable to determine the correct behavior.

In summary, failing to enclose the entire macro definition in round brackets
can lead to errors in the expanded code, and can cause the code to fail to
compile or to behave unexpectedly.


Here's an example of how the corrected macro definition for MAX would behave:

```
#include <stdio.h>

#define MAX(a,b) ({int A=a, B=b; ((A) > (B) ? (A):(B));})

int main() {
    int a = 10;
    int b = 20;
    int c = 0;

    c = MAX(a, b);
    printf("The maximum value is %d\n", c);
    return 0;
}
```

In this example, the macro definition for `MAX` has been corrected by enclosing
the entire expression in round brackets. The line `c = MAX(a, b);` correctly
expands to:

    c = ({int A=a, B=b; ((A) > (B) ? (A):(B));});

When this code is compiled and run, it correctly calculates the maximum value
of `a` and `b` and assigns it to `c`. The output of this program is:

    The maximum value is 20

In summary, enclosing the entire macro definition in round brackets produces
the correct expansion of the macro and allows the code to be compiled and
executed without errors.

---

## 变量

[存储类型] 数据类型 标识符 = value

    存储类型    type     name   = value

    1. auto
        默认，自动分配空间，自动回收空间
        应该不会初始化
        栈空间

    2. static
        静态型, 自动初始化为**0值**或**空值**, **有继承性**, 
        可修饰函数, 只能在当前文件中使用, 不能放在对外扩展, 不能放在 .h 文件中了
        修饰全局变量,
        类似 private 属性

        ```
        void funct(void)
        {
            static int x = 0;
            x = x+1;
        }
        ```
    3. register
        寄存器类型, 建议型, 还是由 gcc 决定, 
        只能用来定义局部变量, 不能定义全局变量
        数据大小有规定, 只能 32bit
        寄存器没有地址

    4. extern(说明型)
        说明型, 也不能改变被说明的变量的值或类型
        不开辟空间

    5. inline
        建议型关键字, 从 C++ 引入

```
main.c
    int i = 10;
    proj.c.fun()
    printf("%d\n",i);


proj.c
    extern int i;               // 其实可以不用写, 类型都可以不用写
    extern i;                   // 类型都不写, 新标准默认为int型了, 会出错的

    void proj.c.fun(void){
        printf("%d\n",i);
    }

```


生命周期和作用范围

    全局变量和局部变量

    ```
    #include <stdio.h>
    #include <stdlib.h>

    int i = 1000;

    int main(void){
        int i = 100;
        {
            int i = 10;
            printf("%d\n",i);
            exit(0);
        }
    }
    ```

    > __FUNCTION__, __LINE__


man 3 fopen  中最早的 errno(error number) 就是全局变量, 现在不是了

```
|   +----------------------------------------------------------------+
|   |          |    局部变量                   |      外部变量       |
|   +----------+------------------+------------+------------+--------+
|   | 存储类别 | auto | register  | 局部static | 外部static |   外部 |
|   +----------+------------------+------------+------------+--------+
|   | 存储方式 |       动态       |             静态                 |
|   +----------+------------------+----------------------------------+
|   | 存储区   |动态区|  寄存器   |          静态存储区              |
|   +----------+------------------+----------------------------------+
|   | 生存期   |函数调用开始指结束|          静态存储区              |
|   +----------+------------------+----------------------------------+
|   | 作用域   |定义变量的函数或复合语句内     |本文件      |其他文件|
|   +----------+------------------+----------------------------------+
|   | 赋初值   |每次函数调用时    | 编译时赋初值,只赋值一次          |
|   +----------+------------------+----------------------------------+
|   | 未赋初值 |不确定            | 自动赋初值0或空字符              |
|   +----------+------------------+----------------------------------+
```


一般会在全局变量前加上 static 关键字

```
-main.c
//主调用
#include <stdio.h>
#include <stdlib.h>
#include "proj.h"

int i = 100;
int main(void){
    printf("[%s]:i= %d\n",__FUNCTION__,i);
    func();
    exit(0);
}


-proj.c
// 功能实现
#include <stdio.h>
#include <stdlib.h>

int i = 1000;

void func(void){
    printf("[%s}:i = %d\n",__FUNCTION__,i);
    exit(0);
}


-proj.h
// 头文件
#ifndef PROJ_H
#define PROJ_H

void func(void);

#endif
```

the code appears to be functioning as intended to protect against multiple
inclusions of the proj.h header file.


多个文件中有同名的全局变量，编译时导致冲突，解决方法就是加 static

## 表达式和语句

加上分号就是语句

## 运算符

1. %
    两边都必须是整型

2. 逗号运算符

    表达式的值是最后一项的值

3. 位运算

    int a = 0b011;
    >>
        a = a << 1;
    <<
    &
    |
    ^
    ~   取反


    num = num | 1<<n
    num = num & ~(1<<n)

    或1
    与0

    man 2 stat
        st_mode
        16bit
        rwxrwxrw

4. 分量运算符(.  ->)

5. 下标运算
    []

6. sizeof 运算符

7. 强制类型转换

    a = (int)b;

## gcc

gcc 
    -Wall:   all warning

## make


man 2 stat
    struct stat 结构体
        st_mode 权限    

    man 2 inode
        S_IROTH     00004   others have read permission
        S_IWOTH     00002   others have write permission
        S_IXOTH     00001   others have execute permission



## 输入、输出专题

### 句柄:既然内存是分页的，那么页里边的东西大概可以是“句”吧
https://www.zhihu.com/question/22950899

缓冲区
    程序结束
    缓冲区满
    强制刷新缓冲区


### Why scanf must use & and printf doesn't

The & character before the variable name in the scanf() function is used **to
obtain the memory address of the variable**, which is then used to store the
input value entered by the user.

When the variable is passed as an argument to the printf() function, its value
is copied and passed to the function, rather than its memory address. The
printf() function then works with that value directly to display it according
to the specified format string.


the compiler helps bring the variable's value from address to printf, right?

Yes, that is correct. The compiler copies the value of the variable to a
register or stack before passing it to printf(). The printf() function then
works with that value directly to display it according to the specified format
string.



### 标准IO, 文件IO

1. 格式化输入输出函数  printf()    scanf()

    man 3 printf
    scanf("%s")     %s 是危险的, 越界

    d,i         10进制

    b           2进制数
    o           8进制无符号整数(输入不能是负数)
    u           10进制无符号整数(输入不能是负数)
    x,X         16进制无符号整数(输入不能是负数)

    c           单一字符
    s           字符串

    e,E         指数形式浮点小数
    f           小数形式浮点小数
    g           e/f 中较短的一种

    %%          %
    -           左对齐, 默认右对齐
    0           补充0而不是空格
    +           显示正负符号
    #           8进制,16进制显示前导符号, 只能用于二进制，八进制，十六进制
    l           d,o,x,u :       long
    l           e,f,g   :       double

    char a[] = "helloworld";
    printf("%.5s\n",a);

    12 是没有单位的, int, long short等就是单位
    12L/12LL 也是有单位的

    缓冲区
        1. 程序结束
        2. 强制输出缓冲区 \n
        3. 缓冲区满

    scanf("%s",a);         // %s 很危险,不会检查越界

    ```
    #include <stdio.h>
    #include <stdlib.h>

    int main(void){
        int a;
        while(1){
            int res = scanf("%d",&a);
            if(res == 1){
                printf("a is : %d\n",a);            // 没有 if 的判断的话,如果输入a, 会陷入死循环, 希望得到 %d, 但是输入'a', 则持续输入缓冲区中的合法值
            }else{
                break;
            }
        }
            exit(0);
    }
    ```

    详解:

    the scanf function will fail to read it and leave the input buffer in an
    invalid state. This can cause the program to enter an infinite loop where
    it continuously attempts to read the invalid input without giving you a
    chance to input a valid number.

    To handle this situation and prevent the program from getting stuck, you
    can modify the code to clear the invalid input from the buffer before the
    next iteration of the loop. One way to do this is by using a do-while loop
    to discard the invalid input, like this:

    ```
    int i = 0;
    while (1) {
        if (scanf("%d", &i) == 1) {
            printf("%d\n", i);
        } else {
            printf("Invalid input\n");
            // Clear the input buffer
            int c;
            do {
                c = getchar();
            } while (c != '\n' && c != EOF);
            continue;
        }
    }
    ```

    With this modification, if scanf fails to read an integer input, it will
    print "Invalid input" and then clear the input buffer using getchar() until
    a newline character or the end of the file is encountered. This ensures
    that any remaining invalid input is discarded before the next iteration of
    the loop.

    In Linux and Unix systems, the typical key or combination of keys that
    represent EOF for getchar() is Control + D

    In Windows systems, the typical key or combination of keys that represent
    EOF for getchar() is Control + Z.


    **The fflush function is used for flushing the output buffer, not the input
    buffer.**


    scanf 返回不包括 \0
        如果不加，可以是空格回车等
        scanf("%d%f",&a,&b); // 输入完第一个，输入回车，换行等再输入第二个

        %s 很危险，有可能发生越界

        ```
        char a[3];
        int b = 1;
        scanf("%s",&a);
        printf("%s\n",a);
        printf("%d\n",b);
        ```

    buffer 和 cache

    buffer：

        A buffer is something that has yet to be “written” to disk.翻译过来就是：
        buffer就是写入到磁盘。buffer是为了提高内存和硬盘（或其他I/O设备）之间的
        数据交换的速度而设计的。buffer将数据缓冲下来，解决速度慢和快的交接问题；
        速度快的需要通过缓冲区将数据一点一点传给速度慢的区域。例如：从内存中将
        数据往硬盘中写入，并不是直接写入，而是缓冲到一定大小之后刷入硬盘中。

    cache

        A cache is something that has been “read” from the disk and stored for
        later use.翻译过来就是：cache就是从磁盘读取数据然后存起来方便以后使用。
        cache实现数据的重复使用，速度慢的设备需要通过缓存将经常要用到的数据缓存
        起来，缓存下来的数据可以提供高速的传输速度给速度快的设备。例如：将硬盘
        中的数据读取出来放在内存的缓存区中，这样以后再次访问同一个资源，速度会
        快很多。


    buffer和cache的特点

    共性：

        都属于内存，数据都是临时的，一旦关机数据都会丢失。

    差异：(先理解前两点，后两点有兴趣可以了解)

        - buffer是要写入数据；cache是已读取数据。

        - buffer数据丢失会影响数据完整性，源数据不受影响；cache数据丢失不会影响
          数据完整性，但会影响性能。

        - 一般来说cache越大，性能越好，超过一定程度，导致命中率太低之后才会越大
          性能越低。buffer来说，空间越大性能影响不大，够用就行。cache过小，或者
          没有cache，不影响程序逻辑（高并发cache过小或者丢失导致系统忙死除外）。
          buffer过小有时候会影响程序逻辑，如导致网络丢包。

        - cache可以做到应用透明，编写应用的可以不用管是否有cache，可以在应用做
          好之后再上cache。当然开发者显式使用cache也行。buffer需要编写应用的人
          设计，是程序的一部分。


2. 字符输入输出函数    getchar()   putchar()

    man 3 getchar

    char a = getchar();


    fputc(), putc(), and putchar() return the character written as an unsigned char cast to an int or EOF on error.

    puts() and fputs() return a nonnegative number on success, or EOF on error.

        没有回车，还需要手动写个回车

    fgetc(), getc(), and getchar() return the character read as an unsigned char cast to an int or EOF on end of file or error.

3. 字符串输入输出函数  gets()  puts()

    man 3 gets  

    **gets() 很危险**

        gets()  reads  a  line  from  stdin  into  the buffer pointed to by s until
        either a terminating newline or EOF, which it replaces with a null byte
        ('\0').  No check for buffer overrun is performed (see BUGS below).

        fget

        getline 动态内存, 不会引起越界, 但是是 gun libc


    puts() writes the string s and a trailing newline to stdout.

    数字是有单位的, int , long 

    ```
    #define SEC_YEAR (365LL * 24LL * 3600LL)
    ```


    变参函数, printf



    ```
    printf("xxxx")              // 输出不了, 要加上 \n
    while(1);
    printf("yyyy")
    ```

    scanf("%s") 很危险，会发生越界行为
        ```
        char name[3];
        scanf("%s",name); // 应该是只能输入2个字符，但是可以输入很多

        ---

        int i;
        while(1)
        {
            scanf("%d",&i);
            printf("i = %d\n",i);   //如果输入 'a', 死循环
        }

        On  success, these functions return the number of input items successfully matched and assigned;

        ---

        int i;
        while(1)
        {
            int ret = scanf("%d",&i);
            if(ret !=1 )
                break;
            printf("i = %d\n",i);   //如果输入 'a', 死循环
        }
        ```



        scanf("%d", &i)
        scanf("%*c%c",&ch)          抑制符, 吃掉一个符号

        ```
        #include <stdio.h>¬

        int main(void){¬

            int a;¬
            char b;¬

            printf("Plz input a int and a char:\n");¬
            scanf("%d",&a);¬
            getchar();¬
            scanf("%c",&b);¬

            printf("int a is |%d|, char b is |%c|\n",a,b);¬

            return 0;¬
        }¬

        ```


        ```gets and puts
        int main(void){¬
            char a[3];¬

            gets(a);¬

            puts(a);¬

            return 0;¬
        }
        ```

## 流程控制

有限状态机
    switch
        case 常量/常量表达式

if-goto
    无条件跳转
    不能跨函

```
int score;
printf("Plz input score:");
scanf("%d",&score);

if(score == 100){
    goto a;
}else if(score == 200){
    goto b;
}
a:
    printf("100");
b:
    printf("200");
}

```

## 数组

In C language, the array name is not a constant. However, the array name can be
implicitly converted into a pointer to the first element of the array,  and
this pointer is a constant pointer, which means that it cannot be modified to
point to a different memory location.

This means that you can use the array name to initialize a pointer variable,
and this pointer variable will also be a constant pointer. For example:

```
int arr[10];
int *ptr = arr; // valid: arr is implicitly converted to a constant pointer to the first element of the array
```

In this example , arr is implicitly converted to a **constant pointer** to the
first element of the array , and this pointer is used to initialize the pointer
variable ptr. Since ptr is also a pointer to the first element of the array ,
you can use ptr to access the array elements just like you would with arr.

---

    `int arr[10]; sizeof(arr)`

in this example ,arr is not converted to a pointer pointing the first member?

In the example `int arr[10]; sizeof(arr);`, the array arr is not converted to a
pointer pointing to the first member.

**The sizeof operator is evaluated at compile time**, and it determines the
size of an object in bytes. In this case, sizeof(arr) returns the size of **the
entire array arr in bytes**, which is 10 * sizeof(int) because arr has 10
elements of type int.

**Note that in many contexts, an array name is automatically converted into a
pointer pointing to the first element of the array**. However, sizeof is not one
of those contexts. So, in the example you provided, arr is treated as an array
of integers with 10 elements, and not as a pointer to an integer.

---

In the code `int arr[] = {1,2,3,4,5}; *(arr+1) = 99;`, the * operator is indeed
used to get the value stored at a particular memory location, but it can also
be used to set the value at that memory location.

In this case,`*(arr+1)` is equivalent to arr[1], which accesses the second
element of the array arr. So, the expression ` *(arr+1)` gets the value stored
in the second element of the array, which is 2.

By assigning a new value of 99 to `*(arr+1)` or arr[1], you are updating the
value stored in the second element of the array to 99. This is a common way of
updating or modifying array elements in C.

**Therefore, the * operator is used both to get and set the value stored in a
particular memory location, depending on the context and usage.**

### 1. 一维数组

[存储类型] 数据类型 key[]

变长数据要看编译器支持否

数组名：表示地址的常量, 数组的起始位置
不检查越界

In this example , arr is implicitly converted to a **constant pointer** to the
first element of the array.


### 2. 二维数组


### 3. 多维数组


### 4. 字符数组 和 字符串

    ```
    /*字符数组赋初值*/
    char cArr[] = {'I','L','O','V','E','C'};            // 没有尾0, 如果用printf(%s), puts 输出，可能会有意外情况

    /*字符串赋初值*/
    char sArr[] = "ILOVEC";                             // 有尾0, printf("%s") 和 puts 没有问题, **字符串是有尾0的,字符数组没有**

    /* 格式化输入方式 */
    scanf("%s",str)                                     // 不能有空格等


    /*用sizeof（）求长度*/
    printf("cArr的长度=%d\n", sizeof(cArr));            // 没有意外情况 6
    printf("sArr的长度=%d\n", sizeof(sArr));            // 没有意外情况 7

    //*(cArr+6) = '\0';
    //*(cArr+7) = 'A';
    //*(cArr+8) = 'A';
    /*用strlen（）求长度*/
    printf("cArr的长度=%d\n", strlen(cArr));            // strlen 统计的是到尾0的字符个数，字符数组的话可能有意外情况
    printf("sArr的长度=%d\n", strlen(sArr));            // strlen 对字符串（有尾0）的没有意外情况
    /*用printf的%s打印内容*/
    printf("cArr的内容=%s\n", cArr);
    printf("sArr的内容=%s\n", sArr);

    ```

    串常量

string.h

    strlen: 不包含尾0, 遇到第一个 \0 就返回
    sizeof() 包含尾零


    strcpy

        char *strcpy(char *dest, const char *src);

        直接覆盖，不是 append

        ```
        #include <string.h>
        char str[] = "hello world";
        strcpy(str,"meet you");
        printf("%s\n",str);
        ```

    strncpy

        char *strncpy(char *dest, const char *src, size_t n);

        从左边开始计算 n 个字符

        ```
        #include <string.h>
        char str[] = "hello world";
        strcpy(str,"meet you",2);      // 覆盖两个字符, -> mello world
        printf("%s\n",str);
        ```

    strcat

        char *strcat(char *dest, const char *src);
        连接 join, append
        覆盖前一个 str 的尾0, 最后添加一个尾0

        ```
        char a[100] = "hello"
        strcat(a, " ");
        strcat(a,"world")
        ```

    strncat

        char *strncat(char *dest, const char *src, size_t n);
        连接 join, append

    strcmp
        int strcmp(const char *s1, const char *s2);
        比较 ASCII
        前 - 后 的差值(第一个,如果第一个相同，则比较第二个，直到有不同为止)

    strncmp

        int strncmp(const char *s1, const char *s2, size_t n);
        只比较前 n 个



## 共用体

共用同一块空间, 里边那个最大就占用多少

就像单选按钮, 而结构体就像复选项

类型描述

    ```
    union 共用体名{  
        数据类型 成员名1;
        数据类型 成员名2;
        ...
    };
    ```


    ```
    union test_un{
        int i;
        float f;
        double d;
        char ch;
    };

    int main(){
        union test_un a;    //一个时间只有一个成员可以生效
        a.f = 1.1;
        printf("%d\n",sizeof(a));
        printf("%f\n",a.i);
    }
    ```

成员引用
    变量名.成员名
    指针名->成员名


x86 大部分是小端

位域
    共用体的一种形式，不是以字节为单位，而是以位为单位

    ```
    union{
        struct{
            char a:1;       // a 占用1bit
            char b:2;       // b 占用2bit
            char c:1;       // c 占用1bit
        }x;
        int y;
    }w;
    ```

    因为大小端的问题, 移植性不强

    ```
    +---+---+---+---+---+---+---+---+
    | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
    +---+---+---+---+---+---+---+---+
    ```

    w.y = 1;
    printf("%d\n",w.x.a)



## 枚举

    enum 标识符{
        成员1,
        成员2,
        成员3
    };

    ```
    enum day{
        mon = 1,
        tus,
        wes,
        thr,
        fri,
        sat,
        sun
    };

    enum day a = wes;
    ```


    ```
    enum{
        STATE_RUNNING=1,
        STATE=CANCELED,
        STATE_OVER
    };

    struct job_st{
        int id;
        int state;
        time_t start,end;
    };

    int main(void){
        struct job_st jobs;
        获取任务状态
        job1.state = STATE_OVER;
        switch(job1.state){
            case STATE_RUNNING: do sth;break;
            case STATE_CANCELED: do sth;break;
            case STATE_OVER; do sth;break;
            default:abort();
        }
    }

    gcc -E 可以看到是没有变化的，当作宏来处理，但是比宏的好处是，不会变成宏值
    ```


## 动态内存管理

malloc
    man 3 malloc

ralloc

realloc

谁申请，谁释放
    alloc

free
    释放


1. malloc

    ```
    void *malloc(size_t size);
    ```

    ```
    #include <stdio.h>
    #include <stdlib.h>

    int main(){
        int* p = NULL;
        p = malloc(sizeof(int));
        if(p == NULL)
        {
            printf("error");
            exit(1);
        }

        *p = 10;
        free(p);
    }
    ```


2. calloc

    ```
    void *realloc(void *ptr, size_t size);
    ```

3. realloc

    ```
    void *realloc(void *ptr, size_t size);
    ```


## 指针

用来保存变量的地址

### 1. 变量与地址

**变量是对某个空间的抽象命名**

There is a mapping between the variable and its value's memory address. If you
have a pointer to the variable, you can use that to access the memory location
where its value is stored directly.

However, if you try to access the variable directly (without a pointer), **the
compiler takes care of the memory address mapping for you, allowing you to use
the variable name to read or modify its value.**

指针就是地址

TYPE NAME VALUE

    TYPE:   int *
    NAME:   i
    VALUE:  &a

    ```
    int a = 1;¬
    int *p = &a;¬
    *p = 110;¬
    printf(format: "%d\n",a);
    ```

### 2. 指针 和 指针变量

    ```
    int a = 3;

    int b;
    int *p = &b;
    *p = 3;
    ```

Here are some snippets of search results related to the differences between `int
a[]={1,2,3};` and `int *p = {1,2,3}` in C:

    - `int a[]={1,2,3};` initializes an array of integers with the values `{1,
      2, 3}`. The array a stores the values directly in memory as three
      contiguous blocks of 4 bytes each (assuming an int is represented with 4
      bytes on the machine).

    - `int *p = {1,2,3}` initializes a pointer p to point to a block of memory
      containing the values `{1, 2, 3}`. The memory is not guaranteed to be
      contiguous in this case - the compiler may decide to store the values at
      arbitrary locations in memory.

    - sizeof(a) returns the size of the array a in bytes, which in this case
      would be 3 * sizeof(int) = 12 bytes.

    - sizeof(p) returns the size of the pointer p in bytes, which is usually 4
      or 8 bytes on a 32- or 64-bit machine, respectively. It does not return
      the size of the memory block p is pointing to, which is unknown in this
      case.

    - The main difference between arrays and pointers is that arrays are not
      modifiable l-values, while pointers are. This means that you can't assign
      to an array, but you can assign to a pointer.

      here's an example illustrating that arrays are non-modifiable lvalues:

      ```
      #include <stdio.h>

      int main() {
          int arr[] = {1, 2, 3};
          arr[0] = 4; // This is allowed
          int *p = arr; 
          p[0] = 5; // This is also allowed
          // arr = p; // This is not allowed

          return 0;
      }
      ```

      **arrays are non-modifiable lvalues** - we can't assign values to them
      after they have been declared, although we can modify the individual
      elements of the array using the bracket operator.

    - Another difference between arrays and pointers is that the name of an
      array can be used as a pointer to its first element. In other words, if a
      is an array of integers, then a can be used as a pointer to the first
      element of the array, i.e. a and &a[0] are equivalent.


### 3. 直接访问和间接访问

### 4. 空指针和野指针

NULL 是一个宏

### 5. 空类型

    void *p

    void *memcpy(void *dest, const void *src, size_t n);

### 6. 定义与初始化的书写规则


### 7. 指针运算

取地址和取值

还可以作 ++ -- 比较

### 8. 指针与数组

二维数组指针

    指向数组

        数据类型 （*指针名） 下标 = 值
        int (*p) [3];    // 指向 int[3], +1 跳3

        ```
        int a[][3] = {1,2,3,4,5,6};
        int (*p)[3] = a;
        ```

        int a[4][5];
        int (*p)[5]=a;

        这里a是个二维数组的数组名
        p是一个指针变量，它指向包含5个int元素的一维数组，此时p的增量以它所指向的一维数组长度为单位

        p+i是一维数组a[i]的地址，即p+i==&a[i]；对该式两边作取内容运算（*）得*(p+i)==a[i]，由于二维数组中a[i]==&a[i][0]，则*(p+i)表示a[i][0]的地址，即*(p+i)==&a[i][0]；

        *(p+2)+3表示a[2][3]地址（第一行为0行，第一列为0列），*（*(p+2)+3）表示a[2][3]的值。

---

        数组指针（也称行指针）

        定义 int (*p)[n];

        ()优先级高，首先说明 p 是一个指针，指向一个整型的一维数组，这个一维数组的长度是 n，也可以说是 p 的步长。

        也就是说执行 p+1 时，p 要跨过 n 个整型数据的长度。

        如要将二维数组赋给一指针，应这样赋值：

        int a[3][4];

        int (*p)[4]; //该语句是定义一个数组指针，指向含 4 个元素的一维数组。

        p=a; //将该二维数组的首地址赋给 p，也就是 a[0]或&a[0][0]

        p++; //该语句执行过后，也就是 p=p+1;p 跨过行 a[0][]指向了行 a[1][]

        所以数组指针也称指向一维数组的指针，亦称行指针。




### 9. 字符数组和指针

    // 字符数组
    char a[] = "hello";
    strcpy(a,"world");

    // 字符指针
    char *p = "hello";
    p = "world";
    puts(p);
    // 这是错误的，因为 p 指向的是串常量，是不能改变的, 但**是是可以的!!!**
    strcpy(p,"world");

### 10. const 与指针

// 常变量

    const int pi = 3.14

// 可以，但是会报警告

    int *p = &pi;
    *p = 3.1415926;

    const int *p = &pi


// 常量指针

    const int *p 
    int const *p    // p 指向的是只读的，**不能通过该指针修改原来的值，原来的值也不一定是不能变化的**

    1. int 指针，float指针，，，指向常量的指针
    2. 指针的指向可以变化

// 指针常量

    int *const p

    1. int 常量，float 常量，，，该指针不能变
    2. 指针指向的变量可以变化


指针的大小在某一个平台下是一定的, 一般是 8

```
*q -> *(&p) -> p
p 即 &a

**q -> **(&p) -> *p -> *(&a) -> a
```


### 11. 指针数组 数组指针

// 数组指针

    int (*p)[3];

// 指针数组

    int * arr[3]

    int main(int argc, char **argv){
         char * p[3] = {"hello","world","hhh"};
    }



void 指针类型

    > void *memcpy(void *dest, const void *src, size_t n);


    ```
    int a[3] = {1,2,3};
    int *p = a;
    int i;

    a[i] = *(a+i) = *(p+i) = p[i]
    &a[i] = a+i   = p+i    = &p[i]

    *a <-> *(a+0)
    sizeof(a)/sizeof(*a)

    a 是一个数组名,是一个存方地址的常量
    p 是一个变量, 存放地址的变量
    ```




    ```
    int main(void){

        int a[3];
        int *p = a;

        for(int i=0; i<3; i++){
            scanf("%d",p++);
        }

        for(int i=0; i<3; i++){
            printf("%d\n",a[i]);
        }
        ---或者---
        p = a;
        for(int i=0; i<3; i++){¬
            printf("%p -> %d\n",p,*p);¬
            p++;¬
        }¬
    exit(0);
    }
    ```


    ```
    int main(void){

        int *p = (int [3]){1,2,4};          // **无名数组**

        for(int i=0; i<3; i++)
            printf("%d\n",p[i]);
        exit(0);
    }
    ```

    ``` 练习
    int main(void){

        int a[] = {5,3,9,1,8};
        int y;
        int *p = &a[1];
        y = (*--p)++;
        printf("%d\n",y);                   // 输出 5
        printf("%d\n",a[0]);                // 输出 6
        exit(0);
    }
    ```

    **是次内层**

    ```
    int main(void){

        int a[2][3] = {1,2,3,4,5,6};

        for(int i=0; i<2; i++){
            for(int j=0; j<3; j++){
                printf("%p -> %d\n",&a[i][j],a[i][j]);
                printf("%p -> %d\n",*(a+i)+j,*(*(a+i)+j));          //!!!
            }
            printf("\n");

        }

        printf("%p ->\n",a);
        printf("%p ->\n",a+1);

        exit(0);
    }
    ```

### 11. 多级指针


The statement `int *p = {1, 2, 3}` is not correct because it is attempting to
initialize a pointer variable with an array of integers using brace
initialization syntax.

While brace initialization can be used to initialize arrays, it cannot be used
to initialize pointer variables in this way.



In C++, arrays are not assignable, which means that you cannot change the
entire contents of an array using the assignment operator.




## 函数

### 1. 函数的定义

数据类型  函数名([形式参数说明表])

1. 定参

2. 变参, eg. printf

    int printf(const char *format, ...);

3. main参数

    (int argc, char *argv[])

    int argc: 多少个参数

    char * argv[]: 参数列表, 指针数组


4. 返回值

    一个进程的返回状态是给它的父进程看的

### 2. 函数的传参

### 3. 函数的调用

### 4. 函数与数组

### 5. 函数与指针

指针作为参数

1. 指针函数

    返回值是指针

    > 返回值 * 函数名(形参)
    > 如 int * fun(int a);

2. 函数指针

    指向函数的指针

    > 类型 (*指针名) (形参)

    > 如 int (*p)(int)

    ```
    

    ```

3. 函数指针数组

    > 类型 (*数组名[下标])(形参)

    int (*funcp[2])(int,int)
        int (int,int) * funcp[2]

[指向指针函数的函数指针数组](https://www.bilibili.com/video/BV18p4y167Md?p=59&spm_id_from=pageDriver)

    > int *(*funcp[N])(int)


### 6. 函数与一维数组


### 7. 函数与二维数组

    print_arr(int p[][N])

## 构造类型

### 1. 结构体

1. 产生和意义

    不像数组，存放不同类型的数据

2. 类型描述

    一般定义在函数外

    ```
    struct 结构体名字{
        数据类型 成员1;         // 不占据空间的
        数据类型 成员2;
        ...
    };                          <--- 这里的分号
    ```

    e.g.

    ```
    struct simple_st{
        int i,j;
        float f;
        char ch;
    };


    无名结构体
    struct simple_st{
        int i,j;
        float f;
        char ch;
    }a,b,c,*p;

    无名结构体并初始化
    struct simple_st{
        int i,j;
        float f;
        char ch;
    }a,b={,,},c,*p;
    ```

3. 嵌套定义

```
#define NAMESIZE 32


struct birthday_st{
    int year;
    int month;
    int day;
};

struct student_st{
    int id;
    char name[NAMESIZE];
    struct birthday_st birth;           // struct birthday_st 数据类型
    int math;
    struct collage_day{
        int year;
        int month;
        int day;
    }collage_date;                      // 这里是定义, 必须要写
    int chinese;
};
```

4. 定义变量(变量，数组，指针), 初始化及成员引用

    和数组一样，声明初始化，或者声明+单个赋值

    1. **成员引用**
        变量名.成员名

        ```
        #include <stdio.h>
        #include <stdlib.h>

        struct simp_st{
            int a;
            int b;
            char c;
        };

        int main(int argc, char *argv[]){
            struct simp_st a = {1,2,'c'};
            a.a = 111;
            printf("%d\n",a.a);
        }
        ```

    **可以只初始化部分元素**

    ```
    struct student_st liu = {.math=99};     // "." 引用当前结构体中的某个成员
    ```

    2. **还可以用指针, 使用箭头**

        指针->成员名

        (*指针).成员名                      // 就不是第一个成员了

    ```
    struct student_st liu = {.name="liu"}
    struct student_st *pliu = &liu;
    printf("%d %s\n",pliu->id,pliu->name);
    ```

    数组

        ```
        struct student_st liu[2] = {{.name="liu"},{.name="wang"}};
        p = &liu[0];            //
        for(int i=0; i<2; i++,p++){
            printf("%s\n",p->name);
        }
        ```

5. 占用内存空间大小

    内存对齐, 占据大小为 address % sizeof(成员)
    ```
    struct simp_st{
        int i;              0 % sizeof(int)   ok->占用4Byte
        char ch;            4 % sizeof(char)  ok->占用1Byte
        float f;            5 % sizeof(float) no  空
                            6 % sizeof(float) no  空
                            7 % sizeof(float) no  空
                            8 % sizeof(float) ok ->占用4Byte
    };                      所以一共占用13
    ```

    但是也可以不对齐(例如网络传输的时候,socket)
    ```
    struct simp_st{
        int i;              0/sizeof(int)   ok->占用4Byte
        char ch;            4/sizeof(char)  ok->占用1Byte
        float f;            8/sizeof(float) ok ->占用4Byte
    }__attribute__((packed));               所以一共占用13
    ```

6. 传参

    1. 值

    2. 指针方式
       truct simp_st a;
       truct simp_st *p = &a;
       func(p);



### 2. 共用体 union

1. 共用体的产生和意义
    
    多个成员只有一个存在, 例如单选; 而结构体类似多选

2. 类型描述

    ```
    union 共用体名{
        数据类型 成员1;
        数据类型 成员2;
        ...
    };
    ```

3. 嵌套定义

    结构体嵌套共用体或者共用体嵌套结构体

    ```
    struct {
        int i;          //4B
        char ch;        //1B

        union{
            int a;      //4,取4
            char c;     //1
        }un;

        float f;        //4
    };



    union{
        int a;
        double d;
        struct{
            int arr[10];
            float f;
        }c;                 // 44, 取这个
    };


    到底可以做什么

    大：低位保存在高位
    小：低位保存在低位

    32bit 数，高16bit 和低16bit的和
        解法1
            #include <stdint.h>
            uint32_t =0x11223344;
            printf("%s\n",i>>16 + i & 0xFFFF);

        解法2
            
            union{
                struct{
                    uint16_t i;
                    uint16_t j;
                }x;
                uint32_t y;
            }a;
            
            a.y = 0x11223344;
            printf("%d\n",a.x.i + a.x.j);
    ```

4. 定义变量(变量，数组，指针),初始化和成员引用

```
union test_un{
    int i;          // 只占用一块内存空间
    float f;
    double d;
    char ch;
};

union test_un a;

a.f = 3.1;          // 其它值是

printf("%d\n",sizeof(a));   // 输出4
printf("%d\n",a.f);


union test_un *p = &test_un;

变量名.成员名
指针名->成员名
```

5. 占用内存大小

    以最大的成员为准

6. 函数传参(值，地址)

    

7. 位域

    没有实际开发的意义

    ```
    union{
        struct{
            char a:1;       //1bit
            char b:2;       //1bit
            char c:1;       //1bit
        }x;
        char y;             //8bits
    }w;                     //8bits


    w.y = 1;
    printf("%d\n",w.x.a);

    7    6    5    4    3    2    1    0
    +----+----+----+----+----+----+----+----+
    |    |    |    |    |    |    |    | 1  |           // 补码形式存在, 为-1
    +----+----+----+----+----+----+----+----+
                          c    b    b    a
    ```

### 3. 枚举类型

    enum 标识符{
        成员1,      可以赋值，下面的值依次
        成员2,
        成员3
    };


    enum day{
        mon,    // 默认为0
        tue,
        thr,
        wes,
        fri,
        sat,
        sun
    };

    enum state_en{
        STATE_RUNNING = 1,
        STATE_CANCELED,
        STATE_OVER
    };

    struct job_st{
        int id;
        enum stat_en state;
        ...
    };


## 








## 数据结构

线性(有头，无头)
    线性表
        顺序存储的线性表
            e.g. fat文件系统
            数组
        链式存储的线性表
            单链表
                单向循环
                单向不循环
            双链表
                双向循环
                双向不循环
    栈
    队列

树状(有向无环图)
    1:N
    
    递归

图
    N:M

    最短路径


存储形式
    顺序存储
        array
    链式存储
        链表(指针实现)








## 静态库与动态库

man string.h            // POSIX Programmer's Manual

静态库不占用运行时间

动态库会占用运行时间


1. 静态库
    libxx.a
    xx 名字

    ar - create, modify, and extract from archives

    ar -cr libxx.a yyy.o
        会生成两个文件， .a 和 .h, 分别放到对应的目录

    /usr/local/include      .h
    /usr/local/lib          二进制的库

    使用
        gcc -L/usr/local/lib -o main main.o -lxx
            -l 必须写在最后

2. 动态库

    ldd - print shared object dependencies

    libxx.so

    gcc -shared -fpic -o libxx.so yyy.c

    
    配置文件
        /etc/ld.so.conf
            include /etc/ld.so.conf.d/*.conf
            /etc/ld.so.conf.d
                ├── fakeroot-x86_64-linux-gnu.conf
                ├── libc.conf
                └── x86_64-linux-gnu.conf
                    /usr/local/lib/x86_64-linux-gnu¬
                    /lib/x86_64-linux-gnu¬
                    /usr/lib/x86_64-linux-gnu¬

        更改完后要运行  /sbin/ldconfig 进行生效

    使用
        gcc -I/usr/local/include -L/usr/local/lib -o xxx -lxx


    非root用户发布
        1. cp libxx.so ~/lib
        2. export LD_LIBRARY_PATH=~/lib


    貌似只有标准库才不用写 -lxxx



## 未看
p32


