# raspbian

## 默认用户名和密码

树莓派Raspbian系统默认登录用户名为pi，该账户默认密码是raspberry

## 系统设置

raspi-config
    
    1. System Options
    2. Display Options
    3. Interface Options
    4. Performance Options
    5. Localisation Options
    6. Advanced Options
    7. Update
    8. About raspi-config

## mount ntfs 分区只读

Falling back to read-only mount because the NTFS partition is in an unsafe state

apt install ntfs-3g(原来叫 ntfsprogs)

ntfsfix /dev/sda1

## 固定IP

### 无线（热点）IP固定方法

/etc/dhcpcd.conf
```
wlan0代表无线，也就是指定接口
ip_address代表设置的静态ip地址
routers代表路由器/网关IP地址
```


## docker

[link](https://discourse.osmc.tv/t/cant-install-docker/88724/3)

    update-alternatives --config iptables

[link](https://linuxhint.com/install_docker_on_raspbian_os/)

    apt install raspberrypi-kernel raspberrypi-kernel-headers

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

E: Sub-process /usr/bin/dpkg returned an error code (1)
