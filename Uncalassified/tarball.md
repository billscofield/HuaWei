gcc
    -save-temps              Do not delete intermediate files
    -E                       Preprocess only; do not compile, assemble or link
    -S                       Compile only; do not assemble or link
    -c                       Compile and assemble([ə'semb(ə)l],集合,汇编), but do not link
    -o <file>                Place the output into <file>  仅仅是个改名的作用
    -shared                  Create a shared library

`gcc min.c`     : gcc编译器会对源文件min.c进行预处理, 编译, 以及链接, 最后生成可执行文件, 默认为a.out
`gcc -c min.c`  : gcc编译器会对源文件min.c进行预处理, 编译, 不进行链接, 最后生成的是object file (目标文件), 此处为min.o, 这属于编译过程的中间阶段, 再经过链接, 才能最终生成可执行文件.


## C 源码到可执行文件的 preprocess/compile/assemble/link 四阶段

1. preprocess
    Macro substitution 宏（#define）替换
    Comments are stripped off 删注释
    Expansion of the included files 展开包含文件（#include）的声明

    预处理可以理解成：把你所写的源代码转换成扩展的完整源代码。

    What the preprocessor does is convert the source code file you write into another source code file (you can think of it as a “modified” or “expanded” source code file).

1. Compilation
    生成汇编指令代码文件

1. Assembly
    把汇编指令翻译成二进制的目标文件（参见ELF格式）
    At this stage only the existing code is converted into machine language, the function calls like printf() are not resolved.
    注意：在不细分的情况下，可以把编译（compile）和汇编（assembly）两个过程合称为编译。

1. link
    把生成的目标文件（.obj）和库（lib）文件等链接，生成可执行（exe）文件、库（lib）文件、其他文件（如dll）等。

    **在前面几个阶段，gcc可能并不知道某些函数等的定义(例如printf())，只是在函数调用处放了个占位符(place-holder)**

    在本阶段，printf()的函数定义被解析出来，其真实地址被放入。




C预处理器（C Pre-Processor）也常简写为 CPP

cc /usr/bin/cc -> /etc/alternatives/cc -> /usr/bin/gcc


compiler
It does this by turning the C source code into an object code file, which is a file ending in “.o” which contains the binary version of the source code. Object code is not directly executable, though. 
In order to make an executable, you also have to add code for all of the library functions that were #included into the file (this is not the same as including the declarations, which is what #include does). This is the job of the linker.


linker
The job of the linker is to link together a bunch of object files (.o files) into a binary executable. This includes both the object files that the compiler created from your source code files as well as object files that have been pre-compiled for you and collected into library files. These files have names which end in .a or .so, and you normally don’t need to know about them, as the linker knows where most of them are located and will link them in automatically as needed.


sourceFile --> [preprocessor]--> newSourceFile --> [compiler]--> objectFile --> [linker+library]--> executableFile


https://blog.csdn.net/tyronne/article/details/50453737


gcc是C编译器；g++是C++编译器；linux下cc一般是一个符号连接，指向gcc；gcc和g++都是GUN（组织）的编译器。
而CC则一般是makefile里面的一个名字，即宏定义，嘿，因为Linux/Unix都是大小写敏感的系统，这点一定要注意。

cc是Unix系统的C Compiler，而gcc则是GNU Compiler Collection，GNU编译器套装。
gcc原名为Gun C语言编译器，因为它原本只能处理C语言，但gcc很快地扩展，包含很多编译器（C、C++、Objective-C、Ada、Fortran、Java）。
因此，它们是不一样的，一个是古老的C编译器，一个是GNU编译器集合，gcc里面的C编译器比cc强大多了，因此没必要用cc。


下载不到cc的原因在于：cc来自于昂贵的Unix系统，cc是商业软件。


https://blog.csdn.net/abc78400123/article/details/6827751




库的概念：一些包含编译好的代码和数据，包括一些常用的函数的文件，供程序使用。

静态库：静态库直接连接在目标代码中，保存在程序下面，后缀一般是.a。好处是不需要配置环境变量，坏处是如果这些静态库发生了改变，整个程序也需要随之改变。

动态库：这些库在程序编译时并不会被连接到目标代码中，在程序运行时才被载入，文件后缀一般是.so。这些函数库并不保存在程序下面，而是保存在环境变量中随时进行调用。好处是这些动态库的升级是单独完成的，但是缺少这些动态库，程序就无法运行，这就是为什么安装程序的时候需要先配置环境变量。







-o <file>   Place the output into <file>；指定输出文件名为file，这个名称不能跟源文件名同名
-E  Preprocess only; do not compile, assemble or link；只预处理，不会编译、汇编、链接
-S  Compile only; do not assemble or link；只编译，不会汇编、链接
-c  Compile and assemble, but do not link； 编译和汇编，不会链接

头文件中有函数的申明，库文件实现函数的定义。

比如，printf函数。使用时应包括stdio.h，打开stdio.h你只能看到，printf这个函数的申明,却看不到printf具体是怎么实现的，而函数的实现在相应的C库中。
而库文件一般是以二进制形式而不是C源文件形式提供给用户使用的。
程序中包括了stdio.h这个头文件。链接器就能根据头件中的信息找到printf这个函数的实现并链接进这个程序代码段里。
函数实现的代码从而把这段代码链接到用户程序中去。

https://zhidao.baidu.com/question/411164294.html


后面的跟版本有关，这样的话，你可以升级动态库，但是不用重新编译应用程序了啊
libxx.so 链接到 libxx.so.1,  libxx.so.1 链接到 libxx.so.1.0，libxx.so.1.0 才是真正的动态库，另2个是链接文件，优点是楼上说的 “可以升级动态库，但是不用重新编译应用程序”


“”先在当前目录查找有无该头文件，有则包含该目录下的头文件，没有则到系统指定的目录下找该头文件
<>直接到系统指定的目录下查找该文件


### 为什么不常见include .c文件
从设计角度上讲，源代码区分为.h和.c文件，是为了接口与实现的分离，实际上两者没什么本质的差别。
.h文件提供接口，.c文件提供具体的实现，两者可以一一对应，也可以不一一对应，没有强制要求。
一个.c文件做为一个模块的实现，有可能要跟其他的模块打交道，这个时候就需要include其他模块的接口(其他模块的.h文件)；
而包含其他模块的实现(.c文件)是没有意义的、危险的。

https://www.cnblogs.com/jeakon/archive/2012/05/06/2816836.html

同一个头文件可以被多次引入，多次引入的效果和一次引入的效果相同，因为头文件在代码层面有防止重复引入的机制
