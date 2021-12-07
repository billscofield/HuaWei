
Linux 网卡命名说明

[link1](https://www.cnblogs.com/answercard/p/7071163.html)


```
/*
 * Two character prefixes based on the type of interface:
 *   en — Ethernet
 *   sl — serial line IP (slip)
 *   wl — wlan
 *   ww — wwan
 *
 * Type of names:
 *   b<number>                             — BCMA bus core number
 *   c<bus_id>                             — CCW bus group name, without leading zeros [s390]
 *   o<index>[d<dev_port>]                 — on-board device index number
 *   s<slot>[f<function>][d<dev_port>]     — hotplug slot index number
 *   x<MAC>                                — MAC address
 *   [P<domain>]p<bus>s<slot>[f<function>][d<dev_port>]
 *                                         — PCI geographical location
 *   [P<domain>]p<bus>s<slot>[f<function>][u<port>][..][c<config>][i<interface>]
 *                                         — USB port number chain
 */
```


上面一段是systemd源码的注释，意思是:

en代表以太网卡

p3s0代表PCI接口的物理位置为(3, 0), 其中横座标代表bus，纵座标代表slot
