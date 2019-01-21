iptables 是基于内核的防火墙，配置完直接生效

netfilter/iptables
    netfilter是Linux内核的功能

防火墙的日志是 IDS,IPS等高级安全设备的基础

在网络中的位置
    网络边界

网络过滤的分解步骤
    获取
        嗅探
        正常请求
    识别
        协议头
        具体内容
    过滤
        丢弃
        修改
        放过
        记录日志

4表5链

内置的4张表
    1. raw
        1. prerouting
        1. output
    1. mangle
        1. 用在修改数据包内容上，用来做流量整形的，给数据包打个标识，默认的规则链有:
            1. prerouting
            1. forward
            1. postrouting
            1. input
            1. output
    1. nat
        1. 
            1. prerouting
            1. postrouting
            1. output
    1. filter
        1. 负责过滤数据包，
            1. input
            1. output
            1. forward

表 -> 链 -> 规则


表间的优先顺序
    raw > mangle > nat > filter



-t --table

-A --append chain rule-specification

-C --check chain rule-specification

-D --delete chain 
     1. rule-specification
     1. rulenum

-E --rename-chain old-chain new-chain

-F --flush [chain]

-I --insert chain [rulenum] rule-specification

-L --list [chain]

-N --new-chain chain

-P --policy chain target

-R --replace chain rulenum rule-specification

-S --list-rules [chain]

-X --delete-chain [chain]

-Z --zero [chain [rulenum]]


netfilter控制点
                    路由决策
    preroutint    [routing-decision]  forward     postroutint

                    input                       output





iptables -t filter(default)


