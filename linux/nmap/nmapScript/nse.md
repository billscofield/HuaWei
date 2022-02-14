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
