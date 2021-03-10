
vim colorscheme
    http://bytefluent.com/vivify/

    将 .vim 文件放到 color文件夹下即可 (~/.vim/colors)
        /usr/share/vim/vim81/colors


## 第一章

Pascal 的主要目标是为更好地学习编程原理提供扎实的基础.

BASIC 的主要目标是开发出类似英文的语言，让不熟悉计算机的学生学习编程

FORTRAN 工程和科学领域

大多数 [C实现] 都有一个大型的库，包括众多有用的C函数

C 不像 Pascal 和 C++ 那么严格，C 很灵活

国际C语言混乱代码大赛 （IOCCC, The International Obfuscated C Code Contest）是一项国际编程赛事，从1984年开始，每年举办一次

CPU 能理解的指令有限(这些指令的集合叫做指令集), 而且这些指令相当具体


1978年，布莱恩 柯林汉(Brian Kernighan) 和 丹尼斯 里奇(Dennis Ritchie) 合著 The C Programming Language(《C语言程序设计》)

C 语言比其他语言更依赖库, 由于缺乏官方标准，UNIX实现提供的库已成为了标准库


### 第一个标准


1. ANSI C / ISO C / C89 / C99
    美国国家标准协会(ANSI)于1983年组建了X3J11委员会，开发了一套C标准, 于1989年公布(ANSI C)
    ISO 于1990年采用了这套标准，形成ISO C
    ISO C 和 ANSI C 是完全相同的东西
    ANSI C/ISO C 的最终版本通常称作 C89 或 C90

1. C99
    1994年, ANSI/ISO 联合委员会(C9X委员会) 开始修订C标准，并发布了C99标准
    3个目标
        国际化(国际字符集)
        弥补缺陷(各种硬件，比如64bit处理器)
        提高计算的实用性(增加某些特性，让其比Fortran更有竞争力)

1. C11 
    2011年发布C11标准，
    出于对当前编程安全的担忧，不再那么强调"信任程序员"的目标了

修订标准的原因不是因为原标准不能用，而是需要跟进新的技术

    gcc -std=c89
    gcc -std=c90
    gcc -std=c99
    gcc -std=c11


### 

编译的细节取决于编程的环境

编译器把源代码转换成中间代码，链接器把中间代码和其他代码合并，生成可执行文件
    好处是可以独立编译单独的模块，稍后再用链接器合并已编译的模块。

目标文件中存储的是编译器翻译的源代码，还不是一个完整的程序。
目标文件缺失[启动代码(startup code)], 启动代码充当着程序和操作系统之间的接口。
目标代码还缺少库函数


启动代码
    C或者C++语言，明面上的入口函数是main(argc,argv)，或者tmain、wmain、WinMain等等。
    进一步，很容易获知，是C Runtime的startup代码中的void mainCRTStartup(void)函数，调用了编程者写的main函数。

链接器:
    把你编写的目标代码
    系统的标准启动代码
    库代码
    这3个部分合并成一个文件,即可执行文件


C运行库(CRT)
    1. C运行时库就是 C run-time library，是 C 而非 C++ 语言世界的概念:取这个名字就是因为你的 C 程序运行时需要这些库中的函数.
    1. C 语言是所谓的“小内核”语言，就其语言本身来说很小（不多的关键字，程序流程控制，数据类型等）；所以，C 语言内核开发出来之后，
       Dennis Ritchie 和 Brian Kernighan 就用 C 本身重写了 90% 以上的 UNIX 系统函数，并且把其中最常用的部分独立出来，形成头文件
       和对应的 LIBRARY，C run-time library 就是这样形成的。
    1. 随后，随着 C 语言的流行，各个 C 编译器的生产商/个体/团体都遵循老的传统，在不同平台上都有相对应的 Standard Library，
       但大部分实现都是与各个平台有关的。由于各个 C 编译器对 C 的支持和理解有很多分歧和微妙的差别，所以就有了 ANSI C；ANSI C 
       （主观意图上）详细的规定了 C 语言各个要素的具体含义和编译器实现要求，引进了新的函数声明方式，同时订立了 Standard Library 
       的标准形式。所以C运行时库由编译器生产商提供。至于由其他厂商/个人/团体提供的头文件和库函数，应当称为第三方 C 运行库（
       Third party C run-time libraries）。
    1. C run-time library里面含有初始化代码，还有错误处理代码(例如divide by zero处理)。你写的程序可以没有math库，程序照样运行，
       只是不能处理复杂的数学运算，不过如果没有了C run-time库，main()就不会被调用，exit()也不能被响应。因为C run-time library包含
       了C程序运行的最基本和最常用的函数。
    1. 到了 C++ 世界里，有另外一个概念:[Standard C++ Library],它包括了上面所说的 C run-time library 和 STL。包含 C run-time library 
       的原因很明显，C++ 是 C 的超集，没有理由再重新来一个 C++ run-time library.

       STL 是“Standard Template Library”的缩写，中文译为“标准模板库”。STL 是 C++ 标准库的一部分，不用单独安装。
       C++ 对模板（Template）支持得很好，STL 就是借助模板把常用的数据结构及其算法都实现了一遍，并且做到了数据结构和算法的分离。例如，
           vector 的底层为顺序表（数组），list 的底层为双向链表，deque 的底层为循环队列，set 的底层为红黑树，hash_set 的底层为哈希表。
           links: http://c.biancheng.net/stl/
           links: https://blog.csdn.net/wqvbjhc/article/details/6612099


### LLVM项目

LLVM 项目是cc的另一个替代品，始于伊利诺一大学2000年的研究项目。
它的 Clang 编译器处理C代码
2012年，Clang 成为为 FreeBSD 的默认C编译器




## 第二章 语言概述

某些窗口环境会在单独的窗口运行程序，然后在程序运行结束后自动关闭窗口
    getchar();

C语言的6种语句
    1. 标号语句
    1. 复合语句
    1. 表达式语句
    1. 选择语句
    1. 迭代语句
    1. 跳转语句

C 预处理器指令(preprocessor directive)

头文件中可以定义一些常量，或者指明函数名以及如何使用他们

C为何不内置输入输出指令?
    并非所有的程序都会用到I/O包

main() 的返回值返回给系统


标识符(identifier)
    声明把特定标识符与计算机内存中的特定位置联系起来，同时也指定了存储在某位置的信息类型和数据类型

    以前的C语言，要求把变量声明在块的顶部, C99 和 C11 遵循 C++ 的惯例，可以吧声明放在块的任何位置

    外部变量是在函数外部定义的全局变量，它的作用域是从变量的定义处开始，到本程序文件的结尾。在此作用域内，全局变量可为各个函数所引用。
        编译时将外部变量分配在静态存储区。

    有时要用extern来声明外部变量，以扩展外部变量的作用域。 也可用static声明外部变量，使该变量不能被其他文件引用。

    用extern声明外部变量

    extern可省略不写。
    
    静态存储区:
        类似对象编程中一个类的公共变量，对所有实例共享，谁都可以更改它，可以计算产生了多少个实例


    实际参数(actual argument)

    函数执行结束后，控制权被返回至主调函数(calling function)

    转义序列(escape sequence)
        an escape sequence is two or more *characters* that often begin with an escape character that tell the computer to perform a 
        function or command. 
        
        所以是一个序列, 表示其他的含义
        
        \0??
            八进制比较特殊，可以省略0,即: \??
            beep='\007'
            beep='\07'
            beep='\7'
        \x??


函数原型(prototype)
    C90 标准增加了函数原型
    是一种声明形式，告知编译器在程序中要使用该函数
    早期的C语言支持一种更简洁的函数声明，只需指定返回类型，不用描述参数

    C语言建议，要为程序中用到的所有函数提供函数原型。
    标准include文件为标准库函数提供了函数原型
        /usr/include/aarch64-linux-gnu/bits/stdio.h



程序状态(program state)
    是在程序的执行过程中，某给定点上所有变量值的集合。它是计算机当前状态的一个快照
    调试器(debugger)


## 第三章 数据和C

字(word):
    是设计计算机时给定的自然存储单位。
    对于8位的微型计算机，1个字长只有8位
    个人计算机的字长增长至16位、32位，64位
    计算机的字长越大，其数据转移越快，允许的内存访问也更多

浮点数
    小数部分和指数部分
    浮点数通常只是实际值的近似值

    printf(%d);                 // 会打印一个随机的内存中的值

    必须至少能表示6位有效数字，且取值范围至少是  10^-37~10^37
    通常存储float需要32bit， 8bit 用于表示指数的值和符号，剩下的24bit 用于表示非指数部分及其符号

    double 占 64bit
    
    %f
    %u

    如果系统支持16进制个是的浮点数，可以用 a 和 A 代替 e 和 E

    long double 时要使用 %Lf %Le %La 转换

    给那些未在函数原型中说明参数类型的函数(如，printf()) 传递参数时，C编译器会把 float 类型的值自动转换为 double 类型

    浮点数的上溢和下溢
        float toogit = 3.4E38 * 100.0f;
        当计算导致数字过大，超过当前类型能表达的范围时，就会发生上溢。
        这种行为过去是为定义的。
        不过现在规定，在这种情况下会给toobig 一个表示无穷大的特定值. inf 或 infinity
    
        最小尾数值，指数也最小, 现在除以2, 会减小指数部分，但是指数已经是最小了，所以只好改变尾数，把尾数部分的位右移
        空出一个二进制位，并丢弃最后一个二进制位
        以10进制为例,4位有效数字, 0.1234E-10, 除以10 -> 0.0123E-10, 虽然的到了结果，但是精度丢失了
        如果除以一个非常大的值，会导致所有的位都为零



八进制和十六进制
    0前缀                   %o   (不显示进制前缀)       %#o     (显示前缀0)
    0X前缀 或 0x前缀        %x|%X(不显示进制前缀)       %#x|%#X (显示前缀0x)


long 常量和 long long 常量
    l 或 L 后缀
    ll 或 LL 后缀
    u表示unsigned

    5uLL
    5ull
    5ULL
    5Ull

溢出行为是未定义行为。常见的整数circle溢出比较有代表性，但是也可能出现其他情况



_Bool
    C99 添加了 _Bool 类型

    ```
    在C99标准被支持之前，我们常常自己模仿定义布尔型，方式有很多种，常见的有下面两种：

    /* 第一种方法 */
    #define TRUE 1
    #define FALSE 0


    /* 第二种方法 */
    enum bool{false, true};
    ```

    _Bool类型长度为1，只能取值范围为0或1。将任意非零值赋值给_Bool类型，都会先转换为1，表示真。将零值赋值给_Bool类型，结果为0，表示假。

    include <stdlib.h>

    _Bool a = 1     非零值,结果为1
    _Bool b = 2     非零值,结果为1
    _Bool b = -2    非零值,结果为1
    _Bool c = 0


    在C++中，通过bool来定义布尔变量，通过true和false对布尔变量进行赋值。C99为了让我们能够写出与C++兼容的代码，添加了一个头文件<stdbool.h>。

    ```
    bool a = true;          输出的话还是1  printf("%d",a)
    bool b = false;         输出的话还是0  printf("%d",b)
    ```



C 在检查类型匹配方面不太严格，C编译器甚至允许二次初始化, 但在激活了比较高级别警告时，会给出警告
    ```
    int mian(void){
        int a = 3.0;
        return 0;
    }
    ```


在变量名中体现其类型
    i_ 前缀表示 int 类型
    us_ 前缀表示 unsigned short 类型

sizeof
    printf("%d",sizeof(int));
    printf("%zd",sizeof(int));

    C99 提供 %zd 转换说明匹配 sizeof 的返回类型, 不支持 C99 的可以用 %u %lu 代替 %zd




刷新输出

    printf() 语句把输出发送到一个叫做缓冲区(buffer)的中间存储区域，
    C标准中规定了何时把缓冲区中的内容发送到屏幕:
        1. 缓冲区满
        1. 遇到换行符
        1. 需要输入的时候

    旧式编译器遇到 scanf() 也不会强制刷新缓冲区，在这种情况下，可以使用换行符刷新缓冲区
        printf("Plz input ur salary:\n")
        scanf("%f",&salary)




语句
    以分号结束



    ```
    printf("hello world\r");        好像是被遮罩层覆盖了一样，看不到输出
    printf("hello world\r\n");      这样就看到了
    ```




main 不是关键字
