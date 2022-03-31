
docker pull registry

x docker run --name myRegistry --restart=always -d -p 5000:5000 registry

docker run -d -p 5000:5000 -v /opt/registry:/var/lib/registry --restart=always --network=liujiaotest --ip=172.21.0.3 registry

    最好自定义网段, 否则可能冲突

    加上--restart=always设置镜像仓库容器的重启策略，每次重启宿主机，也会重启docker registry

    如果之前忘记设置镜像仓库容器的重启策略，可以通过docker update指令更新重启策
    略，我的镜像仓库容器ID前四位为4a75，所以指令如下

        docker update --restart=always 4a75

    使用指令查看registry的运行状态。
        docker ps -f name=myRegistry

        打包镜像
            docker commit -m "" -a "" [CONTAINER ID] [新的镜像名]
                -m --message "xxx"
                -a -author "who"
                nginx:v2

    测试Docker Registry
        在宿主机上查看所有的镜像文件, docker images

        使用自己的Registry给该镜像打上标签。 
        为了指定自己的Registry目的地址，需要在镜像名前加上主机名和端口前缀。

            docker tag 405a 192.168.1.1:5000/liujiao/houdini/test

        测试 [ 有返回就表示成功  ]
            [root@registry ~]# curl 192.168.1.1:5000/v2
            <a href="/v2/">Moved Permanently</a>.


    支持不安全的 registry
        方法一:
            https://cloud.tencent.com/developer/article/1553588
            
            配置文件添加–insecure-registry 192.168.216.51:5000
            
            cat /etc/sysconfig/docker
            ```
            # /etc/sysconfig/docker
            #
            # Modify these options if you want to change the way the docker daemon runs
            OPTIONS='--selinux-enabled --log-driver=journald --signature-verification=false --insecure-registry 192.168.216.51:5000'
            ```
            
            为什么我的另外一台 docker 服务器上没有这个文件
            
        方法二:
            
            ```
            {
              "registry-mirrors": ["https://tuv7rqqq.mirror.aliyuncs.com"],
              "insecure-registries":["192.168.1.2:6000"]
                
            }
            ```
            
            好像 docker 直接服务起不来了

    
### Authentication

登录校验机制的前提是有HTTPS协议，否则，用户名和密码都将会明文传输。

Docker的认证机制也有很多实现，可以直接用代理（比如nginx）在Registry之前进行拦截
验证，高端的一些的是有Token服务端，引导用户授权登录，实现难度较大。

这里以最简单的htpasswd在实现登录校验机制。

apt-cache search htpasswd
apt install apache2-utils

假设密码文件存放在/usr/local/auth目录下面，运行如下命令

` htpasswd -Bbn admin 123456 > /usr/local/auth/passwd

    -c  Create a new file.
    -n  Don't update file; display results on stdout.
    -b  Use the password from the command line rather than prompting for it.
    -i  Read password from stdin without verification (for script usage).
    -m  Force MD5 encryption of the password (default).
    -B  Force bcrypt encryption of the password (very secure).


docker run -d -p 5000:5000 -v /opt/registry:/var/lib/registry --restart=always --network=liujiaotest --ip=172.21.0.3 registry

docker run -d -p 5000:5000 --restart=always --name registry -v /usr/local/auth:/auth -v /opt/registry:/var/lib/registry -e REGISTRY_AUTH=htpasswd -e REGISTRY_AUTH_HTPASSWD_REALM=Registry_Realm -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/passwd registry




## web/ui manager

### 1. rancher

WARNING: The requested image's platform (linux/amd64) does not match the
detected host platform (linux/arm64/v8) and no specific platform was requested

Rancher安装

    1. 下载 rancher 镜像
        
        ` docker pull rancher/server

    2. 创建 rancher 容器
        
        ` docker run -itd --name ranger -p9090:8080 rancher/server


