
## knodck

[zeroflux.org](https://zeroflux.org/projects.html)

[github](https://github.com/jvinet/knock)

apt-get install iptables iptables-persistent
yum install -y iptables-services
源码安装UILDING

    To build knockd, make sure you have libpcap and the autoconf tools installed. Then run the following:

    $ autoreconf -fi
    $ ./configure --prefix=/usr/local
    $ make
    $ sudo make install

    每当设置了新的iptables规则后，使用如下命令保存规则即可，规则会根据ipv4和
    ipv6分别保存在了
        /etc/iptables/rules.v4
        /etc/iptables/rules.v6

    netfilter-persistent  save

    由于 iptables-persistent 在安装时已经把它作为一个服务设置为开机启动了，
    它在开机后会自动加载已经保存的规则，所以也就达到了永久保存的目的。

        systemctl status netfilter-persistent

    允许已建立的连接以及当前会话

        iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

    阻止通向端口22 SSH的所有入站连接

        iptables -A INPUT -p tcp --dport 22 -j REJECT

    netfilter-persistent save
    netfilter-persistent reload

    可以通过由你的计算机连接到服务器，进一步检查是否确实阻止了端口22。



    centos 的是 /etc/sysconfig/iptables
    ```
    # sample configuration for iptables service
    # you can edit this manually or use system-config-firewall
    # please do not ask us to add additional ports/services to this default configuration
    *filter
    :INPUT ACCEPT [0:0]
    :FORWARD ACCEPT [0:0]
    :OUTPUT ACCEPT [0:0]
    -I INPUT -s 10.0.0.1 -j ACCEPT
    -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    -A INPUT -p tcp --dport 22 -j REJECT
    -A INPUT -p icmp -j ACCEPT
    -A INPUT -i lo -j ACCEPT
    #-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
    -A INPUT -j REJECT --reject-with icmp-host-prohibited
    -A FORWARD -j REJECT --reject-with icmp-host-prohibited
    COMMIT

    ```


apt install -y knockd
knock-server.x86_64

    自动安装 knock 客户端

    更改配置文件 /etc/knockd.conf

    ```
    [options]
        # 你可以在此字段中找到knockd的配置选项
        UseSyslog
        # LogFile = /var/knock/knock.log

    [openSSH]
        # 定义敲门暗号顺序, 也可以不止3个端口号
        sequence = 7000:tcp,8000:tcp,9000:tcp
        # 设置超时时间，时间太小可能会出错, 指定序列必须完成的时间量
        seq_timeout = 50
        command     = /sbin/iptables -I INPUT -s %IP% -p tcp --dport 22 -j ACCEPT

        # 这是必须针对客户软件发出的试探设置的标志。如果标志不正确，但试探模式正确，不会触发动作。
        tcpflags = syn

    [closeSSH]
        sequence = 9000:tcp,8000:tcp,7000:tcp
        # cmd_timeout是在执行stop_command变量中包含的命令之前,knockd 将等待的秒数
        seq_timeout = 5
        command     = /sbin/iptables -D INPUT -s %IP% -p tcp --dport 22 -j ACCEPT
        tcpflags = syn

    [openHTTPS]
        sequence    = 12345,54321,24680,13579
        seq_timeout = 5
        command     = /usr/local/sbin/knock_add -i -c INPUT -p tcp -d 443 -f %IP%
        tcpflags    = syn
    ```



要想在指定的IP地址处打开端口22，请在计算机上使用下列命令

    knock -v my-server-ip 7000 8000 9000

    1. 也可以使用 telnet, 但是 telnet 只支持 tcp 端口

        telnet <target-ip> 7000
        telnet <target-ip> 8000
        telnet <target-ip> 9000

    2. nc

        nc -u <target-ip>  7000
        nc -u <target-ip> -p 7000
        nc  <target-ip>  7000           默认 tcp

    3. nmap

        for x in 7000 8000 9000;do
            nmap -Pn --host_timeout 201 --max-retries 0 -p $x <server_ip>
        done


    [2012-08-31 10:41] 192.168.1.16: opencloseSSH: Stage 1
    [2012-08-31 10:41] 192.168.1.16: opencloseSSH: Stage 2
    [2012-08-31 10:41] 192.168.1.16: opencloseSSH: Stage 3
    [2012-08-31 10:41] 192.168.1.16: opencloseSSH: OPEN SESAME
    [2012-08-31 10:41] opencloseSSH: running command: iptables -I INPUT -s 192.168.1.16 -p tcp –syn –dport 22 -j ACCEPT

    如果网络较差，且同时使用tcp和udp进行验证可能会导致数据包到达顺序不一致或某个包丢失导致验证失败。


完成你通过端口22想要完成的任何操作后，可以使用下列命令关闭该端口：

    knock -v my-server-ip 9000 8000 7000



