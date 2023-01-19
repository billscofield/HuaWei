## what is knockd

如果你有一台公众可访问的服务器，黑客可以轻松扫描其IP地址，查找服务器上的开放端
口(尤其是用于SSH的端口22)。将服务器隐藏起来、不让黑客看见的一种方法是使用knockd。
knockd是一种端口试探服务器工具。它侦听以太网或其他可用接口上的所有流量，等待特
殊序列的端口命中(port-hit)。telnet或Putty等客户软件通过向服务器上的端口发送TCP
或数据包来启动端口命中。

## 安装

debian                          centos
knockd                          knock-server

knockd 包含了客户端

apt-get install knockd

## 服务器端

配置文件

    /etc/knockd.conf

    ```
    [options]                           // 全局选项
        UseSyslog
        Interface   = ens33
        
    [openSSH]                           // 自定义
        sequence    = 7000,8000,9000    // 敲门端口号
        seq_timeout = 5                 // 需要在多少时间里完成端口的敲击
        command     = /sbin/iptables -A INPUT -s %IP% -p tcp --dport 22 -j ACCEPT
        tcpflags    = syn               // 来源封包所需带有的封包标志，一般来说， UDP 封包不会有ack
        
    [closeSSH]
        sequence    = 9000,8000,7000
        seq_timeout = 5
        command     = /sbin/iptables -D INPUT -s %IP% -p tcp --dport 22 -j ACCEPT
        tcpflags    = syn
    ```

    systemctl start knockd

## 客户端

敲门

    knock IP  7000 8000 9000

关门

    knock IP  9000 8000 7000




