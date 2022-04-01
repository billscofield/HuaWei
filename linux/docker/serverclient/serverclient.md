# Docker server and client

Docker客户端和服务端的通讯方式：client和自定义程序

Docker客户端和服务端的连接方式：socket

演示Docker客户端和服务端之间用remote-api通讯：nc   -U   /var/run/docker.sock


## 1、Docker客户端和服务端的连接方式

方式一：client 和 demaon

　　User   <-->  Docker客户端  <-->  Docker服务端（守护进程）

　　　　User发送命令给Docker客户端，如：docker pull、docker run

　　　　Docker客户端转发命令给宿主机上的Docker守护进程

　　　　Docker守护进程接收执行命令，返回命令执行结果

　　　　Docker服务端（守护进程）负责管理宿主机上的各个容器。

 

 方式二：自定义程序和 服务端

 　　　 User   <-->  自定义程序  <-->  Docker服务端（守护进程）

 　　　　自定义程序调用remote-api，remote-api是 rest风格的api

 　　　　https://docks.docker.com/reference/api/docker_remote_api

  

## 2、Docker客户端和守护进程通过Socket连接，可以远程或本地连接

Unix的端口，如：unix:///var/run/docker/sock（默认连接方式）
tcp://host:prot
fd://socketfd
　　

　　　

   在服务端，查看是否启动了docker的守护进程

   　　ps -ef | grep docker

   　　root  1526  1  9  17:34  ？   00:00:99  /usr/bin/docker -d

   　　

   　　docker version

   　　

## 3、通过linux的nc命令演示remote-api的使用

　　-U 指明使用socket

　　/var/run/docker.sock 指明 socket 地址

　　info是个remote-pi


    nc -U /var/run/docker.sock
    GET /info HTTP/1.1


    返回信息

    HTTP/1.1 200 OK
    Content-Type:application/json
    Job-Name:info
    Date:Tue,14 Apr 2015 09:38:28 GMT
    Content-Length:765


    JSON串格式的返回内容



## 

docker的服务端与客户端间可以通过unix、tcp方式进行通信。但默认情况下，服务端只监
听本地unix接口/var/run/docker.sock，所以客户端只能在服务端所在的机器上使用该
unix接口控制服务端。

客户端若想在与服务端进行跨机器通信，就得将服务端监听方式改成tcp，监听的端口为
2375（非安全）、2376（安全）。

1. 服务端(172.25.11.191:2375)

    ` dockerd -H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375

2. 客户端(172.25.11.189)

    ` docker -H 172.25.11.191:2375 ps


## 

官网提供的标准安装包，因为那包括了Docker Engine和Docker Client

    docker-ce-cli : Docker CLI, the open-source application container engine
