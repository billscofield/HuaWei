
https://hub.docker.com/r/zabbix/zabbix-appliance

docker pull zabbix/zabbix-appliance

    ` docker run --name some-zabbix-appliance -p 20080:80 -p 20051:10051 -p 20052:10052  --restart aways -d zabbix/zabbix-appliance:tag


## 保存数据




## client配置文件

/etc/zabbix/zabbix_agentd.conf

```
PidFile=/var/run/zabbix/zabbix_agentd.pid
LogFile=/var/run/zabbix/zabbix_agentd.log
LogFileSize=0
Server=
ServerActive=
Hostname=
Include=/etc/zabbix/zabbix_agentd.conf.d/*.conf
```


## zabbix-get

zabbix_get -s 'host' -p 10050 -k 'agent.ping'       // 返回1即正常
zabbix_get -s 'host' -p 10050 -k 'system.hostname'


## 安装中文字体

yum install wqy-microhei-fonts
cp /usr/share/fonts/wqy-microhei_ttc /usr/share/fonts/dejavu/DejaVuSans.ttf



## 自定义监控项目

/etc/zabbix/zabbix_agentd.conf

```
Option: UnsafeUserParameters
    Format: UserParameter=<key>,<shell command>

```

1. 限制登录人数

    cd /etc/zabbix/zabbix_agentd.d/

    UserParameter=login.users, who | wc -l

    systemctl restart zabbix-agent.service

2. 在页面添加 zabbix-server 的自定义监控项模板

    1. 创建模板
    2. 创建应用集(一些监控项的集合)
    3. 创建监控项,自定义 item
    4. 创建触发器
    5. 创建图形
    6. 将具体的主机和模板关联


## 邮件报警

Administrator -> Media Types

我的头像 -> Media


## 全网监控方案

克隆监控模板

自动注册和自动发现

使用 zabbix 的 api 接口, 利用 crul, 或者开发自己的编程脚本如 python 等


rsync服务监控
    net.tcp.port[,873]

NFS
    方式1. 111 端口

    方式2. showmount -e ip | wc -l

Mysql

    net.tcp.port[,3306]

    zabbix自带的模板

Web服务器监控


### 监控服务的具体方法

端口
    netstat 
    ss
    lsof

进程信息
    ps

通过端连接客户
    mysql -uroot -p



### 自动发现和注册

自动发现: server 主动去发现, 然后去记录, 老师收作业
    被动模式
    缺点: zabbix server 压力较大, 耗时较久

自动注册: agent 主动上报, 好学生主动交作业
    主动模式


1. 配置 hosts
    ` 服务器ip 
1. agent 已经启动

1. administrator -> 自动发现 -> 动作 -> 
