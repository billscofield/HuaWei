
## 

| 
| 
| +-----------+
| |Source File|
| | hello.c   |-----------+
| +-----------+          \|/
|                        +---------------+      +---------+         +-------------+     +---------+      +------------+
|                        |+-------------+|      |         |       \ |+-----------+|     |         |     \|+----------+|
|                        ||Preprocessing||----> | hello.i |-------> ||Compilation||---->| hello.s |----->|| Assembly ||
|                        ||(cpp)        ||      |         |       / ||(gcc)      ||     |         |     /|| (as)     ||
|                        |+-------------+|      |         |         |+-----------+|     |         |      |+----------+|
|                        +---------------+      +---------+         +-------------+     +---------+      +------------+
| +-----------+          /|\                                                                                |
| |Header File|-----------+                                                                                 |
| | tdio.h    |                                                                                            \|/
| +-----------+                                                                                          +-------------+
|                                                                                                        | Object File | 
|                                                                                                        | hello.o     | 
|                                                                                                        +-------------+
|                                                                                                           |
|                                                                                                           |
|                                                                                                          \|/
|                                                                           +----------------+           +-------------+
|                                                                           | Static library |---------->|+-----------+|
|                                                                           | libc.a         |           || Linking   ||
|                                                                           +----------------+           || (ld)      ||
|                                                                                                        |+-----------+|
|                                                                                                        +-------------+
|                                                                                                           |
|                                                                                                           |
|                                                                                                          \|/
|                                                                                                        +-------------+
|                                                                                                        | Executable  |
|                                                                                                        | hello       |
|                                                                                                        +-------------+


编译是最核心也是最复杂的过程, 生成汇编文件


    objdump 

        -h, --[section-]headers  Display the contents of the section headers
        
        -x, --all-headers        Display the contents of all headers

    readelf 

    ```
    readelf -h a.out

    ELF Header:
      Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00
      Class:                             ELF64
      Data:                              2's complement, little endian
      Version:                           1 (current)
      OS/ABI:                            UNIX - System V
      ABI Version:                       0
      Type:                              DYN (Shared object file)
      Machine:                           AArch64
      Version:                           0x1
      Entry point address:               0x660
      Start of program headers:          64 (bytes into file)
      Start of section headers:          7496 (bytes into file)
      Flags:                             0x0
      Size of this header:               64 (bytes)
      Size of program headers:           56 (bytes)
      Number of program headers:         9
      Size of section headers:           64 (bytes)
      Number of section headers:         29
      Section header string table index: 28
    ```



目标文件只是没有经过链接的过程，它本身的格式就是按照可执行文件的格式存储的，只是结构稍有不同

动态链接库 .so 和 核心转储文件 core dump 也都是 elf 格式存储的

elf 文件的内容是按照所谓的'段'的形式（section）存储的

    详细请看 man elf


链接

    各个源代码的模块都进行独立的编译，链接就是要处理各个模块之间的相互引用，使他们能够想需衔接。

    gcc 默认是链接动态库

    静态: --static 参数
        
        gcc -o hello_static --static hello.s
            
        gcc -o hello_static --static -v hello.s
            
            -v 打印详细过程


    
