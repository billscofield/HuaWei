## 网站

https://github.com/docker

https://www.docker.com

https://docs.docker.com

https://hub.docker.com

docker-cn.com

docker.com/tryit/


## Docker 历史¬

2010年, 在美国成立了一家公司 dotCloud

做一些 pass 的云集算服务, LXC 有关的容器技术

他们将自己的技术(容器化技术)命名为 Docker

2013年将其开源

2014年4月9日, Docker 1.0 发布

使用go语言编写


## Docker 背景知识

用户空间

内核空间

使用的镜像有alpine


Namespaces  命名空间
    编程语言
        封装->代码隔离
    操作系统
        系统资源的隔离
        进程、网络、文件系统...

    有5种隔离
        1. PID (Process ID) 进程隔离
            容器有自己独立的进程表和1号进程
        1. NET (Network)    管理网络接口
            容器有自己独立的网络信息
        1. IPC (InterProcess Communication) 管理跨进程通信的访问
            在ipc通信时，需要加入额外信息来标示进程
        1. MNT (Mount)      管理挂载点
        1. UTS (Unix Timesharing System)    隔离内核和版本标识
            独立的 hostname 和 domain

Control Groups(cgroups) 控制组
    管理命名空间隔离的资源

    资源限制
    优先级设定
    资源计量
    资源控制
    资源使用记录

    /sys/fs/cgroup

Chroot

    文件系统的隔离

传统linux启动时，将rootfs设置为readonly并检查完整性，然后设置为read-write

Docker 在启动 container 的时候，也是将rootfs设置为readonly,然后通过 aufs 把一个
readwrite 的文件系统挂载到 rootfs 之上，并且把下层文件系统设置成 readonly,这样
构成一个完整的操作系统

对于每一层的 readonly 的 FS，在docker中成为 image

对于顶上 read-write 的FS，在 docker 中成为 container

对于readonly 中内容的修改(比如nginx), 采用的是 COW(copy on write)的技术，把文件
复制到 read-write 层并改写，实际用户看到的是当前container层中的文件，image中的
文件不会被影响


因此container 可以共享image层的 FS, 提高了存储的效率


Docker hub

    Automated Builds Image, 通过和 github 的集成，自动监控 github 项目中变化，
    构建新的image,然后自动发布到 docker hub 中

    [namespace]/[repository name]:[tag]
        
        liujiao/ubuntu:1.1
        
        liujiao/nginx:1.1
        
        [namespace]/[repository name]:[tag]  整个称之为registry
        
        docker push [registry_url]/namespace/repository_name:tag_name
        
        tag 默认是latest
        
        docker search repository-name
        
        对image重命名
            
            docker tag liujiao/test 192.168.10.1:5000/liujiao/test:1.1



## 文件系统

传统linux文件系统

    boot file system(bootfs)
        
        包括 bootloader 和 kernel,在启动完成后，kernel 在内存中，bootloader解除挂载

    root file system(rootfs)
        包括 /usr, /bin 等目录，这些和 kernel 无关, 和不同的发行版本相关


## 网络

### Docke 网络驱动模型

https://www.bilibili.com/video/BV16E41187y4?from=search&seid=10413634710931696721

1. bridge(默认)

    网桥类型网络，就是 NAT 网络

    ```修改默认的配置 /etc/docker/daemon.json
    {
        "bip": "192.168.1.5/24",                    // bridge ip
        "fixed-cidr": "192.168.1.5/25",             // 掩码
        "fixed-cidr-v6": "2001:db8::/64",           // 可以不设置
        "mtu": 1500,
        "default-gateway": "10.0.1.1",
        "default-gateway-v6": "2001:db8:abcd::89",
        "dns": ["10.20.1.2","10.20.1.3"]
    }

    ```

    宿主机: brctl show 查看网桥信息

    宿主机的 veth 和容器内的网卡是如何对应的呢?
        
        宿主机: ip a
            11: veth32f731d@if10: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master docker0 state UP group default
                link/ether 66:81:a0:1b:66:b1 brd ff:ff:ff:ff:ff:ff link-netnsid 2
                inet6 fe80::6481:a0ff:fe1b:66b1/64 scope link
                   valid_lft forever preferred_lft forever
            
        容器: ip a
            10: eth0@if11: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue
                link/ether 02:42:ac:11:00:04 brd ff:ff:ff:ff:ff:ff
                inet 172.17.0.4/16 brd 172.17.255.255 scope global eth0
                   valid_lft forever preferred_lft forever

        容器虚拟网卡的名字: eth@if数字, 这个数字就对应宿主机虚拟网卡的数字


1. host
    
    和主机共用(virtual box 中的桥接)

    docker run --name "test01" --rm -it --network host busybox /bin/sh

    ip a 信息和宿主机完全一样

1. none

1. overlay
    
    docker run --name "test01" --rm -it --network container:demo1  busybox /bin/sh

    文件系统和PID 是和 demo1 隔离的


1. macvlan


docker network list     列出网络模型

docker inspect <Docker-ID>  | grep NetworkSettings

docker network --help


### bridge

Docker 的网络接口都是虚拟的接口

虚拟的网络接口的转发效率高

在宿主机上可以看到有个 docker0 的网卡

172.17.0.1

SandBox(沙盒)


|   +-------+           +-------+
|   | 容器1 |           | 容器2 |
|   +-------+           +-------+
|   veth接口            veth接口    eth0
|      |                    |
|      +----+           +---+
|           |           |
|          \|/         \|/  vethXXX
|      +--------------------+
|      |    网桥 docker     |
|      +--------------------+
|                 |
|      +--------------------+
|      |    物理网卡        |
|      +--------------------+


有一个容器就会在宿主机上有一个 vethXXX 与之对应

Docker 创建容器的时候, 会执行下面的操作
    
    1. 创建一对的虚拟的网络接口，一个放宿主机，一个容器中
    2. 宿主机的虚拟接口接到 docker 的网桥上，名称为 vethXXX
    3. 虚拟网络接口名称为 eth0
    4. 从宿主机的网桥上获取IP地址




## Docker 组成

Docker Client 客户端

Docker Daemon 守护进程

1. Docker Image 镜像

    层叠的只读文件系统

    +-------------+
    |add nginx    |
    +-------------+
    |add vim      |
    +-------------+
    |rootfs  例如ubuntu
    +-------------+
    |bootfs       |
    +-------------+

1. Docker Container 容器

    +-------------+
    |可写层       |
    +-------------+
    |add nginx    |
    +-------------+
    |add vim      |
    +-------------+
    |rootfs  例如ubuntu
    +-------------+
    |bootfs       |
    +-------------+

1. Docker Registry 仓库


### 帮助

docker version

docker info

docker 命令 --help


## 镜像命令



### 增

docker pull 镜像[:tag]
    
    -a, --all-tags[=false]
        Download all tagged images in the repository
        
    --disable-content-trust[=true]
        Skip image verification
        
    -h, --help[=false]
        help for pull
        
    --platform=""
        Set platform if server is multi-platform capable
        
    -q, --quiet[=false]
        Suppress verbose output


1. 附加后台镜像实例

    docker container attach [实例名]


### 3. 删除镜像

docker rmi  默认 latest

Alias for docker image rm.

-f, --force[=false]

    Force removal of the image

-h, --help[=false]

    help for rmi

--no-prune[=false]

    Do not delete untagged parents

删除全部镜像

    docker image rm $(docker image ls -qa)

### 查

1. 查看当前的 registry

    docker info | grep registry


1. 列出本机已经 pull，安装的镜像

    docker image ls     //是image 不是images

    docker images       //是docker image ls 的别名

    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    镜像的仓库源                                                镜像创建时间

    docker image --help

    docker image ls 或者 docker images

        -a, --all             Show all images (default hides intermediate images)
        
            --digests         Show digests(文摘；摘要)
        
        -f, --filter filter   Filter output based on conditions provided
            
            - stars=<numberOfStar>
            
            - is-automated=(true|false)
            
            - is-official=(true|false)
            
            (man docker-search ; /filter)
            
            --format string   Pretty-print images using a Go template
            
            --no-trunc        Don't truncate output(显示完整的image ID)
        
        -q, --quiet           Only show numeric IDs(image id)     //用于script处理


1. 镜像搜索(搜索的还是docker-hub上的)

    1. 方法1 docker hub 
        1. 注册
        1. 查找 ubuntu
        1. 网址 hub.docker.com
        
    1. 方法2 命令行
        1. docker search [option] TERM
            默认是从 docker hub 中搜索
            
            1. --no-trunc   //不截断,do not truncate output(主要针对description)
            
            1. --limit [数字] //一次返回多少个results  默认25
                
                Max number of search results
                
            1. --filter
                1. --filter=stars=<numberOfStar> 这里是min值, 是>=
                
                1. --filter=is-automated=true|false
                
                1. --filter=is-official=true|flase
            
            
            ```
            1. docker search kali
            
            NAME                              DESCRIPTION                                     STARS    OFFICIAL     AUTOMATED
            kalilinux/kali-rolling            Official Kali Linux image (weekly snapshot o…   76
            linuxkonsult/kali-metasploit      Kali base image with metasploit                 69                    [OK]
            ```

### 上传镜像

docker login 登录到 docker hub中

把docker image push 到 docker hub 中

docker tag [ID] liujiao/test


## 容器

启动服务，安装镜像完成后在 host 上运行 ifconfig, 多了个 docker0 的网卡

Commands:
    commit      Create a new image from a container's changes
    exec        Run a command in a running container
    logs        Fetch the logs of a container
    ls          List containers
    top         Display the running processes of a container
    run         Run a command in a new container
    start       Start one or more stopped containers
    restart     Restart one or more containers
    pause       Pause all processes within one or more containers
    attach      Attach local standard input, output, and error streams to a running container
    port        List port mappings or a specific mapping for the container
    stats       Display a live stream of container(s) resource usage statistics
    stop        Stop one or more running containers 正常关闭
    kill        Kill one or more running containers 拔电源

    cp          Copy files/folders between a container and the local filesystem

    export      Export a container's filesystem as a tar archive

    inspect     Display detailed information on one or more containers
    diff        Inspect changes to files or directories on a container's filesystem

    rename      Rename a container
    create      Create a new container

    rm          Remove one or more containers
    prune       Remove all stopped containers

    unpause     Unpause all processes within one or more containers
    update      Update configuration of one or more containers
    wait        Block until one or more containers stop, then print their exit codes

### 1. 增

#### 启动单次容器

docker run IMAGE COMMAND

    docker run ubuntu echo "hello world"

    -e, --env=[]
        
        Set environment variables
        
        This option allows you to specify arbitrary environment variables that are available for the process that will be launched inside of the container.
        mysql 容器需要输入密码，就用这个
        
        docker run -it --name liumysql -p 9000:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql bash
        
    docker run -d ubuntu /bin/bash -c "while true;do echo 'helo';sleep 1;done"


    --rm true|false
        
        Automatically remove the container when it exits. The default is false.
        
        --rm flag can work together with -d, and auto-removal will be done on daemon side. Note that it's incompatible with any restart policy other than none.
        
        docker run -it --name mysql -p 8888:3306 --rm -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql
        docker run -it --name mysql -p 8888:3306 --rm -e MYSQL_ROOT_PASSWORD=111 mysql
        docker run -it --name mysql -p 8888:3306 --rm -e MYSQL_RANDOM_PASSWORD=111 mysql


    -m 内存限制

    --cpuset-cpus=  //CPUs in which to allow execution (0-3, 0,1)

    --name="XXX"

    -d  后台方式运行

    -it 交互式

    -p  指定端口
        -p  主机端口:容器端口
        -p  ip:主机端口:容器端口

    -P  随机端口

    --rm    Automatically remove the container when it exits


#### 启动交互式容器

docker run -it IMAGE COMMAND

    -i --interactive=true   始终打开一个标准输入

    -t --tty=true   


#### 进入容器

1. sshd

1. nsenter(namespace enter)
    包含在util-linux中, 用来进入一个进程的 namespace

    获取一个进程的pid
        方法一: docker inspect [container] | grep Pid
        方法二: 
            docker inspect --format "{{.State.Pid}}" [container]
            nsenter --target [container Pid] --mount --uts --ipc --net --pid
            不好用啊，我的debian 报错
                nsenter: failed to execute /usr/bin/zsh: No such file or directory
        方法三:
            docker exec -it [container] /bin/bash
1. exec

1. attach


### 停止容器

1. 停止一个镜像实例

    docker stop [实例名]

1. 强制停止一个容器

    docker kill 



### 查看容器

1. docker ps

List containers

不加参数是正在运行的容器

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

docker container inspect [id或name]   

dcoker inspect 
    
    Return low-level information on Docker objects

    查看存储信息: docker inspect <ID> | grep "Mounts"


1. docker top 

    Display the running processes of a container


1. docker-stats - Display a live stream of container(s) resource usage statistics

    docker stats 容器   // 看 cpu 内存使用



#### 创建容器

注意

    docker run | docker container run    are the same, docker --help | grep run  && docker container --help | grep run

        有网友说docker container run 是新的命令，而docker run是旧命令

        https://forums.docker.com/t/docker-run-and-docker-container-run/30526


    man docker-container-run    =>      Alias for docker run.
    man docker-ps               =>      Alias for docker container ls.
    man docker-exec             =>      Alias for docker container exec.

1. 创建一个守护式容器
    1. 能够长期运行
    1. 没有交互式会话
    1. 适合运行应用程序和会话

    Docker容器后台运行，就必须有一个前台进程    


    1. 方式1 
    docker run -i -t [镜像名] /bin/bash
        -t : --tty

    docker run -it ubuntu       //每个镜像都有默认的shell,比如Ubuntu是/bin/bash, busybox 是sh

    ctrl p q 方式退出

    docker attache  
    
    1. 方式2 
        docker run -d 镜像名
        -d, --detach                         Run container in background and print container ID

        docker run --name one -d ubuntu /bin/sh -c "while true;do echo helloworld;sleep1;done"



/usr/lib/systemd/system/docker.service
    -H, --host=[unix:///var/run/docker.sock]: tcp://[host]:[port][path] to bind or unix://[/path/to/socket] to use.

    默认: ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock --icc=false --iptables=true

    docker -H 192.168.1.1 info  //如果server是用TCP,在别的机器上




#### 启动容器

1. 开启一个镜像实例

    docker start [实例名]
    docker restart [实例名]

    Alias for docker container start.

-a, --attach[=false]

    Attach STDOUT/STDERR and forward signals

-i, --interactive[=false]

    Attach container's STDIN

--checkpoint=""

    Restore from this checkpoint

--checkpoint-dir=""

    Use a custom checkpoint storage directory

--detach-keys=""

    Override the key sequence for detaching a container

-h, --help[=false]

    help for start


1. 重命名容器名

    docker container rename [old-container-name] [new-container-name]


1. 重新启动停止的容器

    docker container start  [容器名]
        这里没有 -i -t, 它们是 docker run 时的
        
        -t, --time=10
            Seconds to wait for stop before killing the container


#### 删除已经停止的容器

docker rm [容器名]  //不能删除正在运行的容器

    -f, --force[=false]
        
        Force the removal of a running container (uses SIGKILL)

    -h, --help[=false]
        
        help for rm

    -l, --link[=false]
        
        Remove the specified link

    -v, --volumes[=false]
        
        Remove anonymous volumes associated with the container



删除多个容器

    docker rm -f $(docker ps -a -q)

    docker ps -a -q | xargs docker rm 



docker container kill [实例名]

    Kill one or more running containers

    Options:

        -s, --signal string   Signal to send to the container (default "KILL")


#### 附加运行的容器

进入当前正在运行的容器

docker exec -it [实例名] /bin/bash

    新开了一个终端

docker attach [实例名]
    
    还是原来的

---

docker container exec [实例名] ifconfig

docker container exec -t [实例名] ifconfig

docker container exec -it [实例名] ifconfig

docker container exec -it [实例名] bash

    创建了一个新的bash, exit 退出不会exit container

    不是所有容器都有bash，但一般都有sh,所以 start 不起来换shell

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

    如果两个或以上的地方同时使用这种方式登录，同步显示，和vnc一样的效果


#### 退出容器

容器不会停止运行

    ctrl p q    //将交互式容器放在后台运行

容器停止退出

    exit

## 进程

docker top [id]


## 将容器中的文件 cp 到宿主机器

容器可以没有在运行

docker cp ID:/路径/文件   本地路径

## 日志

docker log 

可以看到 container 中 command 所指向进程的STDOUT,STDERR数据

**Fetch the logs of a container**

Options:

    --details        Show extra details provided to logs

-f, --follow         Follow log output

    --since string   Show logs since timestamp (e.g. 2013-01-02T13:23:37) or relative (e.g. 42m for 42 minutes)

-n, --tail string    Number of lines to show from the end of the logs (default "all")

-t, --timestamps     Show timestamps

    --until string   Show logs before a timestamp (e.g. 2013-01-02T13:23:37) or relative (e.g. 42m for 42 minutes)

    ```
    docker run -d ubuntu /bin/sh -c "while true;do echo 'hello';sleep 2;done"

    docker logs -f -t <ubuntu-id>

    是因为后台运行着一个shell程序，所以docker认为这个容器有事在做
    没有进程的容器会被销毁
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

        "dns": ["8.8.8.8","8.8.4.4"],
        "data-root": "/data/docker"                     //docker info | grep "Docker Root Dir: /var/lib/docker"
    }
    ```

    这个文件格式如果不对的话，会报错:
    Failed to start Docker Application Container Engine.

    systemctl daemon-reload
    systemctl restart docker

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


the docker engine consists of two parts:
    a daemon:a server process that manages all the containers
    a client:which acts as a remote control for the daemon



查看容器日志(容器内部运行情况)
    docker logs [-f] [-t] [--tail]
        --details[=false]
            Show extra details provided to logs
        
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
        让 docker 容器自己停止

    docker kill 容器名
        杀死 docker 容器



man docker-run
man docker-logs
man docker-top
man docker-exec
man docker-search




在容器中部署网站
    端口映射，格式为：主机(宿主)端口:容器端口
        -P, --publish-all=true|false
            Publish all exposed ports to random ports on the host interfaces. The default is false.
            暴露 dockerfile 中所有 EXPLOSE 的端口

        -p, --publish ip:[hostPort]:containerPort | [hostPort:]containerPort
            Publish a container's port, or range of ports, to the host.

    docker run -p 80 --name nginxtest -it ubuntu
        主机随机一个端口, 可以使用
            docker ps
            docker port CONTAINER
        查看具体主机端口
            containerPort
                docker run -p 80 --name nginxtest -it ubuntu
            hostPort:containerPort
                docker run -p 8080:80 --name nginxtest -it ubuntu
            ip::containerPort
                docker run -p 0.0.0.0:80 --name nginxtest -it ubuntu
            ip:hostPort:containerPort
                docker run -p 0.0.0.0:8080:80 --name nginxtest -it ubuntu

            [49000,49900]
    
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
    docker inspect | grep IPAddress

curl http://容器的ip地址
    可以通过 docker inspect [容器名] 来查看ip地址，端口等情况，查看 NetworkSettings
    不用添加端口号


docker stop web
docker start web
docker exec web nginx
curl http://127.0.0.1:端口 并不能访问
停止并重新启动容器时，ip地址，映射的端口号都会变化
    怎么解决呢?


镜像的位置
    docker info 查看image位置   Root Dir
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

    docker inspect 镜像或者容器
        返回json格式信息

    repository 仓库 比如 liujiao/ubuntu中的liujiao
    registry 仓库

    registry 仓库 包含 repository 仓库, repository 仓库包含一个个的镜像

    -a, --all[=false]
        Show all images (default hides intermediate images)

    --digests[=false]
        Show digests

    -f, --filter=
        Filter output based on conditions provided

    --format=""
        Pretty-print images using a Go template

    -h, --help[=false]
        help for images

    --no-trunc[=false]
        Don't truncate output

    -q, --quiet[=false]
        Only show numeric IDs

    

删除镜像
    docker rmi  镜像1 镜像2 ...
        -f , --force
        --no-prune  //do not delete untagged parents   不移除该镜像的未打标签的父镜像

        docker rmi $(docker images -q ubuntu)
        docker rmi $(docker images -q)
        
镜像标签


拉取镜像
    docer pull [option] NAME[:TAG]
        -a,-all

        全名：用户名/镜像名

    --registry-mirror
        /etc/default/docker 添加  DOCKER-OPTS="--registry-mirror=http://"

        systemctl restart docker
        可以看到后面有了 --registry-mirror 选项

    docker pull hub.c.163.com/library/ubuntu
        hub.c.163.com/library/      //网易docker registry
        不同站点下载的image 不一样啊，网易下载的ubuntu 120MB,而默认的站点才86MB

    DAUCLOUD
    
    busybox 是一个集成了一百多个最常用linux命令和工具的软件,同时它也是一个最小的Linux系统，它提供了该系统的主要功能，例如grep、find、mount以及telnet等但不包含一些与GNU相关的功能和选项。

    配置 Docker 中国区官方镜像

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
            
            -a --author [string]
                
                docker inspect 时可以看到
                
            -m --message    [string]
                
                docker inspect 时看不到，里面没有???
                
            -p --pause          //pause container during commit(default true)
                
                默认会暂停容器
                
            
            docker commit [numeric id] 镜像名
            
            docker commit -m "描述行信息" -a 作者    容器ID   目标镜像[:tag]

    1. 方法2 docker build //通过dockerfile文件构建
        docker build 
            -t --tags=" "
            -q, --quiet               Suppress the build output and print image ID on success
            --rm                      Remove intermediate containers after a successful build (default true)




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


    host 上一个veth{id}的虚拟网卡和一个container里面的eth网卡一一映射
    host 上的bridge负责把数据流veth间转发实现网络的IO
    bridge 使用RFC1918 给每一个container分配私有ip

    docker run --net host ...
        --net host  直接使用host的网络，网卡, 同样的IP
        --net none  不适用网络


    docer 容器 在stop start后 ip可能会改变，不可靠
    docker 使用了别名的机制解决此问题


    默认使用host上的DNS配置
        --dns

### 帮助命令

1. docker version
1. docker info
1. docker --help
    docker run --help
    docker exec --help



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

Docker 容器的本地实现不支持 NVIDIA GPU，这就是为什么我们开发了nvidia-docker插件。

使用 Nvidia Docker，可以无缝地配置一个GPU设备可见的容器，并准备好执行基于GPU的应用程序

Nvidia 关于 nvidia-docker 的博客强调了使用便携式GPU容器的两个关键点

    1. 与驱动程序无关的 CUDA 镜像

    1. Docker 命令行包装器，在启动时将驱动程序的用户模式组件和GPU（字符设备）装载到容器中。

在安装 nvidia-docker 之前更新系统的NVIDIA驱动程序。另外，确保 Docker 安装在系统上。

CUDA（Compute Unified Device Architecture），是显卡厂商 NVIDIA 推出的运算平台。 CUDA 是一种由 NVIDIA 推出的通用并行计算架构，该架构使GPU能够解决复杂的计算问题。

https://www.sohu.com/a/209301090_609513



## docker 搭建 git server

https://blog.csdn.net/xxkalychen/article/details/82219821





## docker file

1. 大小写不敏感，建议使用大写

1. 在根目录下新建 mydocker 文件夹并进入
    mkdir /mydocker && cd /mydocker

1. "可在Dockerfile中使用 VOLUME指令 来给镜像添加一个或多个数据卷"

    VOLUME["/dataVolumeContainer","/data/VolumeContainer2","/data/VolumeContainer3"]    //全都是容器内的

    出于可移植和分享的考虑，用 -v 主机目录:容器目录  这种方法不能够直接在 Dockerfile 中实现
    由于宿主机目录是依赖于特定主机的，并不能保证在所有的宿主机上都存在这样的特定目录

    如何在宿主机中挂载呢???

1. File 构建
    vim dockerfile

    ```
    # volume test
    FROM centos
    VOLUME ["/dataVolumeContainer1","/dataVolumeContainer2"]
    CMD echo "Finished,---success1"
    CMD /bin/bash
    
    **在container中实际运行的首进程**


    大致等价于下边这条命令
        docker run -it -v /host1:/dataVolumeContainer1 -v /host2:/dataVolumeContainer2 centos /bin/bash

        就是在容器内生成两个volume文件夹，在主机上没有生成
    ```

1. build 生成镜像
    

1. run 



## 解决普通用户无法使用 docker 命令的问题

1.如果普通用户运行docker，是会报错的。
    Cannot connect to the Docker daemon. Is the docker daemon running on this host?

2.其实这个问题是权限的问题。

    ll /var/run/docker.sock
    srw-rw---- 1 root docker 0 Jul 18 16:20 /var/run/docker.sock=

可以看到docker.sock这个文件的权限是660，也就是说组用户是有权限的。那么我们只要把用户加到docker这个组下就ok了。

3.usermod修改用户组。
    usermod -a -G docker 用户

重启docker
    service docker restart



## Orchestration as a service(OaaS)

[ˌɔːrkɪˈstreɪʃn] 管弦乐

协调在不同 host 上的 container, 把他们组成一个有机的统一体, 容器编排


### 解决方案

1. Fig
    python所写

1. Kubernetes



## graphdriver and volume

graphdriver 是用来存储镜像和容器的

volume 是用来存储数据的

graphdriver
    aufs(ubuntu)
    btrfs(CoreOS)
    devicemapper(Redhat,CentOS)
    overlayfs(CoreOS)

graph 镜像的管理者
    json        镜像信息
    layersize   镜像的大小信息


aufs
    another Union File System

    挂载点: /var/lib/docker/aufs/mnt/$CONTAINER_ID




## 可视化

portainer

Docker 图形化界面管理工具,提供一个后台面板供我们操作

docker run -d -p 8080:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock --privileged=true portainer/portainer


## 容器数据卷

将容器内的目录挂载到宿主机内的目录

容器间也可以

如果宿主机目录存在文件a, 而docker主机也要创建a, 会如何操作?

### 使用方式一:

docker run -it -v 宿主机目录:容器内目录

    宿主机目录不必先存在

    docker inspect [id] | grep Mounts
        "Source"
        "Destination"
        "RW":true

    docker run -d -p 3310:3306 -v /home/mysql/conf:/etc/mysql/conf.d  -v /home/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=密码 --name mysql01 mysql

    

### 具名挂载和匿名挂载

-v 卷名:容器内路径                  // 具名挂载, /var/lib/docker/volumes/具名

匿名挂载:未指定宿主机目录

-v 容器内路径
    
    会自动挂在到宿主机内的一个目录

    docker volume ls
        
        具名挂载会显示容器内路径

    docker volume inspect 具名      // 查看 Mountpoint
        
        /var/lib/docker/volumes/具名

-v 宿主机路径:容器内路径:ro         // 只能从宿主机进行操作

-v 宿主机路径:容器内路径:rw



## Dockerfile

每个命令都是一层

```dockerfile1

FROM centos

VOLUME ["volume01","volume02"]      // 这个是容器内路径, 根目录下

CMD echo "------end--------"

CMD /bin/bash

```

docker build -f /test/dockerfile1 -t mycentos .

    -t, --tag list                Name and optionally a tag in the 'name:tag' format
        --target string           Set the target build stage to build.
        --ulimit ulimit           Ulimit options (default [])

    . 当前目录

    docker build -f /test/dockerfile1 --tag mycentos .


容器间共享, 父容器(数据卷容器)

    --volumes-from

    docker run -it --name dockerfather:0.1 mydocker

    docker run it --name son1 --volumes-from dcokerfather mydocker

    父容器停掉,删掉, 子容器不受影响, 应该是指针引用的概念
