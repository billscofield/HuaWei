
应用层协议(TCP/IP)

C/S 架构

三种角色
    1. 客户端
    1. 服务端
        1. 代理 agent
        1. 代理 proxy


SNMPAgent：每个网络设备上都有个Agent，有些已经内建Agent，有些则要外接SNMPAgent，它主负责接收来自NMS的命令，以回报其网络设备的状况，当网络设备发生状况时，会透过Agent发出Trap告知NMS。


Proxy强调服务器的安全性、隐秘性、面向的调用方为非用户，分解Server的压力；
Agent强调客户端（面向用户级）、本地化、统一收集信息，处理转换消息，发送至Server并更新本地状态。


SNMP Traps are alert messages sent from a remote SNMP-enabled device to a central collector, the "SNMP manager"

Trap messages are the main form of communication between an SNMP Agent and an SNMP Manager. 

They are used to inform an SNMP manager when an important event happens at the Agent level. 

**A benefit of using Traps for reporting alarms is that they trigger instantaniously, rather than waiting for a status request from the manager.**


## 管理信息库MIB(被管理设备信息数据库)
1. 任何一个被管理的资源都表示成一个对象，称为被管理的对象。
1. MIB是被管理对象的集合。
1. 它定义了被管理对象的一系列属性：对象的名称、对象的访问权限和对象的数据类型等。每个SNMP设备（Agent）都有自己的MIB。
1. MIB也可以看作是NMS（网络管理系统，网络管理系统既可以指一台专门用来进行网络管理的服务器，也可以指某个网络设备中执行管理功能的一个应用程序）和Agent之间的沟通桥梁。
