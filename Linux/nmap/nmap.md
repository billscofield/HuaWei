
-sL: 
    Since the idea is to simply print a list of target hosts, options for higher level functionality such as port scanning, OS detection, or ping scanning cannot be combined with this. 
    If you wish to disable ping scanning while still performing such higher level functionality, read up on the -Pn (skip ping) option.

    相当于给你列出这个网段有哪些机器，帮你做数学题而已

    例如
        nmap 192.168.1.0/29 -sL

        Starting Nmap 7.80 ( https://nmap.org  ) at 2020-03-10 07:00 CST
        Nmap scan report for bogon (192.168.1.0)
        Nmap scan report for bogon (192.168.1.1)
        Nmap scan report for bogon (192.168.1.2)
        Nmap scan report for bogon (192.168.1.3)
        Nmap scan report for bogon (192.168.1.4)
        Nmap scan report for bogon (192.168.1.5)
        Nmap scan report for bogon (192.168.1.6)
        Nmap scan report for bogon (192.168.1.7)
        Nmap done: 8 IP addresses (0 hosts up) scanned in 0.50 seconds


-sn 和 -PO1 还是不一样
    ➜  ~ nmap -sn 172.20.10.1
    Starting Nmap 7.80 ( https://nmap.org  ) at 2020-03-10 07:19 CST
    Nmap scan report for bogon (172.20.10.1)
    Host is up (0.0069s latency).
    MAC Address: 76:9F:13:F1:37:64 (Unknown)
    Nmap done: 1 IP address (1 host up) scanned in 0.10 seconds

    ➜  ~ nmap -PO1 172.20.10.1
    Starting Nmap 7.80 ( https://nmap.org  ) at 2020-03-10 07:19 CST
    Nmap scan report for bogon (172.20.10.1)
    Host is up (0.0032s latency).
    Not shown: 829 closed ports, 168 filtered ports
    PORT      STATE SERVICE
    21/tcp    open  ftp
    53/tcp    open  domain
    62078/tcp open  iphone-sync
    MAC Address: 76:9F:13:F1:37:64 (Unknown)

    -sn 不扫描端口
