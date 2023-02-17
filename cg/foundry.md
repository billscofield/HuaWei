# rlm

## 浮动授权

是一种可以转移的授权，是指软件的授权可以在不同的计算机之间相互移动，但同一时刻可以使用的授权总数量不超过允许的上限。
授权转移的申请和验证需要通过授权服务器来完成。根据授权移动的范围不同，分为局域网浮动授权和广域网浮动授权两种。

举例说明:

局域网浮动授权：是一种集团模式的授权，需要在企业的局域网服务器上安装一个局域网服务模块，负责局域网内并发节点数量的控制。
比如企业有100台计算机，但同时使用某软件的计算机数量一般不超过20台，那只买20个浮动授权就可以了。也就是说这100台计算机都
装了某软件，但同时使用该软件的计算机数量不能超过20台，但不限制是那20台。只要局域网内同时使用该软件的计算机数量没有到20台，
其它计算机可以继续登录使用该软件；同时使用该软件的计算机数量到达20台后，其它计算机就无法登录使用该软件了。这20台授权数量
是在100台计算机内浮动的。


广域网浮动授权：是一种可以转移的单机授权，需要通过架设在互联网上的中央授权服务器配合来完成授权的收回和转移，以控制同一时
刻只有一台计算机可以使用授权软件。与固定在某一台计算机上的单机授权相比，这种授权适合于需要在多种场合使用某一软件而又不愿
意购买多套授权的用户，比如“办公室-家-出差”模式。在转移授权时，用户需要在当前授权有效的计算机机上执行收回操作，将本机授权
作废并返还给互联网上的中央授权服务器。回收后，其它计算机就可以重新使用该授权了。


提供浮动授权解决方案的公司有北京比特安索信息技术有限公司、Flexera Software公司等


## The Foundry 公司

英[ˈfaʊndri] 铸造厂; 玻璃厂

Foundry是来自英国的顶尖软件公司，总部位于伦敦，在软件行业有20年历史。旗下的Nuke软件，是影视特效合成软件，好莱坞99%的电影
特效都是用Nuke软件制作，在电影／电视／游戏行业有诸多用户；

https://www.foundry.com/
https://www.foundry.com/zh-hans/

    1. NUKE
    2. KATANA
    3. MARI

    4. MODO
    5. FLIX
    6. COLORWAY
    7. HIERO
    8. CARAVR
    8. OCULA


### Foundry 授权工具

Foundry 授权实用工具（FLU ：Foundry Licensing Utility） 

Foundry Licensing Utility还增添了英语之外的中文、日语和韩语支持。


#### 有关授权工具的详细文档，请访问 learn.foundry.com/licensing



#### 如何安装Foundry 授权实用工具: 

    ```html
    https://learn.foundry.com/licensing/Content/User_Guide/Installing/flu_install.html?_gl=1*1eoompn*_ga*MTEzMDY1NTU2Mi4xNjE3MDA1MDg4*_ga_QQ35L7EVY0*MTYxOTQyMDU4My4zLjEuMTYxOTQyMTEyMC4w*_ga_THF8SPBJQF*MTYxOTQyMDU4My4yLjEuMTYxOTQyMTEyMC4w
    ```


1. Qualified Operating Systems

    CentOS 7 or Ubuntu 19 (64-bit)

2. Installing on Linux

    Download the installer for your Linux distribution from our website at www.foundry.com/licensing/tools

    • .AppImage - Most distributions, other than CentOS 6.

    • .deb - Debian/Ubuntu based distributions.

    • .rpm - CentOS/RHEL distributions.



#### FLU教程系列





### RLM

Reprise License Manager

英 [rɪˈpriːz] 重复部分，再现部；重复，重演

