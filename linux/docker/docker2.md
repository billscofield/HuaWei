# APT 方法安装Docker

使用清华的源，否则官方的 非常的慢

https://mirrors.tuna.tsinghua.edu.cn/help/docker-ce/

sudo apt install docker.io

sudo groupadd docker
sudo gpasswd -a ${USER} docker      //sudo usermod -aG docker your-user
sudo service docker restart         //发现权限问题依旧，重启好了


sudo apt install docker-ce

dpkg -s docker-ce

dpkg -L docker-ce

    --listfiles docker-ce



## 查看docker信息

docker info


## 查看版本信息

docker version	//较为详细

docker --version	//仅版本号
docker -v           //仅版本号

## 查看服务器有哪些镜像

docker search ubuntu

Filter output based on these conditions:
    - stars=<numberOfStar>
    - is-automated=(true|false)
    - is-official=(true|false)

    docker search --filter=stars=100 ubuntu
    docker search -f stars=100 ubuntu


## 更换源

vi /etc/docker/daemon.json

    ```
    {
        "registry-mirrors":["https://mirrors.tuna.tsinghua.edu.cn/docker-ce"]
    }
    ```

## 下载docker镜像

docker pull
