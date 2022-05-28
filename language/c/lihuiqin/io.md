# 是一切实现的基础

## 

stdio 标准IO

sysio 系统IO(文件IO)

优先使用标准 IO

|
|
|-------------------+       +
|                   | stdio |
|   user sysio       +-------+
|----------------------------
|   kernel space


一. sysio系统调用IO(文件IO)：

    kernel为用户提供的一组函数，用于让我们能对话kernel。所以我们可以通过系统调
    用IO 直接对话kernel。

    思考：既然系统调用IO 是kernel 提供的，那么不同的系统，他们的kernel 可能是不
    一样的，比如Linux 系统和 Windows 系统，所以他们提供的系统调用IO也是不一样的，
    这就给我们程序员造成了困扰，因为如果一个需求跨平台实现，因为每个系统提供的
    系统调用IO 不同，导致不同的平台分别实现一遍我们的程序是很头疼的，所以针对不
    同平台的差异，就推出了标准IO。

二. stdio 标准IO

    标准IO 是依赖于系统调用IO 来实现的如 printf()，他就是我们标准IO 中的一个，
    我们在使用 printf()的时候，不会去考虑具体的环境与平台，这是因为标准IO 是调
    用了 各个平台的系统调用IO 从而实现了与kernel 的交互。标准IO 推出来后，各个
    系统都要支持标准IO ,如标准IO 要调用 打印 打开 关闭 等操作，那么不论当前平台
    系统怎么做，不论他用什么系统调用IO 去支撑标准IO的对应功能，一定要实现对应功
    能。所以我们不论在什么系统，都可以使用标准IO 。

    所以stdio 是 依赖于 sysio 来实现的，但是不同系统对标准IO 的支持是不一样的，
    比如：标准io :fopen() ，在 LINUX 系统中 依赖的系统调用IO 是 open()，而在
    Windows下依赖的系统调用IO是openfile()。所以 open() 与 openfile()就是系统
    kernel 提供出来的系统调用IO ，fopen()就是标准IO ，我不论在Linux 系统还是在
    Windows系统中调用 fopen() 都能够打开一个文件。


## 标准IO

FILE 类型
    typedef 出来的



fopen()

    ```
    FILE *fopen(const char *pathname, const char *mode);


    Upon successful completion fopen(), fdopen(), and freopen() return a FILE
    pointer.  

    Otherwise,  NULL is returned and **errno** is set to indicate the error.
        
        errno: 最初是全局变量, 现在是私有数据, 宏
        
        /usr/include/asm-generic/errno-base.h           //看这个
        /usr/include/asm-generic/errno.h
        
        ./x86_64-linux-gnu/sys/errno.h
        ./x86_64-linux-gnu/asm/errno.h


    ```

延展

    /usr/lib/x86_64-linux-gnu is the multiarch folder for libraries built for
    64-bit x86 on Linux using the GNU C library.     

    /usr/lib is the historical folder for libraries built for the system; you’
    ll still find libraries there because quite a few packages don’t follow the
    multiarch spec.



mode:

    The argument mode points to a string beginning with one of the following
    sequences ( possibly  followed by additional characters, as described
    below):  比如 rabcd, 只会读到第一个字符r


    r      Open text file for reading.  The stream is positioned at the beginning of the file.

    r+     Open for reading and writing.  The stream is positioned at the beginning of the file.



    w   Truncate file to zero length or create text file for writing.

    w+  Open for reading and writing. 
        
        The file is created if it does  not  exist,  otherwise  it  is
        truncated. 
        
        The stream is positioned at the beginning of the file.

    a   Open  for appending (writing at end of file). 
        
        The file is created if it does not exist.
        
        The stream is positioned at the end of the file.
        
        最后一个字节的下一个位置

    a+  Open for reading and appending (writing at end of file).

        The file is created if it does  not exist.
        
        Output  is always appended to the end of the file.
        
        POSIX is silent on what the initial read position is when using this mode.
        
        For glibc, the initial file position for reading is at the beginning
        of the file, but for Android/BSD/MacOS, the initial file position for
        reading is at the end of the file.


    the 'b' is ignored on all POSIX conforming systems, including Linux.


    返回值在[堆]上
        malloc(sizeof(FILE));

    fclose
        
        有逆操作的一般是在堆上



fclose()

    int fclose(FILE *stream);

    Upon successful completion, 0 is returned.

    Otherwise, EOF is returned and errno is set to indicate the error.

    In either case, any further access (including another call to fclose()) to
    the stream results in undefined behavior.


    默认打开文件时，开了3个流 stdin stdout stderr

    ```
    #include <stdio.h>
    #include <errno.h>

    int main(int argc, char *argv[]){

        FILE *p = NULL;
        
        int count = 0;
        
        while(1){
            p = fopen("temp","r");
            if(p == NULL){
                perror("fopen()");
                break;
            }
            count++;
        }
        printf("%d\n",count);
    }

    输出 1021
    加上 stdin stderr stdout  = 1024

    ulimit -a           
        open files / file descriptors
            一个进程能打开的最大文件数

```





---

fgetc();
    int fgetc(FILE *stream);    // 函数, 返回 int
    int getc(FILE *stream);     // 宏, 返回 int

    字符

    1. getchar() is equivalent to getc(stdin).

    2. getc() is equivalent to fgetc() except that it may be implemented as a
       macro which evaluates stream more than once.

    fgetc(), getc(), and getchar() return the character read as an unsigned
    char cast to an int or **EOF** on end of file or error.


fputc();
    int fputc(int c, FILE *stream);
    int putc(int c, FILE *stream);
    int putchar(int c);

    fputc() writes the character c, cast to an unsigned char, to stream.

    putc()  is  equivalent  to  fputc()  except  that it may be implemented as a
    macro which evaluates stream more than once.

    putchar(c) is equivalent to putc(c, stdout).

    fputc(),  putc(), and putchar() return the character written as an unsigned
    char cast to an int or EOF on error.




---

fgets();
fputs();

---


fread();
fwrite()

---


printf();
scanf();

---


fseek();
ftell();
rewind();

---


fflush();




行缓冲: 
    换行的时候刷新
    满的时候刷新
    强制刷新
    终端设备是这样的

全缓冲
    满的时候刷新
    强制刷新
    (默认，只要不是终端设备)
    对磁盘文件通常使用全缓存访问
    
无缓冲
    需要立即输出的内容， 如 stderr


setvbuf
    _IONBF unbuffered
    _IOLBF line buffered
    _IOFBF fully buffered


getline



临时文件

    1. 如何不冲突

    2. 及时销毁


## 文件IO/系统调用IO

文件描述符是在文件IO中贯穿始终的类型

### 文件描述符

fd
    1. 是一个整型数
    2. 是一个数组下标
    3. fd优先使用当前可用范围内最小的

数组array
+---+
|   |       结构体      inode
|   |       +---+       +---+
|   |------>|   |---->  |   |
|   |       |   |       +---+
|   |       +---+
|   |
|   |
|   |
+---+

array[0]    STDIN_FILENO        定义在 /usr/include/unistd.h
array[1]    STDOUT_FILENO
array[2]    STDERR_FILENO



```
FILE *fdopen(int fd, const char *mode);     // 返回文件指针
int fileno(FILE *stream)                    // 返回文件描述符
```



标准IO肯定有个 fd


typedef struct iobuf{
    int cnt;            // 剩余的字节数
    char *ptr;          // 下一个字符的位置
    char *base;         // 缓冲区的位置
    int flag;           // 文件的访问模式
    int fd;             // 文件描述符
}FILE;

|
|                                           FILE 类型 结构体变量
|                                           +--------+
|                                           |        |                                  +------+
|                                           |  base ---------------->  缓存 <---------->| 键盘 |
|   用户程序 -> 标准IO函数 -> FILE sp ->   |        |                  /|\             | 屏幕 |
|                                           |  prt  ---------------------+              | 文件 |
|                                           +--------+                                  +------+
|   


base 指向整个缓存的地址

ptr 指向缓存中的某个





### 文件IO操作

1. open
2. close
3. read
4. write
5. lseek

标准IO函数都是基于上边几个函数

**这些不带缓存的函数都是内核提供的系统调用**

他们不是 ANSI C 的组成部分，但是 POSIX 的组成部分


|       +-----------------------------------+
|       |                                   |
|       |                   +----------+    |
|       |        +--------->| 应用代码 |    |
|       |        |          +----+-----+    |
|       |       \|/              |          |   用户进程
|       |   +----+----+          |          |
|       |   | C库函数 |          |          |
|       |   +----+----+          |          |
|       |        |               |          |
|       +--------|---------------|----------+
|                |               |
|               \|/             \|/
|       +-----------------------------------+
|       |                                   |
|       |             系统调用              |   内核
|       |                                   |
|       +-----------------------------------+

标准io 通过 FILE 对文件进行操作，其实也是 fd
系统调用基于 fd 对文件进行操作


#### 1. open

man 2 open

```
int open(const char *pathname, int flags);
    oflag: 位图

int open(const char *pathname, int flags, mode_t mode);
    有 create 时要用这个

    重载, 写多个参数，语法错误
    变参, 写多个参数，




flags:
    
Values for oflag are constructed by a bitwise-inclusive OR of flags from the
following list, defined in <fcntl.h>. Applications shall specify exactly one of
the first three values (file access modes) below in the value of oflag:

1. O_RDONLY

    Open for reading only.

2. O_WRONLY

    Open for writing only.

3. O_RDWR

    Open for reading and writing. The result is undefined if this flag is
    applied to a FIFO.

---

读cache
写buffer

O_CREAT

O_EXCL
    必须打开一个新的

O_TRUNC
    截断

O_APPEND

O_ASYNC

O_DIRECT

O_DIRECTORY

O_LARGEFILE

O_NOATIME

O_NOFOLLOW

O_NONBLOCK
    非阻塞, 

O_SYNC
    同步



    ```
    r   -> O_RDONLY
    r+  -> O_RDWR
    w   -> O_WRONLY | O_CREAT | O_TRUNC
    w+  -> O_RDWR | O_TRUNC | O_CREAT
    ```



返回值

    Upon  successful  completion,  these functions shall open the file and
    return a non-negative integer representing the file descriptor.

    Otherwise, these functions shall return **-1** and set errno to indicate
    the error.

    If -1 is returned, no files shall be created or modified.
```


#### 2. close

int close(int fd);

close() returns zero on success.  On error, -1 is returned, and errno is set
appropriately.


#### 3. read

```
ssize_t read(int fd, void *buf, size_t count);
    buf 读到 buf


return 
    On success, the number of bytes read is returned (zero indicates end of file)

    On  error,  -1  is  returned,  and errno is set appropriately.

```


#### 4. write

```
ssize_t write(int fd, const void *buf, size_t count);

    从 buf 读


return 
    
    On  success, the number of bytes written is returned.(0 indicates nothing was written )

    On error, -1 is returned, and errno is set to indicate the cause of the
    error.

```



#### 5. lseek

```
off_t lseek(int fd, off_t offset, int whence);
    SEEK_SET
    SEEK_CUR
    SEEK_END


Upon successful completion, lseek() returns the resulting offset location as
measured in bytes from the  beginning of the file.

On error, the value (off_t) -1 is returned and errno is set to indicate the
error.

```

```



```






### 文件IO和标准IO的区别

响应速度 & 吞吐量

标准IO 和文件IO 不可以混用

```
int fileno(FILE *stream);


FILE *fopen(const char *path, const char *mode);
```

### IO效率问题


### 文件共享


### 原子操作


### 程序中的重定向 dup, dup2


### 同步

sync

fsync

fdatasync

fcntl();        // f control
ioctl();        // io control

/dev/fd/
