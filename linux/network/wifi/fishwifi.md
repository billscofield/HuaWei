
# 钓鱼WiFi

工具包 :
    1. aircrack-ng: wireless WEP/WPA cracking utilities

DHCP(Listening Port 67)
    1. apt install isc-dhcp-server: ISC DHCP server for automatic IP address assignment
    1. /etc/dhcp/dhcpd.conf
    ```
    subnet 192.168.1.0 netmask 255.255.255.0 {
        range 192.168.1.100 192.168.1.200;
        option routers 192.168.1.1;
        option subnet-mask 255.255.255.0;
        option domain-name-servers 192.168.150.222;
    }
    ```
    1. vim /etc/default/isc-dhcp-server
        INTERFACESv4="at0"

    1. systemctl restart isc-dhcp-server


DNS
    1. apt install bind9

    1. /etc/bind/named.conf.options
    ```
    forwarders { 8.8.8.8; }
    recursion yes;
    allow-query { any; };
    listen-on { any; };
    listen-on port 53 { 192.168.150.222; };
    ```

    1. systemctl restart bind9

    1. nslookup z.cn 192.168.150.222


转发
    内核

    iptables
        iptables -nL
        iptables-save       // 链
        
        iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o wan1 -j SNAT --to-source 192.168.150.222
        iptables-save

抓取
    ettercap
        ettercap-common - Multipurpose sniffer/interceptor/logger for switched LAN

