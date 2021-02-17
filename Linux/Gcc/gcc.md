## 

gdb 是GNU推出的程序调试器

1. 预处理(pre-processing)           

    -E  只进行预编译，头文件，不做其他处理

    .i  预处理后的文件


1. 编译(compiling)                  

    -S 只编译不汇编，生成汇编代码

    .o  编译后的目标文件


1. 汇编(assembling)                 

    -c 只编译和汇编, 生成目标文件.o, 不链接

    .s  汇编语言代码文件

1. 链接(linking)                    

    同时链接 _start 启动代码(gcc提供)


-o              文件名

-g              在生成的可执行程序中包含标准调试信息

-I dir          头文件路径  /usr/include

-L dir          库文件路径  /usr/lib

-static         链接静态库(centos 需要安装 glibc-static)

-library        链接名为library的库文件

-O、-O2、-O3    将优化状态打开，不能与-g连用

-Wall           将警告看成是错误，发生警告是取消编译

-Werror         将警告看成是错误，发生警告是取消编译

-w              禁止所有报警

-pedantic       以ANSI/ISO C标准列出的所有警告

    当GCC在编译不符合ANSI/ISO C语言标准的源代码时，如果在编译指令中加上了-pedantic选项，那么源程序中使用了扩展语法的地方将产生相应的警告信息。


    ```
    void main(){                    不能是void
        printf('hello')             没有返回
    }

    warning: return type of ‘main’ is not ‘int’ [-Wmain]
    void main(){
        ^~~~
    ```


gcc 提供了30多条警告信息和3个告警级别

gcc 通过文件后缀名来区别输入文件的类型



---

-E                       Preprocess only; do not compile, assemble or link.

-S                       Compile only; do not assemble or link.

-c                       Compile and assemble, but do not link.


1. -E后的.i文件

    gcc -E hello.c -o hello.i

    hello.i: C source, ASCII text

1. -S后的.s文件

    gcc -S hello.i -o hello.s

    .s 文件 hello.s: assembler source, ASCII text

1. -c后的.o文件

    gcc -c hello.s -o hello.o

    hello.o: ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped

    elf(executable linkage format)

    man elf

        elf - format of Executable and Linking Format (ELF) files

    objdump 

1. gcc hello.o -o hello

    链接所有目标文件, 



## 
-Ldir
           Add directory dir to the list of directories to be searched for -l.
-I dir
           Add the directory dir to the list of directories to be searched for header files.  Directories named by -I are searched before the standard system include directories.  If
           the directory dir is a standard system include directory, the option is ignored to ensure that the default search order for system directories and the special treatment of
           system headers are not defeated .  If dir begins with "=", then the "=" will be replaced by the sysroot prefix; see --sysroot and -isysroot.

-Wall
           Turns on all optional warnings which are desirable for normal code.  At present this is -Wcomment, -Wtrigraphs, -Wmultichar and a warning about integer promotion causing a
           change of sign in "#if" expressions.  Note that many of the preprocessor's warnings are on by default and have no options to control them.

       -x c
       -x c++
       -x objective-c
       -x assembler-with-cpp
           Specify the source language: C, C++, Objective-C, or assembly.  This has nothing to do with standards conformance or extensions; it merely selects which base syntax to
           expect.  If you give none of these options, cpp will deduce the language from the extension of the source file: .c, .cc, .m, or .S.  Some other common extensions for C++ and
           assembly are also recognized.  If cpp does not recognize the extension, it will treat the file as C; this is the most generic mode.

           Note: Previous versions of cpp accepted a -lang option which selected both the language and the standards conformance level.  This option has been removed, because it
           conflicts with the -l option.

-w  Suppress all warnings, including those which GNU CPP issues by default.

-pedantic
           Issue all the mandatory diagnostics listed in the C standard.  Some of them are left out by default, since they trigger frequently on harmless code.



-g  Produce debugging information in the operating system's native format (stabs, COFF, XCOFF, or DWARF 2).  GDB can work with this debugging information.

   On most systems that use stabs format, -g enables use of extra debugging information that only GDB can use; this extra information makes debugging work better in GDB but
   probably makes other debuggers crash or refuse to read the program.  If you want to control for certain whether to generate the extra information, use -gstabs+, -gstabs,
   -gxcoff+, -gxcoff, or -gvms (see below).

   GCC allows you to use -g with -O.  The shortcuts taken by optimized code may occasionally produce surprising results: some variables you declared may not exist at all; flow
   of control may briefly move where you did not expect it; some statements may not be executed because they compute constant results or their values are already at hand; some
   statements may execute in different places because they have been moved out of loops.

   Nevertheless it proves possible to debug optimized output.  This makes it reasonable to use the optimizer for programs that might have bugs.

   The following options are useful when GCC is generated with the capability for more than one debugging format.



gcc -c a.c. b.c c.c d.c

gcc -S a.c. b.c c.c d.c

gcc -E a.c. b.c c.c d.c 
    这个是默认输出到标准输出，需要 用 -o 指定输出文件
    这样的话 -E 后面只能跟一个 文件了

gcc -Wall -o program a.c b.c c.c

gcc -Wall -o program a.o b.o c.o


gcc: fatal error: cannot specify -o with -c, -S or -E with multiple files


a.out 格式 是指Linux过去使用的二进制格式
ELF(Executable and Linking Format)格式是另一种二进制格式，1995年，ELF格式作为 Linux 的标准二进制格式


## gdb(GUN Debugger) 调试工具

apt install gdb

头文件中有函数的申明，库文件实现函数的定义。
比如，printf函数。使用时应包括stdio.h，打开stdio.h你只能看到，printf这
个函数的申明,却看不到printf具体是怎么实现的，而函数的实现在相应的C库中。
而库文件一般是以二进制形式而不是C源文件形式提供给用户使用的。

程序中包括了stdio.h这个头文件, 编译的时候再指定这个库和它的位置，
链接器就能根据头件中的信息找到printf这个函数的实现并链接进这个程序代码段里。

为了是gdb正常工作，必须在编译的时候加上 -g 或者 -ggdb 选项

用法
    gdb elf文件


-g、-ggdb、-g3和-ggdb3之间的区别

具体来说，-g产生的debug信息是OS native format， GDB可以使用之。
而-ggdb产生的debug信息更倾向于给GDB使用的。
所以，如果你用的GDB调试器，那么使用-ggdb选项。如果是其他调试器，则使用-g。

3只是级别。这个级别会产生更多的额外debug信息。3这个级别可以调试宏。


```dgb的例子

#include <stdio.h>
int main(){
    int a = 0;
    printf("Plz input a number:");
    scanf("%d",a);                              这里没有加&
    printf("%d",a);
}

gcc -ggdb3 hello.c -o hello

gdb hello
    run

```



-fPIC
   If supported for the target machine, emit position-independent code, suitable for dynamic linking and avoiding any limit on the size of the global offset table.  This option
   makes a difference on the m68k, PowerPC and SPARC.

   Position-independent code requires special support, and therefore works only on certain machines.

   When this flag is set, the macros "__pic__" and "__PIC__" are defined to 2.

-fPIC：表示编译为位置独立的代码，不用此选项的话编译后的代码是位置相关的所以动态载入时是通过代码拷贝的方式来满足不同进程的需要，而不能达到真正代码段共享的目的。





## 真实的例子

```main.c
#include <stdio.h>

int main(){
    say();
}
```

```say.c
#include <stdio.h>

void say(){
    printf("Hello world");
}
```

gcc say.c -fPIC -shared -o libsay.so

gcc -o main main.c -lsay -L /root/c/3 可以这么编译，但是运行的时候需要用 LD_LIBRARY_PATH
!!!必须是这个顺序
    gcc -o main main.c 
    gcc main.c -o main

gcc -o main main.c -lsay -L ./  如果是当前目录，一定要加上这个 slash




export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)
gcc -o main main.c


---------

-mcpu unfortunately has different semantics for different targets. It's deprecated for x86 (being a synonym for -mtune) but not for ARM, where it's a sum of -march and -mtune.

So to answer your question - on ARM, always use -mcpu for best performance, unless you care for backwards compatibility.


---------

## 关于 有-dev后缀的软件包
apt install libmysqld-dev
安装路径 /usr/include/mysql/ (包含了mysql插件开发需要的头文件,和一些链接库)
    ???如果只是包含头文件的话，那可以不用安装了，因为只是报警，但是如果包含一些链接库的话就必须要安装了

    ```
    ➜  8 gcc boy.c eat.c -o main
    boy.c:2:21: fatal error: include.h: No such file or directory
    compilation terminated.


    ---------

    去掉include 头文件，手工加载 动态库
    去掉boy.c中的 #include "include.h"
    gcc boy.c -leat -L./ -o boy
    
    但是这样会产生warning, 洁癖症患者无法忍受...
    ```

pythen-dev
liblxml2-dev
    lxml is the most feature-rich and easy-to-use library for processing XML and HTML in the Python language.
    https://lxml.de/
liblxslt1-dev


    ```
    python-dev contains the header files you need to build Python extensions. lxml is a Python C-API extension that is compiled when you do pip install lxml. The lxml sources have at least something like #include <Python.h> in the code. The compiler looks for the Python.h file during compilation, hence those files need to be on your system such that they can be found. On Linux typically, the binary libraries and header files of packages like python are separate. Hence you can have Python installed and everything works fine but when you want to build extensions you need to install the corresponding dev package.

    The header files are needed when you build the extension. The extension source code references header files of the libraries it uses. When the Python extension is built it uses the Python shared library that contains the Python API C functions and data structures. This applies not only to Python but to almost all libraries and applications you install on your system. Whenever you write a program that uses the librarie's API you need the corresponding devel package to build your program

https://stackoverflow.com/questions/31002091/what-is-python-dev-package-used-for
    ```







