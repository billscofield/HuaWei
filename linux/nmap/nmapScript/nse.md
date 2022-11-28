# NSE(Nmap Script Engine)

NSE 的目的:
    
    1. 网络发现
    2. 更复杂的版本检测
    3. 漏洞检测
    4. 后门检测
    5. 漏洞利用
        
        可以使用 NSE 编写对应的漏洞利用脚本，但是目前 Nmap 官方不打算将 Nmap 作
        成与 Metasploit 进行漏洞利用的框架

Nmap 脚本都是由 Lua 5.3 编写的. 

在 nmap 中可以使用 -sC 和 --script nse名称 调用 NSE 脚本


nmap --script=auth [ip]

    鉴权 扫描：使用 --script=auth 可以对目标主机应用**弱口令检测**。

nmap --script=brute [ip]

    暴力破解攻击：nmap具有暴力破解的功能，可对数据库，smb,snmp等进行简单密码的
    暴力猜解。

nmap --script=vuln [ip]

    扫描常见的漏洞：nmap具备漏洞扫描的功能，可以检查目标主机或网段是否存在常见
    的漏洞。

nmap --script=realvnc-auth-bypass [ip]

    应用服务扫描：nmap具备很多常见应用服务的扫描脚本，例如VNC服务，mysql服务，
    telnet服务，rsync服务等，此处以vnc服务为例。

nmap --script=broadcast [ip]

    广播探测：探测局域网内更多服务开启的情况。

nmap --script=external [域名]

    用于第三方服务，例如whois解析。
        whois解析：利用第三方的数据库或资源查询目标地址的信息

nmap --script=default

    默认，执行脚本（-sC）。

map --script=discovery

    与主机和服务发现相关的脚本。
