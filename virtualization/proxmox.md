创建CT: 创建OpenVZ架构虚拟机, 需要下载模板
创建虚拟机: 创建


在web界面，你就只能上传小于2G的ISO文件。
解决办法：
    通过sftp上传到以下目录就可以解决
    /var/lib/vz/template/iso

## 源的更换

目前Proxmox中文社区源已正式提供镜像服务，镜像更新频率为每10小时，镜像站机房存放在法国巴黎online机房使用阿里云、华为云融合提供国内CDN加速服务。 地址 http://download.proxmox.wiki

1. 删除企业源

    rm -rf /etc/apt/sources.list.d/pve-enterprise.list

1. 下载秘钥

    wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg

1. 添加社区源

    echo "deb http://download.proxmox.wiki/debian/pve stretch pve-no-subscription" >/etc/apt/sources.list.d/pve-install-repo.list

    建议同时使用国内debian源

    deb http://mirrors.aliyun.com/debian/ buster main non-free contrib
    deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib
    deb http://mirrors.aliyun.com/debian-security buster/updates main
    deb-src http://mirrors.aliyun.com/debian-security buster/updates main
    deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
    deb-src http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
    deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib
    deb-src http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib

1. 最后执行

    apt update
    apt update && apt dist-upgrade #如需升级pve，则执行该命令

## PVE命令行管理虚拟机启动和停止
查看集群资源状况
    pvesh get /cluster/resources
#取得虚拟机当前状态
#pvesh get /nodes/<节点id>/qemu/<虚拟机id>/status/current
#关闭虚拟机
#pvesh create /nodes/<节点id>/qemu/<虚拟机id>/status/stop
