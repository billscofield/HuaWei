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
```
