# APT 方法安装Docker
使用清华的源，否则官方的 非常的慢

https://mirrors.tuna.tsinghua.edu.cn/help/docker-ce/

sudo apt install docker.io

sudo groupadd docker
sudo gpasswd -a ${USER} docker	//sudo usermod -aG docker your-user
sudo service docker restart	//发现权限问题依旧，重启好了




## 查看docker信息
docker info

## 查看版本信息
docker version	//较为详细

docker --version	//仅版本号

## 查看服务器有哪些镜像
docker search ubuntu

## 更换源

## 下载docker镜像
docker pull
