https://www.jianshu.com/p/da47338a7408


1. set命令介绍

set命令主要用来设置shell，在编写shell脚本时，使用set命令能设置shell的执行方式，
根据需求不同，采用的参数设置也不同。set命令也用来显示系统中已存在的shell变量以
及设置新的shell变量。


2. set命令的常用参数及作用

set

不带参数的set命令用来显示环境变量。


## set -e 

-e参数表示只要shell脚本中发生错误，即命令返回值不等于0，则停止执行并退出shell。
set -e在shell脚本中经常使用。默认情况下，shell脚本碰到错误会报错，但会继续执行
后面的命令。

test.sh脚本内容如下：

```

#!/usr/bin/env bash
set -e

hello
echo "Hello set"

```

执行结果如下：

```

root@3500f62fe5ae:/workspace# sh test.sh
test.sh: 4: test.sh: hello: not found

```

注：set +e表示关闭-e选项，set -e表示重新打开-e选项。


## set -u

-u参数表示shell脚本执行时如果遇到不存在的变量会报错并停止执行。默认不加-u参数的情况下，shell脚本遇到不存在的变量不会报错，会继续执行。

test.sh脚本内容如下：

```
#!/usr/bin/env bash
echo $test

set -u
echo $hello

```

执行结果如下：

```

root@3500f62fe5ae:/workspace# sh test.sh

test.sh: 5: test.sh: hello: parameter not set

```
