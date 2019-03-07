dst : destination
src : source
NAT : Network Address Translation

General
    Chain
        srcnat : 源地址转换，其作用是将 ip 数据包的源地址转换成另外一个地址
            除了指明协议 端口 转换成什么地址外 , 还要谈到是在那块网卡 ( 接口)上做这个“源地址地址转换”
            要让内网的电脑通过 ros 访问外网，那么就由与公网连接的网卡做 snat ，在添加 src-nat规则时， general 页的 out-interface 就应选 " 外网卡 "
        dstnat
                dst-nat 除了指定转换后的地址外 , 也将涉及是在那块网卡 (接口)上进行 , 例如, 要将公网发给ros 的 a 端口的数据包转给内网 ip 为 b 的 c 端口 , 那么设置好 a\b\c 的值后 , 在 dst-nat 规则 general页的 in-interface 里, 应选择与 b 地址网段相连的网卡 ( 接口), 显然这是一块内网卡 ,
        src-address 是指对哪些源地址进行伪装 ( 可以一个可以多个 ),
        dst-address 是指发向哪些主机的数据包要进行伪装 ( 可以一个可以多个 ) ，

        protocol 说明对哪些传输协进行转换 ( 通常有 tcp,udp 等)
        in-interface
        out-interface 说明通过哪一个网卡进行转换 ( 通常是外网卡 outside)

        In. Interface List
        Out. Interface List

        
Advanced

Action
    to-address

to-src-address 是将源地址伪装成哪些地址 ( 可以是一个也可以是很多个 )
to-src-pot 是将源端口伪装成哪些端口 (可以是一个也可以是很多个 ),

dst-port 是指发向哪些端口的数据包进行伪装 (可以一个可以多个 )，
src-port 是指从哪些源端口发出的数据包进行伪装 ( 可以一个可以多个 )

action : action ，这是说明用的哪种转换方式
    通常我们用 masqurade，nat 这两种 , 在特殊情况下用 accept( 主要是内网中有公网地址存在的情况 ) 方法
