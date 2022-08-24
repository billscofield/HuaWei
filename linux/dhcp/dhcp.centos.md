

## 服务端

rpm -qa | grep dhcp
    dhcp-libs-4.2.5-82.el7.centos.x86_64
    dhcp-common-4.2.5-82.el7.centos.x86_64

1. 安装
    yum install -y dhcp

    (1/4): dhclient-4.2.5-83.el7.centos.1.x86_64.rpm               | 286 kB  00:00:00
    (2/4): dhcp-4.2.5-83.el7.centos.1.x86_64.rpm                   | 515 kB  00:00:00
    (3/4): dhcp-common-4.2.5-83.el7.centos.1.x86_64.rpm            | 177 kB  00:00:00
    (4/4): dhcp-libs-4.2.5-83.el7.centos.1.x86_64.rpm              | 133 kB  00:00:00


    man dhclient

2. 配置文件

    rpm -ql dhcp | grep conf

    cp /usr/share/doc/dhcp-4.2.5/dhcpd.conf.example  /etc/dhcp/dhcpd.conf


    subnet 作用域设置
        netmask
        range                       // ip 范围
        option routers              // 网关地址
        option domain-name-servers  // DNS 服务器地址
        option broadcast-address    // 广播地址


    option definitions common to all supported networks.  option 是全局的设置


    ```
    option domain-name "example.org";       // dns 所在域
    option domain-name-servers ns1.example.org, ns2.example.org;        // 具体的 DNS 服务器

    default-lease-time 600;
    max-lease-time 7200;

    # Use this to enble / disable dynamic dns updates globally.         // 动态 DNS, none/interim/ad-hoc
    #ddns-update-style none;


    // DHCP 是权威, 当有多个 dhcp 时，最高优先级别
    #authoritative;


    log-facility local7;


    subnet 192.168.1.0 netmask 255.255.255.0 {
        range dynamic-bootp 192.168.1.1 192.168.1.100;
        option broadcast-addrss 192.168.1.255;
        option routers rtr-239-1.example.org;
    }


    subnet 10.5.5.0 netmask 255.255.255.224 {
      range 10.5.5.26 10.5.5.30;
      option domain-name-servers ns1.internal.example.org, ns2.xxx;     // 这个用逗号
      option domain-name "internal.example.org";
      option routers 10.5.5.1;
      option broadcast-address 10.5.5.31;
      default-lease-time 600;
      max-lease-time 7200;
    
    ```

    租约配置文件
        /var/lib/dhcpd/dhcpd.leases
        /var/lib/dhcpd/dhcpd6.leases

3. 启动

    其中一个 subnet 必须是本地网段, 否则起不来

    systemctl restart dhcpd
    systemctl enable dhcpd


dhclient

    -r      Release  the current lease and stop the running DHCP client as
            previously recorded in the PID file.
            
            dhclient -r ens33

    -d      Force dhclient to run as a foreground process.
            
            dhclient -d ens33
            或者
            tail -f /var/log/message
            
            nmcli connection show ens33
                dhcp_server_identifier = 10.0.0.1
            
            tcpdump -nn -vvv -s 1500 -i ens33 host <SERVERIP> and udp port 67 or udp port 68


作用域
    subnet 定义一个作用域

保留地址
    根据 mac 地址分发 IP 地址

    ```
    host fantasia {                             // fantasia是名字，随意
      hardware ethernet 08:00:07:26:c0:a5;
      fixed-address 10.0.0.1;
      #option host-name "test.a.com";            // 发放计算机名称, 要删除/etc/hostname 中的内容
    }
    ```

DHCP 超级作用域
    将两个或多个作用于合成一个

    shared-network SUPER{
        
        subnet 10.5.5.0 netmask 255.255.255.224 {
          range 10.5.5.26 10.5.5.30;
          option domain-name-servers ns1.internal.example.org, ns2.xxx;     // 这个用逗号
          option domain-name "internal.example.org";
          option routers 10.5.5.1;
          option broadcast-address 10.5.5.31;
          default-lease-time 600;
          max-lease-time 7200;
        }

        subnet 10.6.5.0 netmask 255.255.255.224 {
          range 10.6.5.26 10.5.5.30;
          option domain-name-servers ns1.internal.example.org, ns2.xxx;     // 这个用逗号
          option domain-name "internal.example.org";
          option routers 10.6.5.1;
          option broadcast-address 10.6.5.31;
          default-lease-time 600;
          max-lease-time 7200;
        }
    }
