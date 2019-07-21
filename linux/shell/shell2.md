标准输入指的是键盘

< 将文件内容作为另一个程序的标准输入
    grep passwd < file.txt
    wall < 文件名

$TERM   screen-256color
$LANG
$PS1
    \W  当前目录名
    \w  绝对路径名
$PS2
    次一级的输出提示符，如 telnet
$MAIL
    如 /var/mail/root



echo $MAIL
echo ${MAIL}



man bash

查询是否为 bash 的内置命令(外部命令: 其他非 bash 所提供的命令)
    type 命令


## 自定义变量
变量名=变量值

将某个变量设为只读
    readonly 变量

    在变量赋值后使用    
        
    在变量赋值前使用    
        有卵用啊，都不能赋值了

需要其他额外的命令提供信息时
    1. `date +%Y`
    1. $(date +%Y)

    ```
    work="/root/git/imi/a/b/c/d/"
    cd $work

    ```

## 注销
exit 或 logout

## mesg
允许接收 write 否
mesg n
mesg y
mesg



who am i 比 whoami 多显示终端名称和登录时间
whoami 只显示谁

```
**字符串匹配 important**
find . -name "s*[!'e']"

test -d /etc/passwd && echo 'yes'
test -d /etc/passwd || echo 'not a directory'

T型管道
ip a | tee ip.txt | grep ens

$? 0True 1False 2错误
```

## 关于 && ||  \& -a -o !
貌似 && || 用在命令行中,而 -a -o ! 用在 shell script 中???

```

```
## expr





## 变量内容的删除、取代和替换
### 删除
1. 从左到右 懒惰

    ```
    ${变量#起始字符*终止字符} [,]
    ${path#/*bin:}
    ```

1. 从左到右 贪婪

    ```
    ${变量##起始字符*终止字符} [,]
    ${path##*bin}
    ```
1. 从右至左 懒惰

    ```
    ${变量%起始字符*终止字符} [,]
    ${path%/*bin:}
    ```
1. 从右到左 贪婪

    ```
    ${变量%%起始字符*终止字符} [,]
    ${path%%*bin}
    ```

起始字符串左边
终止字符串右边

### 替换
${变量/旧字符串/新字符串}   第一个
${变量//字符串/新字符串}    全部



变量的测试
vara=${变量-默认值}
    如果变量没有设置，则输出 默认值
    如果变量 设置过, 比如 name=
        echo ${name-hello} 不会有输出，因为name设置过了

vara=${变量:-默认值}
    变量为空 或者未设置，都会以默认值显示

vara=${变量=默认值}
    变量也被改变了

vara=${变量?未设置提示} 仅当变量未设置时，进行提示, 为空时，不提示



/etc/issue
    man issue
    登录前的信息

/etc/motd
    登录后的信息


stdin   0>
stdout  1>
stderr  2>
stdout+stderr &>





环境变量
内部变量
用户变量

set 显示左右变量，不包括内部变量

内部变量
```
#
    说明：$#变量是命令行参数或位置参数的数量
-
    说明：$-变量是传递给shell脚本的执行标志
?
    说明：$? 变量是最近一次执行的命令或shell脚本的出口状态
$
    说明：$$ 变量是shell脚本里面的进程ID。Shell脚本经常使用 $$ 变量组织临时文件名，确保文件名的唯一性。
_

    说明：$_ 变量是一个特殊的变量，在shell开始运行时，变量的初始值为shell或其执行的shell脚本的绝对路径名，之后就是最近执行的命令的最后一个选项或参数等。
!
    说明：&! 变量的值是最近运行的一个后台进程的PID
*
    说明：$* 变量的值表示所有的位置参数，其值是所有位置参数的值。
@
    说明：$@ 变量的值类似于$*，表示所有的位置参数，其值也是所有位置参数的值。
LINENO
    调测用。用于显示脚本中当前执行的命令的行号。
OLDPWD
    利用cd命令改换到新目录之前所在的工作目录。
    用法：cd $OLDPWD  （切换到之前的工作目录，和cd - 功能一样）
    注意1：变量用$引用，注意2：linux下区分大小写
OPTARG
    getopts命令已经处理的前一个选项参数。
    getopts命令见Shell内部命令
OPTIND
PPID
    是当前进程的父进程的PID
PWD
    当前工作目录。
    注意：这是一个变量，变量值等同于命令pwd的输出
RANDOM
    随机数变量。每次引用这个变量会得到一个0~32767的随机数。
REPLY
    read命令，如果没有被指定变量。即通过read读入的数据，如果没有对应的变量进行赋值，则可以把REPLY变量用作read命令的默认变量，接收read命令读入的参数。
SECONDS
    脚本已经运行的时间（以秒为单位）

```

$0 当前程序的名称

