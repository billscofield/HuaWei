

硬件监控
    通过远程控制卡，Dell的iDRAC, HP的ILO 和 IBM 的 IMM 等
    使用 IPMI 来完成物理设备的监控工作，温度，硬盘故障等
    路由器，交换机(端口，光衰，日志), 打印机，Windows等

系统监控
    CPU，内存，硬盘使用率，系统负载，进程数

服务监控
    apache,nginx,php,mysql,memcache,redis,tomcat,JVM,TCP连接数

性能监控
    网站性能，服务器性能，数据库性能，存储性能

日志监控
    ELK

安全监控
    用户登录数，passwd文件变化，本地文件改动
    不同攻击类型的统计

网络监控
    端口，web(URL), DB, ping, IDC贷款网络流量，网络流入流出速率, SMTP, POP3








## centos 系统下载地址

http://mirrors.163.com/


## 更新apt源

```
deb http://mirrors.aliyun.com/debian/ buster main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib
deb http://mirrors.aliyun.com/debian-security buster/updates main
deb-src http://mirrors.aliyun.com/debian-security buster/updates main
deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib


# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free
```


## zabbix server 的安装配置

查看 requirements

    4.Installation 章节
    
    https://www.zabbix.com/documentation/5.0/manual/installation/requirements


### 系统初始化

apt 源

### 第1步：安装 Apache Web 服务器和 PHP 包

```
apt install apache2 php php-mysql php-mysqlnd php-ldap php-bcmath php-mbstring php-gd php-pdo php-xml libapache2-mod-php
apt install php-bcmath php-mbstring(上边已经安装了，没有安装上？)
```

### 第2步：安装MariaDB服务器

```
apt install mariadb-server

```

您需要保护MariaDB服务器数据库安装。 已安装的软件包附带了您需要运行的脚本并遵循安全建议。

    mysql_secure_installation

    ```
    create database zabbix character set utf8mb4 collate utf8mb4_generial_ci;
    grant all privileges on zabbix.* to zabbix@localhost identified by 'password';
    flush privileges
    ```


建议修改 mariadb 配置文件 my.cnf

```修改配置文档my.cnf

[mysqld]

innodb_large_prefix=1
innodb_file_per_table = 1
innodb_file_format = Barracuda
```

### 第3步，安装和配置Zabbix服务器

wget https://repo.zabbix.com/zabbix/4.0/debian/pool/main/z/zabbix-release/zabbix-release_4.0-3+buster_all.deb

dpkg -i zabbix-release_4.0-3+buster_all.deb

apt update

### Install Zabbix server, frontend, agent

apt -y install zabbix-server-mysql zabbix-frontend-php zabbix-agent

zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -u zabbix -p zabbix

接下来，通过编辑文件/etc/zabbix/zabbix_server.conf ，将Zabbix服务器守护程序配置为使用您为其创建的数据库。

    vim /etc/zabbix/zabbix_server.conf

        DBPassword=

您还应该通过在/etc/zabbix/apache.conf文件中定义时区来设置PHP以便与Zabbix前端一起正常工作。

    ```
    vim /etc/zabbix/apache.conf

    php_value date.timezone Africa/Kampala

    (/etc/php/7.3/apache2/php.ini) https://blog.csdn.net/jing875480512/article/details/79002404

    ```

通过所有完美的环境设置，您现在可以启动Zabbix服务器和代理程序进程，使它们能够在系统引导时自动启动

    ```
    systemctl start zabbix-server zabbix-agent
    systemctl enable zabbix-server zabbix-agent
    systemctl restart apache2
    重启 php?
    ```


如果是安装官方的写法 utf8 collate utf8_ci
1118 (42000) at line 1278: Row size too large (> 8126). Changing some columns to TEXT or BLOB or using ROW_FORMAT=DYNAMIC or ROW_FORMAT=COMPRnt row format, BLOB prefix of 768 bytes is stored inline.





---

PHP bcmath extension missing (PHP configuration parameter --enable-bcmath

	apt install php-bcmath

PHP mbstring extension missing (PHP configuration parameter --enable-mbstring).

	apt install php-mbstring




zabbix 登录账号密码	Admin:zabbix

update  users set passwd=md5("woshitiancai") where userid='1';// 更改 Admin 登录密码



### Zabbix修改为中文界面

进入Zabbix的WEB管理PHP目录(这个目录的位置看 /etc/zabbix/apache2.conf 目录)

修改语言配置文件 locales.inc.php
vi include/locales.inc.php  (/usr/share/zabbix/include/locales.inc.php)
找到 zh_CN，将 flase 改为 true

上传 ttf 中文字体文件到 /usr/share/zabbix/assets/fonts 目录，如“楷体”（simkai.ttf），如果字体文件是 *.ttc，可以改为 *.ttf

修改常量定义文件 defines.inc.php
vi include/defines.inc.php
找到 ZBX_GRAPH_FONT_NAME，将常量值替换成上传的中文字体文件名，如：simkai
打开Zabbix界面，Administrator-Users 选择语言-Chinese(zh_CN)-update-刷新Zabbix Web页面

还是不行的话是因为 Debian10 没有安装中文支持

#### Debian10 添加中文支持

links:https://www.cmsky.com/debian-zabbix-language/

Debian下安装好Zabbix后想选择语言的时候发现中文选项是灰色的。

于是查找解决办法，修改站点根目录下include/locales.inc.php文件，确保zh_CN.utf8这一行是true

可是我改过后发现语言选项还是灰的，于是继续查找发现原来我用的debian系统没有添加中文语言环境。于是乎执行命令
dpkg-reconfigure locales把zh_CN.utf8这一行选中保存，然后使用locale -a查看里面有zh_CN.utf8就行了。
最后重启一下web服务，service apache2 restart就可以选择中文了。


---

1. Setup locales
    dpkg-reconfigure locales

    选择
    zh_CN GB2312
    zh_CN.GBK GBK
    zh_CN.UTF-8 UTF-8
    默认locale还是选en_US.UF8


2. Install font

    apt-get install ttf-arphic-uming  xfonts-intl-chinese xfonts-wqy

3. 安装debian中文输入法

    apt-get install scim scim-chinese scim-pinyin


中文字体

    /usr/share/zabbix/include

    /usr/share/zabbix/fonts??? 不是复制到这里???
        
        cp /usr/share/fonts/wqy-microhei.ttc /usr/share/zabbix/
        
        ➜  share find . -iname DejaVuSans.ttf
        ./matplotlib/mpl-data/fonts/ttf/DejaVuSans.ttf
        ./fonts/truetype/dejavu/DejaVuSans.ttf                  覆盖这个



### zabbix agent 安装

apt install zabbix-agent

/etc/zabbix/zabbix_agentd.conf

    Server= 被动

    ServerActive= 主

    Hostname= 需要和前端中设置一致


验证

方法一:可以在 agent 端查看服务状态 和 日志(tail /var/log/zabbix/zabbix_agentd.log)

方法二:也可在 server 端 telnet agent-IP 10050

方法三:前端当中 配置/主机/可用性 ZBX更新为绿色

再查看 监控/最新数据 是否有监控数据


windows 添加 agent 方法

    1. 下载agent

    1. 修改配置文件
        
        注意配置文件位置默认在c盘根目录
        
        注意添加防火墙端口
        
    1. powershell

        zabbix_agentd.exe --config c:\zabbix\conf\zabbix_agentd.conf --install

        zabbix_agentd.exe --config c:\zabbix\conf\zabbix_agentd.conf --uninstall

        zabbix_agentd.exe --config c:\zabbix\conf\zabbix_agentd.conf --start

        zabbix_agentd.exe --config c:\zabbix\conf\zabbix_agentd.conf --stop





问题:
1. systemctl status zabbix-agent.service
    Can't open PID file /run/zabbix/zabbix_agentd.pid (yet?) after start: No such file or directory
    这个 agent 报这个错误不影响server收集信息

2. 查看zabbix_agent 日志出现failed to accept an incoming connection: connection from "28.44.20.129" rejected, allowed hosts: "192.168.1.17"

    报错原因：**zabbix server监听全网地址，agent监听内网地址**
    解决办法：把zabbix_agentd.conf中 的server把zabbix_server的公网和内网地址都加行。然后agent就可以正常获取到值了




debian 10 系统需要安装nmap???

    apt install nmap


debian 10 需要安装snmp

    apt install snmp

安装 sudo 软件

    apt install sudo 

    为 zabbix 用户授权???
        
        vi /etc/sudoers
        
        zabbix ALL=(ALL) NOPASSWD:ALL



#### agent2

links:
    https://www.zabbix.com/documentation/5.0/manual/concepts/agent2

Zabbix agent 2 is a new generation of Zabbix agent and may be used in place of Zabbix agent. 

Agent 2 is written in Go (with some C code of Zabbix agent reused). A configured Go version 1.13+ environment is required for building Zabbix agent 2.

Agent 2 does not support daemonization on Linux; since Zabbix 5.0.4 it can be run as a Windows service.

Passive checks work similarly to Zabbix agent. Active checks support scheduled/flexible intervals and check concurrency within one active server.

Zabbix agent 2 is available in pre-compiled Zabbix packages. To compile Zabbix agent 2 from sources you have to specify the --enable-agent2 configure option.



做好时间同步

    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

    apt-cache show ntpdate

/usr/sbin/zabbix_agent2

systemctl enable --now zabbix_agent2



cat /lib/systemd/system/zabbix-agent2.service


### 在服务器上测试数据接收

apt install zabbix-get

zabbix-get -s 10.0.0.1 -p 10050 -k 'system.hostname'


## snmp 监控 RouterOS

https://techexpert.tips/zabbix/monitor-mikrotik-zabbix/

模板: Template Net Mikrotik SNMPv2



## 术语

Host            服务器
Hosts           主机组
Applications    应用
Events          事件
Media           发送通知的通道
Remote Command  
Item            一个指标的监控
Trigger         触发器
Action          动作


zabbix-server
zabbix-agent
zabbix-proxy
zabbix database
zabbix web
zabbix get
zabbix sender
zabbix java gateway





## 监控系统

1. 单一监控程序
    linux中的top, vmstat, iostat 等

1. 分布式监控程序
    1. zabbix
    1. Prometheus(基于Go语言)
    1. Open-Falcon(小米开发，貌似很久没有更新了)
    1. Nagios

### 功能
    1. 数据收集
        SNMP(打印机，存储, UPS等等) 
        IPMI(用于获取硬件的温度，风扇，硬盘，电源等):智能平台管理接口（Intelligent Platform Management Interface）, 也可管理硬件设备，如关机，重启
        支持无agent监控，如果不支持 SNMP,IPMI,agent, 则可以用TCP, ICMP, SSH, Telnet 等渗透的方法进行监控
        支持自定义监控：通过shell, python, ruby, perl, powershell 任何可执行的脚本手机监控数据
        URL监控: 监控线上的业务是否正常，异常响应
    1. 数据展示
        图标及监控大屏
        网络拓扑图
    1. 告警策略
        
    1. 告警发送
        发送告警信息
        自动修复故障
        告警升级
        自定义告警信息
        告警关联:可以有效降低告警风暴
    1. 事件管理
    1. 报表管理
    1. 认证权限
        不同部门关心不同的数据, 有不同的权限
        加密通信
        统一认证
        权限管理
    1. zabbix 自动化
        网络自动发现
        低级别自动发现(LLD):
        Agent自动注册

    1. zabbix API
        自动化配置管理




zabbix - monitor anything

开发语言: C, PHP, JAVA

监控任何的设备， 系统，应用和资源





### 架构

```
+--------------------------------------------------------------------------------+
|                                                                                |
|                               Zabbix Web                                       |
|                                  ▲                                             |
|                                  |                                             |
|   zabbix agent ------            |                                             |
|                     |            |                                             |
|                     |            ▼                                             |
|   zabbix agent ----------▶ zabbix server ◀---------▶ Database                  |
|                     |            ▲                                             |
|                     |            |                                             |
|   zabbix agent ------            |                                             |
|                                  |                                             |
|                                  |                                             |
|                     ---------------------------                                |
|                     |                         |                                |
|                     |                         |                                |
|                     |                         |                                |
|                     ▼                         ▼                                |
|              Java Gateway                 Zabbix Proxy  ◀---------▶ Database   |
|   负责通过JMX监控手机Java应用性能数据         ▲                                |
|                                               |                                |
|                                               |                                |
|                                               |                                |
|                                               |                                |
|                                      ----------------------                    |
|                                      |                    |                    |
|                                      |                    |                    |
|                                zabbix agent           zabbix agent             |
|                                                                                |
+--------------------------------------------------------------------------------+ 
    

```

### zabbix server 组成

监控功能
    vmware collector                unreachable Poller
    trapper     http poller         icmp pinger     java poller
    Poller      timer               java gateway    ipmi poller

    1. vmware collector:   负责收集vmware虚拟化环境监控数据
    1. trapper进程:        主要负责Agent主动上报的监控数据
    1. poller进程:         主要负责 Server 主动拉取类型的监控数据
    1. http poller进程:    主要负责URL监控类型的数据收集
    1. timer进程:          负责处理和时间有关的数据以及告警
    1. unreachable Poller: 负责处理无法到达类型的监控
    1. icmp pinger进程:    ping 存活检测
    1. java poller进程:    负责拉取JMX类型数据
    1. java gateway进程:   负责和java gateway 通信处理数据
    1. ipmi poller进程:    负责IPMI类型数据获取

报警功能
    escalator
    Alerter Manager
    Alerter



### zabbix 基本术语

#### 组监功能

frontend                            前端
zabbix API                          zabbix接口
zabbix Server   
zabbix Agent
zabbix Proxy
Network discovery                   网络自动发现
Active agent auto-registration      主动Agent自动注册
Low-level discovery                 低级自动发现


#### 数据收集

host                                主机(任何被监控的设备，交换机，存储，打印机等等)
host group                          主机组(主机的逻辑分组，同一个机房的交换机，一个办公室的打印机)
item                                监控项
value preprocessing                 预处理, 数据存入数据库前按照指定的规则预处理, 比如单位换算

template                            模板, 可以应用到多个监控设备的监控集合，包含监控项，触发器，图形，LLD, web监控等
application                         应用, 一组监控项的逻辑分组, 比如Nginx的监控项统一分到Nginx应用中

web scenario                        web场景, 是监控web的一个或多个http请求，一个场景中可以是单个URL,也可以是多个URL
                                    比如哦可以将用户登录，搜索，点击商品详情，加入购物车等操作放入一个场景进行监控，
                                    当所有的步骤都成功，该场景的监控才是成功的
Macros                              宏, 可以认为是一个变量，可应用在告警，模板等功能中


#### 数据展示

graph                               图表, 可以将一个或多个监控项的监控数据放入到同一张图表中，
                                    比如将CPU的用户使用率，系统使用率，空闲率都放入CPU监控监控图表中

screen                              聚合图表, 将多个 graph 聚在一张监控大屏中
                                    比如将CPU, 网卡, 内存, IO 这些图表放在一起，就组成了主机的聚合图表
maps                                拓扑图

Slide shows                         幻灯片演示, 轮流播放 聚合图表, 可以实现将 主机, 网络, 存储, 缓存, 数据库的各个聚合图表
                                    轮流播放

#### 告警相关

Trigger                             触发器, 告警的策略设置, 可设置 正常状态和异常状态的触发器
                                    比如 CPU 持续5分钟使用率超过90% 就触发报警

event                               事件, 比如告警状态的变化，客户端注册成功等

problem                             异常状态
OK                                  正常状态
action                              操作, 根据事件以及条件定义的一系列动作
escalation                          升级
media                               媒介, 告警的方式，短信，邮件
notification                        通知, 关于事件的消息，通过指定的媒体发送给用户
remote command                      远程命令
Maintenance                         维护模式, 就是维护时间段，改时间段可以不发送告警; 或者发送告警，但是不计入服务可用性


#### 认证和权限

User                                用户
User Group                          用户组, 比如运维组，研发组
permission                          权限
User Type                           用户类型, 三种: 普通用户，管理员，超级管理员



## 自定义监控模板

模板

应用集 application(相当于文件夹)

监控项 item

Trigger

图形

主机和该模板关联


群组


只在一台 agent 上创建了 UserParameter , 其他主机上没有这个，模板应用在其他主机上之后如何监控该item???  上传给了 zabbix-server



## 邮件报警

SMTP HELO  这个怎么写，代表啥意思???



## 添加大量主机

克隆监控模板

自动注册和自动发现

使用 zabbix 的 api 接口，利用 curl 语言，或者开发自己的编程脚本入 Python 等



## 自动发现，自动注册

自动发现: server 主动去发现所有的客户端，然后将客户端的信息进行记录
    
    server 端压力会比较大, 耗时

    被动模式

自动注册: agent 主动上报自己的信息, 发给 server

    主动模式

    /etc/zabbix/zabbix/zabbix_agent.conf    -> HostnameItem=system.hostname





