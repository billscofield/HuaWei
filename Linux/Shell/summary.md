除非特别声明，发行版本为 Debian 或 Ubuntu

## 

lrwxrwxrwx 1 root root 4 Mar  9 11:01 /usr/bin/sh -> dash


更改system shell 
    system shell is the default command interpreter for shell scripts
    dpkg-reconfigure shell类型  


pstree

ps --forest

ps -aux --forest


bash -i             交互式shell
bash -l             login shell
bash -r             启动一个受限的shell，用户会被限制在当前目录
bash -c string      子shell
    bash -c "cd /usr/bin/ && pwd"


### 进程列表

包含在括号里的命令, 会创建子shell执行

$BASH_SUBSHELL

经常使用子shell进行多进程处理，但是会明显拖慢处理速度，并非真正的多进程处理

### 

外部命令的执行都会创建一个子进程
    ps -ef

有些命令有多重实现，如 pwd 和 echo
    type -a pwd
        pwd is a shell builtin
        pwd is /usr/bin/pwd
        pwd is /bin/pwd
    type -a echo
        echo is a shell builtin
        echo is /usr/bin/echo
        echo is /bin/echo

which 只显示了外部命令文件


全局环境变量
    env
    printenv

    要显示某一个全局变量的值，用 printenv xxx， env xxx 不可以

局部环境变量
    set: 所有环境变量; 包括局部变量，全局变量以及用户定义变量


修改，删除子shell中的全局环境变量并不会影响到父shell中该变量的值

子shell甚至无法使用export改变父shell中全局变量的值


login shell
    /etc/profile
    /etc/bash.bashrc
    /etc/profile.d/...
    ~/.profile
    ~/.bashrc


nonlogin shell
    /etc/bash.bashrc
    ~/.bashrc


可拆卸式认证模块(Pluggable Authentication Modules, PAM)
    PAM 文件会在bash shell 启动之前处理，这些文件中可能会包含环境变量

    /etc/environment
    ~/.pam_environment


echo -n         don't output the trailing newline





命令替换会创建一个子shell
    $()
    ``
() 会创建一个子shell
|  会创建一个子shell
bash xxx.sh     会创建一个子shell
./xxx.sh        会创建一个子shell


内联输入重定向(inline input redirection)
    cat << EOF
    xxx
    EOF


数学运算符
    expr 1 + 5      必须这样，空格不能省
    +
    -
    \*
    /
    %
    \>
    =
    !=
    \<
    \<=
    \>=
    \|
    \&      后台运行符号

    逻辑运算
    位运算



将数学运算结果赋值给一个变量    $[1 * 3]

    a=$[4*3]; echo $a

    a=$[1>2]; echo $a       返回零，正确返回1，错误返回零
    a=$[1==1]; echo $a      返回1
    a=$[1 & 2]; echo $a     返回3



bc -q

    var1=10

    print var1

    quit


    var1=$(echo "scale=4; 10/3" | bc)


exit 命令
    exit 状态码



if command
then
    commands
elif command
then
    commands
else
    commands
fi






if test $a;then     变量是否为空或未定义
