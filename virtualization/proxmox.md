创建CT: 创建OpenVZ架构虚拟机, 需要下载模板
创建虚拟机: 创建


在web界面，你就只能上传小于2G的ISO文件。
解决办法：
    通过sftp上传到以下目录就可以解决
    /var/lib/vz/template/iso

源的更换

```
# pve6 <--> debian buster

#deb http://ftp.debian.org/debian buster main contrib
#deb http://ftp.debian.org/debian buster-updates main contrib
# security updates
#deb http://security.debian.org buster/updates main contrib

# https needs(apt install apt-transport-https -y)
deb https://mirrors.aliyun.com/debian buster main contrib non-free
deb https://mirrors.aliyun.com/debian buster-updates main contrib non-free
deb https://mirrors.aliyun.com/debian-security buster/updates main contrib non-free

# pve6 repository: pve-no-subscription
#deb http://download.proxmox.com/debian/pve buster pve-no-subscription
#deb https://mirrors.ustc.edu.cn/proxmox/debian/pve buster pve-no-subscription
deb http://download.proxmox.wiki/debian/pve buster pve-no-subscription
```


ceph 分布式存储
