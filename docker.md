## 网站
hub.docker.com
docker-cn.com

## Docker 背景知识
用户空间

内核空间

docker 镜像(image)也可以自己制作

    使用的镜像有alpine


### 对镜像的操作
#### 增

#### 删

#### 改

#### 查


### 对容器的操作
#### 增

#### 删

#### 改

#### 查


### 网络
172.17.xxx.xxx











常用操作

    1. 列出本机已经pull，安装的镜像
        docker image ls
        docker images

    1. 列出运行的镜像
        docker ps   |   docker container ls

    1. 列出运行的镜像
        docker ps -a    |   docker container ls -a

    1. docker pull [镜像]

    1. 附加后台镜像实例
        docker container attach [实例名]
    



    启动服务，安装镜像完成后 ifconfig, 多了个 docker0 的网卡

    1. 创建一个交互式镜像实例
        docker container run --name [实例名1] -it [镜像名]  //一个镜像可以有多个实例，实例的名字
            -i 交互式
            -t 

        docker run ubuntu echo "hello world"

        docker run | docker container run    are the same, docker --help | grep run  && docker container --help | grep run
            有网友说docker container run 是新的命令，而docker run是旧命令
                https://forums.docker.com/t/docker-run-and-docker-container-run/30526
            这样说的话，docker ps 是旧命令；docker container ls 是新命令

        本地没有镜像的话，会自动下载 ubuntu:latest

    1. 创建一个守护式容器
        1. 能够长期运行
        1. 没有交互式会话
        1. 适合运行应用程序和会话

        1. 方式1 
            docker run -i -t [镜像名] /bin/bash
            -t : --tty
            **ctrl p  ctrl q** //将交互式容器放在后台运行

            docker run -it ubuntu       //每个镜像都有默认的shell,比如Ubuntu是/bin/bash, busybox 是sh
        
        1. 方式2 
            docker run -d 镜像名
                --detach=true 默认是false
            docker run --name one -d ubuntu /bin/sh -c "while true;do echo helloworld;sleep1;done"

        exit 是彻底退出容器

    1. 停止一个镜像实例
        docker stop [实例名]

    1. 开启一个镜像实例
        docker start [实例名]
    

    1. 详细查看容器
        docker inspect [id或name]

    1. 重命名容器名
        docker container rename [old-container-name] [new-container-name]


    1. 重新启动停止的容器
        docker container start [-i] [容器名]
            -i : 交互式
            这里没有 -t, -t 是 docker run 时的

    1. 删除已经停止的容器
        docker rm [容器名]  //不能删除正在运行的容器


    docker container kill [实例名]

    docker container exec [实例名] ifconfig

    docker container exec -it [实例名] /bin/sh

    docker container inspect [实例名]


    haproxy


    国内源

        ```
        /etc/docker/daemon.json //初始状况没有这个文件

        { 
        "registry-mirrors": 
            [ 
            "https://kfwkfulq.mirror.aliyuncs.com", 
            "https://2lqq34jg.mirror.aliyuncs.com", 
            "https://pee6w651.mirror.aliyuncs.com",
            "https://registry.docker-cn.com",
            "http://hub-mirror.c.163.com" 
            ], 

        "dns": ["8.8.8.8","8.8.4.4"] 
        }
        ```

---


### docker是什么
1. 为什么会出现docker
    开发的代码 被运维 放到服务器就挂了。环境不一样，代码就不能用了
    把开发的环境：代码、配置、系统、数据 打包给运维
    软件+环境 安装
    把原始环境一模一样的复制过来

    整体交付（运行环境+代码）

1. 镜像
    1. 代码
    1. 运行环境
    1. 操作系统
    1. 内核
1. 理念
    Build, Ship and Run Any App, Anywhere
    集装箱：隔离的作用
    集装箱就是开发者的每个工具，我现在是把开发者所有的工具、环境拿过来，放到鲸鱼上

### Docker 能干什么
1. 之前的虚拟化技术
    虚拟机
        1. 模拟的是整套系统，硬件 + 软件
    特点
        1. 太重
        1. 启动慢
        1. 耗费资源
        就好像老式坦克一样

    容器虚拟化技术

Linux 容器不是模拟一个完整的操作系统，而是对进程进行隔离。
有了容器，就可以将软件运行所需的所有资源打包到一个隔离的容器中。
不需要捆绑一整套操作系统，只需要软件工作所需要的库资源和设置。
容器没有内核，使用的是系统的内核
每个容器都有自己的文件系统

基于容器的虚拟化，仅包含业务运行所需的runtime环境

弹性云扩容
大规模动态调度


1. 开发/运维（DevOps)  开发并自己运维
    1. 一次开发,到处运行
    1. 搬家 和 搬楼 的区别

1. 容器，镜像，仓库
    Docker Hub

    1. centos 6.5 以上版本
        uname -r

    1. 镜像的实例就是容器
    可以把容器看做是一个简易版的Linux环境（包括root用户权限、进程空间、用户空间、网络空间等）和运行在其中的应用程序。

    1. 仓库是集中存放镜像的地方

        公开库，私有库


---

container = App + Bins/Libs, 就像那个集装箱
Docker 就像是那条鲸鱼
大海就是实体Linux


2013年3月份第一次发布

## 实践

-------------------------------------
Docker 的容器技术 是虚拟化的一种
什么是容器？
    一种虚拟化的方案
    操作系统级别的虚拟化
    只能运行相同或相似内核的操作系统
    依赖于Linux内核特性：Namespace 和 Cgroups (Control Group)，(不能，也没有windows容器)

        Namespace
            封装-》系统资源的隔离，进程，网络，文件系统...
            1. PID (process ID) 进程隔离
            1. NET (network) 管理网络接口
            1. IPC (InterProcess Communication) 管理跨进程通信的访问
            1. MNT (Mount)  管理挂载点
            1. UTS (Unix Timesharing System) 隔离内核和版本标识
        Cgroups (2007年被整合进Linux内核)
            1. 资源限制
            1. 优先级设定
            1. 资源计量
            1. 资源控制

    依托Linux内核的虚拟化


1. docker client   客户端（C/S架构）
1. docker daemon   守护进程 
1. docker image    镜像

    层叠的只读文件系统
    联合加载(union mount)

1. docker container    容器
    增加可写层
    写时复制(copy on write)

1. docker registry 仓库
    保存用户构建的镜像


docker image镜像
   
    add Apache
    add emacs
    rootfs(root fs root文件系统,比如ubuntu,centos,只读)
    bootfs(boot fs boot文件系统)

    一个镜像可以放到另一个镜像
    镜像分层

容器
    
    可写层
    add Apache
    add emacs
    rootfs(root fs root文件系统,比如ubuntu,centos,只读)
    bootfs(boot fs boot文件系统)


the docker engine consists of two parts:
    a daemon:a server process that manages all the containers
    a client:which acts as a remote control for the daemon

## 安装
安装方式
    检查
        1. 内核 uname -r
        1. ls -l /sys/class/misc/device-mapper
    1. 方法1 Ubuntu 的apt
        sudo apt install docker.io
        source /etc/bash_completion.d/docker.io  //没有额...

    1. **方法2** Docker维护的安装方式
        检查对https的支持状况 /usr/lib/apt/metods/https 文件是否存在

        docker 提供的shell脚本
        sudo apt install curl
        curl -sSL https://get.docker.com/ | sudo sh

    1. ubuntu默认的那个管理账户添加到docker组里边还是提示权限问题，添加了一个普通用户添加到docker组里边就OK了...
        docker version
        If you would like to use Docker as a non-root user, you should now consider adding your user to the "docker" group with something like:

          sudo usermod -aG docker your-user

        
        sudo groupadd docker
        sudo gpasswd -a ${USER} docker
        sudo service docker restart

systemctl start docker
service docker start


查看容器
    docker ps   //正在运行的
        -a      //所有的container
        -l      //最后创建的那个container
        -n [m]     //最后创建的m个container
        --no-trunk //do not truncate output
        -q --quiet //only show numeric ids
        -s --size   //total size


查看容器日志(容器内部运行情况)
    docker logs [-f] [-t] [--tail]
        -f 一直跟踪 --follows , 一直更新
        -t 时间 --timestamps
        --tail 10
            --tail 0
        docker logs -tf [container名]
        
        例子
            ```
            docker run -d --name busy ubuntu /bin/sh -c "while true;do echo 'hello';sleep 1;done;"
            docker logs -tf --detail 1 busy
            ```

    docker top 容器名   //查看运行中的容器的进程
        
        
在运行的容器中启动新进程
    docker exec  -d -i -t 容器名 COMMAND ARG...
        docker exec -it dc1 /bin/bash
        docker top dc1  //此时就可以看到一个/bin/bash进程在运行
        
停止守护式容器
    docker stop 容器名
        让docker容器自己停止
    docker kill 容器名
        杀死docker容器


man docker-run
man docker-log
man docker-top
man docker-exec
man docker-search




在容器中部署网站
    端口映射，格式为：主机(宿主)端口:容器端口
        -P[upcase] , --publish=[]
        -p
    
    1. 创建映射80端口的交互式容器
    1. 安装Nginx
    1. 安装vim
    1. 创建静态页面
    1. 修改Nginx配置文件
    1. 运行Nginx
    1. 验证网站访问

docker run -p 80 --name web -it ubuntu /bin/bash
apt install -y nginx
apt install vim
mkdir -p /var/www/html
cd /var/www/html
vim index.html
    <html>
        <head>Nginx in docker</head>
        <body>
            this is from docker
        </body>
    </html>

whereis nginx
ls /etc/nginx/sites-enabled
vim /etc/nginx/sites-enabled/default
    server 
        root /var/www/html;
nginx
ctrl p ctrl q

docker ps
    查看到容器的80端口映射到了哪个端口
docker port web
    这个也可以看端口映射情况
docker top web

curl http://127.0.0.1:端口

docker inspect //容器的ip地址
curl http://容器的ip地址
    可以通过 docker inspect [容器名] 来查看ip地址，端口等情况，查看 NetworkSettings


docker stop web
docker start web
docker exec web nginx
curl http://127.0.0.1:端口 并不能访问
停止并重新启动容器时，ip地址，映射的端口号都会变化
    怎么解决呢?


镜像的位置
    docker info 
        查看image位置
        /var/lib/docker/
        find ./ -name respositories.json
            respositories.json 也存了些信息

列出镜像
    docker images   //已经安装的镜像
        -a --all    //显示中间层镜像
        -f --filter
        --no-trunc  //不阶段 imageid
        -q --quiet
       
        repository:仓库名  比如ubuntu,centos. 一系列镜像的集合;不同于repositry 提供镜像的存储服务
        tag:标签名, 一个repository钟的镜像是以 tags 来进行区分的，repository + tag 就进行了唯一标识
            repository:tag 构成了完整的镜像名子
            repository 默认使用latest对应的镜像
                比如：docker pull ubuntu == docker pull ubuntu:latest
        Image ID    
        created 建立时间
        virtual size 大小

        docker images ubuntu    //ubuntu 是一个repository, 包含很多不同tag的image

        1个image可能有多个tag, 但只有一个numeric id; 
            所以 docker rmi ubuntu:latest 可能只删除了一个标签，而没有删除所有的；这种情况下docker rmi [numeric id] 可直接将相同numeric 的具有多个标签的image删除
            为什么同一个镜像要有多个tag呢?

查看镜像
    支持容器的查看
    支持镜像的查看
    
    docker inspect ubunt
        返回json格式信息

删除镜像
    docker rmi  镜像1 镜像2 ...
        -f , --force
        --no-prune  //do not delete untagged parents   不移除该镜像的过程镜像,默认移除
        
镜像标签


查找镜像
    1. 方法1 docker hub 
        1. 注册
        1. 查找 ubuntu
        1. 网址 hub.docker.com
    1. 方法2 命令行
        1. docker search [option] TERM
            1. --no-trunc   //不截断,do not truncate output(主要针对description)
            1. --limit [数字] //一次返回多少个results  默认25
            1. --filter=stars=最少值
            1. --filter=is-automated=true
                automated自动化选项时什么意思???
            1. --filter=is-official=true|flase

    1. problems
        为什么docker search ubuntu 的返回结果中有的有repository,有的没有，repository还不一样;而hub.docker.com中搜索时只是tag不同
        网页搜索时输入的是 repository? 所以这样: ?

拉取镜像
    docer pull [option] NAME[:TAG]
        -a,-all

        全名：用户名/镜像名

    --registry-mirror   //修改为国内的???
        /etc/default/docker 添加  DOCKER

    docker pull hub.c.163.com/library/ubuntu
        hub.c.163.com/library/      //网易docker registry
        不同站点下载的image 不一样啊，网易下载的ubuntu 120MB,而默认的站点才86MB

    DAUCLOUD
    
    busybox是一个集成了一百多个最常用linux命令和工具的软件,同时它也是一个最小的Linux系统，它提供了该系统的主要功能，例如grep、find、mount以及telnet等但不包含一些与GNU相关的功能和选项。

    配置Docker中国区官方镜像

        ```
        vim /etc/docker/daemon.json

        {
            "registry-mirrors":["https://registry.docker-cn.com"]
        }

        sudo service docker restart

        docker pull busybox //进行测试
        ```


推送镜像
    docker push 用户名/镜像名
    docker 并不会上传整个镜像，而是上传修改的地方


构建镜像
    1. 方法1 docker commit   //通过容器构建
        docker commit [options] CONTAINER名字 [REPOSITORY[:TAG]] (镜像名)
                                ??
            -a --author [string]
                docker inspect 时可以看到
            -m --message    [string]
                docker inspect 时看不到，里面没有???
            -p --pause  //pause container during commit(default true)

            docker commit [numeric id] 镜像名
    1. 方法2 docker build //通过dockerfile文件构建
        docker build 
            --tags " "



remote api

    传统C/S方式
    user -> docker client -> docker server

    remote api 方式
                        remote api
    user -> 自定义程序 ----------->  docker server



docker client & server
    通过socket 方式连接
        unix

docker 守护进程
    service docker status
    ps -el | grep docker
    /etc/init.d/docker start
    /etc/init.d/docker stop
    /etc/init.d/docker restart

    docker 启动配置文件
        /etc/default/docker

docker 的远程访问???
    1. 需要保证版本一致

    1. -H
    1. /etc/default/docker


docker的网络
    docker0:
        docker server的网卡
        linux的虚拟网桥 
            1. 可以设置IP地址
            1. 相当于拥有一个隐藏的虚拟网卡

        网桥管理工具 bridge-utils(ubuntu 默认没有安装)
            brctl show

    docer 容器 在stop start后 ip可能会改变，不可靠
    docker 使用了别名的机制解决此问题

### 帮助命令
1. docker version
1. docker info
1. docker --help
    为什么我的只显示那么几个options???//网上那些不知道是什么玩意儿，乱写，shit
    docker run --help
    docker exec --help


## 安装软件
1. net-tools, the collection of base networking utilities for Linux.
    Includes: 
        arp
        hostname
        ifconfig
        netstat
        rarp
        route
        plipconfig
        slattach
        mii-tool
        iptunnel 
        ipmaddr








## 
docker 
dns - bind9
nginx
    nginx自启动


宿主机 uname -r 和 容器的 uname -r 相同

宿主机 hostname 和 容器的 hostname 不同
    宿主机的hostname就是docker ps --no-trunc 的前12个字符


容器因为docker的出现而流行起来，因为docker较为复杂,不容易管理

docker 把开发环境部署到容器


Mirror site(镜像站点)
    是将网站的多个副本放置不同的服务器，这样可能提高反应速度，用户可以在访问较少或相对速度较快的服务器上取得信息，提高了网络传输效率，也提高了网站的安全性。镜像必须保证不断更新以反映原站的变化，有些时候原站没有条件连接进高速线路，而镜像站却可以连接进。



## nvidia-docker
Docker容器的本地实现不支持NVIDIA GPU，这就是为什么我们开发了nvidia-docker插件。

使用Nvidia Docker，可以无缝地配置一个GPU设备可见的容器，并准备好执行基于GPU的应用程序

Nvidia关于nvidia-docker的博客强调了使用便携式GPU容器的两个关键点
    1. 与驱动程序无关的CUDA镜像
    1. Docker命令行包装器，在启动时将驱动程序的用户模式组件和GPU（字符设备）装载到容器中。

在安装nvidia-docker之前更新系统的NVIDIA驱动程序。另外，确保Docker安装在系统上。

CUDA（Compute Unified Device Architecture），是显卡厂商NVIDIA推出的运算平台。 CUDA?是一种由NVIDIA推出的通用并行计算架构，该架构使GPU能够解决复杂的计算问题。

https://www.sohu.com/a/209301090_609513



## docker 搭建 git server
https://blog.csdn.net/xxkalychen/article/details/82219821
