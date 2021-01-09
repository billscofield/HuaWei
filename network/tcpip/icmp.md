
## 华为 和 Cisco 对 Ping 广播包的不通处理方式

### 直接广播

```Cisco
R1#ping 10.0.0.255

Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 10.0.0.255, timeout is 2 seconds:

Reply to request 0 from 10.0.0.2, 32 ms
Reply to request 0 from 10.0.0.3, 40 ms
Reply to request 1 from 10.0.0.2, 28 ms

```

```华为
[Huawei]ping 10.0.0.255
  PING 10.0.0.255: 56  data bytes, press CTRL_C to break
    Reply from 10.0.0.255: bytes=56 Sequence=1 ttl=255 time=20 ms
    Reply from 10.0.0.255: bytes=56 Sequence=2 ttl=255 time=1 ms
    Reply from 10.0.0.255: bytes=56 Sequence=3 ttl=255 time=1 ms
```

Cisco 的广播包确实到了每个主机，但是华为的好像没有出去



### 受限广播

```Cisco
R1#ping 255.255.255.255

Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 255.255.255.255, timeout is 2 seconds:

Reply to request 0 from 10.0.0.2, 32 ms
Reply to request 0 from 10.0.0.3, 36 ms
Reply to request 1 from 10.0.0.3, 24 ms
```


```华为
<Huawei>ping 255.255.255.255
  PING 255.255.255.255: 56  data bytes, press CTRL_C to break
    Request time out
    Request time out
    Request time out
    Request time out
    Request time out
```



### 四种 IP 广播




## 关于一个网卡配多个IP

```Cisco

### router1
conf t
int f0/0
ip add 10.0.0.1 255.255.255.0
ip add 10.0.0.11 255.255.255.0

一个局域网不能有重复的 MAC 地址
```


shutdown 
clear arp 
no shutdown 
