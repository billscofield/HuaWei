netfilter
TCP Wrappers
    主要通过分析服务器程序来管理, 与启动的端口无关，只与程序的名称有关。


可以通过 iptables 命令来进行规则的排序与修改，不过鸟哥建议你使用 Shell Script 来撰写属于你自己的防火墙机制。


防火墙的最大功能就是帮助你限制某些服务的访问来源
    1. 比如fpt只允许内网用户访问
    1. 仅仅接受 wwww 服务
    1. 仅能主动对外连接
    1. ...

主要分析OSI的2,3,4层协议

子网防火墙

DMZ 非军事化管理区
    DMZ的重点在于保护服务器本身

IPTables的重点在于
    1. **比对**
    1. **分析顺序(先干掉最危险的角色)**

当一个网络数据包要进入到主机之前，会先经过Netfilter进行检查，那就是iptables的规则。
    网络数据包 符合 item1 就进入1
               不符合则对下一个进行匹配检查
               
    默认规则(policy)

当**规则顺序**排列错误时，就会产生很严重的错误


管理**特殊标志**的 mangle
管理**后端主机**的 nat
管理**本机进出**的 filter


filter  :   主要跟进入Linux本机的数据包有关，是默认的table
    input
    output:Linux本机要发送的数据包有关
    forward:传递数据包到后端主机，与nat的table相关性较高

nat:主要进行**来源**与**目的地**的IP或port的转换
    prerouting
    output
    postrouting

mangle(破坏者):与特殊的数据包的路由标志有关



iptables [-t tables] [-L] [-nv]
    -t : table 默认 filter
    -L : list 
    -n : numeric outpu. IP address and port numbers will be printed in numeric format. avoid llong reverse DNS lookups
    -v : verbose

    清除
        -F --flush 
            flush(冲刷) the selected chain. equivalent to deleting all the rules one by one.
        -Z --zero
           zero the packet and byte counters in all chains, or only the given chain, or only the given rule in a chain. 
        -X --delete-chain
            delete the optional(随意的) user-defined chain specified.

        上面3条命令会将本机防火墙的所有规则都清除，但不会改变默认策略(policy)

    定义默认策略
        iptables [-t nat] -P [INPUT,OUTPUT,FORWARD] [ACCEPT,DROP]
            -P --policy chain target

    数据包的基础对比：IP、网络及接口设备
        -A --append chain rule-specification,新增的规则放在原规则的最后面
        -I --insert chain [rulenum] rule-specification (starting 1 for the first rule)

        -i --in-interface : Name of an interface via which a packet was received(only for packets entering the INPUT, FORWARD and PREROUTING chains)
            when the "!" is used before the interface name , the sense is inverted
            if the interface ends in a "+", then any interface which begins with this name will match
            if this option is omitted, any interface name will match
            -i lo
        -o --out-interface : name of an interface via which a packet is going to be sent

        [!]-p --protocol   
        
        [!]-s --source address[/mask]
        [!]-d --destination[/mask]
        
        -j --jump : this specifies the target of the rule; i.e., what to do if the packet matches it.
            ACCEPT
            DROP
            LOG : 仅仅记录在内核日志文件中，/var/log/message
        
        示例
            iptables -A INPUT -i lo -j ACCEPT
                **没有制定的项目，则表示该项目完全接受**
                没有 -s -d 则表示不论什么值都会被接受
            iptables -A INPUT -i eth1 -s 192.168.100.0/24 -j ACCEPT
            iptables -A INPUT -i eth1 -s 192.168.100.24 -j DROP

    target : 代表的操作
        ACCEPT
        DROP
        REJECT???
    prot : protocol 协议

    opt : option 额外的选项说明
    source : 来源ip
    destination : 目标IP

iptables-save : 会列出完整的防火墙规则  dump iptables rules to stdout
    iptables-save [-t table]
    -t --table
    
    
    
