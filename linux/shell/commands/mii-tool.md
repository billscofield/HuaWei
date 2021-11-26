## 100Base-T4

[link](https://www.tutorialspoint.com/what-is-100base-t4)

Properties

    1. This has four pairs of unshielded twisted pair of Category 3. i.e. voice
       grade.
        
    2. Two of these pairs are bi-directional and the other two are
       unidirectional.  The two unidirectional wires are reserved for receiving
       and sending data respectively. In each direction, three pairs can be
       used simultaneously for data transmission.
        
    3. Each twisted pair is capable of transmitting a maximum of **25Mbaud** data.
       Thus the three pairs can handle a maximum of **75Mbaud** data.
        
    4. It uses the encoding scheme 8B/6T (eight binary/six ternary).

The following diagram shows the use of four wires −


|
|                       +--------------------------+-
|                       |                          |
|                       | +--------------+         |            send
|                       | |              |         |        ---------------> 25Mbps
|                       | |          >>--|------------------------->>
|                       | | 8B/6T        |         |
|                   +---|-| Encoder  >>--|-+       |            send / receive
|                   |   | |              | |       |        <--------------> 25Mbps
|                   |   | |              | +-----------------------
|                   |   | |              | |       |
|                   |   | |          >>--|-|-----+ |
|                   |   | |              | |     | |
|                   |   | +--------------+ |     | |
|                   |   |                  |     | |
|   100Mbps---------+   |                  |     | |
|                   |   |                  |     | |
|                   |   | +--------------+ |     | |
|                   |   | |              | |     |
|                   |   | |          <<--|-+     | |            send / receive
|                   |   | |              |       | |        <---------------> 25Mbps
|                   |   | | 8B/6T        |       +-----------------
|                   |   | |              |       | |
|                   +---|-| Decoder  <<--|-------+ |            receive
|                       | |              |         |        <---------------  25Mbps
|                       | |          <<--|-------------------------<<
|                       | +--------------+         |
|                       |                          |
|                       +--------------------------+
|
|       25Mbps x 3 = 75Mbps


X:  为同一传输速率下的不同标准（例如100 BASE-T下有X或4两个标准）
    TX 表示传输介质2对高质量的双绞线，一对用于发送数据，一对用于接受数据，



快速以太网制定的三种有关传输介质的标准
    100BASE-T4
    100BASE-TX
    100BASE-FX

## mii-tool

manipulate media-independent interface status

配置网络设备协商方式的工具

有时网卡需要配置协商方式 ，比如10/100/1000M的网卡半双工、全双工、自动协商的配置
。但大多数的网络设备是不用我们来修改协商，因为大多数网络设置接入的时候，都采用
自动协商来解决相互通信的问题。不过自动协商也不是万能的，有时也会出 现错误，比如
丢包率比较高，这时就要我们来指定网卡的协商方式 。

mii-tool 在更改网络设备通信协商方式的方法比较简单，

    -v 参数来查看网络接口的状态；

        ```
        [hello@hello]$ mii-tool -v enp0s25
        
        enp0s25: negotiated 1000baseT-FD flow-control, link ok
        product info: vendor 00:aa:00 or 00:55:00, model 10 rev 0
        basic mode:   autonegotiation enabled
        basic status: autonegotiation complete, link ok
        capabilities: 1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
        advertising:  1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD flow-control
        link partner: 1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD flow-control
        ```

    -F media, --force=media
        
        Disable  autonegotiation,  and force the MII to either 
            100baseTx-FD,
            100baseTx-HD,
            10baseT-FD,
            10baseT-HD
        operation.

        mii-tool -F 100baseTx-FD


## ethtool 工具关于网络协商功能介绍

这个工具比较复杂，功能也特别多

ethtool eth0    查询ethX网口基本设置


-i --driver
    Queries the specified network device for associated **driver** information.

 -r --negotiate
    Restarts auto-negotiation on the specified Ethernet device, if
    auto-negotiation is enabled.

-S --statistics
    Queries the specified network device for NIC- and driver-specific statistics.

    ```
    rx_packets: 92013524
    tx_packets: 26806519
    rx_bytes: 18026994286
    tx_bytes: 8702399489
    rx_broadcast: 51289240
    tx_broadcast: 35437
    rx_multicast: 11309178
    tx_multicast: 1156756
    rx_errors: 2
    tx_errors: 0
    tx_dropped: 0
    multicast: 11309178
    collisions: 0
    ...
    ```

-s --change

    Allows changing some or all settings of the specified network device.
    All following options only  apply  if -s was specified.

    speed N
        Set speed in Mb/s.
        ethtool with just the device name as an argument will show you the supported device speeds.

    **duplex half|full**
        Sets full or half duplex mode.

    port tp|aui|bnc|mii
        Selects device port.

    master-slave preferred-master|preferred-slave|forced-master|forced-slave
        
        Configure MASTER/SLAVE role of the PHY. When the PHY is configured as
        MASTER, the PMA Transmit  function shall  source  TX_TCLK  from  a
        local clock source. When configured as SLAVE, the PMA Transmit function
        shall source TX_TCLK from the clock recovered from data stream provided
        by MASTER. Not all devices  sup‐port this.
        
        preferred-master   Prefer MASTER role on autonegotiation
        preferred-slave    Prefer SLAVE role on autonegotiation
        forced-master      Force the PHY in MASTER role. Can be used without autonegotiation
        forced-slave       Force the PHY in SLAVE role. Can be used without autonegotiation

    mdix auto|on|off
        Selects  MDI-X  mode for port. May be used to override the automatic
        detection feature of most adapters.  An argument of auto means
        automatic detection of MDI status, on forces MDI-X (crossover) mode,
        while off means  MDI  (straight through) mode.  The driver should
        guarantee that this command takes effect immedi‐ately, and if necessary
        may reset the link to cause the change to take effect.

    **autoneg on|off**
        Specifies whether autonegotiation should be enabled. Autonegotiation is
        enabled by default, but in  some network devices may have trouble with
        it, so you can disable it if really necessary.

    advertise N


    1. 把网卡eth0 速度改为10Mb/s，采用半双工

        > ethtool -s eth0 speed 10 duplex half

    2. 把网卡eth0 速度改为100Mb/s，采用全双工

        > ethtool -s eth 0 speed 100 duplex full



