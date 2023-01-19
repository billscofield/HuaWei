
## knodck

apt-get install iptables iptables-persistent

    每当设置了新的iptables规则后，使用如下命令保存规则即可，规则会根据ipv4和
    ipv6分别保存在了
        /etc/iptables/rules.v4
        /etc/iptables/rules.v6

    netfilter-persistent  save

    由于 iptables-persistent 在安装时已经把它作为一个服务设置为开机启动了，
    它在开机后会自动加载已经保存的规则，所以也就达到了永久保存的目的。

        systemctl status netfilter-persistent

    允许已建立的连接以及当前会话

        iptables -A INPUT -m conntrack --ctstate ESTABLISHED，RELATED -j ACCEPT

    阻止通向端口22 SSH的所有入站连接

        iptables -A INPUT -p tcp --dport 22 -j REJECT

    netfilter-persistent save
    netfilter-persistent reload

    可以通过由你的计算机连接到服务器，进一步检查是否确实阻止了端口22。


apt install -y knockd

    自动安装 knock 客户端

    更改配置文件 /etc/knockd.conf

    ```
    [options]
        # 你可以在此字段中找到knockd的配置选项
        UseSyslog

    [openSSH]
        sequence = 7000:tcp,8000:tcp,9000:tcp
        seq_timeout = 5
        command     = /sbin/iptables -I INPUT -s %IP% -p tcp --dport 22 -j ACCEPT

        # 这是必须针对客户软件发出的试探设置的标志。如果标志不正确，但试探模式正确，不会触发动作。
        tcpflags = syn

    [closeSSH]
        sequence = 9000:tcp,8000:tcp,7000:tcp
        seq_timeout = 5
        command     = /sbin/iptables -D INPUT -s %IP% -p tcp --dport 22 -j ACCEPT
        tcpflags = syn
    ```



要想在指定的IP地址处打开端口22，请在计算机上使用下列命令
    knock -v my-server-ip 7000 8000 9000

完成你通过端口22想要完成的任何操作后，可以使用下列命令关闭该端口：
    knock -v my-server-ip 9000 8000 7000



