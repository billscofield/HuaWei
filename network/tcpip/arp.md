

## windows 下工具

p2p终结者

cain



### Proxy-arp

           10.1.0.0/16         192.168.1.0/24
    +----+              +----+               +----+
    | R1 |--------------| R2 |---------------| R3 |....
    +----+              +----+               +----+




```Cisco

R1:
    conf t
    host r1
    no ip routing       //必须的
    int f0/0
    mac-add 1.1.1
    ip add 10.1.0.1 255.255.0.0     //必须不能是 24 位掩码
    no shut


R2:
    conft 
    host r2
    int f0/0
    mac-add 12.12.12
    ip add 10.1.0.2 255.255.0.0
    no shut

    int f1/0
    mac-add 23.23.23
    ip add 192.168.1.1 255.255.255.0
    no shut


R3
    conf t
    host r3
    int f0/0
    mac-add 3.3.3
    ip add 192.168.1.2 255.255.255.0
    no shut

R1:
    show arp
    ping 255.255.255.255       路由器隔绝广播，不会得到 R3 的 mac
    ```
    R1#show arp
    Protocol  Address          Age (min)  Hardware Addr   Type   Interface
    Internet  10.1.0.1                -   0001.0001.0001  ARPA   FastEthernet0/0
    ```


    ping 192.168.1.1
    show arp
    ```
    R1#show arp
    Protocol  Address          Age (min)  Hardware Addr   Type   Interface
    Internet  10.1.0.1                -   0001.0001.0001  ARPA   FastEthernet0/0
    Internet  192.168.1.1             0   0012.0012.0012  ARPA   FastEthernet0/0
    ```


    ping 192.168.1.2
    show arp
    ```
    R1#show arp
    Protocol  Address          Age (min)  Hardware Addr   Type   Interface
    Internet  10.1.0.1                -   0001.0001.0001  ARPA   FastEthernet0/0
    Internet  192.168.1.1             0   0012.0012.0012  ARPA   FastEthernet0/0
    Internet  192.168.1.2             0   0012.0012.0012  ARPA   FastEthernet0/0
    ```

    proxy-ary 成功
    网上说不能是24位掩码，实验证明是可以的

```
