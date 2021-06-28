##

标准 I/O 由ANSI C 标准定义

标准 I/O 通过缓冲机制减少系统调用，实现更高的效率
    系统调用: 通过调用操作系统提供的系统调用接口对硬件进行操作
    缓冲: 多很多数据到缓冲区，以减少系统调用

流 
    FILE结构体

        标准 I/O 用一个结构体类型来存放打开的文件的相关信息

        标准 I/O 的所有操作都是围绕FILE来进行

    流(stream)
        文本流
        二进制流

        windows中，文本流中换行符是 \r\n  二进制流是 \n
        linux中换行符均是\n

缓冲的类型
    全缓冲
        当流的缓冲区无数据或无空间时才执行实际I/O操作
        打开文件时默认

    行缓冲
        当在输入和输出中遇到换行符时，进行I/O操作
        当流和一个终端关联时，典型的行缓冲

    无缓冲
        数据直接写入文件，流不进行缓冲
        错误相关


标准IO预定义了3个流:stdin,stdout,stderr
    stdin   0   STDIN_FILENO
    stdout  1   STDOUT_FILENO
    stderr  2   STDERR_FILENO

一组专门用于IO操作的函数


## 打开流

```
FILE *fopen(路径, 模式)

模式
    r 或 rb     ：文件必须存在，以只读方式打开文件,r:文本流；rb:二进制流
    r+ 或 rb+   : 文件必须存在，以读写方式打开文件
    w 或 wb     : 以只写方式打开文件，若文件存在则文件长度清零，不存在则创建
    w+ 或 wb+   : 以读写方式打开文件，其他同 w
    a 或 ab     : 以只写方式打开文件，不存在则创建，向文件写入的数据被追加到文件末尾
    a+ 或 ab+   : 以读写方式打开文件，其他同 a

    当给定 b 参数时，表示以二进制方式打开文件，但linux中忽略该参数




fopen() 创建的文件访问权限是 0666

umask 与操作
    666
    022取反
    ---
    644
    
```

处理错误信息
    ```
    extern int errno

    void perror

    char *strerror
    ```

关闭流

```
int fclose(FILE *stream);

```







fd: file description

文件IO操作:
    open
    clsoe
    read
    write
    lseek


