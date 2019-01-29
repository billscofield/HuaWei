# shell

```
\< 词首
\> 词尾
\b 既可以表示词首，也可以表示词尾
```

默认贪婪

[^.] 除了“.”

[:alpha:]

正向匹配 \1 代表的是第一个的匹配，而不是这个表达式
(exp) （exp)  \1  \2

:%s/xyz/&er/g
    & 代表xyz, 即查找项

\b([0-9]{1,3}\.){3}[0-9]{1,3}\b

\b 应该是和vim关于单词的定义是一样的，
    

### .sh文件自动添加注释，文件头

```
autocmd BufNewFile *.sh exec ":call setTitle()"

function setTitle()
    if expand("%:e") == 'sh'
    call setline(1,"#!/bin/bash")
    call setline(2,"#")
    call setline(3,"#*********************************")
    call setline(4,"#Author:                BillScofield")
    call setline(5,"#DATE:                  ".strftime("%Y-%m-%d"))
    call setline(6,"#FILENAME:              ".expand("%"))
    call setline(7,"#*********************************")
    call setline(8,"")
    endif
endfunc
```

## 脚本中的错误
1. syntax error 会立刻停止执行
1. command not found  不会影响下面的命令的执行
    1. 后续的操作可能就是错误的

1. 检查错误
    1. 语法错误    bash -n a.sh

1. 脚本的执行过程，每一步都会输出（有输出的情况下），
    1. bash -x a.sh
    1. + 一个加号代表外层输出
    1. ++ 两个加号代表再进一层的输出

## bash
1. -i  interactive
1. -r  restricted shell
1. --  any arguments after -- are treated as filenames and arguments. - is equal to --



## 变量    

= 左右不能有空格

name="BILL"

带有特殊符号的时候，要叫上双引号，最好是都加上双引号

```
命令被引用 ``
```

### 双引号保留格式
name=`cat /etc/fstab`
echo $name  //没有换行的格式
echo "$name"    // /etc/fstab 中是什么格式就按照什么格式输出, 保留格式

### 关于赋值
重新赋值  会重新找一个空间放，原来的还在

name1=1
name2=2
name3=3

name4=$name1
name1=11

echo $name1 还是1

### 变量类型
弱类型

i=100 被当成了字符串

**不支持浮点数**

变量名
    1. 驼峰命名法
    1. 字母、数字、下划线
    都可以,注意要统一

#### 变量种类
1. 局部变量，标准变量，普通变量
    1. 只在当前session中有效
    1. 子进程也不能使用父进程的变量
    1. 不能向上传递，也不能向下传递

1. 全局变量
    1. bash 是后台执行
    1. 全局变量定义
        export name="Xian"

        或者

        name="xian"
        export name

        如果之前定义了局部变量a,export a 可以将其升级为全局变量
    1. 可以向下传递
        1. 子进程可以改，但是不能向上传递
    
    1. declare -x 也可以声明全局变量

    **加不加双引号的原则：这个命令能否识别它**

    set 可以显示所有变量，和一些函数

1. 查所有环境变量
    1. env
    1. printenv
    1. export
    1. declare -x

1. 变量的删除
    1. unset name

1. 系统内置变量

1. 自定义变量


${name}
$name


lscpu
/proc/meminfo
lsblk   硬盘大小
`date +%F`

echo -e "\e[031;31m内容\e[0m"
    -e : enable interpretation of backslash escapes

1. bash 嵌套
    1. echo $$  //当前进程的进程编号
    1. echo $PPID   //父进程的进程编号
    1. pstree  直观的看进程编号
        1. pstree -p


SHLVL   当前shell 深度，第一个为1

`$_`  前一个命令的最后一个参数

只读变量（常量）
readonly name="bcd"
declare -r
    也不能unset,退出就没有了，进程的声明周期

显示所有常量
    1. declare -r 
        UID
        父进程
    1. readonly -p
    
### 小括号
umask 026;touch /data/f1    640
umask 026;touch /data/f2    640

(umask 026;touch /data/f1)  仅仅这一次，**一次性**
    ()  开启了子shell ,subshell

(cd /data;rm -rf /data/)    作业完成后，又回到之前的shell

x=1;echo "pid=$$";(echo "subpid=$$";echo "subx=$x";x=2;echo "subx2=$x");echo x=$x

**小括号这种subshell 和普通的 subshell 不同**
    1. 它的进程ID 和父进程ID一样
    1. 父进程的变量会向子shell传递
    
    共同点
        1. 不会向上传递



### 大括号
{;} //最后一个命令是有分号的
{name="aaa";echo $name;}
就是在本shell中执行，类似于数学运算中的优先级吧


### 位置变量
1. $1 $2 $3 

baskup.sh a b c
$1 就是a
$2 就是b
$3 就是c
...

1. $#   参数个数
1. $0   脚本名称（完整路径名字） 
    1. 软连接 的话显示 软连接的名字
1. $@   所有参数,**每个参数为独立字符串**
1. `$*` 传递给脚本的所有参数，**全部参数合为一个字符串**



```
a.sh
echo "----------"
echo 1st is $1
echo 2st is $2
echo 3st is $3
echo 10st is ${10}      否则会认为是$1+0   
echo "所有参数 $@"
echo "参数个数 $#"
echo "文件名 $0"

**echo "文件名 `basename $0`"**    去掉路径 
    `basename $0`


a.sh one two three four

```

小例子

```
a.sh

echo "start to copy..."
scp $1 wang@192.168.1.2:/home/wang/work/
echo "copy finished!!!"

增强版本是下边，$* 复制多个文件
scp $* wang@192.168.1.2:/home/wang/work/
能不能换成$@呢???
```

```
$* $@ 的区别

a.sh
echo "a.sh:all arg are $*"
./b.sh "$*"  //$* 所有参数作为一个整体字符串,必须加上双引号才是一个整体
# ./b.sh "$@"   //$@ 每个参数作为一个独立的字符串


b.sh
echo "b.sh:1st arg is $1"




```

**set-- 清空所有位置变量**


```
a.sh
echo $0

link -s a.sh link.sh
./link.sh   输出link.sh

```

whereis pidof
**$0 不一样可以通过程序造成软连接功能不一样**
pidof 直接运行 和 运行源文件 结果不一样 //类$1



shift 命令   把第一个移出去
```
a.sh
echo $1
echo $2
echo $3
shift


echo $1
echo $2
echo $3
shift


echo $1
echo $2
echo $3


输出123 23  3

shift 默认移1位
shift 2


#!/bin/bash
while [ $# != 0 ];do
echo "第一个参数为：$1,参数个数为：$#"
shift
done
```

**$? =0 表示前一条命令执行成功**
    前一条命令的执行结果状态

    对于脚本而言，也是前一条命令的结果状态

    **一个脚本返回的结果是最后一条命令决定的**

    **和是否有语法错误决定的**


**退出状态码**
    exit    
    exit 10





## hash
1. 简介
    1. linux系统下会有一个hash表，当你刚开机时这个hash表为空，每当你执行过一条命令时，hash表会记录下这条命令的路径，就相当于缓存一样。

    1. 第一次执行命令shell解释器默认的会从PATH路径下寻找该命令的路径，当你第二次使用该命令时，shell解释器首先会查看hash表，没有该命令才会去PATH路径下寻找。
    1. hash表的作用：
        1. 大大提高命令的调用速率。

1. 命令
    1. help hash
    1.  hash -l             //--long
        1. 查看hash表中的内容

    1. hash -p /bin/ls bb
        1. 把ls命令重新写了一遍，改名为bb

    1. hash -t ls　　//-t参数可以查看hash表中命令的路径
        1. hash表中没有记录这个命令的话，就是not found

    1. hash -r
        1. 清空hash表
    1. hash -d bb
        1. 清除某一条



## 算数运算
x=10
y=20

$x+$y 输出10+20


let $x+$y
    help let
    let:专门做数据运算
        z=x+y
        z=$x+$y
    let x++

sum=$[x+y]
sum=$[$x+$y]
sum=$((x+y))

var=expr 1 + 2  //expr是命令，参数间要有空格
var=expr 1 \* 2
var=$(expr 1 \* 2)


##  短路
false && cmd2;cmd3
true || cmd2;cmd3

鸡蛋里边挑骨头

### XOR 异或
0^1 -> 1
0^0 -> 0
1^1 -> 0
1^0 -> 0

declare -i x=10 //声明为数字








COLOR=$[RANDOM%7+31]




## to review

远程桌面  xrdp
    https://blog.csdn.net/sinolover/article/details/78673625



unzip 用法
    https://blog.csdn.net/qq_35399846/article/details/70168002



# 吴光科
echo "!!!"  //! 在shell中有什么特殊用处吗?

echo $UID
    $PWD

$0 也可以这样理解，bash 的第一个参数 即文件本身


## if 语句

```
if ();then
    COMMAND
else
    COMMAND
fi



if 
then
    COMMAND
else
    COMMAND
fi




if 
then

elif
then

else

fi
```

-f  判断文件是否存在    if [ -f FILENAME ]
    
    ```
    FILE=/data/a.txt
    if [ ! -f $FILE ];then
        echo "">>$FILE
    else
        echo "exists"
    fi 
    ```

-d  判断目录是否存在    if [ -d DIR ]
    
    ```
    if [ ! -d /data/newyear ];then
        mkdir -p /data/newyear
    else
        echo "the Direction exists"
    fi
    ```

-eq 等于，用于：整型比较
    
    ```
    score=$1

    if [ -z $score ];then
        echo "please input"
        exit
    fi


    if [[ $score -gt 90 ]];then
        echo "very good"
    elif [[ $score -gt 60 ]];then
        echo "good"
    else
        echo "bad"
    fi

    ```
    数字比较用 [[]] , 文件、目录用[]??

-ne 不等于

-lt little than
-le little or equal
-gt greater than
-ge greater or equal

-a  and
-o  or
-z  空字符串

! 取反, 要有一个空格

1. []
    要有空格

1. 在bash中，$( )与` `（反引号）都是用来作命令替换的。
    命令替换与变量替换差不多，都是用来重组命令行的，先完成引号里的命令行，然后将其结果替换出来，再重组成新的命令行。

    ```
    echo today is $(date "+%Y-%m-%d")
    echo today is `date "+%Y-%m-%d"`
    ```

    $( )的弊端是，并不是所有的类unix系统都支持这种方式，但反引号是肯定支持的。

    echo Linux `echo Shell $(echo today is $(date "+%Y-%m-%d"))`
        这种嵌套的情况下，单单使用反引号会出现问题, 多个$()同时使用也不会有问题



1. 一般情况下，$var与${var}是没有区别的，但是用${ }会比较精确的界定变量名称的范围

    ```
    A=Linux
    echo ${A}B  //输出LinuxB
    echo $AB    //表示变量AB
    ```


### MySQL 备份

```
#!/bin/bash
# auto backup mysql db

# 备份路径
BACK_DIR=/data/backup/`date +%F`

# 是否是root用户
if [ $UID -ne 0 ];then
    echo "must root"
fi

# 创建备份路径
if [ -d $BACK_DIR ];then
    mkdir -p $BACK_DIR
fi

# 备份
MYSQL_DB=discuz
MYSQL_USER=backup
MYSQL_PW=1234
MYSQQL_CMD=/usr/bin/mysqldump

# 备份命令
$MYSQL_CMD -u$MYSQL_USER -p$MYSQL_PW -d$MYSQL_DB > $BACK_DIR/$MYSQL_DB.sql

if [ $? -eq 0 ];then
    echo "success"
else
    echo -e "failed"
fi
```



## for
```
for 变量 in 字符串
    do
        语句
    done


for i in `seq 1 10`
    do 
        echo $i
    done


j=0
for ((i=1;i<=100;i++))
    do
       j = `expr $i + $j` 
    done




打包数个文件
for i in `find ./ -name "*.log"`
    do
        tar -zcvf $i.tar.gz $i//还有问题
    done


批量传输文件scp


    ```
    FIELS=$*
    for i in 
        do 
            scp -r $FILES root@192.168.1.1
    done
    ```


## 各种shell
1. AIX 下的Korn Shell, 即ksh
1. Solaris 下的 Bourne Shell, 即bsh
1. FreeBSD 下的C Shell, 即csh
1. HP-UX 下的POSIX Shell
1. Linux 下的Bourne Again Shell, 即bash

cat /etc/shells


    ```
    find ./ -name a[b.]*
        这个为什么报错呢?

    find ./ -name a[b.].*

    find ./ -name "a[b.]*"


    当前目录下 有 a.sh ab.sh
    ----

    a.txt ab.txt c.txt b.txt
    find ./ -name "[!a]*"
    find ./ -name "[! a]*"
        这两个与预期相同
    find ./ -name "[ ! a ]*"

        这三条命令为什么不一样呢?


    
    ```


    标准输出+错误输出 合并到一个文件

| tee 文件      T型管道
    
## 文件通配符
*
?
[]
[字符1,字符2,字符3]
[开始字符-结束字符]
[! 字符]

## 输入输出重定向符 与 管道符
1. <       标准输入重定向
1. >       标准输出重定向
1. 2>      标准错误输出重定向
1. &>      标准输出合并重定向
1. >>      标准输出追加重定向
1. |       管道
1. | tee   T型管道
    1. 将前一个命令的**标准输出**存入一个文件中，并传递给下一个命令作为标准输入
        用法:   命令 | tee 文件 | 命令



## 命令执行控制符
1. ;    顺序执行
1. &&   逻辑与
1. ||   逻辑或
1. &    后台执行

## 命令替换符号
1. ""   
1. ''   阻止shell解析变量
1. ``   把执行命令的结果存放在变量中

## 元字符
1. #        注释符号
1. $        变量的引用符号
1. 空格     分隔符，用来分隔 命令名、参数、选项

## 转义符
1. \



## 环境配置文件
全局环境变量配置文件：/etc/profile , /etc/bashrc
用户环境变量配置文件：~/.bash_profile , ~/.bashrc
读取顺序：
    1. /etc/profile         //每个用户都会加载
    1. ~/.bash_profile      //仅当用户登陆时，加载一次；

    1. ~/.bashrc            //当用户登陆时，每次打开新shell时，该文件被读取
    1. /etc/bashrc          //每个用户，当bash被打开时，该文件被读取
