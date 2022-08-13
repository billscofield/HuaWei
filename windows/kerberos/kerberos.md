
## Windows 本地认证

windows 本地认证流程

Windows Logon Process(winlogon.exe) 用户登录程序，用于管理用户登录和退出

LSASS 用于微软windows系统的安全机制。她用于本店全和登录策略

---

%SystemRoot%\system32\config\sam

### NTLM Hash 
    长度 32 位
    由数字和字母组成

NTLM hash 的前身是 LM Hash 目前已经淘汰
    xp,03(LM Hash)

windows 本身不存储明文密码

```
pip install passlib
python
from passlib.hash import nthash

h = nthash.hash('admin')
```


admin -> hex -> unicode -> md4


### LM Hash

1. 将所有小写字母转换为大写

2. 填充为14个字符(使用0x00填充),转换为16进制,

3. 分为两组(每组7个)

4. 每组进行 des 加密

5. 将上述两个des加密的值进行拼接


## windows 网络认证

信托机构

SMB服务端口 445

早期 SMB 协议在网络上传输明文口令。后来出现 LAN Manager Challenge/Response 验证机制, 简称 LM, 他是如此简单以至很容易被破解

微软提出了 windows NT LM 机制，称之为 NTLM, 现在已经有了 NTLMv2, 域环境下的 Kerberos

### Challenge / Response

协商 -> 质询 -> 验证

1. 协商

    客户端想服务器确认协议版本，v1 or v2
    ...

2. 质询

    1. client 像 server 发送用户信息(用户名)请求

    2. server 接到请求，生成一个 16位的随机数，称之为 "challenge", 使用登录用户
       名对应的 NTLM Hash 加密 Challenge 生成 challenge1. 同时，生成 challenge1
       后, 将 challenge 发送给客户端

    3. 客户端收到 challenge 后，使用将要登录到账户对应的 NTLM Hash 加密
       challenge 生成 Response 发送给 server

    4. server 对比 response 和 challenge1,若想等则通过

NTLMv2

    和 NTLM 的显著不同就是 challenge 和加密算法不同

    1. challenge 
        v2 有 16 位
    2. 加密算法
        v2 的加密算法是 HMAC-md5


哈希传递
    在不需要帐户名密码的情况下完成认证的一个技术

    解决了在渗透中获取不到明文密码，破解不了 NTLM Hash

    必要条件
        1. 被传递认证的用户名
        2. 被传递用户的 NTLM Hash

    工具
        CrackMapExec

            root@kali: 
            cme smb 192.168.1.1 -u administrator -H [NTLM Hash] -x whoami(指令)

        smbexec
        metasploit
        smbmap


## Active Directory(活动目录) 概念

AD 存储了有关**网络对象**的信息, 并且让管理员和用户能够轻松的查找和使用这些信息。
AD 使用了一种结构化的数据存储方式，并以此作为基础对目录信息进行**合乎逻辑的分层
组织**

把域想象成树木，而网络对象则是叶子

网络对象分为
    1. 用户
    2. 用户组
    3. 计算机
    4. 域
    5. 组织单位
    6. 安全策略等

活动目录的功能

    1. 服务器及客户端计算机管理

        管理服务器和客户端计算机账户，所有服务器和客户端计算机加入域管理并实施组策略

    2. 用户服务
        
        管理用户域帐号、用户信息、企业通讯录（与电子邮件系统集成）、用户组管理、
        用户身份认证，用户授权管理等，按组实施组管理策略

    3. 资源管理
        管理打印机、文件共享服务等网络资源

    4. 桌面配置
        集中的配置各种桌面配置策略

    5. 应用系统支撑

        支持财务、人事、电子邮件、企业信息门户、办公自动化、补丁管理、防病毒系
        统等各种应用系统

### 域认证体系 Kerberos

是一种网络认证协议，其设计目标是通过密钥系统为客户机/服务器应用程序提供强大的认
证服务。

该认证过程的实现不依赖与主机操作系统的认证，无需给予主机地址的信任，不要求网络
上所有的主机的物理安全，并假定网络上传送的数据包可以被任意地读取、修改和插入数
据。

在以上情况下， Kerberos 作为一种**可信任的第三方认证服务**，是通过传统的密码技
术(如:共享密钥)执行认证服务的


域认证所参与的角色(三只狗头)


+-----------------------------------------------------------------------------------+
|   Domain Controller                                                               |
|                                                                                   |
|   +-----------------------------------------------------------+                   |
|   |                                                           |                   |
|   |                             KDC                           |                   |
|   |   +------------------------+  +-------------------------+ |   +---------+     |
|   |   | Authentication Service |  | Ticket Granting Service | |-->|   AD    |     |
|   |   +------------------------+  +-------------------------+ |   +---------+     |
|   +-----------------------------------------------------------+                   |
+-----------------------------------------------------------------------------------+
           /|\      |                      /|\      |
            |       |                       |       |
            |1      |2                      |3      |4
            |       |                       |       |
            |      \|/                      |      \|/
    +-----------------------------------------------------------+   5   +-----------+
    |                                                           |------>|           |
    |                           client                          |       |  server   |
    |                                                           |<------|           |
    +-----------------------------------------------------------+   6   +-----------+


    1. client
    2. server
    3. KDC(Key Distribution Center) = DC(Domain Control)
        AD(account database)
            存储所有 client 的白名单，只有存在于白名单中的 client 才能顺利申请到 TGT

        Authentication Service:
            为 client 生成 TGT 的服务

        Ticket Granting Service
            为 client 生成某个服务的 ticket

域认证流程-粗略流程

    1. client 向 Kerberos 服务请求，希望获取访问某个 server 的权限。Kerberos 得
       到了这个消息，首先得判断 client 是否是可信赖的。 这就是 AS 服务完成的工
       作，通过在 AD 中存储黑白名单来区分 client。成功后，AS 返回 TGT 给client.

    2. client 得到 TGT 后， 继续想 Kerberos 请求, 希望获得访问 server 的权限,
       kerberos 又得到了消息，通过 client 消息中的 TGT, 判断出了 client 拥有这
       个权限，给了 client 访问 server 的权限 ticket

    3. client 在得到 ticket 后，终于可以陈宫访问 server. 这个 ticket 只是针对这
       个 server, 其他 server 需要想 TGS 申请



