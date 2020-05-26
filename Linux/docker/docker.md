## 网站
https://github.com/docker
https://www.docker.com
https://hub.docker.com
docker-cn.com

## Docker 背景知识
用户空间

内核空间

使用的镜像有alpine


使用go语言编写


### 网络
172.17.xxx.xxx

dotClout公司

SandBox(沙盒)




常用操作

### 列出镜像

1. 列出本机已经pull，安装的镜像
    docker image ls     //是image 不是images
    docker images       //是docker image ls 的别名
        
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE

    docker image --help

    docker image ls | docker images
        -a, --all             Show all images (default hides intermediate images)
            --digests         Show digests(文摘；摘要)
        -f, --filter filter   Filter output based on conditions provided
            --format string   Pretty-print images using a Go template
            --no-trunc        Don't truncate output(显示完整的image ID)
        -q, --quiet           Only show numeric IDs(image id)     //用于script处理

1. 列出运行的镜像
    docker ps   |   docker container ls

1. 列出运行的镜像
    docker ps -a    |   docker container ls -a

1. docker pull [镜像]

1. 附加后台镜像实例
    docker container attach [实例名]


### 删除镜像
docker rmi  默认latest

Alias for docker image rm.

-f, --force[=false]
    Force removal of the image

-h, --help[=false]
    help for rmi

--no-prune[=false]
    Do not delete untagged parents

    ```
    删除全部
    docker image rm $(docker image ls -qa)
    ```

    

### 查找镜像
    1. 方法1 docker hub 
        1. 注册
        1. 查找 ubuntu
        1. 网址 hub.docker.com

    1. 方法2 命令行
        1. docker search [option] TERM
            1. --no-trunc   //不截断,do not truncate output(主要针对description)
            
            1. --limit [数字] //一次返回多少个results  默认25
                Max number of search results
                
            1. --filter
                1. --filter=stars=<numberOfStar> 这里是min值, 是>=
                
                1. --filter=is-automated=true|false
                
                1. --filter=is-official=true|flase


            ```
            1. docker search kali

            NAME                                                     DESCRIPTION                                     STARS               OFFICIAL            AUTOMATED
            kalilinux/kali-rolling                                   Official Kali Linux image (weekly snapshot o…   76
            linuxkonsult/kali-metasploit                             Kali base image with metasploit                 69                                      [OK]
            ```

    1. problems
        为什么docker search ubuntu 的返回结果中有的有repository,有的没有，repository还不一样;而hub.docker.com中搜索时只是tag不同
        网页搜索时输入的是 repository? 所以这样: ?



### 容器

启动服务，安装镜像完成后 ifconfig, 多了个 docker0 的网卡

Commands:
    commit      Create a new image from a container's changes
    cp          Copy files/folders between a container and the local filesystem

    exec        Run a command in a running container
    export      Export a container's filesystem as a tar archive

    inspect     Display detailed information on one or more containers
    logs        Fetch the logs of a container
    ls          List containers
    top         Display the running processes of a container
    diff        Inspect changes to files or directories on a container's filesystem

    port        List port mappings or a specific mapping for the container
    rename      Rename a container

    create      Create a new container
    run         Run a command in a new container
    start       Start one or more stopped containers
    restart     Restart one or more containers
    pause       Pause all processes within one or more containers
    attach      Attach local standard input, output, and error streams to a running container

    stats       Display a live stream of container(s) resource usage statistics
    stop        Stop one or more running containers 正常关闭
    kill        Kill one or more running containers 拔电源

    rm          Remove one or more containers
    prune       Remove all stopped containers

    unpause     Unpause all processes within one or more containers
    update      Update configuration of one or more containers
    wait        Block until one or more containers stop, then print their exit codes


#### 查看容器

1. docker ps

List containers

Options:
    -a, --all             Show all containers (default shows just running)
    -l, --latest          Show the latest created container (includes all states)
    -n, --last int        Show n last created containers (includes all states) (default -1)

    -f, --filter filter   Filter output based on conditions provided
    --format string       Pretty-print containers using a Go template
    --no-trunc            Don't truncate output
    -q, --quiet           Only display numeric IDs
    -s, --size            Display total file sizes

    ```
    docker ps -n 3

    docker ps -l

    docker ps -q
    ```


1. 详细查看容器

docker container inspect [id或name]   | dcoker inspect 
    
    Return low-level information on Docker objects

    查看存储信息: docker inspect <ID> | grep "Mounts"


1. docker top 
    Display the running processes of a container




#### 创建容器
1. 创建一个交互式镜像实例

    docker container run --name [实例名1] -it [镜像名或ID号]  //一个镜像可以有多个实例，实例的名字
        -i, --interactive       Keep STDIN open even if not attached
        -t, --tty               Allocate a pseudo-TTY
        --name string           Assign a name to the container


    docker run ubuntu echo "hello world"


注意
    docker run | docker container run    are the same, docker --help | grep run  && docker container --help | grep run
        有网友说docker container run 是新的命令，而docker run是旧命令
        https://forums.docker.com/t/docker-run-and-docker-container-run/30526
    这样说的话，docker ps 是旧命令；docker container ls 是新命令


1. 创建一个守护式容器
    1. 能够长期运行
    1. 没有交互式会话
    1. 适合运行应用程序和会话
    Docker容器后台运行，就必须有一个前台进程    


    1. 方式1 
    docker run -i -t [镜像名] /bin/bash
        -t : --tty

    docker run -it ubuntu       //每个镜像都有默认的shell,比如Ubuntu是/bin/bash, busybox 是sh
    
    1. 方式2 
        docker run -d 镜像名
        -d, --detach                         Run container in background and print container ID

        docker run --name one -d ubuntu /bin/sh -c "while true;do echo helloworld;sleep1;done"


#### 停止容器

1. 停止一个镜像实例
docker stop [实例名]

#### 启动容器

1. 开启一个镜像实例
docker start [实例名]


1. 重命名容器名
    docker container rename [old-container-name] [new-container-name]


1. 重新启动停止的容器
docker container start [-i] [容器名]
        -i : 交互式
        这里没有 -t, -t 是 docker run 时的

#### 删除已经停止的容器

docker rm [容器名]  //不能删除正在运行的容器


删除多个容器
    docker rm -f $(docker ps -a -q)

    docker ps -a -q | xargs docker rm 



docker container kill [实例名]
    Kill one or more running containers

    Options:
        -s, --signal string   Signal to send to the container (default "KILL")


#### 附加运行的容器

docker container exec [实例名] ifconfig

docker container exec -t [实例名] ifconfig

    ```
    docker container exec -t [实例名] ls -l //不要用引号将命令包起来
    结果直接反映出来
    ```

docker container exec -it [实例名] /bin/sh      通 docker container attach

Options:
    -d, --detach               Detached mode: run command in the background
        --detach-keys string   Override the key sequence for detaching a container
    -e, --env list             Set environment variables
    -i, --interactive          Keep STDIN open even if not attached
        --privileged           Give extended privileges to the command
    -t, --tty                  Allocate a pseudo-TTY
    -u, --user string          Username or UID (format: <name|uid>[:<group|gid>])
    -w, --workdir string       Working directory inside the container


docker container inspect [实例名]

docker attach [实例名]

#### 退出容器

容器不会停止运行
    ctrl p q    //将交互式容器放在后台运行

容器停止退出
    exit



#### 日志
docker log 

**Fetch the logs of a container**

Options:
    --details        Show extra details provided to logs
-f, --follow         Follow log output
    --since string   Show logs since timestamp (e.g. 2013-01-02T13:23:37) or relative (e.g. 42m for 42 minutes)
    --tail string    Number of lines to show from the end of the logs (default "all")
-t, --timestamps     Show timestamps
    --until string   Show logs before a timestamp (e.g. 2013-01-02T13:23:37) or relative (e.g. 42m for 42 minutes)

    ```
    docker run -d ubuntu /bin/sh -c "while true;do echo 'hello';sleep 2;done"

    docker logs -f -t <ubuntu-id>

    是因为后台运行着一个shell程序，所以docker认为这个容器有事在做
    ```

#### 将数据从docker中拷贝到主机

docker cp
Usage:  docker container cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
        docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH

Copy files/folders between a container and the local filesystem

Use '-' as the source to read a tar archive from stdin
and extract it to a directory destination in a container.
Use '-' as the destination to stream a tar archive of a
container source to stdout.

Options:
  -a, --archive       Archive mode (copy all uid/gid information)
  -L, --follow-link   Always follow symbol link in SRC_PATH

  ```
  docker container cp dockerUbunt:/dockerfile ./
  ```










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


2013年dotCloud公司(现已改名为Docker Inc)发布Docker容器技术

### docker是什么
容器虚拟化技术 三要素
    容器:就是模板的实例, 容器是用镜像创建的运行实例
    镜像:就是模板, 每个镜像有不同的标签(tag)
    仓库:


docker 是容器
镜像就是虚拟的环境
仓库用于存放镜像


是一个管理引擎


联合文件系统 UnionFS

1. 为什么会出现docker
    把开发的环境：代码、配置、系统、数据 打包给运维
    软件+环境 安装
    把原始环境和代码一模一样的复制过来

    整体交付（运行环境+代码）

    **没有Hypervisor实现硬件资源虚拟化**

1. 镜像
    1. 代码
    1. 运行环境
    1. 操作系统
    1. 内核

1. 理念
    Build, Ship and Run Any App, Anywhere
    集装箱：隔离的作用
    集装箱就是开发者的每个工具，我现在是把开发者所有的工具、环境拿过来，放到鲸鱼上


作为Docker三大核心技术之一的镜像技术在Docker的快速发展之路上可谓功不可没：
镜像让容器真正插上了翅膀，实现了容器自身的重用和标准化传播，使得开发、交付、运维流水线上的各个角色真正围绕同一交付物，“test what you write, ship what you test”成为现实。


Docker技术本质上并不是新技术，而是将已有技术进行了更好地整合和包装。内核容器技术以一种完整形态最早出现在Sun公司的Solaris操作系统上，Solaris是当时最先进的服务器操作系统。2005年Sun发布了Solaris Container技术，从此开启了内核容器之门。

https://tonybai.com/tag/lxc/


1. 之前的虚拟化技术
    虚拟机
        1. 模拟的是整套系统，硬件 + 软件
    特点
        1. 太重
        1. 启动慢
        1. 耗费资源
        就好像老式坦克一样

### 容器

Linux **容器**不是模拟一个完整的操作系统，而是**对进程进行隔离。**

有了容器，就可以将软件运行所需的所有资源打包到一个隔离的容器中。

不需要捆绑一整套操作系统，只需要软件工作所需要的库资源和设置。

容器没有内核，使用的是系统的内核, 通过系统内核调用硬件资源

每个容器都有自己的文件系统




基于容器的虚拟化，仅包含业务运行所需的runtime环境

弹性云扩容
**大规模动态调度**


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
**大海就是实体Linux**

2013年3月份第一次发布


<img src="../materials/dockerVSvm">


## 实践

-------------------------------------
Docker 的容器技术 是虚拟化的一种
什么是容器？
    一种虚拟化的方案
    操作系统级别的虚拟化
    只能运行相同或相似内核的操作系统
    依赖于Linux内核特性：Namespace 和 Cgroups (Control Group)，(不能，也没有windows容器)

        Namespace
            封装->系统资源的隔离，进程，网络，文件系统...
            1. PID (process ID) 进程隔离
            1. NET (network) 管理网络接口
            1. IPC (InterProcess Communication) 管理跨进程通信的访问
            1. MNT (Mount)  管理挂载点
            1. UTS (Unix Timesharing System) 隔离内核和版本标识
        Cgroups (2007年被整合进Linux内核),对资源进行管理
            1. 资源限制
            1. 优先级设定
            1. 资源计量
            1. 资源控制


    文件系统隔离
    资源隔离
    网络隔离
    日志记录
    交互式shell


docker 用于计算，存储交给别人
    日志，跟踪，数据库等通常应放在docker容器外
    外部挂载的方式

oracle 不适合使用docker,oracle太大了


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

docker-io
docker-engine
上面两个是什么，有什么区别?

docker-ce(community edition)
docker-ee(enterprise edition)


安装方式
    检查
        1. 内核 uname -r
        1. ls -l /sys/class/misc/device-mapper

    1. 方法1 Ubuntu 的apt
        sudo apt install docker.io
        //source /etc/bash_completion.d/docker.io  //没有 docker.io 这个文件啊,也不用检查这个吧，哪个教程说要检查这个来的?


        **安装完成后，将当前用户添加到docker组，service docker restart  后docker ps不行,提示权限不足(权限的配置问题?)，重启可以了**

    1. **方法2** Docker维护的安装方式
        检查对https的支持状况 /usr/lib/apt/metods/https 文件是否存在

        docker 提供的shell脚本
        sudo apt install curl
        curl -sSL https://get.docker.com/ | sudo sh
        这个非常地慢

    1. ubuntu默认的那个管理账户添加到docker组里边还是提示权限问题，添加了一个普通用户添加到docker组里边就OK了...

        docker version
        If you would like to use Docker as a non-root user, you should now consider adding your user to the "docker" group with something like:

          sudo usermod -aG docker your-user

        
        sudo groupadd docker
        sudo gpasswd -a ${USER} docker
        sudo service docker restart

systemctl start docker
service docker start

### 推荐的安装方式

    1. 利用国内源进行docker的安装

        安装添加新存储库所需的依赖项
            apt install ca-certificates curl software-properties-common gnupg2

        添加源
            deb [arch=amd64] http://mirrors.ustc.edu.cn/docker-ce/linux/debian buster stable　　

        使用以下 curl 命令导入存储库的 GPG 密钥：
            curl -fsSL http://mirrors.ustc.edu.cn/docker-ce/linux/debian/gpg | sudo apt-key add -

        然后apt update在install
            apt-get install docker-ce

        检查docker
            docker version

        开启服务
            systemctl start docker

        拉取镜像
            阿里云镜像加速配置, 登录阿里云，控制台,搜索"镜像" , "镜像加速器"
            阿里云上会显示如何配置阿里云的源(根据发行版)

            ```
            touch /etc/docker/daemon.json
            {
              "registry-mirrors": ["https://hkya5jtz.mirror.aliyuncs.com"]
            }
            systemctl daemon-reload
            systemctl restart docker
            ```

            通过 docker info 查看镜像地址(Registry Mirrors)

            docker run hello-world
            现在本地寻找，如果没有去仓库下载 
                Unable to find image 'hello-world:latest' locally           默认:latest
                latest: Pulling from library/hello-world
                0e03bdcc26d7: Pull complete
                Digest: sha256:8e3114318a995a1ee497790535e7b88365222a21771ae7e53687ad76563e8e76
                Status: Downloaded newer image for hello-world:latest

            配置文件查看 dpkg --listfiles docker-ce


        docker映射端口和挂载目录
            docker run -it -p 8083:8080 -p 3389:3306 -v /mnt/:/mnt update /bin/bash
                              宿主 容器    宿主 容器    宿主  容器

        导出容器
            docker export -o cheng.tar confident_hopper
                              新名字     容器名字

        导入容器
            docker import cheng.tar cheng
                                    新名字


帮助
    docker help


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
        tag:标签名, 一个repository钟的镜像是以 tags 来进行区分的，repository + tag 就进行了唯一标识
            repository:tag 构成了完整的镜像名子
            repository 默认使用latest对应的镜像
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
    1. 方法1 docker commit   //通过容器构建, 提交容器副本使之成为一个新的镜像
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





## docker file

1. 在根目录下新建 mydocker 文件夹并进入
    mkdir /mydocker && cd /mydocker

1. "可在Dockerfile中使用 VOLUME指令 来给镜像添加一个或多个数据卷"

    VOLUME["/dataVolumeContainer","/data/VolumeContainer2","/data/VolumeContainer3"]    //全都是容器内的

    出于可移植和分享的考虑，用 -v 主机目录:容器目录  这种方法不能够直接在 Dockerfile 中实现
    由于宿主机目录是依赖于特定主机的，并不能保证在所有的宿主机上都存在这样的特定目录

1. File 构建
    vim dockerfile

    ```
    # volume test
    FROM centos
    VOLUME ["/dataVolumeContainer1","/dataVolumeContainer2"]
    CMD echo "Finished,---success1"
    CMD /bin/bash


    大致等价于下边这条命令
        docker run -it -v /host1:/dataVolumeContainer1 -v /host2:/dataVolumeContainer2 centos /bin/bash

        就是在容器内生成两个volume文件夹，在主机上没有生成
    ```
1. build 生成镜像
    

1. run 



## 
