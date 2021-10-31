
## dockerfile 容器卷
根目录 dockerfile
FROM centos
VOLUME ["/dataVolumeContainer1","/dataVolumeContainer2"]
CMD echo "finished"
CMD /bin/bash


docker run -it -v /host1:/dataVolumeContainer1 -v /host2:/dataVolumeContainer2 centos /bin/bash

docker build -f /mydocker/dockerfile -t liujiao/centos .

会给一个默认的宿主机默认地址 docker inpsect


docker run -it -name dc02 --volumes-from dc01 liujiao/centos

数据卷的生命周期直到没有容器使用它为止

## dockerfile

```
每条保留字指令都必须为大写，并且后面要跟随只少一个参数

指令从上到下顺序执行
# 表示注释
每条指令都会创建一个新的镜像层，并对镜像进行提交
```


FROM scratch //scrach是基本类

MAINTAINER liujiao billscofield@126.com
    镜像维护者的姓名和邮箱地址

RUN
    RUN apt install -y vim
    RUN apt install net-tools

    容器构建时需要运行的命令, 每一个run就是一个层

    ```
    WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
    ```

    shell 模式
        RUN apt-get update && apt install -y neofetch
        /bin/sh -c command  以/bin/sh -c 运行命令

    exec 模式
        RUN ["executable", "param1","parma2"]
        RUN ["/bin/bash","-c","echo helloworld"]    可以以其他shell运行命令


EXPOSE      //对外服务端口
    EXPOSE 80
    EXPOSE 80 4040

WORKDIR     //docker run -it 镜像，登录后的默认目录,默认根目录

ENV         //环境变量
    ENV mypath /tmp 
    ENV mypath=/tmp 这两种都可以
    WORKDIR $mypath

    用来在构建镜像过程中设置环境变量


ADD         //拷贝+解压缩
    将宿主机目录下的文件拷贝进镜像且Add命令会自动处理URL和解压tar压缩包
COPY        //拷贝


VOLUME      //容器卷，数据持久化


CMD ["/bin/bash"]   //如果有这个，docker run -it 时就可以不写 /bin/bash
    指定容器启动时要运行的命令
    制定容器运行时默认的行为

    容器运行时的命令

    **可以有多个CMD指令，但只有最后一个生效**
    CMD /bin/bash

    **会被docker run 后面的参数替换**
        docker run -it ubuntu ls -l
        docker run -it liujiao/ubuntu:1 pwd

    CMD 使用方式2 搭配ENTRYPOINT
        CMD ["param1","param2"] 作为ENTRYPOINT指令的默认参数



ENTRYPOINT
    容器启动时要运行的命令
    每一个dockerfile 只能定义一个ENTRYPOINT，多个ENTRYPOINT只有最后一个生效
    当定义了ENRTYPINT后，CMD只能作为参数进行传递
    
    docker run 的参数不会被替换，而是追加
    
    ```
    FROM centos
    RUN yum install -y curl
    CMD ["curl","-s","http://ip.cn"]

    ---

    FROM ubuntu
    ENTRYPOINT ["ls","-al"]
    CMD ["/"]                   docker run 时的参数会替换这个参数

    ```



    可以用 docker run --entrypoint 命令覆盖

    ???

ONBUILD
    当构建一个被继承的 Dockerfile时运行命令，父镜像在被子继承后父镜像的 onbuild 被触发
    类似于触发器
    会在构建过程中插入指令

    ONBUILD <dockerfile 指令>

    ```
    ONBUILD RUN echo "this is from onbuild trigger"
    ```

.dockignore

USER 指定用户
    USER <username>                 USER uid
    USER <username>:<groupname>     USER uid:gid
    USER <username>:gid             USER uid:groupname


dockerfile 构建过程
    1. 从基础镜像运行一个容器
    2. 执行一条指令，对容器进行修改
    3. 执行类似 docker commit 的命令，提交一个新的镜像层
    4. 再基于刚才提交的镜像运行一个容器
    5. 执行 dockerfile 中的吓一条指令，直至所有指令执行完毕

    删除中间层容器，而不会删除中间层镜像
    使用中间层镜像调试

构建缓存
```
//第一次运行
➜  docker docker build -t liujiao/test .
Sending build context to Docker daemon  3.072kB
Step 1/3 : FROM ubuntu
---> d70eaf7277ea
Step 2/3 : MAINTAINER liujiao billscofield@126.com
---> Running in 8276e8699d57
Removing intermediate container 8276e8699d57
---> 88d6ddf91370
Step 3/3 : CMD /bin/bash
---> Running in fc1e742a8cfb
Removing intermediate container fc1e742a8cfb
---> 6316db2d85de
Successfully built 6316db2d85de
Successfully tagged liujiao/test:latest

//第二次运行
➜  docker docker build -t liujiao/test .
Sending build context to Docker daemon  3.072kB
Step 1/3 : FROM ubuntu
---> d70eaf7277ea
Step 2/3 : MAINTAINER liujiao billscofield@126.com
---> Using cache
---> 88d6ddf91370
Step 3/3 : CMD /bin/bash
---> Using cache
---> 6316db2d85de
Successfully built 6316db2d85de
Successfully tagged liujiao/test:latest
```
但是有时候我们不希望使用缓存，如 apt-get update

此时我们可以使用  docker build --no-cache
或者也可以在dockerfile 中 设置 ENV REFRESH_DATE 2017-07-02, 每次构建时修改这个变量


---

base镜像 scratch

docker history 镜像

apt-cache show iputils-ping
apt-cache show iputils-arping
apt-cache show iputils-tracepath

docker images 镜像

镜像仓库
    阿里云
    产品分类
    开发和运维
    代码托管、仓库
    容器镜像服务



## 网络

docker 守护进程通过 docker0 网卡向docker 提供网络

docker0 即 Linux 的虚拟网桥 宿主机上运行ip a, 而不是docker容器中
网桥是二层设备，但是Linux的网桥有如下特点:
    1. 可以设置IP地址
        通常是 172.16.0.1/16
    1. 相当于拥有一个隐藏的虚拟网卡

管理 docker0 的ip地址范围
    ifconfig docker 0 192.168.100.1 netmask 255.255.255.0

### 网桥管理程序

apt install bridge-utils    

brctl 
    show        show a list of bridges
    showmac     show a list of mac addresses

    addbr           <bridge>                add bridge
    delbr           <bridge>                delete bridge
    addif           <bridge> <device>       add interface to bridge
    delif           <bridge> <device>       delete interface from bridge


添加虚拟网桥

    brctl addbr br0
    ifconfig br0 192.168.200.254 netmask 255.255.255.0

    更改docker守护进程的启动设置
    vi /etc/default/docker
       DOCKER_OPS=" -b=br0""
    
    systemctl restart docker
    ps -ef | grep docker 
       
### 容器的互联

1. 允许所有容器互联(默认)
1. 拒绝容器间互联
1. 允许特定容器间的互联

```环境准备
Dockerfile

FROM ubuntu
RUN apt-get update && apt-get install -y iputils-ping curl nginx
EXPOSE 80
CMD /bin/bash
```

systemctl restart docker 会使容器的IP地址发生变化

docker run --link=[另外一个容器]:[另外一个容器的nickname] imagae command

docker run -it --name=cct1 liujiao/ubuntu 
docker run -it --name=cct2 --link=cct1:nginxserver liujiao/ubuntu 

在cct2中,ping nginxserver

#### 拒绝容器间互联

vi /etc/default/docker
DOCKER_OPS="--icc=false"    //这个好像不管用，而是修改 /usr/lib/systemd/system/docker.service

```
ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock  --icc=false
```


去掉 --icc=false 后 systemctl docker restart 后，docker start cctv1 cctv2 又能互相通信了

#### 允许特定容器间互联

--icc=false --iptables=true 
--link


#### 容器与外部网络的连接

1. --ip_forward=true 默认
1. iptables

sysctl net.ipv4.conf.all.forwarding


## VOLUME 容器卷

docker inspcet [container]
```
    "Mounts"
        "Source": "/var/lib/docker/volumes/ed8ea46dde79a4e2e0fd314fae6a628adb5c0c4081b3cae76c2b516e4608f24a/_data",

```

