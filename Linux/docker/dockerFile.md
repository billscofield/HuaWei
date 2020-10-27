
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

    容器构建时需要运行的命令

    ```
    WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
    ```


EXPOSE      //对外服务端口
    EXPOSE 80

WORKDIR     //docker run -it 镜像，登录后的默认目录,默认根目录

ENV         //环境变量
    ENV mypath /tmp
    WORKDIR $mypath

    用来在构建镜像过程中设置环境变量


ADD         //拷贝+解压缩
    将宿主机目录下的文件拷贝进镜像且Add命令会自动处理URL和解压tar压缩包
COPY        //拷贝


VOLUME      //容器卷，数据持久化


CMD ["/bin/bash"]   //如果有这个，docker run -it 时就可以不写 /bin/bash
    指定容器启动时要运行的命令

    **可以有多个CMD指令，但只有最后一个生效**
    CMD /bin/bash

    **会被docker run 后面的参数替换**
        docker run -it ubuntu ls -l
        docker run -it liujiao/ubuntu:1 pwd

ENTERPOINT
    容器启动时要运行的命令
    
    docker run 的参数不会被替换，而是追加
    
    ```
    FROM centos
    RUN yum install -y curl
    CMD ["curl","-s","http://ip.cn"]
    ```

ONBUILD
    当构建一个被继承的 Dockerfile时运行命令，父镜像在被子继承后父镜像的 onbuild 被触发
    类似于触发器

.dockignore



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
