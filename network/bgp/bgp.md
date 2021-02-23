
## 什么是 BGP 链路， BGP 链路能做到什么?

BGP(Border GatewayProtocol)是一种在自治系统之间动态交换路由信息的路由协议。一个自治系统的经典定义是在一个管理机构控制之下的一组路由器，它使用 IGP 和普通度量值向其他自治系统转发报文。

    产品优势

    1. 消除南北访问障碍
    2. 高速互联互通
    3. 服务器只需要设置一个 IP 地址，最佳访问路由是由网络上的骨干路由器根据路由跳数与其它技术指标来确定的，不会对占用服务器的任何系统资源。服务器的上行路由与
       下行路由都能选择最优的路径，所以能真正实现高速的单 IP 双线访问。
    4. 由于 BGP 协议本身具有冗余备份、消除环路的特点，所以可以实现路由的相互备份，在一个出口出现故障时路由会自动切换到其它口。
    5. 使用 BGP 协议还可以使网络具有很强的扩展性可以将服务商网络与其他运营商互联，轻松实现单 IP 多线路，做到所有互联运营商的用户访问都很快。这个是双 IP 双线
       无法比拟的。虽然 BGP 方案是最好的解决方案但由于此方案需要互联网提供商的设备投入与带宽投入方面较大并且技术上较为复杂，所以目前国内采用此方案仅限于实力较强的专业互联网服务商。


其实我觉得应该叫做 Multi Origin Routes ： http://bgp.he.net/report/multi-origin-routes 

https://www.v2ex.com/t/259363





BGP线路是由两条或两条以上的线路组成的多线zhi路带宽，每条线路都在运营商那里广播了，如电信、联通、移动组成的三线BGP，就是机房的线路分别在电信、联通、移动

运营商那里都做了广播的，自动识别来自不同线路的访问用户，并快速响应；通常把多线统称BGP，但实际上真正的BGP区别于普通多线，BGP线路是只有一个IP线路连接到服

务器上，而普通双线或多线，需要有两个或多个IP线路连接到服务器上。