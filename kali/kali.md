## kali安装sogo输入法
apt-get install fcitx 
apt --fix-broken install
dpkg -i sogo...deb

system-configuration / Region & Language / input / add Chinese
fcitx configuration
add sogo


## metasploit
内部各个库，模块之间的信息桥梁 postgresql
postgresql port 5432

msdb
    init
    reinit
    delete
    start
    stop


## modules
所有模块存放位置
    /usr/share/metasploit-framework/modules

1. exploits
利用系统漏洞进行攻击的动作(run),此模块对应每一个具体漏洞的攻击方法(主动、被动)
对漏洞的利用

比如某个程序存在漏洞(对输入没有做完全限定),比如说输入AAA会导致代码被放置到寄存器，exploit就是发现这种未完全限定的输入，然后将payload代码(攻击工具)放入到代码可执行区域

exploit 打开门并进入房间(相当于侦察兵)，payload 就是邪恶的恶魔
exploit 是木马，payload 是木马里的士兵

1. payloads
成功exploit之后，真正在目标系统执行的代码或指令

shellcode : payload 返回一个shell，或者可访问目标的shell
    是以拿到shell为目的
    是payload的一种，由于其建立正反向shell而得名

cd /usr/share/metasploit-framework/payloads/

    1. singles
        all in one, 完整的一个payload,不需要依赖外部的库等
        大小比较大

    1. stagers
        目标计算机内存有限时，先传输一个较小的payload用于建立连接

    1. stages
        利用stager建立的连接下载的后续payload

1. auxiliary
    执行信息手机、枚举、指纹探测、扫描等功能的辅助模块(没有payload 的 exploit模块)

1. encoders

1. evasion

1. nops

1. post


## 微软漏洞编号
ms17-010  17年第10个
