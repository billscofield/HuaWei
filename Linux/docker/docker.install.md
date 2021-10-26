## linux 安装方式

检查
    1. 内核 uname -r
    1. 存储驱动 ls -l /sys/class/misc/device-mapper

1. 方法1 Ubuntu 的apt
    sudo apt install docker.io
    //source /etc/bash_completion.d/docker.io  //没有 docker.io 这个文件啊,也不用检查这个吧，哪个教程说要检查这个来的?

    docker.io version

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
    注销重新登录

    groups (1)           - print the groups a user is in
    users (1)            - print the user names of users currently logged in to the current host


systemctl start docker

service docker start



## 推荐的安装方式

利用国内源进行docker的安装

安装添加新存储库所需的依赖项

    apt install apt-transport-https ca-certificates curl software-properties-common gnupg2

添加源

    deb [arch=amd64] http://mirrors.ustc.edu.cn/docker-ce/linux/debian buster stable　　

使用以下 curl 命令导入存储库的 GPG 密钥：

    curl -fsSL http://mirrors.ustc.edu.cn/docker-ce/linux/debian/gpg | sudo apt-key add -

然后apt update在install

    apt-get install docker-ce

检查docker 是否安装成功

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
    
    
    实际发现不太好用，网易的比较好用
    {
      "registry-mirrors": ["http://hub-mirror.c.163.com"]
      
    }
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
        -o, --output=""
            Write to a file, instead of STDOUT


导入容器

    docker import cheng.tar cheng
                            新名字


帮助

    docker help



## docker-io       

早期 ubuntu 维护的版本

docker-engine

上面两个是什么，有什么区别?

docker-ce(community edition)

docker-ee(enterprise edition)


### Windows and MAC¬
¬
基于 virtualBox, 类似于华为模拟器

boot2docker

