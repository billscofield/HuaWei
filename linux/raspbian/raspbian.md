# raspbian

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

https://linuxhint.com/install_docker_on_raspbian_os/
    apt install raspberrypi-kernel raspberrypi-kernel-headers

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

E: Sub-process /usr/bin/dpkg returned an error code (1)
