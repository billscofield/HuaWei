
四个核心概念。

    1. 内核
    1. 编译工具链
    1. 最小软件系统
    1. 启动过程



由一个工具链编译出来的<二进制程序文件>或<函数库文件>必然链接该工具链中的函数库
，无论静态连接方式还是动态连接方式


Glibc 特性: 自给自足
    
    Glibc 并不需要依赖其他的函数库文件就可以完成其编译链接。


内部依赖就是工具链自身依赖的函数库 与 编译链接所使用的函数库 是同一个

外部依赖则是不同的




``` 制作一个静态库并使用这个静态库

file1 f1.c #include <stdio.h>

void f1(){ print("this is f1..."); }


file2 f2.c #include <stdio.h>

void f1(){ print("this is f2..."); }


file main.c #include <stdio.h>

void f1(); void f2(); int main(){ f1(); f2(); return 0; }


// 1. 生成两个二进制文件 f1.o,f2.o gcc -c f1.c f2.c            

// 2. 生成静态库

c   Create the archive.  The specified archive is always created if it did not
exist, when you request an update.  But a warning is issued unless you specify
in advance that you expect to create it, by using this modifier.


 r  Insert the files member... into archive (with replacement). This operation
 differs from q in that any previously existing members are deleted if their
 names match those being added.

    If one of the files named in member... does not exist, ar displays an error
    message, and leaves undisturbed any existing members of the archive
    matching that name.

    By default, new members are added at the end of the file; but you may use
    one of the modifiers a, b, or i to request placement relative to some
    existing member.

    The modifier v used with this operation elicits a line of output for each
    file inserted, along with one of the letters a or r to indicate whether the
    file was appended (no old member deleted) or replaced.


 v  This modifier requests the verbose version of an operation.  Many
 operations display additional information, such as filenames processed, when
 the modifier v is appended.



ar -crv libx.a f1.o f2.o        //生成 libx.a

// 3. 使用静态库// -L 路径// -l 库名

gcc hello.c -o hello -static -L . -l x

```


``` 制作一个动态库并使用这个动态库

file1 f1.c #include <stdio.h>

void f1(){ print("this is f1..."); }


file2 f2.c #include <stdio.h>

void f1(){ print("this is f2..."); }


file main.c #include <stdio.h>

void f1(); void f2(); int main(){ f1(); f2(); return 0; }



// 1. 生成两个二进制文件(也可以没有) f1.o,f2.o 

gcc -c f1.c f2.c      


// 2. 制作动态库

gcc -fPIC -shared -o libx.so  f1.c f2.c


// 3. 使用动态库

gcc hello.ca -o hello -L . -l x

// 但是运行这个hello 文件的时候还是去 /lib/x86_64 这些个目录去查找动态库./hello
```
