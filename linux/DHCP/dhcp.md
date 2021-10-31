
UDP
服务器端: 67
客户端  : 68


    Client              Server

DHCP Discover  ---> 

          <---          DHCP OFFER


DHCP Request   --->

               <---     DHCP ACK


DHCP Release   --->



bootps,bootpc  DHCP的前身, Cisco 设备商就是这个


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
