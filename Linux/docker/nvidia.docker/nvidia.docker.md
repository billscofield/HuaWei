
## FAQ

### 1. Error response from daemon: could not select device driver ““ with capabilities: [[gpu]]

Nvidia Docker安装后，使用镜像创建容器时出错，命令如下

docker run -it -gpus all ubuntu nvidia-smi
错误提示：

Error response from daemon: could not select device driver "" with capabilities: [[gpu]]
这是由于没有配置好docker运行环境导致的，执行安装容器运行环境（Ubuntu为例）

apt-get install nvidia-container-runtime
安装后重新启动docker

systemctl restart docker

https://blog.csdn.net/dou3516/article/details/108314908
https://blog.csdn.net/BigData_Mining/article/details/104991349

### 2. 
