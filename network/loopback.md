
## 图示

https://www.pianshen.com/article/80841804771/




                |                               A
                |                               |
    +-----------V-------------------------------|-----------+
    | +------------------+              +-----------------+ |
    | |IP output function|              |IP input function| |
    | +------------------+              +-----------------+ |
    |       /            \              A           A       |
    +------/--------------\------------/-------------\------+
          /   ________________________/               \_______________________
         V   V              \                                                  \
+-------------+      +-------\------------------Ethernet Driver-----------------\---------------+
|             |      |        V                                                  \              |
| Place on IP |      |       +---------------------------+          +-------------------------+ |
| input queue |<-------YES---| Destination IP address    |          | Place on IP input queue | |
|             |<-- | |       | equal to Broadcast address|          +-------------------------+ |
+-------------+  | V |       | or Multicast address?     |                       A              |
Loopback Driver  | | |       +---------------------------+                       |              |
                 | | |                  NO |                                     |              |
                 | | |                     |                                     |              |
                 | | |                     V                                     |              |
                 | | |       +---------------------------+                       |              |
                 | | | YES   | Destination IP address    |                       |              |
                 --|-----<---| equal to Interface IP     |                       A              |
                   | |       | address?                  |                       |              |
                   | |       +---------------------------+                       |              |
                   V | No, use ARP to get  |                                     |              |
                   | | destination         |                                     |              |
                   | | Ethernet address    |                                     |              |
                   | |                     V                                     |              |
                   | |       +---------------------------+          +----------------------+    |
                   | |       |                           |          | Demultiplex based on |    |    拆解数据帧（demultiplexing）
                   | |       |            ARP            |<---ARP---| Ethernet frame type  |    |
                   | |       |                           |          |                      |    |
                   | |       +---------------------------+          +----------------------+    |
                   | |                     |                                     A              |
                   | |               Send  |                             Receive |              |
                   | |                     |                                     |              |
                   | +---------------------|-------------------------------------|--------------+
                   |                       |                                     |
                   V                       V                                     |
---------------------------------------------------------------------------------------------------
Ethernet


loopback: 
    1. 使本机中的不同进程（client和server）直接通过TCP/IP协议栈进行通信，让数据报不离开本机，避免将报文暴露到外网
    1. 排障（troubleshooting ）：如果ping 127.0.0.1 不通，则表示主机的TCP/IP协议栈有问题


当从以太网接收到数据帧后，开始进行拆解数据帧（demultiplexing），

1. 如果是ARP报文，则直接通过ARP协议发送到以太网中
2. 如果是IP报文，则放置到IP报文输入队列中，然后发送到IP输入函数。经过协议栈处理，发送到IP输出函数
    1. 如果目的地址是loopback地址，则直接发送给Loopback驱动的IP输入队列中
    2. 如果目的地址是广播或多播地址，拷贝一份到Loopback输入队列中，然后通过以太网发送出去
    3. 如果目的地址是本机IP，则发送给Loopback驱动的IP输入队列中
        1. 如果不是，则通过ARP协议发送到以太网，去获得目的MAC地址




传给环回接口的报文都为IP报文
传给广播地址或多播地址的报文都会拷贝一份到Loopback，然后再发送给以太网，因为广播和多播包含主机本身
任何传给本机IP地址的报文都会送回Loopback（ping本机IP地址的报文，通过Lo网卡抓到包）




参考:
    1. 书籍《TCP/IP Illustrated, Volume 1: The Protocols, W. Richard Stevens.》



