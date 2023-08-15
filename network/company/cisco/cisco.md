# cisco

开机启动过程

+--------------------+-----------+-----------+----------+----------------------------------------------------------------------------+------+
|                    | 读取/写入 | 固化/外置 | 重启丢失 |                    功能                                                    | 类比 |
+--------------------+-----------+-----------+----------+----------------------------------------------------------------------------+------+
|                    | 只读      |   固化    |    F     | 用于系统初始化，ROM 中主要包括:                                            |      |
|                    |           |           |          |                                                                            |      |
|                    |           |           |          | 1. 系统加电自检(POST), 用于检测路由器各硬件部分完好                        | ROM  |
| ROM只读内存        |           |           |          | 2. 系统引导区代码(BootStrap), 用于启动路由器并加载 ISO 文件                |      | 这里也可以进入一个底层系统, 可以删除 startup-config
|                    |           |           |          | 3. 存放 Mini OS                                                            |      |
|                    |           |           |          | ROM 是只读存储器，不能修改其中存放的代码，如要进行升级，则要替换 ROM 芯片  |      |
+--------------------+-----------+-----------+----------+----------------------------------------------------------------------------+------+
| Flash,闪存         | 可读可写  |   外置    |   F      | 存放完整 IOS 文件和其他系统文件，用于系统备份/升级                         | 硬盘 | dir flash:
+--------------------+-----------+-----------+----------+----------------------------------------------------------------------------+------+
| NVRAM, 非易失性RAM | 可读可写  |  固化     |   F      | startup configuration file : startup-config                                |      | dir nvram:    破解密码
+--------------------+-----------+-----------+----------+----------------------------------------------------------------------------+------+
|                    |           |           |          | 存放临时文件，包括:                                                        |      |
| RAM, 随即访问内存  | 可读可取  |  固化     |   T      |                                                                            |      |
|                    |           |           |          | 1. running configuration file : running-config                             | RAM  |
|                    |           |           |          | 2. 路由表项，ARP缓存表项，日志表项，队列中排队等大发送的分组               |      |
|                    |           |           |          | 3. 正在执行的代码，IOS操作系统程序，其他临时数据                           |      |
+--------------------+-----------+-----------+----------+----------------------------------------------------------------------------+------+

dir all

running-config != startup-config
保存后就和 startup-config 一样了


ROM, 只读内存

RAM, 随即访问内存

NVRAM, 非易失性RAM

## 模式

- 用户模式(远程登陆)
- 特权模式(主要是看)
- config 模式(配置模式)

hostname router1

banner motd

控制台线路:
    line console 0
    超时时间
    exec-timeout 20 30

vty
    line vty 0 4
    login
    password xxx

    使能命令
    enable password  xxx

    加密口令
    enable secret xxx

    服务器口令加密
    service password encryption
    no service password encryption

end 直接推出到最底层  ctrl+z

接口的描述
    description stringxxx

show interfaces
show interfaces fa 0/0

do show ip int brief

vlan 2
exit
int eth 0/0
int range eth 0/0 - 1
switchport mode access 
switchport access vlan 2
do show vlan brief


int eth 0/0
ip address 10.0.0.1 255.255.0.0
no shutdown

## telnet

1. 要配置 enable 密码, 否则不能进入全局配置模式

    enable password ciscoenable

2. line vty 下激活 telnet(login)

    line vty 0 4
    login
    transport input telnet      // 允许 telnet
    password cisco              telnet 密码为 cisco

3. 允许 telnet 协议

## ssh

1. 域名

    ip domain name a.com

2. hostname

3. 密钥

    必须有域名和hostname 才可以产生

    crypto key generate rsa modulus 1024

4. 创建用户

    username glab password cisco

5. vty 允许 ssh

    line vty 0 4
    trasnport input ssh telnet
    login local                 用本地的用户登陆



## router

copy running-config startup-config

### 命令

更改mac地址

```
conf t 
int f0/0
mac-address 1.1.1
do sh run inter f0/0            //do show running-config interface f0/0


普通模式下直接 show running-config int f0/0
其他模式下均要加上 do   : do show running-config int f0/0
```


