## Harbor

Harbor是由VMWare在Docker Registry的基础之上进行了二次封装，加进去了很多额外程序，
而且提供了一个非常漂亮的web界面。

    1. Project Harbor 是一个开源的受信任的云原生注册表项目，用于存储、签名和扫描上下文。
    2. Harbor 通过添加用户通常需要的功能（如安全性、身份和管理）来扩展开源 Docker 发行版。
    3. Harbor 支持用户管理、访问控制、活动监控、实例间复制等高级功能。

Harbor在物理机上部署是非常难的，而为了简化Harbor的应用，Harbor官方直接把Harbor
做成了在容器中运行的应用，而且这个容器在Harbor中依赖类似redis、mysql、pgsql等很
多存储系统，所以它需要编排很多容器协同起来工作，因此VMWare Harbor在部署和使用时，
需要借助于Docker的单机编排工具( Docker compose )来实现。

Compose 是一个用于定义和运行多容器 Docker 应用程序的工具。使用 Compose，您可以
使用 YAML 文件来配置应用程序的服务。然后，使用单个命令，从配置创建并启动所有服
务。

https://github.com/goharbor/harbor/releases



wget https://storage.googleapis.com/harbor-releases/release-1.10.0/harbor-offline-installer-v1.10.1-rc1.tgz
tar zxf harbor-offline-installer-v1.10.1-rc1.tgz

修改harbor.yml配置文件
    hostname: 192.168.157.104  #这里配置的监听地址，也可以是域名
    port: 8888 #这里配置监听端口
    harbor_admin_password: 123456  # 配置admin用户的密码
    data_volume: /data/harbor  #配置数据仓库

安装harbor
    ./install.sh

访问harbor界面
    http://192.168.157.104:8888

在每个节点都配置docker信任harbor仓库
    {
    "registry-mirrors":["https://docker.mirrors.ustc.edu.cn"],
    "insecure-registries" : ["http://192.168.157.104:8888"]

    }

    service docker restart


docker login -u admin -p 192.168.157.104:8888
docker tag nginx:latest 192.168.157.105:8888/library/nginx:latest
docker push 192.168.157.105:8888/library/nginx:latest



harbor开机自启

    因为harbor的服务是由 解压目录 中的 docker-compose.yml 配置文件和
    docker中的 容器 提供的所以，我们在设置开机自启时就需要在此目录中启动容器。

    docker-compose stop
    docker-compose start


    ```
    #!/bin/bash

    cd /usr/local/harbor
    docker-compose start

    // 给权限
    [root@node1 harbor]# chmod +x harbor_enable.sh 
    [root@node1 harbor]# ll harbor_enable.sh 
    -rwxr-xr-x. 1 root root 55 Dec 16 18:59 harbor_enable.sh


    // 把脚本写入到 /etc/rc.local 文件中
    [root@node1 harbor]# vim /etc/rc.local
    #!/bin/bash
    /bin/bash /usr/local/harbor/harbor_enable.sh// 添加这行


    [root@node1 harbor]# chmod +x /etc/rc.local 
    ```
