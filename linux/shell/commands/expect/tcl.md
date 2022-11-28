https://www.tutorialspoint.com/tcl-tk/tcl_decisions.htm

Tcl Tk 入门经典

一个控制交互式程序的工具

links
    https://www.bilibili.com/video/BV19t411H7N2?from=search&seid=8801663209888878690

    https://www.bilibili.com/video/BV1wW411K7Zy?from=search&seid=8801663209888878690

    https://www.cnblogs.com/52py/p/14172191.html

    https://www.cnblogs.com/klb561/p/9043191.html

apt-cache show expect

Automates interactive applications
Expect is a tool for automating interactive applications according to a script.
Following the script, Expect knows what can be expected from a program and what
the correct response should be. Expect is also useful for testing these same
applications. And by adding Tk, you can also wrap interactive applications in
X11 GUIs. An interpreted language provides branching and high-level control
structures to direct the dialogue. In addition, the user can take control and
interact directly when desired, afterward returning control to the script.
.
This package contains the expect binary and several Expect based scripts.



The -f flag prefaces a file from which to read commands from.  The flag itself
is optional as it is only useful when using the #! notation (see above), so
that other arguments may be supplied on the command line.  (When using Expectk,
this option is specified as -file.)


```
#!/usr/bin/expect

# spawn 启动/产生一个会话
spawn ssh root@192.168.1.1

expect {
    "yes/no" { send "yes\r"; exp_continue }
    "password" { send "password\r" }
}
interact
```

```
#!/usr/bin/expect

spawn ssh 10.0.5.116 "ip a"

expect {
    "yes/no" { send "yes\r"; exp_continue }
    #"password" { send "20150312\r"; exp_continue }
    "password" { send "20150312\r" }
}
interact
```



```
#!/usr/bin/expect

spawn yum install ascii

expect {
    "y/d/N" send { "y\r" }
}
expect eof
```


---


set timeout 5
    意思是在expect语句中，5s后超时，不再作出选择。
    默认是 10
    如果超时，脚本将继续向下进行(比如在等待某个模式出现，超时以后，会进行下一语句)。

spawn
    启动新的进程，执行命令或者指定程序
expect
    从进程中接收信息, 如果匹配成功, 就执行expect后的动作
    expect还能理解一些特殊情况，如超时和遇到文件尾。
send
    向进程发送字符串

interact
    执行完spawn内的命令后不退出，剩下的操作由我们人工来执行。如登陆ssh，expect
    脚本可以帮我们登录（不用手动输入密码），登陆之后需要我们手动交互。

set name [lindex $argv 0]
    设置变量名为name，其值为 传入 expect脚本的第一个 参数 。第一个参数的索引值为0，第二个为1，依次类推

send_user
    用来打印信息，相当于shell中的echo
    send_user "hello"

exp_continue
    执行完expect后的动作后，使expect不退出，继续往下匹配

expect eof
    不允许用户交互，直接退出（这个用的会比interact多）
    这个等待eof必须要有，如果没有eof，很可能在子进程没有结束前就退出

$argc表示参数个数，而参数值存放在$argv中
    ```
    if {$argc != 4} {
        puts "Usage:./script.sh <ip> <username> <password> <cmd>"
        exit 1
    }

    set ip [lindex $argv 0]
    set user [lindex $argv 1]
    set pass [lindex $argv 2]
    set cmd [lindex $argv 3]
    set timeout -1

    spawn ssh $user@$ip $cmd
    ```

exit,close,wait：exit表示退出脚本，close表示立即关闭过程，而wait则是等待过程返回eof时关闭。



被精确匹配的字符串(或者当超时发生时，已经读取但未进行匹配的字符串)被存贮在变量expect_match里面。




```
set test 123            # 自定义变量
set commd [exec ls]     # 调用系统命令赋值
set ip [lindex $argv 0] # 参数赋值
puts "test is   $test"
puts "$commd"
puts "ip is $ip"
```




switch

```
switch  $color  {
    apple {
        puts "apple is blue"
    }
    banana {
        puts "banana is yellow "
    }
}
```


if 分支

```
#!/usr/bin/expect
set test [lindex $argv 0]
if { "$test" == "apple" } {
    puts "$test"
} else  {
    puts "not apple"
}
```


for 循环结构
第一种
```
#!/usr/bin/expect
foreach number {
1
2
3
4
} {
    puts "$number"
}
```


第二种

```
#!/usr/bin/expect
for {set i 0} {$i<4} {incr i} {
    puts "$i"
}
```



while  循环结构

```
#!/usr/bin/expect
set i 1
while {$i<4} {
    puts "$i"
    incr i
}
```



函数定义
```
#!/usr/bin/expect
proc test {} {
        puts "ok"
}
test
```


若要运行shell脚本，写shell脚本的绝对路径
    spawn bash /home/hadoop/test/1.sh
