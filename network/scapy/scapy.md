

pip install matplotlib
pip install PyX
pip install ipython
pip install cryptography

## 使用

使用下面的方法需要先导入：

    from scapy.all import *


## 构建 IP 包

1. 构建 IP 包

    pkt=IP()/TCP()

    pkt.show()

    pkt = IP(src='192.168.1.10',dst='8.8.8.8')/TCP()

    res = sr1(pkt)

    dst 也可以是一个范围
        dst = Net('192.168.1.0/24')

1. 发送

    sr1(): send and receive one by one

    sr(): send and receive all

    send(): only send

    srp1()  发送两层
    srp()   发送两层
    sendp() 发送两层

1. 查看收到的包的信息

    res.summary()

    res.show()


1. 常见的构建包函数

    1. 二层

        Ether(dst='ff:ff:ff:ff:ff:ff')
    1. 

1. 查看包属性

    ls

    ls(IP)
    ls(ICMP)
    ls(ARP)

生成随机数据项
    生成限定范围的随机数 RandNum(2048, 65536)
    生成指定长度的随机字符串 RandString(10)
    生成指定长度的随机字节串 RandBin(10)
    生成随机IP地址 RandIP() RandIP6()
        print(RandIP())
    生成随机MAC地址 RandMAC()

检验数据是否正确
    检验IP地址是否正确 valid_ip('192.168.1.1') valid_ip6('::1')
    检验Net地址是否正确 valid_net valid_net6
    检验MAC地址 valid_mac('00:11:22:33:44:55')
