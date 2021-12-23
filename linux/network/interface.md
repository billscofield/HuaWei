https://blog.csdn.net/fansilean/article/details/43069883


## auto-hotplug && auto 

links:

    https://lists.debian.org/debian-user/2017/09/msg00911.html

    https://unix.stackexchange.com/questions/192671/what-is-a-hotplug-event-from-the-interface

### auto

auto:            

    try to ip link set <dev> up  at boot.  Best choice for anything PCIe/SoC.

allow-hotplug:   

    *wait* for kernel+drivers+udev to detect the device, then ip link set <dev> up it.  The only thing that can deal with annoying USB, SDIO, etc.


This can be kinda important when non-auto-loading stuff is involved, or when network file systems are involved.

So, look at what *exact* kind of network device you're dealing with.



---

auto-hotplug

    To start interface <interface_name> upon hotplug event of the system.

---

https://lists.debian.org/debian-boot/2007/07/msg00377.html

The problem of using auto is that the booting gets stuck until
dhclient3 timeouts, if you lack network support while booting the
system. If you use allow-hotplug it doesn't happen.





## biosdevname 和 net.ifnames 两种命名规范

### 一致网络设备命名规范

Centos 6及之前的版本网卡命名格式：eth[0123…]。

Centos 7为了方便定位和区分网络设备，采用一致网络设备命名（CONSISTENT NETWORK
DEVICE NAMING）规范，支持 biosdevname 和 net.ifnames 两种命名规范。


### net.ifnames

net.ifnames 命名规范为：设备类型 + 设备位置 + 数字

设备类型

    en 代表以太网
    wl 代表无线局域网（WLAN）
    ww 代表无线广域网（WWAN）


设备命名

    +-------------------------------------------------------------------+-------------------+
    | 格式                                                              |   描述            |
    +-------------------------------------------------------------------+-------------------+
    | o<index>                                                          |   板载设备索引号  |
    +-------------------------------------------------------------------+-------------------+
    | s<slot>[f<function>][d<dev_id>]                                   |   热插拔插槽索引号|
    +-------------------------------------------------------------------+-------------------+
    | x<MAC>                                                            |   MAC 地址        |
    +-------------------------------------------------------------------+-------------------+
    | p<bus>s<slot>[f<function>][d<dev_id>]                             |   PCI 地理位置    |
    +-------------------------------------------------------------------+-------------------+
    | p<bus>s<slot>[f<function>][u<port>][..][c<config>][i<interface>]  |   USB 端口链      |
    +-------------------------------------------------------------------+-------------------+


示例

    en o1            板载1号网卡
    en p0s2          PCI扩展卡的2号端口
    en s33           热插拔插槽3号PCI-E插槽的3号端口
    ww p0s29f7u2i2   4G modem
    wl p3s0          第3号PCI扩展卡的0号端口
    wl p0s2f1u4u1    连接在USB Hub上的无线网卡


### biosdevname 命名规范

+---------------------+-------------------------------------
| 设备                | 旧名称      新名称          示例
+---------------------+-------------------------------------
| 内嵌网络接口（LOM） | eth[0123…]  em[1234…][a]    em1
+---------------------+-------------------------------------
| PCI 卡网络接口      | eth[0123…]  pp[b]           p3p4
+---------------------+-------------------------------------
| 虚拟功能            | eth[0123…]  pp_[c]          p3p4_1
+---------------------+-------------------------------------

注: 新枚举从 1 开始。

