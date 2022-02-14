# Linux Server

## ip

子网卡

1. ifconfig
    1. 主要是查看，因为不能保存到硬盘，而是存在内存中
    1. ifconfig eth0 192.168.1.1 netmask 255.255.255.0
        1. 子网卡(虚拟网卡)
            ifconfig eth0:0 192.168.1.2 netmask 255.255.255.0
    1. 开启/关闭网卡
        1. ifconfig eth0 down
        1. ifconfig eth0 up


service networking restart
/etc/init.d/networking restart


1. 图形化

1. setup(redhat专有)

    AMD(Advanced Micro Device)

1. 配置文件
    1. /etc/network/interfaces
    1. auto eth0
    1. inet 
        1. none
        1. static
        1. dhcp
        1. manual
    1. address 
    1. netmask
    1. gateway
    1. broadcast 可选
    1. dns-nameservers 192.168.0.1

```
iface ens33 inet static
address 192.168.1.111
gateway 192.168.1.1
netmask 255.255.255.0
dns-nameservers 8.8.8.8
```

配置文件修改后，Linux ping不通外网，可以ping通内网和8.8.8.8, 这是什么原因?



dns
    /etc/resolf.conf        //don't edit this file   软连接指向 /run/systemd/resolve/stub-resolv.conf


ifdown 
ifup
    这两个怎么用？
    1. 貌似是只有当/etc/network/interfaces 有对应的item时，才可以用这两条命令，否则会提示 unknown interface [网卡名称]

    ```
    /etc/network/interfaces 添加了 ens33
    init 6 使该配置生效后

    ifdown 提示 cannot assign requested address  是什么意思?
    ```

貌似修改了/etc/network/interfaces，即使/etc/init.d/networking restart 或者
ifconfig ens33 down && ifconfig ens33 up 或者 ifdown ens33 && ifup ens33 也不会
生效，init 6 才会生效



## 主机名

1. 临时修改

    hostname 新主机名

    重新登陆一个终端就可以看到改变了

1. 查看所有ip

    hostname -I , --all-ip-addresses
    hostname -i , --ip-adress   //和hostname对应的那个ip

    例如docker nginx

    上边两个发现

1. 主机名文件

    1. /etc/hostname

## 主机名和ip对应关系

1. /etc/hosts

        存放的是域名与ip的对应关系，域名与主机名没有任何关系，你可以为任何一个IP指定任意一个名字
?


## netstat

-t:列出tcp协议端口
-u:列出udp协议端口

-a:所有网络连接  --all  display all sockets (default:connected)
-l:仅列出在监听状态网络服务 --listening    display listening server sockets
-n:不使用域名与服务名，而使用IP地址和端口号 --numeric    don't resolve names

-r --route      display routing table
    同 route
    可以查看gateway
-i --interface  display interface table
-g --groups     display multicast group memberships


netstat -nl
netstat -na
netstat -tln
netstat -tuln

tcp才会有监听（listen）


established 
netstat -an | grep ESTABLISHED | wc -l


## route

-v, --verbose
-n, --numeric       don't resolve names
-e, --extend        display other/more information
-F, --fib           display Forwarding Information Base
-C, --cache         display routing cache instead of FIB

## nslookup

(name server lookup)

Nslookup can be use in interactive and non-interactive mode.

By default nslookup will use the domain server that is currently configured for
your system.  You can switch DNS servers using server name or server IP address
option.

To switch to using the open dns server address 208.67.222.222 then go to an
interactive prompt and type:

    nslookup
    >server 20867.222.222

http://www.steves-internet-guide.com/using-nslookup/


## telnet

telnet使用的是tcp协议，换句话说telnet只能检测tcp的这个端口打开了没

Telnet是基于TCP的，默认端口是23。**端口承载的服务可以由用户设定。** sqlserver的
Telnet服务是1433端口

telnet ip port测试目标主机端口是否开放

不要开telnet服务端

telnet ip port
telnet 192.168.1.1 23

```
telnet www.baidu.com 80

connected to www.a.shifen.com
escape character is '^]'
表示这个端口是打开的
```

telnet为什么可以用来检测某个端口是开启了的呢? 
telnet 80端口是什么意思呢?
telnet 服务端都没有开启，为什么还可以telnet 80端口呢?

## traceroute

使用的是ping，如果禁止了ping，那么就...

-n, --numeric   


## wget
