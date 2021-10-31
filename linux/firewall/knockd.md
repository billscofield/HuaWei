
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
        seq_timeout = 5
        command     = /sbin/iptables -A INPUT -s %IP% -p tcp --dport 22 -j ACCEPT
        tcpflags    = syn
        
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
