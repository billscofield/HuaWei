
UDP
    服务器端: 67
    客户端  : 68


|       Client              Server
|   
|   DHCP Discover  ---> 广播
|             <---单播          DHCP OFFER      // IP 租约 netmask  BR地址(广播地址)  DNS  Gateway  客户端主机名
|   DHCP Request   ---> 广播
|                  <--- 单播    DHCP ACK
|   DHCP Release   --->
|   

最开始，客户端 0.0.0.0:68 发广播 255.255.255.255.67(udp) 我的 mac 地址是 xxx


bootps,bootpc  DHCP的前身, Cisco 设备商就是这个

什么时候会获得IP
    计算机开机
    网卡接通网络
    重启网卡服务
    租约到期,无法续订


租约更新
    租约完成1/2
    租约完成7/8
    租约到期


## 查看DHCP信息

cat /var/lib/dhcp/dhclient.enp2s0.leasesc

记录系统从DHCP服务器获取的IP信息。

```

lease {
  interface "enp2s0";
  fixed-address 192.168.61.104;
  option subnet-mask 255.255.255.0;
  option routers 192.168.61.1;
  option dhcp-lease-time 7200;                              // 此项是到期时间，单位秒。
  option dhcp-message-type 5;
  option domain-name-servers 192.168.1.1,192.168.61.1;
  option dhcp-server-identifier 192.168.61.1;
  renew 1 2021/08/02 23:16:17;
  rebind 2 2021/08/03 00:09:02;
  expire 2 2021/08/03 00:24:02;
}


```

dhclient -r #释放IP

dhclient #获取IP
