https://zhuanlan.zhihu.com/p/34843290



https://scapy.readthedocs.io/en/latest/index.html




## Kamene

Scapy是基于Python语言的网络报文处理程序，它可以让用户发送、嗅探、解析、以及伪造网络报文，运用Scapy可以进行网路侦
测、端口扫描、路由追踪、以及网络攻击。Kamene是Scapy的分支，一开始的Scapy并不支持Python 3，为了支持Python 3就诞生
了Scapy3k这个分支，为了方便区分就把Scapy3k更名为了Kamene。注意：最新的Scapy是支持Python 3的(Scapy 2.4.0+)。


Scapy 官网: https://scapy.net/

Scapy Pypi包主页: https://pypi.org/project/scapy/


### 安装

pip3 install -i https://pypi.douban.com/simple/ kamene

执行完毕后输入 kamene 验证安装是否成功

上面白色的警告提示说: 无法导入 cryptography 模块，没有IPv6路由，没有IPython shell。我们依次安装这几个模块。


```
pip install cryptography
pip install ipython
```


### 构造包演示

构造一个Ping的请求包

```
ping = IP(dst="http://www.baidu.com") / ICMP()

```

斜杠’ / ‘就是用来区分网络层次的，一般来说把底层的协议写在左边把高层的协议写在右边，就像下面这样:

数据链路层协议 / 网络层协议 / 传输层协议 / 应用层协议及数据


一般来说我们不需要关心数据链路层的协议Scapy会为我们自动配置。


Scapy定义了很多函数和类，通过这些函数和类我们就可以构造数据包。这里的IP可以用来生成一个IP的报文头。

```
In [3]: IP()
Out[3]: <IP  |>

```

show()方法获取报文字段信息(在Python shell中下划线表示上条语句执行结果)

```
In [4]: _.show()
###[ IP  ]###
version= 4
ihl= None
tos= 0x0
len= None
id= 1
flags=
frag= 0
ttl= 64
proto= hopopt
chksum= None
src= 127.0.0.1
dst= 127.0.0.1
\options\

```

长度(len)，校验和(chksum)、协议(proto)等字段Scapy都会自动计算，所以我们只有3个字段需要注意一下，ttl、src、dst


所以这段代码就是设置目标地址:

IP(dst="http://www.baidu.com")

有基础的朋友可能会说：“这明明是域名，不是IP地址!“。对，这确实是域名，但是Scapy功能非常强大，当你把dst赋值为域名时Scapy会自动调用一个名为Net的函数来解析域名。


还可以指定掩码位数:

```
list(Net('http://www.baidu.com/30'))

```


生成一个ICMP报文头:

```
ICMP()

_.show()
###[ ICMP  ]###
    type= echo-request
    code= 0
    chksum= None
    id= 0x0
    seq= 0x0

```

type为8、code为0是ping的请求，type为0、code为0是ping的响应

Scapy会为每个报文设定默认值，调用ICMP函数默认就是构造一个ICMP请求，所以下面两条是等价的:

ICMP()

ICMP(type=8, code=0)

也可以查看对象的type，code属性值

```
ICMP().type
ICMP().code
```



通过ls函数就可以查看默认值

ls(<协议名>)

```
ls(IP)
```

也可以同时查看实际值和默认值

ls(IP(dst="http://www.baidu.com"))

没有括号的是实际值，有括号的是默认值

```
In [14]: ls(IP(dst='www.baidu.com'))
version    : BitField             = 4               (4)
ihl        : BitField             = None            (None)
tos        : XByteField           = 0               (0)
len        : ShortField           = None            (None)
id         : ShortField           = 1               (1)
flags      : FlagsField           = 0               (0)
frag       : BitField             = 0               (0)
ttl        : ByteField            = 64              (64)
proto      : ByteEnumField        = 0               (0)
chksum     : XShortField          = None            (None)
src        : Emph                 = '192.168.200.1' (None)
dst        : Emph                 = Net('www.baidu.com') ('127.0.0.1')
options    : PacketListField      = []              ([])


```


sr1函数发送一个数据包，再接收一个数据包，然后返回响应的数据包



```
In [18]: resultpkt = sr1(ping)
Begin emission:
Finished to send 1 packets.
....*
Received 5 packets, got 1 answers, remaining 0 packets

```

直接在命令行输入变量名就可以输出接收到的包信息了。

```
In [19]: resultpkt
Out[19]: <IP  version=4 ihl=5 tos=0x0 len=28 id=1 flags= frag=0 ttl=47 proto=icmp chksum=0xffec src=220.181.38.148 dst=192.168.200.1 options=[] |<ICMP  type=echo-reply code=0 chksum=0x0 id=0x0 seq=0x0 |<Padding  load='\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' |>>>
```

以 | 分割的元素, 上述包有3个元素


通过下标访问每个报文数据:

```
resultpkt[0]
resultpkt[1]
resultpkt[2]
```

通过属性的形式获取字段

    resultpkt[0].src

可以加下标也可以不加，但是推荐加上。例如我们想访问ICMP的校验和(chksum)，不加标访问的是IP的校验和加下标[1]才可以访问ICMP的校验和



通过fields属性以字典的形式获取报文头

获取IP报文头:

    resultpkt[0].fields



获取Padding数据:

    resultpkt[2].fields


既然是字典就可以通过键获取对应的值。

获取IP报文头的源地址:

    resultpkt[0].fields['src']

还有一种高级的方法，通过协议下标来访问报文头:

```
resultpkt[IP].fields
resultpkt[ICMP].fields
resultpkt[Padding].fields
```



### Scapy数据包发送函数:

sr: 发送数据包并接收相匹配的数据包
srp: 与sr一样但是关注数据链路层(以后讲ARP协议时会用)

sr1: 发送一个数据包并接收一个相匹配的数据包
srp1: 与sr1一样但是关注数据链路层(以后讲ARP协议时会用)

send: 只发送数据包不接收数据包
sendp: 与send一样但是关注数据链路层(以后讲ARP协议时会用)



result = sr(IP(dst='10.0.0.0/23')/ICMP(),timeout = 10)

接输入变量名或用type函数就可以看到返回的数据是个元组

```
In [16]: result
Out[16]:
(<Results: TCP:0 UDP:0 ICMP:386 Other:0>,
 <Unanswered: TCP:0 UDP:0 ICMP:126 Other:0>)

In [17]: type(result)
Out[17]: tuple

```

用len函数获取长度，用display方法来展示数据。

result[0].display()

len(result[0])

result[0]里的每个素都是元组，每个元组都是由发送的包和它相匹配的应答包组成。


```
result[0][0]

<Results: TCP:0 UDP:0 ICMP:435 Other:0>
>>> result[0][0]
(<IP  frag=0 proto=icmp dst=10.0.1.1 |<ICMP  |>>, <IP  version=4 ihl=5 tos=0x0 len=28 id=35015 flags= frag=0 ttl=63 proto=icmp chksum=0x5f6f src=10.0.1.1 dst=192.168.200.1 options=[] |<ICMP  type=echo-reply code=0 chksum=0x0 id=0x0 seq=0x0 |<Padding  load='\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' |>>>)

```
