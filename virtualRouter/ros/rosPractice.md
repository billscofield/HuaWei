## 更改密码
/password

## 更改web端口
/ip service
:set www序号 port=808

## 增加用户

## 配置网卡名称
/interface  print
set 0 name <网卡名称(比如lan,wan)>

## 配置ROS网卡地址
/ip address 
add address 192.168.1.1/24 interface 网卡名

## ssh
/ip service enable ssh
/ip service disable ssh
/ip service ssh port=22 address=10.0.0.10   //其它IP都均被拒绝

https://www.cnblogs.com/zoulongbin/p/5849660.html

## 重启
/system reboot

## mstsc 设置
/ip firewall nat >
add chain=dstnat dst-address=<lan口地址> protocol=tcp dst-port=7758 action=dst-nat to-addresses=<客户机> to-port=3389

https://wenku.baidu.com/view/3d8b62db80eb6294dd886ca4.html

## IP绑定(先不搞)

/ip arp 
print       //当前内网在线主机的MAC,IP信息

自动扫描加入 ip-arp
    :foreach i in [/ip arp find dynamic yes] do={/ip arp add copy-from $i}
取消绑定
    :foreach i in [/ip arp find ] do={/ip arp remove $i}

https://wenku.baidu.com/view/6e8c2cd9a58da0116c1749a3.html

## 禁止连接外部网络
/ip firewall filter add chain=forward dst-address=封的ip/32 action=drop comment="step1:全部不允许ISP网络"


## 分组、限速

### 限速之 Simple Queue(简单队列)
至少包含两个参数
    1. 被控制的ip地址
    1. 被控制ip的速率

例如：我们有50台PC，IP地址分别为192.168.0.1——192.168.0.50，每台的最大的上传速率为512K，最大下载速率为1M。

:for qiu from 1 to 50 do={/queue simple add name=(pc-$qiu) target-address=(192.168.0. $qiu) max-limit=512000/1000000 interface=all disabled=no}


最后要说明simple queue 不足的是：simple queue 是采用FIFO（先入先出队列）算法，即转发优先顺序是自上而下，意味着当前面的地址耗尽所有带宽时，后面的地址连接请求将会出现空等待（即“饿死”）！


http://www.rosabc.com/thread-17611-1-1.html


某个网段的速率进行限制(假定限制内网的192.168.2.2到192.168.2.14，这一连续IP段的内网机器上网总速率）
add name=queue1 target-addresses=192.168.2.0/28 max-limit=512000/512000

假定限制内网的192.168.2.2,192.168.2.23,192.168.2.26,这三台不连续的地址段限制上网的总流量为512K:
add name=queue2 target-address=192.168.2.2,192.168.2.23,192.168.2.26 max-limit=512000/512000

通过对参数target-addresses进行不同的调整，可以实现基于内网源地址的单、连续段或者不连续的IP地址段对上网流量限制

http://blog.sina.com.cn/s/blog_5386eacd0100qkpd.html

##

## IPSEC Net-to-Net


## 执行script脚本
图形化
    System > scripts

    run <number> 看不到输出结果

命令行脚本
    /system script
    add name=脚本名称 owner=所有者 source={命令}

    print
    run <number> 可以看到输出结果
    

