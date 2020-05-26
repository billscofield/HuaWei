
## service 

/etc/init.d/networking

有不同的级别, 相同的服务在不同的级别的启停状态是不一样的

systemctl list-dependencies [target]



    /usr/lib/systemd/system/ *.target       systemctl 中的级别
    为了兼容性，runlevel 被映射到了相应的 .target, 可以通过 ll | grep runlevel 查看

    查看当前默认级别
        systemctl get-default -> graphical.target

    修改默认级别
        systemctl set-default multi-user.target



## systemctl

systemd 取代了 init

/usr/lib/systemd/system/        大部分还是在这里
/etc/systemd/system/
    lrwxrwxrwx 1 root root 31 Mar  9 11:20 sshd.service -> /lib/systemd/system/ssh.service


systemctl start | stop | restart | reload | enable | disable 服务名称




vi /usr/lib/systemd/system/ssh.service

```
[Unit]  这里边是启动顺序相关
After=network.target auditd.service


[Unit]  这里边是启动顺序相关
After=network.target auditd.service Bill.service    在后边 append 需要的服务
Requires=Bill.service                               还需要添加这个



[Service]   包含的是具体可以被 systemctl 调用的命令



[Install]   希望可以在哪个级别进行引导

```
    

## 启动顺序

BIOS -> MBR -> BootLoader(grub) -> kernel -> systemd -> 系统初始化 -> shell
                                -> windows


```
dd if=/dev/sda of=mbr.bin bs=446 count=1
hexdump -C mbr.bin


dd if=/dev/sda of=mbr2.bin bs=512 count=1


说 000001c0 开始是分区信息，但是不够66字节啊

55 aa:

```

1. BIOS

2. MBR

3. Grub     
    /boot/grub/  或者 /boot/grub2/

    grub-editenv list               列出当前默认的内核启动项

4. kernel

5. systemd
    /usr/lib/systemd/system/runlevel判断



shell 脚本需要赋予 rx 权限

```
#!/usr/bin/bash

# 注释

rx权限
```


执行方式
    1. bash ./a.sh      子进程
    2. ./a.sh           子进程

    3. source ./a.sh    当前进程, cd 成功
    4. . ./a.sh         当前进程, cd 成功


    ```a.sh

    #!/usr/bin/bash
    cd /var
    pwd 

    ```

内建命令不会产生子进程
内建命令仅对当前shell起作用


### 管道符


**管道符是通过子进程方式运行的, 内部命令不会创建子进程???**

```
cat | ps -f

UID        PID  PPID  C STIME TTY          TIME CMD
root     14209  6449  0 13:15 pts/4    00:00:01 -zsh
root     23237 14209  0 15:01 pts/4    00:00:00 cat
root     23238 14209  0 15:01 pts/4    00:00:00 ps -f


cd /proc/23237/fd/ && ls -l

lrwx------ 1 root root 64 May 26 15:08 0 -> /dev/pts/4              标准输入
l-wx------ 1 root root 64 May 26 15:08 1 -> 'pipe:[33475757]'       标准输出
lrwx------ 1 root root 64 May 26 15:08 2 -> /dev/pts/4              


cd /proc/23238/  提示没有那个文件或目录, 因为执行完就结束了，没有等待

```

**管道符会为两边的命令创建子进程(如果命令为外部命令)**


    ```
    cd /usr/lib/systemd/system/ | pwd

    管道符为两边的命令创建子shell，所以pwd的输出是当前路径

    当将上述命令写到文件中时,不论那种执行方式（bash source) 效果均是一样的，管道符产生子shell
    ```



echo 'hello' | passwd --stdin root




### 输入输出重定向

2>&1
&>

```
read name
read name<name.info



---

cat > a.sh <<EOF


EOF
```


### 变量的赋值

"="两边不可以出现空格

1. a=123

2. let a=1+2

3. 将命令赋值给变量
    l=ls

4. 将命令的结果赋值给变量
    a=$(pwd)
    a=`pwd`
5. 空格或特殊字符 可以包含在 双引号 或 单引号 中
    双引号:不完全引用
    单引号:完全引用


变量的引用
    ${变量}

    2>&1 也是同样的原理???


变量的默认作用范围
    默认当前的shell, 子shell,和平行shell中不能访问

    ```
    a=1
    bash
    echo $a
    ```
    
    export 导出，让子 shell 可以得到父 shell 的值


    变量的删除
        unset 变量

环境变量
    env

    PATH    命令搜索路径

    set     中有更多的变量，包括
            $?  上一条命令的错误数
            $$  当前进程PID
            $0  当前进程(程序)名称

            ```预定义变量
            # $1...$9 ${10}...

            pos1=$1
            pos2=$2
            pos2=${2}_   **空值与否，增加下划线**
            pos2=${2-_}  **如果是空值，就增加下划线**   叫变量替换

            echo $pos1
            echo $pos2

            ```

数组
    定义数组 
        ip=(1 2 3)

    显示数组所有元素
        echo ${ip[@]}

    显示数组个数
        echo ${#ip[@]}

    显示数组的第一个元素
        echo ${ip[0]}       bash第一个是[0]     zsh第一个是[1]


转义
    特殊字符

    ```
    #   注释
    ;   分号
    \   转义
        平凡 -> 特殊    \n
        特殊 -> 平凡    \$
    " ' 冒号
    ```


运算符
    赋值运算符
        = 
        算数 和 字符串赋值
        unset 取消为变量的赋值

        ```
        + - * / ** %

        1. 方法一：使用 expr 进行运算(不支持小数)

            expr 3 + 4  要有空格

            num1=$(expr 3 * 13)

        2. 方法二：let      (赋值运算 和 算数运算 和 逻辑运算)
            
            let "变量名=变量值"
            let "a=3*33"
                0开头的八进制
                0x开头的十六进制

            缩写为双圆括号
            echo $(( 3 + 4 ))
            ((a=10))
            ((a++))
            ((a--))
            ((++a))
            ((--a))

            ((3>1 && 3<10))
            echo $?


            (( ! 3>2 ))
        ```
        

    算数运算符

    数字常量

    双圆括号




括号
    ()  (()) $()
    单独使用圆括号会产生一个子shell(x=123)
    数组初始化 ip=(1 2 3)

    ```
    unset abc
    ( abc= 123 )
    echo $abc


    ips=(ip1 ip2 ip3)

    ---

    echo $(( 3+10 ))

    ---

    cmd=$(ls)
    ```


    [] [[]]
    单独使用方括号是测试(test) 或 数组元素功能
    两个方括号表示测试表达式

    ```
    [ 5 -gt 4 ]

    ---

    [[ 4 > 3 ]]             第一个操作数 和 运算符之间必须有空格
                            [[ 3 > 2 ]]
                            [[ 3 >2 ]]
    ```


    < > 尖括号 重定向符号

    {}
    输出范围    echo {0..9}    echo {a..z}
    文件复制    cp a{,.bak}




```
case 语句的分隔符要转义;;
    

#   注释
    # ls

:   空指令
    死循环

.   和 source 命令相同
~   家目录
,   分隔目录
*   通配符

?   条件测试 或 通配符
    一个字符

$   取值符号

|   管道符号

&   后台运行

    空格
    echo {0..9}
    echo { 0..9 }                   ???

```
