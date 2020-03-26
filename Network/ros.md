## help

tab 键 类似 ls
?      类似 ll + --help

## /system
/system identity身份 set name=ros3
/system identity print              打印设备名称


/system reboot
/system shutdown


/export(输出)                       查看配置
/ip export                          查看IP配置


/system backup
    save name=你要设置的文件名      备份路由,会自动加 .backup 扩展名
    load name=备份的路由文件名      恢复备份

    路径是 /file    


## /interface

/interface print                            查看网卡状态
    R:running
    X:not running

/interface enable number=0                         激活0网卡
/interface disenable number=0                      激活0网卡


/interface ethernet set LAN mac-address=aa:bb:cc:dd:ee:ff       修改mac地址

## /ip

/ip firewall connnection print              查看当前网络连接

/ip firewall nat add action=masquerade out-interface=WAN chain=srcnat


/ip service set www port=81                 改变www服务端口为81

/ip hotspot user add name=1 password=1      增加hotspot用户

/ip dns set servers=1.1.1.1,2.2.2.2
/ip dns print
/ip dns set allow-remote-requests=yes


/ip dns static add name=a.com address=1.1.1.1
/ip dns static print
/ip dns static remove number=0


查看缓存中的dns
/ip dns cache print


清空缓存
/ip dns cache flush                         不会清空我们设置的static 但dns



/ip address add address=192.168.1.1/24 interface=LAN

### /ip route

X - disabled
A - active
D - dynamic
C - connect
S - static
r - rip
b - bgp
o - ospf


/ip route add gateway=192.168.1.254         添加默认路由
/ip route remove number=0                   删除第零条规则

add dst-address=10.1.12.0/24 gateway=192.168.0.253


Virtual Routing and Forwarding (VRF) Policy


## /password

/password 回车
    提示输入 old-password
    提示输入 new-password

/password old-password
    然后会提示输入 new-password


/password new-password
    然后会提示输入 old-password
    然后会提示输入 confirm 密码




    
