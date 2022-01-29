## 搭建自己的 DockerHub

Docker Hub是由Docker官方提供的，我们也可以搭建自己的Docker，搭建方式也很容器，
因为Docker官方已经将Docker注册服务器做成镜像了，我们直接pull下来运行即可。具体
步骤如下：

1. 拉取镜像

    运行如下命令拉取registry官方镜像：

        > docker pull registry

2. 运行

    接下来运行如下命令将registry运行起来，如下：

        > docker run -itd --name registry -p 5000:5000 2e2f252f3c88

运行成功后，我们就可以将自己的镜像提交到registry上了，如下：

    > docker commit -m "..." 127.0.0.1:5000/nginx3:v3

需要注意的是，本地镜像的命名按照registryHost:registryPort/imageName:tag的格式命
名。
