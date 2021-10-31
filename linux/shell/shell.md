
1. 系统初始化

2. 自动化安装程序

3. 自动化调整配置文件

4. 自动化部署业务

5. 定期备份恢复程序

6. 自动化信息采集(zabbix + shell)

7. 自动化日志收集(ELK)
    
    1. 收集 -> 存储 -> 展示

8. 自动化扩容/缩荣(zabbix + shell)


## SHELL

拿鸡蛋做例子更好哈哈

离不开逻辑判断 和 循环遍历

正则表达式三剑客：grep sed awd 无处不在

查看环境变量

    echo $PATH

查看Shell

    echo $SHELL

查看linux支持的shell

    cat /etc/shells  

    输sh就进入到sh了

    不同的shell切换是有父子关系的,一层一层下去的

history => ~/.bash_history文件

    由 $HISTSIZE配置 -> ~/.bashrc HISTSIZE=1000
    source ~/.bashrc 或者 重新进入终端
    history -c(clear),会清除内存，但不会清空.bash_history
    HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S" 写进~/.bashrc
    chattr +a ~/.bash_history //只能追加，不能删除文件
    !! 最后一条命令
    !99 第99条命令
    !word 倒叙第一个 word 开头的命令

### 命令补全及别名

sudo apt-get install bash-completion(ubuntu 默认安装了)

    一次，两次 tab

alias 
    ~/.bashrc

unalias

### 通配符

```
*:任意多个
```

?:一个任意字符

[]:[0-4]/[abc]

{}:{1,2,3,a,b} 同[]或


### 输入输出重定向

cat 1.txt > 2.txt

ls aaa 2> err //错误重定向

ls aaa 2>> err //错误追加重定向

ls &> a.txt //&> 错误的和正确的都会有作用

ls &>> a.txt //&> 错误的和正确的都会有作用

ls >right.txt 2>err.txt

wc -l < 1.txt

### 管道符号 作业控制

cat a.txt \| grep "aaa"

ctrl + z :挂起

jobs:列出挂起的程序

fg 号码:调到前台运行

bg 号码:调到后台运行

sleep:sleep 秒数

sleep 100 & ：直接丢到后台运行，但是jobs 看不到这个进程

### 变量

自定义变量
系统环境变量
预先定义变量
位置参数变量
内置变量
    continue、break、exit

    强引用
    弱引用

#### 变量=值

= 两边不能有空格

变量值有特殊字符时需要用单引号括起来
    a='a b c' 
    单引号脱意
    a="a$bc"
    双引号不脱意

```
a=1
b=2
c=3
c="a$b" -> a2
c="a$bc" -> a //$bc当做一个变量
c= "a$b"c -> a2c
echo ${STR}s is greate

---

a=1
b=2
c=$a+$b
echo $c | bc

```

unset

PATH , HOME , PWD , LOGNAME , LANG

env : 列出系统变量	

set : 列出系统的、用户的变量


```
a=11

set \| grep a

```
查看 tty

```
w   
echo $SSH_TTY   
echo $TTY
pstree   
```





#### 系统环境变量


#### 预先定义变量

```
$0
$*  所有参数
$@  单独每一个参数
$#  个数
$?
$$  当前进程的PID
$!  上一个后台进程的PID
$_  上一个命令的最后一个参数

$UID
$HOME

```

#### 全局变量

export a=1

仅在子shell中生效

#### 静态变量

readonly B=2 声明静态的变量 B=2，不能 unset

#### 反引号赋值

```
a=`ls -l`

```

a=$(ls -l) //等价于反引号

### 环境变量配置文件

/etc/profile

/etc/bash.bashrc

 PS1变量:命令行最左边的部分

~/.profile

~/.bashrc

~/.bash\_history

~/.bash\_logout

source <==> .

 source ~/.bashrc

 . ~/.bashrc

### 特殊符号

1. 

1. ?

1. #注释

 #ls 

1. \\ 脱义

1. \| 管道符

 cut 截取


### 默认变量(变量替代)

```方式一
echo ${url-www.baidu.com}
如果没有设置url, 则输出 www.baidu.com
```


a=
echo ${a-z.cn} 输出空


```方式二
echo ${url:-z.cn}
```

变量没有值或者为空值，都会使用新的变量

a=
echo ${a:-z.cn} 输出z.cn


没有被赋值，即没有使用a=, 表现都一样
主要区别
    a=
    ${a-z.cn}  输出空
    ${a:-z.cn} 输出z.cn




## 数学运算

### 整数运算

1. expr

expr $a + $b
expr $a + 2


2. $(())

```
$((3+2))
$(( 3+2 ))
$(( 3 + 2))
$(( 3 ** 2))

```

3. $[]

```
echo $[3*4]
echo $[ 3*4 ]
echo $[ 3* 4 ]
echo $[ 3 * 4 ]
```

4. let

```
let a=3*22
let a='3 * 22'

i=1
let i++
let i+=2
let ++i
```

### 小数运算用 bc

echo "3/2" | bc

echo 'scale=2;3/2' | bc

echo "scale=2;3/2" | bc



## 文件测试

test

```
test -d /backup || mdkir -p /backup
```



## Unix BSD Linux
### unix操作系统 

UNIX操作系统，是一个强大的多用户、多任务操作系统，支持多种处理器架构，按照操作系统的分类，属于分时操作系统，最早由KenThompson、Dennis Ritchie和Douglas McIlroy于1969年在AT&T的贝尔实验室开发。目前它的商标权由国际开放标准组织所拥有，只有符合单一UNIX规范的UNIX系统才能使用UNIX这个名称，否则只能称为类UNIX(UNIX-like)。

### BSD 

BSD (Berkeley Software Distribution，伯克利软件套件)是Unix的衍生系统，在1977至1995年间由加州大学伯克利分校开发和发布的。历史上， BSD曾经被认为是UNIX的一支--"BSD UNIX", 因为它和AT&T UNIX操作系统共享基础代码和设计。在20世纪80年代，衍生出了许多变形的UNIX授权软件。比较著名的如DEC的Ultrix及Sun公司的SunOS。1990年代，BSD很大程度上被System V4.x版以及OSF/1系统所取代，晚期BSD版本为几个开源软件开发提供了平台并且一直沿用至今。今天，"BSD"并不特指任何一个BSD衍生版本，而是类UNIX操作系统中的一个分支的总称。

### linux系统 

Linux操作系统是基于UNIX操作系统发展而来的一种克隆系统，它诞生于1991 年的 [Linux桌面] 10 月5 日（这是第一次正式向外公布的时间）。以后借助于Internet网络，并通过全世界各地计算机爱好者的共同努力，已成为今天世界上使用最多的一种UNIX 类操作系统，并且使用人数还在迅猛增长。


## 脚本的执行

1. sh 脚本

2. ./ 脚本

3. chmod +x 


exit 推出整个程序


## 生成随机数

openssl rand -base64 数字
openssl rand -hex 数字


## 关联数组

declare -A 数组名
数组名[索引]=值

```
declare -A info
info[name]=liu
info[age]=11

echo ${info[age]}

所有的值
echo ${info[*]}

所有的索引
echo ${!info[*]}
```


## 函数

定义函数
调用函数
函数返回
函数传参

exit [num]
return [num]

set 参数, 位置参数重置

```
set 1 2 3 4 5   或者   set `seq 5`

for i in $*;do
    echo $i
done
```

## 正则表达式

和通配符是不一样的，有本质区别的



## 运行多条 SHELL 命令

```
ssh otherhost <<-EOF
    ls some_folder;
    ./someaction.sh 'some params'
    pwd
    ./some_other_action.sh 'some params'
EOF
```
