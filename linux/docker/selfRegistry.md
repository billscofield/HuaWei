
docker pull registry

x docker run --name myRegistry --restart=always -d -p 5000:5000 registry

docker run -d -p 5000:5000 -v /opt/registry:/var/lib/registry --restart=alwayx --network=liujiaotest --ip=172.21.0.3 registry

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

    


