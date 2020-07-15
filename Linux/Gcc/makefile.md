## 项目管理

节省编译时间

<<GNU make>>

文件名: Makefile

注释: hash

make 目标       //默认第一个目标


### 基本

目标文件:依赖文件
[TAB]指令


```
hello.i:hello.c
    gcc -E hello.c -o hello.i

hello.s:hello.i
    gcc -S hello.i -o hello.s

hello.o:hello.s
    gcc -c hello.s -o hello.o

hello:hello.o
    gcc hello.o -o hello

```

**第一个目标文件是我们的最终目标, 所以上边的代码要反过来**


```
hello:hello.o
    gcc hello.o -o hello

hello.o:hello.s
    gcc -c hello.s -o hello.o

hello.s:hello.i
    gcc -S hello.i -o hello.s

hello.i:hello.c
    gcc -E hello.c -o hello.i


感觉有点像递归

```




### 伪目标文件

**如果目标不依赖任何条件，则执行对应命令**

clear:
    rm -rf ./*.o

依据的是时间，clear没有依赖，就没有时间的概念, 不能执行，但我的可以啊

以.PHONY命名

```
.PHONY:

clear:
    rm -f ./*.o


main:say.o eat.o main.o ./inc/include.h
    gcc -o main main.o say.o eat.o

```


一般每个 .c 文件会有一个 .h 文件


```
test:circle.o cube.o main.o
    gcc circle.o cube.o main.o -o test

circle.o:circle.c
    gcc circle.c -o circle.o

cube.o:cube.c
    gcc cube.c -o cube.o

main.o:main.c
    gcc main.c -o main.o

.PNONY:clear
clear:
    rm -rf ./*.o
```

建立关系树,然后自下向上执行命令

再次执行时，会只修改修改过的文件(根据文件时间mtime，目标时间，依赖时间)

如果依赖文件是未来时间，会报警告, 但是还是可以执行

如果把.c 文件的mtime修改为过去，执行make，并没有重新执行啊

如果把mtime修改的比目标文件稍新一些，并不是未来时间，不报错，重新执行




在Makefile中，.PHONY后面的target表示的也是一个伪造的target, 而不是真实存在的文件target，注意Makefile的target默认是文件。

举个例子：
复制代码

$ cat -n Makefile1
1    clean:
2        rm -f foo
$ cat -n Makefile2
1    .PHONY: clean
2    clean:
3        rm -f foo

复制代码

Makefile1和Makefile2的差别就是在Makefile2中定义了：

1 .PHONY: clean

直接Make看看

复制代码

$ ls -l
total 8
-rw-r--r-- 1 huanli huanli 18 Jul 13 17:51 Makefile1
-rw-r--r-- 1 huanli huanli 32 Jul 13 17:51 Makefile2
$ make -f Makefile1 clean
rm -f foo
$ make -f Makefile2 clean
rm -f foo

复制代码

Makefile1和Makefile2的行为没有啥子区别嘛，呵呵

创建一个文件clean, 再make看看

复制代码

$ touch clean
$ ls -l
total 8
-rw-r--r-- 1 huanli huanli  0 Jul 13 18:06 clean
-rw-r--r-- 1 huanli huanli 18 Jul 13 17:51 Makefile1
-rw-r--r-- 1 huanli huanli 32 Jul 13 17:51 Makefile2
$ make -f Makefile1 clean
make: 'clean' is up to date.
$ make -f Makefile2 clean
rm -f foo

复制代码

区别来了，Makefile1拒绝了执行clean, 因为文件clean存在。而Makefile2却不理会文件clean的存在，总是执行clean后面的规则。由此可见，.PHONY clean发挥了作用。

小结：

.PHONY: clean
o means the word "clean" doesn't represent a file name in this Makefile;
o means the Makefile has nothing to do with a file called "clean" 
in the same directory.



#### 命令参数

参数一: -

.PHONY:clean

clean:
    rm a.o      //当a.o 不存在时，rm 返回值补位零，make 就会报错，终止执行

    -rm a.o     //命令前边加一个dash，即使这条命令出错，make 也可以继续向下执行,


    ```
    -rm -f a.o
    ```


参数一: @

不显示命令本身, 只显示结果

```
test:
    echo "hello"

make test

    '''输出结果
    echo "hello"
    hello
    '''

test:
    @echo "hello"

make test

    '''输出结果
    hello
    '''

```



### 变量

=       替换

+=      追加

:=      恒等于

变量的引用:$(变量)


make -p     //可以查看内建的命令default


```
TAR = hello

CC := gcc

OBJ = cube.o circle.o main.o

$(TAR):$(OBJ)
    $(CC) $(OBJ) -o $(TAR)

```


一些变量

CPPFLAGS= -Iinclude          //预处理
CFLAGS= -g -Wall             //编译时的参数
LDFLAGS= -L路径 -l库名       //连接时
CC=gcc                       //


```
$(target):$(obj)
    $(CC) $^ $(LDFLAGS) -o $@

%.o:%.c
    $(CC) $^ $(CPPFLAGS) $(CFLAGS) -o $@
```



### 隐含规则

```
%.c     每一个、任意的 .c 文件

%.o     每一个、任意的 .o 文件

*.c     所有的 .c 文件

*.o     所有的 .o 文件


TAR = test
OBJ = circle.o cube.o main.o
CC := gcc

$(TAR):$(OBJ)
    $(CC) $(OBJ) -o $(TAR)

%.o:%.c
    $(CC) %.c -o %.o

```

### 通配符

$@      所有的目标文件

$^      所有的依赖文件

$<      第一个依赖文件的名称


```
TAR = test
OBJ = circle.o cube.o main.o
CC := gcc
RMRF := rm -rf

$(TAR):$(OBJ)
    $(CC) $^ -o $@

%.o:%.c
    $(CC) -c $^ -o $@
```


### 函数

1. whildcard

`src=$(whildcard *.c)            //当前目录下所有的*.c


1. patsubst                        //字符串替换, 把$(src)中的%.c 换成 %.o 其他的保留
$(patsubst %.c,%.o,$(src))

    ```
    SRC=one.c two.c three.c four.h five.h
    OBJ=$(patsubst %.c,%.o,$(SRC))

    test:
        @echo $(OBJ)

        '''输出结果
        one.c two.c three.c four.h five.h
        '''

    ```



### 

distclean       //彻底清除生成**过程文件**和生成**配置文件**

install 


make -c 目录    //进入目录(通常子目录)执行该目录下的makefile

```
make -C src
```
