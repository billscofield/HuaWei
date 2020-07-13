## 项目管理

节省编译时间


文件名: Makefile

注释: hash


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

以.PHONY命名

```
.PHONY:

clean:
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

.PNONY:
clear:
    rm -rf ./*.o
```


### 变量

=       替换
+=      追加
:=      恒等于


```
TAR = hello

CC := gcc

OBJ = cube.o circle.o main.o

$(TAR):$(OBJ)
    $(CC) $(OBJ) -o $(TAR)

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


$^      所有的目标文件
$@      所有的依赖文件
$<      第一个依赖文件的名称


```
TAR = test
OBJ = circle.o cube.o main.o
CC := gcc
RMRF := rm -rf

$(TAR):$(OBJ)
    $(CC) $@ -o $^

%.o:%.c
    $(CC) -c $@ -o $^
```



