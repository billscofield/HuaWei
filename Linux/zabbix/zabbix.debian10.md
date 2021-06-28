links:

    https://www.bilibili.com/video/BV1xA411i7wU?p=3&spm_id_from=pageDriver




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



## 监控工具

1. Cacti

早期产品

    使用轮询的方式由主服务器向设备发送数据请求来获取设备上状态数据信息, 如果设备很多, 这个轮询的过程就非常的耗时，轮询的结果就不能及时的反应设备的状态

    关注的是对数据的展示，而不是异常反馈, 缺乏报警机制

值夜班


1. Nagios

开源免费

插件机制

    无法将多个相同应用集群的数据及合起来，也不能监控到集群中特殊节点的迁移和恢复

    看不到历史数据，只能看到报警事件，很难追查故障原因

    配置复杂


1. Ganglia

UC Berkeley 发起

主要监控系统性能, 主要用于 hoodop 


1. zabbix

支持主动轮询 和 被动捕获

server 对设备性能要求低，并发监控，对 CPU 的要求更高

被动模式

    从 agent 的角度来说的, ** server 向 agent 发送一份监控项请求，agent 接收请求，获取数据并想应该 server **, 相当于老师向学渣要作业, 学渣做完后发给老师

**主动模式

    从 agent 的角度来说的, ** agent 向server 请求与自己相关监控项配置，主动地将server配置的监控项相关数据发送给server ** 相当于学霸主动问老师有什么作业，做完后主动发给老师

    能极大的节约监控 server 的资源

    zabbix_sender
        -z zabbix_server_ip
        -p zabbix_server_port
        -s zabbix_agent_hostname
        -k key
        -o value
     
        zabbix_sender -z 10.0.0.1 -s 10.0.0.10 -p 10051 -k 'zbx-send' -o 20     //需要多发送一些，然后
            
            需要使用 zabbix采集器, 因为 主动agent并没有这个key, 服务器不会接受这个key

    agent端基本配置
        
        ServerActive=10.0.0.1
        Hostname=node1.q.com    //自己的主机名，假设主机定死了，不设置下一项
        #HostnameItem           //如果自己的主机名易变动，这一项相当于key一样去匹配???
            若后边两个同时启用，下边一个选择生效




支持自动发现功能

---

缺点

    被监控主机都需要安装 agent

    数据都在数据库中，瓶颈主要在数据库

    项目批量修改不方便

    入门容易，但是深层次需求需要非常熟悉zabbix，并进行大量的二次定制开发，难度较大

    系统级别报警设置相对较多，如果不筛选的话报警右键会很多；并且自定义的项目报警需要自己设置，过程比较繁琐

    缺少数据汇总功能，如无法查看一组服务器平均值，需要进行二次开发


---

监控对象

    数据库      MySQL  MariaDB  Oracle  SQLServer       |   agent
    应用软件    Nginx  Apache   PHP     Tomcat          |   agent

    ---

    集群        LVS  Keepalived  HAproxy   RHCS  F5     |   agent
    虚拟化      VMware   KVM   XEN    docker    k8s     |   agent
    操作系统    Linux    Unix   Windows                 |   agent

    ---

    硬件        服务器    存储    网络设备              |   IPMI 卡，需要IPMI硬件
    网络        网络环境(内网环境 外网环境)             |   SNMP


硬件 系统 程序





|
|                                        heart beat
|                       zabbix server <---------------- server backup
|                           /|\
|                            |
|        proxy1--------------+-----------------proxy2
|           |                |                   |
|           |                |                   |
|           |                |                   |
|           |            Database                |
|           |                                    |
|    +------+------+                        +----+------+
|    |             |                        |           |
|  agentd1      agentd2                 agentd3     agentd4
|
|


|   主机(host) --->  监控项(item) --->  触发器(trigger)  --->  动作(action)   --->  媒介(media)  --->  用户
|                       /|\   
|                        |
|                        |
|                        |
|                      图形   
|   


主机组(host group)
    
    主机的逻辑组；它包含主机和模板。 一个主机组里的主机和模板之间并没有任何直接的关联
   
事件(event)
    单次发生的需要注意的事情，例如触发器状态改变 或 发现有监控代理自动注册

升级(escalation)
    一个在动作内执行操作的自定义场景; 发送通知、执行远程命令的序列

远程命令(remote command)
    一个预定义好的，在满足一定条件的情况下，可以在被监控主机上自动执行的命令

模板(template)
    一组可以被应用到一个或多个主机上的实体(监控项，触发器，图形，局和图形，应用，LLD，Web场景) 的集合
    模板的任务就是加快对主机监控任务的实施，也可以是监控任务的批量修改更简单
    模板是直接关联到每台单独的主机上

应用(application)
    一组监控项组成的逻辑分组
    
web场景(web scenario)
    利用一个或多个 HTTP 请求来检查网站的可用性

前端(frontend)
    前段web界面

Zabbix API
    使用 JSON RPC 协议
    




## centos 系统下载地址

http://mirrors.163.com/


setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
systemctl stop firewalld.service


weget 这个文件安装(mirrors.aliyun.com/zabbix/zabbix/4.4/rhel/7/x86_64/zabbix-release...)

还需要配置好 epel 源, 有一些依赖


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
    create database zabbix character set utf8mb4 collate utf8mb4_bin;
    create user zabbix@localhost identified by 'zabbix';
    grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix';
    flush privileges
    ```


建议修改 mariadb 配置文件 my.cnf

```修改配置文档my.cnf

[mysqld]

innodb_large_prefix=1
innodb_file_per_table = 1
innodb_file_format = Barracuda

---优化???---

skip_name_resolve = ON              # 跳过主机名解析
innodb_file_per_table = ON          # 开启独立表空间
innodb_buffer_pool_size = 256M      # 缓存池大小
max_connections = 2000              # 最大连接数
log-bin = master-log                # 开启二进制日志


```

### 第3步，安装和配置Zabbix服务器

wget https://repo.zabbix.com/zabbix/4.0/debian/pool/main/z/zabbix-release/zabbix-release_4.0-3+buster_all.deb

dpkg -i zabbix-release_4.0-3+buster_all.deb

apt update

### Install Zabbix server, frontend, agent

apt install -y zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-agent

```
zabbix-server-mysql

zabbix-frontend-php

zabbix-apache-conf

```

zcat /usr/share/zabbix-server-mysql/{schema,images,data}.sql.gz | mysql -uzabbix -pSECRETPASSWORD zabbix
    find . -iname "*create*"
    官网上的那个不对，下载安装后的 README
 


接下来，通过编辑文件/etc/zabbix/zabbix_server.conf ，将Zabbix服务器守护程序配置为使用您为其创建的数据库。

    vim /etc/zabbix/zabbix_server.conf

    ```
        ### Option: DBHost
        DBHost=localhost
        DBPassword=
        DBUser=zabbix
        DBPassword=
        DBPort=3306
        
        ---
        
        ListenPort=10051
        SourceIP=           // 发采样数据请求IP (应该是老师的角色, 老师向学渣要作业的, 那应该是被动模式了)
        
        ---
       
        ### Option: PidFile
        PidFile=/var/run/zabbix/zabbix_server.pid
        
        ---
        
        ### Option: Timeout
        Timeout=4
        
        ---
        
        ### Option: AlertScriptsPath
        AlertScriptsPath=/usr/lib/zabbix/alertscripts
        
        ---
        ExternalScripts=/usr/lib/zabbix/externalscripts
        
        ---
         LogSlowQueries=3000
        StatsAllowedIP=127.0.0.1    // comma separated, Stats request will be accepted only from the addresses listed here.
        ---
        
        SNMPTrapperFile=/var/log/snmptrap/snmptrap.log
        LogFile=/var/log/zabbix/zabbix_server.log
        LogFileSize=0       // 日志的滚动，默认值为1,表示滚动。设为零表示不滚动，当数据很多的时候，我们也可以设置为1， 
                            // 0 - disable automatic log rotation
                            // 然后在 Maximum size of log file in MB 设置数据文件最大到多少时会自动滚动
        
        ### Option: DebugLevel 日志级别 
            [0,5] 5是最详细的, 默认为3(warnings)  

    ```




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

```
ll 

/usr/share/zabbix/assets/fonts/graphfont.ttf -> /etc/alternatives/zabbix-frontend-font

lrwxrwxrwx 1 root root  47 Feb  2 14:25 zabbix-frontend-font -> /usr/share/fonts/truetype/dejavu/DejaVuSans.ttf

```

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

    ```
    Hostname= 自己能被server端识别的名称
        zabbix_agent.conf 和 前端设置的不一样，会在日志中体现
        697:20210221:074232.177 cannot send list of active checks to "10.0.2.10": host [Zabbix server] not found

    ##### Active checks related
    ServerActive= 主

    ##### Passive checks related
    Server=serverip

    ListenIP=0.0.0.0
    ListenPort=10050
    ```

systemctl restart zabbix-agent


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




对于centos, 请先关闭防火墙和selinux
    systemctl disable firewalld
    systemctl stop firewalld
    setenforce 0
否则报错
    zabbix_get [19475]: Get value error: cannot connect to [[192.168.61.101]:10050]: [113] No route to host


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
    只能是大写字母，数字，下划线


#### 数据展示

graph                               图表, 可以将一个或多个监控项的监控数据放入到同一张图表中，
                                    比如将CPU的用户使用率，系统使用率，空闲率都放入CPU监控监控图表中

    1. 线状图(normal)

    1. 堆叠面积图(stacked)

    1. 饼图(pie)

    1. 分离型饼图(爆发的)(exploded)

screen                              聚合图表, 将多个 graph 聚在一张监控大屏中
                                    比如将CPU, 网卡, 内存, IO 这些图表放在一起，就组成了主机的聚合图表
    监控 ---> 聚合图形

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
    configuration / Actions
    举例
    ```
    apt install redis
    vi /etc/redis/redis.conf
    bind 0.0.0.0                    //默认端口 6379

    添加监控项 net.tcp.listen[6379]

    配置--->动作

        先添加“操作” 然后才能添加动作

        操作
            操作类型:
                发送消息
                远程命令
                    sudo /usr/bin/systemctl restart redis.service
                    
                    vi /etc/sudoers
                    
                    zabbix  ALL=(ALL)   NOPASSWD: /usr/bin/systemctl
                    
                agent.conf 中允许接收远程命令
                    EnableRemoteCommands=1  // 允许接收远程命令
                    LogRemoteCommands=1     // 把接受的远程命令记入日志

    ```




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

    进程--> 变更 --> 每秒更改   ??? 这是啥意思

    但是port端口不要设置 每秒更改, 否则 0 1

    删除的步骤
        
        1. 清除历史和趋势
        1. 删除

    Show Value (值展示)
        As is   原始值
        Delta   (simple change) (变化) 本次采样减去前一次采样的值的结果
        Delta   (speed per second)(速率) 本次采样减去前一次采样的值，再除以经过的时间

Trigger

    nodata()            // 是否采集到数据，采集不到为异常
    last()              // 最近几次
    date()              // 时间，返回当前的时间 YYYYMMDD
    time()              // 返回当前的时间 HHMMSS
    now()               // 返回 Epoch(1970年1月1日00:00:00UTC)时间的秒数
    dayofmonth()        // 当前是本月的第几天

    触发器表达式

        {<server>:<key>.<function>(<parameter>)}<operator><constant>
        
        函数有: avg count change date dayofweek delta diff iregexp last max min nodata now sum 

        参数: 大多数数值函数可以接受秒数为其参数，而如果在数值参数之前使用 '#' 作为前缀，则表示为最近几次的取值, 如 sum(300)
              表示300秒内所有取值纸盒，而 sum(#300) 则表示最近 300 次取值之和
                
              avg coun last min max 还支持第二个参数，用于完成时间限定，如 max(1h,7d) 将返回一周之内的最大值???
            
        运算符:
            '/'
            '*'
            '+'
            '-'
            '<' : less than  A<B 等价于  A<=B-0.000001
            '>' : more than  A>B 等价于  A>=B+0.000001
            '#' : Not equal  A#B 等价于  (A<=B-0.000001) | (A>=B+0.000001)
            '=' : equal      A=B 等价于  (A>B-0.000001) & (A<B+0.000001)
            '&' : AND
            '|' : OR

        {Zabbix Server:net.if.in[enp0s3].last(#1,5)}>10240

        灾难 严重 一般严重 警告 信息 未分类

    恢复表达式: 何时恢复正常,并自定从 Dashboard 中删除该 Problem, 但是在 监测 --> 问题, 根据条件搜索 仍然可以看到

    依赖项: 为了找到真正的问题源
            例如 网络，CPU, 内存等都要基于该主机开机


图形

主机和该模板关联


群组


## UserParameter

只在一台 agent 上创建了 UserParameter , 其他主机上没有这个，模板应用在其他主机上之后如何监控该item???  上传给了 zabbix-server

用法格式

    UserParameter=<key>,<command>

    /etc/zabbix/zabbix_agentd.d/

    vim memory_free.conf

    UserParameter=memory.free, free | awk '/^Mem/{print $4}'

    systemctl restart zabbix_agent

    zabbix-get -s 10.0.2.10 -p 10050 -key 'memory.free'


    如果有很多自定义参数呢?

    ```
    UserParameter=memory.stats[*], cat /proc/meminfo | awk '/^$1/{print $$2}'

    1. 如果需要使用命令行里面出现2这种变量，那么你要使用两个$2，例如awk ’{ print $$2 }’，为了防止和参数冲突，所以zabbix做了这个规定。

    2. zabbix禁止使用一些不安全的参数，如下：
        
        \ ' ” ` * ? [ ] { } ~ $ ! & ; ( ) < > | # @

    3. 从zabbix 2.0开始，zabbix返回文本数据可以是空格。
    示例1
        
        UserParameter=ping[*],echo $1
        ping[0] - 将一直返回0
        ping[aaa] - 将一直返回 'aaa'

    示例2
        
        UserParameter=mysql.ping[*],mysqladmin -u1−p2 ping | grep -c alive

    如下参数用于监控MYSQL，并且可以传递用户名和密码。

        mysql.ping[zabbix,our_password]
        
    示例3

        统计一个文件中有多少行被匹配?

        UserParameter=wc[*],grep -c "2"1

    如下方法将会返回文件中出现指定字符的行数

        wc[/etc/passwd,root]
        wc[/etc/services,zabbix]

    links:
        https://www.cnblogs.com/xu360/articles/6629559.html
    ```



## 报警媒介

Adminiation(管理) / Media types(报警媒介类型)

邮件报警

SMTP HELO  这个怎么写，代表啥意思???


## 添加主机

(必填项)主机名称: 这个应该同 agent 中设置的 hostname 相同

可见的名称: 这个可以不一样


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


1. 发现方式

    ip地址范围

    可用服务(ftp,ssh,http,...)

    zabbix agent 的响应

    snmp agent 的响应

1. 发现过程

    1. discovery 发现

        zabbix 定期扫描网络发现规则中定义的IP范围; 检查的频率对于每个规则都是可配置的，每个规则都有一组用于IP范围执行的服务检查
        
        由网络发现模块执行的服务和主机(IP)的每个检查都会生成一个发现事件
        
        8种响应事件
            
            service up
            service down
            
            host up
            host down
            
            service discovered
            service lost
            
            host discovered
            host lost

    1. actions 动作





## 宏 (macro)

就是变量

zabbix 有许多内置的宏，
    {HOST.NAME}
    {HOST.IP}
    {TRIGGER.DESCRIPTION}
    {TRIGGER.NAME}
    {TRIGGER.EVENTS.ACK}


系统内建宏
    {HOST.NAME}

用户宏可以在全局、模板和主机级别进行定义。这些宏具有一个特殊的语法：
    {$MACRO}


    全局宏
    模板宏
    主机宏





## web 监控

监控制定的站点的资源下载速度，页面响应事件，响应代码

1. 术语

    web scenario: web 场景（站点）

    web page : web 页面, 一个场景有多个页面

    内建key : 要测一个页面，要测三个步骤(下边三个内建key)

1. 内建 key

    web.test.in[Scenario,Step,bps]: 传输速率

    web.test.time[Scenario,Step]: 响应时长

    web.test.rspcode[Scenario,Step]: 响应码



## snmp

三种通信方式：读(get getnext), 写(set), 陷阱(trap)

端口
    

yum install net-snmp net-snmp-utils

vi /etc/snmp/snmpd.conf

systemctl restart snmpd         // 被监控端开启的服务
systemctl restart snmptrapd     // 监控端开启的服务(如果允许被监控端启动主动监控时启用)


步骤

    1. 定义认证符, 将社区名称 public 映射为 安全名称

    2. 将安全名称映射到一个组名

    3. 为我们创建一个视图，让我们团队有权利




snmpget -v 2c -c public 192.168.1.1 snmp码


## JMX
