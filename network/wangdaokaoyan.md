计算机网络是互联的、自治的计算机集合

自治-无主从关系



## 计算机网络的功能

1. 数据通信

1. 资源共享
    1. 硬件资源如打印机
    1. 软件资源：直接在远程主机上运行
    1. 数据

1. 分布式处理
    如Hadoop

1. 提高可靠性/冗余

1. 负载均衡
....

## 计算机网络的组成

1. 计算机网络组成
    硬件
    软件
    协议

1. 工作方式
    1. 边缘部分,端系统
    1. 核心部分
        为边缘设备提供服务，如交换机，路由器

1. 功能
    通信子网(OSI上三层)
    资源子网(OSI下三层)

## 网络分类

1. 分布范围
    广域网: 使用的是交换技术
        带宽不一定
    城域网
    局域网: 使用的是广播技术
        10Mb,100Mb,100Mb
    个人区域网PAN

1. 使用者
    公用网: 中国电信
    专用网: 军队，政府

1. 交换技术
    电路交换
        最早的电话
    报文交换
        源应用发送的信息整体
        存储转发
    分组交换
        分组交换会比报文交换产生更小的时延,发送时延相同，传输时延和发送时延会有重叠，类似并行效果
        存储转发

    应用层：    报文
    传输层：    报文段(对大的报文分段)
    网络层:     IP数据报，分组(如果报文段还是比较大)
    数据链路层: 帧
    物理层：    比特流

    [数据报方式]为网络层提供[无连接服务]
    [虚电路方式]为网络层提供[连接服务]

    无连接服务：不事先为分组的传输确定传输路径，每个分组独立确定传输路径，不同分组传输路径可能不同。
    连接服务：首先为分组的传输确定传输路径（建立连接），然后沿该路径（连接）传输系列分组，系列分组传输路径相同，传输结束后拆除连接。

1. 拓扑结构
    1. 总线型
        两端要加电阻，吸收信号, 防止信号反弹
    1. 环形
    1. 星型, 局域网
    1. 树型
    1. 网状, 广域网
    
1. 传输技术
    1. 广播式
    1. 点对点式
        存储转发，路由选择

## 标准化工作

1. 法定标准 OSI
1. 事实上的标准 TCP/IP, 
    标准SIM卡
    Micro SIM
    就像苹果的 Nano SIM 卡

RFC(Request For Comments)
    1. 因特网草案(Internet Draft)
    1. 成为建议的标准(Proposed Standard), 开始成为RFC文档, 让大家评论
    1. 因特网法案标准


### 相关组织

1. ISO: OSI, HDLC协议
1. 国际电信联盟 ITU:制定通信规则
1. IEEE:学术机构
1. IETF:负责因特网相关标准的制定 RFC

## 性能指标

1. 速率:在数字信道上传输数据**位数的速率**
    数据传输率或比特率
    1000为换算率, 存储是2进制

    接收速率 主要看缓存


    电信号比光信号的速度还要快一些, 但是光信号支持更高的频率范围, 发送端可以发送高频信号，发送速度更快

1. 带宽
    原本指某个信号具有的**频带宽度，最高频率和最低频率之差**，单位是赫兹(Hz)
    表示网络的通信线路**传输数据的能力**
    单位时间从一点到另一点所能通过的**最高数据率,最高速率**
    链路带宽:协议上的，<= 物理上的极限
    
    发送端的**最大发送速率**

    2Mb/s  1微秒  可向链路发送2bit数据

1. 吞吐量
    单位时间内通过某个网络（或信道，接口）的数据量。单位 b/s kb/s Mb/s

1. 时延：从一端到另一端所需的时间，也叫延迟，单位是秒
    1. 发送时延: 从第一个bit发出到最后一个bit发出,     = 数据长度/信道带宽(发送速率)
        高速链路指的是提高发送速率,电磁波速率一般不变
    1. 传播时延: 取决于电磁波速度和链路长度，2x10^8    =信道长度/电磁波在信道上的传播速率
    1. 排队时延: 路由器缓存中等待时间, x2,输入和输出
    1. 处理时延: 检错+找路由时间

1. 时延带宽积：传播时延x带宽
    b           s       b/s
    描述的信息量

    又称为 **以比特为单位的链路长度**, 即 “某段链路现在有多少比特”

1. 往返时延RTT(Round-Trip Time): 从发送第一个比特开始到接收到接收方的确认
    2倍传播时延

1. 利用率
    信道利用率=有数据通过时间/(有+无)数据通过时间

    时延 和 信道利用率 成 开口向上的抛物线 正比关系

    当前时延 = 空闲时的时延/(1 - 信道利用率) 大概是这个关系
    


## 分层
实体
    对等实体    协议:为对等实体数据交换而建立的规则、标准或约定

接口(SAP服务访问点)

服务


协议
    001001010101001

    语法:规定传输数据的格式
        从哪里开始，从哪里分割，从哪里结束

    语义:要完成的功能
        每一个分段的功能,是什么意思

    同步:各种操作的顺序
        哪个数据先发，哪个后发


SDU服务数据单元:具体的功能代码, 相当于数据部分
PCI协议控制信息:相当于协议头
PDU:协议数据单元，对等层之间传送的数据单位
PDU = PCI + SDU


上4层可以看做计算机到计算机的直连， 因为中间系统（路由器，交换机）只用到低3层, 所以上4层是端到端
而下3层是点到点


1. 应用层:所有能和用户交互**产生网络流量的程序**
    FTP\SMTP\HTTP

1. 表示层:交换信息的表示方式(语法和语义)
    1. 格式转换 
    1. 数据加密解密
    1. 数据压缩和恢复    

    jpeg, rar

1. 会话层:向**表示层实体/用户进程** 提供"建立连接" 并在连接上"有序的传输" 数据, 这是会话，也是“建立同步(SYN)"
    1. 建立、管理、终止会话
    1. 校验点，可使会话在通信失效时 从 **校验点/同步点** 继续回复通信，实现数据同步

    主要协议：ADSP、ASP

1. 传输层
    负责端到端的通信

    "可"靠传输、不可靠传输
    "差"错控制
    "流"量控制
    "复"用分用


    可靠传输：发送一个，确认，然后再发送
    
    差错控制：比如丢失了一些数据，    

    流量控制：发送端速度的控制

    复用:多个应用层进程 可 同时使用下面运输层的服务, "按照应用分配端口号"
    分用:运输层吧收到的信息分别交付给上面应用层中相应的进程

1. 网络层:把"分组"从源端传到目的端，为分组交换网上的不同主机提供通信服务。单位是数据报
    数据报 过长 则 切割成 更小的 分组    

    1. 路由选择
    1. 流量控制
        发送端的速度问题
    1. 差错控制
        
    1. 拥塞控制
        宏观的，若所有节点都来不及接受分组，而要丢弃大量分组的话，网络就处于“拥塞”状态。因此要采取一定措施，缓解这种拥塞。

    主要协议: IP, IPX, ICMP, IGMP, ARP, RARP, OSPF

1.  数据链路层：数据报组装成帧
    1. 成帧（定义帧的开始和结束)    ...1001100111000...
    1. 差错控制 (帧错+位错)         检错而不纠错
    1. 流量控制???
    1. 访问控制(对信道的访问,信道复用)
        对于共享式，谁有权限使用信道

    协议：Ethernet, SDLC, HDLC, PPP, STP


1. 物理层
    将比特流转为物理信号 进行透明传输

    透明传输：不管比特流是什么样的，都应当能够在链路上传送

    1. 定义接口特性, 多少引脚啊等等
    1. 定义传输模式：单工、半双工、双工(通信方式)
    1. 定义传输速率，10Mbps
    1. 比特同步, 这边发送一个bit, 接收端就收到一个bit
    1. 比特编码, 如差分曼彻斯顿编码

    协议:RJ45 、 802.3

    不是指具体的传输媒体



网络接口层: Ethernet 、ATM、Frame Relay


TCP/IP设计之初就考虑到异构网互联问题，将IP作为重要层次

综合 OSI 和 TCP/IP 的5层模型, 用于考试用


### 物理层基本概念

    1. 机械特性
    1. 电气特性
        电压，距离，速率
    1. 功能特性
        高低电平所代表的的意义
        各信号线的用途
    1. 规程特性
        过程特性，定义各条物理线路的工作规程和时序关系




### 数据通信基础知识

数据：传送信息的实体，有意义的符号序列
信号：数据的电磁、电气的表现，是数据在传输过程中的存在形式
    数字信号
    模拟信号

信源：产生和发送数据的源头
信道：信号的传输媒介。一般用来表示向某一个方向传送信息的介质，因此一条通信线路往往包含一条发送信道和一条接收信道
    有方向, 矢量

    单工通信: 只有一个方向的通信而没有反向的交互，仅需要一条信道
    半双工通信: 需要两条信道
    全双工通信: 需要两条信道
信宿：
信噪：



基带信号(基本频带信号):来自信源的信号

频带信号(即是带通信号)：在通信中，由于基带信号具有频率很低的频谱分量,出于抗干扰和提高传输率考虑一般不宜直接传输,需要把基带信号变换成其频带适合在信道中传输的信号，变换后的信号就是频带信号
    调幅(AM)
    调频(FM)
    调相(PM)


#### 两种数据传输方式

串行传输
    1. 总的速度慢
    1. 费用低(**只需要一个信道**)
    1. 适合远距离

并行传输
    1. 速度快
    1. 费用高(需要更多的信道)
    1. 适合近距离
    例如 vga, hdmi, PS/2


脉冲
    通常是指电子技术中经常运用的一种像脉搏似的短暂起伏的电冲击(电压或电流)。 
    主要特性有波形、幅度、宽度和重复频率。 脉冲是相对于连续信号在整个信号周期内短时间发生的信号，
    大部分信号周期内没有信号。 就像人的脉搏一样。

    脉冲信号是一种离散信号，形状多种多样，与普通模拟信号（如正弦波）相比，波形之间在Y轴不连续（波形与波形之间有明显的间隔）但具有一定的周期性是它的特点。最常见的脉冲波是矩形波（也就是方波）。



码元:固定时长的信号波形, 代表**不同离散值**，当码元的离散状态有M个时，此时码元为M进制码元。
    这个固定时长称为 **码元宽度**
    二进制码元

    1码元可以携带多个比特的信息量
    比如二进制码元，一个码元有两种状态



    

速率:传输速率(主机发送); 而传播速率是电磁特性

[码元传输速率]: 单位是 波特(Baud)
    调制速率，波形速率, 符号速率

    1Baud = 1码元/秒, 每秒**变化次数**

    码元速率与进制数无关
    二进制码元，一个码元是1bit
    四进制码元，一个码元是2bit(00,01,10,11)

[信息传输速率]: 单位时间内 传输的 二进制码元个数, 单位是 比特/秒

若一个码元携带 n bit 的信息量，则 M Baud 的码元传输速率 所对应的的信息传输速率为 n x M bit/s
    同样是 1 Baud, 
    二进制码元的信息传输速率是2，传递了2个信息中的一个, 1个比特就是一个码元
    四进制码元的信息传输速率是4，传递了4个信息中的一个, 2个比特才是一个码元
    16进制码元的信息传输速率是16，传递了16个信息中的一个, 4个比特才是一个码元

    16进制码元，6s传输了7200个码元，求码元速率和信息速率
        码元速率:7200/6=1200Baud
        信息速率:1200*4=4800bit
   
    系统传输的是比特流，通常比较的是传输速率

    

带宽：单位时间从网络中的某一点到另一点所能通过的“最高数据率”


一个16进制码元的比特数:log2(16) = 4



失真:接收端波形，
    有失真还可以识别
    有失真不可以识别

影响失真程度的因素:
    码元传输速率, 越快越验证
    信号传输距离
    噪声干扰
    传输媒质量


信道带宽:Hz
    频率低，
    频率高


失真的一种现象-**码间串扰**
    码间串扰:频率高,码元传输速度太快，接收端失去了 **码元之间清晰界限** 的现象
    码元和信号是一一对应的

    例如很多人从你眼前慢速和快速通过
    


奈氏准则 和 香农定理 中带宽的单位是 Hz


奈氏准则("Nice"哈哈) 奈奎斯特定理:限制码元速率
    在理想低通（无噪声，带宽受限）条件下，为了避免 码间串扰，[**极限码元传输速率**]为 2W Baud, W 是信道带宽，单位是 Hz
    低通：低于最高频率的可以通过

    理想低通信道下的极限数据传输率 = 2Wlog2(V)  bit/s
        V：码元的离散值个数
        W：带宽，Hz

    结论：
        1. 任何信道中，码元传输的速率是有上限的。若传输速率超过此上限，就会出现严重的码间串扰问题
        1. 信道的 频带越宽，就可以用更高的速率进行码元的有效传输
        1. 奈氏准则 给出了[码元传输速率]的限制，但并没有对[信息传输速率]给出限制
        1. 由于奈氏准则的制约, 要提高数据的传输速率，就必须设法使每个码元能携带更多个比特的信息量，这就需要采用[多元制的调制方法]
        
        光纤 比 电信号快的原因





香农定理: 限制信息速率即比特率
    噪声会使接收端对码元的判断产生错误，
    但是噪声的影响是相对的，若信号较强，那么噪声影响相对较小。因此，[信噪比]就很重要

    信噪比=信号的平均功率/噪声的平均功率，记做 S/N, 并用分贝（dB）作为度量单位
        分贝(dB)= 10log10(S/N)

    香浓定理：**在带宽受限且[有噪声]**的信道中，为了不产生误差，信息的数据传输速录有上限值

        信道的极限数据传输速率 = Wlog2(1+S/N)   bit/s
            


    结论：
        **只要信息的传输速率低于信道的极限传输速率，就一定能找到某种方法来实现[无差错的传输]**   无限提高信噪比?
        得出的是[极限信息传输速率],实际信道能达到的传输速率要低很多
    
        例题:电话线信道带宽为3000Hz， 噪声为30dB，则最大数据传输速率是多少?
            30=10log10(S/N)
            S/N=1000

            3000*log2(1+1000) = 30Kb/s

奈氏准则（内忧）
    带宽受限，无噪声的情况下，为了避免码间串扰
香农定理（外患）
    带宽受限，有噪声的条件下


2Wlog2(V)   和  Wlog2(1+S/N)  取最小


    例题: 二进制信号在信噪比为127:1的4KHz信道上传输，最大的数据速率可达到多少?
        NICE准则： 2*4K*log2(2) = 8k b/s
        香浓: 4k * log2(1+127)=28k b/s
        所以是 8k b/s

## 编码 & 调制

信道上传送的信号
    1. 基带信号:将数字信号1和0直接用两种不同的电压表示，在送到**[数字信道]**上去传输(基带传输).

        **[来自信源]的信号，像计算机输出的代表各种文字或图像文件的数据信号 都属于基带信号。**

        基带信号就是发出的[直接代表了要传输的信息的信号],比如我们说话的声波就是基带信号.

        基带信号可以是数字信号，也可以是模拟信号

    1. 宽带信号:将基带信号进行调制后形成的频分复用模拟信号，在传送到**[模拟信道]**上去传输(宽带传输).
        把基带信号经过[载波调制]后，把信号的频率范围搬移到较高的频段，一遍在信道中传输
        例如人的声音发送到音频广播中, 人的声音是基带信号，载波形成频带信号


    在近距离传输时，计算机采用基带传输的方式（近距离衰减小，信号内容不易发生变化）,比如 HDMI，VGA
    在远距离传输时，计算机采用宽带传输的方式（远距离衰减大，即使信号变化大，也能最后过滤出来基带信号)
    


编码 与 调制

把数据 转成 信号

数字数据 转成 数字信号 叫 编码(通过数字发送器)
数字数据 转成 模拟信号 叫 调制(通过调制器)


模拟数据 转成 数字信号 叫 编码(通过PCM编码器)
模拟数据 转成 模拟信号 叫 调制(放大器调制器)



非归零编码：需要一种同步机制，多长时间一个码元, 需要一个信道来进行同步机制, 始终周期

曼彻斯特编码: **每一次跳变都是一次同步**，每一个码元都被调成两个电平，所以数据传输速率只有调制速率的1/2

    一个始终周期内两个码元，但一个bit

    由低变高是0，由高变低是1，没有变化是没有数据

    可以表示没有数据



字节序
    小端法：高村高，低存低
        计算机
        0x12345678 4字节
        ----------
        |   12   | 高位
        ----------
        |   34   |
        ----------
        |   56   |
        ----------
        |   78   | 低位
        ----------

        htonl(host to net long) 4字节  对ip
        htons(host to net short)2字节  对端口

        ntohl(network to host long)
        ntohs(network to host short)

    大端法：高村低，低存高
        网络
        ----------
        |   78   | 高位
        ----------
        |   56   |
        ----------
        |   34   |
        ----------
        |   12   | 低位
        ----------

    

调制
    调幅
    调频
    调向
    正交调幅调制：调幅调向



传输媒体:不是物理层，相当于第零层
    导向型传输介质
        双绞线
            数字信号
            模拟信号
        同轴电缆
            基带同轴电缆
            宽带同轴电缆, 如电视
        光纤
            可见光的频率10的8次方，带宽很大
            
            单模
                发送发射入单条光线
                横向模式，将光纤细到传输单个光
            多模
                发送发根据入射角射入多条光纤
            特点:
                1. 传输损耗小
                1. 抗雷电和电磁干扰
    非导向型传输介质
        无线电波
            万向
            穿透能力强
        微波
            固定方向
            频率高，带宽高


            地面微博接力通信
            卫星通信
                时延长
                受气候影响大
                误码率高
                成本高
        红外线、激光
            固定方向


单模光纤 宽带可达10GHz
    wlog2(1+S/N)  S/n 取1k
    10G x 10 = 100Gb/s = 12.5GB/s




## 物理层设备
1. 中继器
    对信号进行再生和还原，对衰减的信号进行放大, 保持与元数据相同，以增加信号传输的距离，延长网络的长度
    **[再生]数字信号**

    模拟信号的设备: 放大器

    中继器的两端：两端的网络部分是**网段，而不是子网，适用于完全相同的[两类]网络的互联，且两个网段速率要相同。**
        网段
        子网

    两端可连相同媒体，也可连不通媒体

    两端的网段一定要是同一个协议。（中继器不会存储转发）

    5-4-3规则：再生数字信号是需要时间的，
        5: 最多不超过5个网段
        4: 4个设备
        3: 只有3个段可以连接计算机

          1       2       3       4        5
        -----   -----   -----   -----   -------
            |   |   |   |   |   |   |   |
            -----   -----   -----   -----
            | R1|   | R2|   | R3|   | R4|
            -----   -----   -----   -----

1. 集线器（多端口中继器）
    不具备信号的定向传送能力，是一个共享式设备, 即广播
    不能分割冲突域
    平分带宽
    



## 数据链路层

节点:主机和路由器

链路:两个节点之间的**物理通道**

数据链路:网络中两个节点之间的**逻辑通道**

1. 为网络层提供服务

    无确认无连接服务

    有确认无连接服务
        目的主机必须确认收到
        误码率较高的，比如无线

    有确认面向连接服务
        最可靠的

1. 链路管理，即连接的建立、维持、释放

1. 封装成帧

    首部和尾部包含许多的控制信息，他们的一个重要作用：帧定界（确定帧的界限）

    帧同步：**接收方]应当能从接收到的二进制比特流中区分出帧的起始和终止**

    帧最大长度(MTU)

    透明传输：你看不到，但确实存在

    组帧的4中方法
        1. 字符计数法
            帧首部使用一个计数字段（第一个字节，8bit）来标明帧内字符数

        1. 字符填充法
            SOH(start of header) 1个字节
            EOT(End of transmission) 1个字节

            在数据EOT前面加上ESC 进行转义
            ESC SOH
            ESC EOT
            ESC ESC

        1. 零比特填充法
            和字符填充法不同的是：SOH 和 EOT 是一样的 0111 1110
            5 1 1 0
            发送端：遇到5个1，就添加0
            接收端，遇到5个1，删除一个0

        1. 违规编码法
            编码中不会用到电平组合表示 定界帧的起始和终止


        常用的是比特填充法和违规编码法


流量控制 与 可靠传输机制
    较高的发送速度和较低的接收能力的不匹配，会造成传输出错，超出接收方的缓存空间，造成数据丢弃

    [链路层的流量控制]是点到点，[传输层的流量控制]是端到端

    链路层的流量控制手段：[接收方收不下就不回复确认]
    传输层流量控制手段：接收端给发送端一个窗口公告


    停止-等待协议
        没发送完一个帧就停止发送，等待对方的确认，在收到确认后再发送下一个帧
        如果没有收到，[超时计时器]到期，发送方再发一帧

        RTT:往返时延

        通信质量越来越好后，可靠传输的功能逐渐过渡到传输层


        信道利用率:发送发在一个发送周期内，有效地发送数据所需要的时间占整个发送周期的比率
        信道利用率=(L/C)/T
            L:T内发送L比特数据
            C:发送方数据传输率
            T:从开始发送数据，到收到第一个确认帧为止
        信道吞吐率=信道利用率*发送发的发送速率
            

    滑动窗口协议
        发送一个窗口，收到确认帧后，移动窗口，发送窗口，循环
        可靠传输（发送方自动重传）:一定时间后没有收到确认帧，则重新发送这个窗口

        GBN协议
        SR协议

差错控制
    全局性:大多由噪声引起,线路本身电器特性所产生的[随机噪声]
        解决办法:提高信噪比

    局部性：外界特定的短暂原因所造成的[冲击噪声]
        解决办法:编码技术


    差错
        位错(bit位错)
            检错编码
                奇偶校验码
                    n-1位信息员
                    1位校验元
                    
                    奇校验码:1的个数位奇数
                        只能检查出**奇数个比特错误**,检错能力为50%
                        1000 0001:错一个bit,可以检测出来，但错偶数个就检查不出来了
                        检错能力50%
                    偶校验码:1的个数位偶数
                    
                    例题:如果一个字符S的ASCII编码从低到高依次是 1100 101,采用奇校验，在下列收到的传输后字符中，哪个错误不能检测？(加一个1 是奇校验 1 1100 101)
                        A:11000011  B:11001010  C:11001100  D:11010011
                        偶校验         偶校验       偶校验      奇校验 
                        所以偶数个1肯定错误，直接排除; 选项D 无法判断
                    
                    
                循环冗余码CRC
                    CRC校验中有两个关键点，
                        一是预先确定一个发送送端和接收端都用来作为除数的二进制比特串（或多项式），可以随机选择，也可以使用国际标准，但是**最高位和最低位必须为1**
                        二是把原始帧与上面计算出的除数进行[模2除法]运算，计算出CRC码。

                        不进位的加法
                        
                        最终发送的数据：要发送的数据+帧检验序列FCS




            纠错编码
                海明码(还能知道哪里出错了)
         
            链路层的编码是针对一组bit
            冗余码
                异或
               
        帧错
            帧丢失
            帧重复
            帧失序




信道
点对点链路
    PPP协议，常用语广域网

广播式链路
    所有主机共享通信介质
    早期的总线以太网、无线局域网，常用于局域网

    星型（逻辑总线型）


    介质访问控制
        静态划分信道
            频分多路复用 FDM    (Division Multiple)
                类似 "并行"
                用户分到一定的频带后，在通信过程中自始至终都占用这个频带

            时分多路复用 TDM
                类似 "并发"

            波分多路复用 WDM(wave)
                [光的频分多路复用]
                合波器/分波器

            码分多路复用 CDM
                码分多址(CDMA)

        动态划分信道(多点接入)
            轮询访问介质访问控制
                令牌传递协议

            随机访问介质访问控制
                ALOHA协议       不听就说
                CSMA协议        先听再说
                CSMA/CD协议     
                CSMA/CA协议
            
            
        复用器/分用器



CSMA/CD
    先听再发
    边听边发

    CD:半双工网络



## 局域网

局域网介质访问控制方法
    1. CSMA/CD(总线型网络)
        常用于总线型网络，也用于树形网络
        争用期
        在局域网的分析中，常把总线上的单程端到端传播时延记为τ。通常取51.2微秒为争用期时间，对于10Mb/s以太网，期间可以发送512bit数据，即64字节。
        二进制指数类型 退避算法

    1. 令牌总线
        常用于总线型网络，也用于树形网络

    1. 令牌环


局域网的分类(介质访问控制的方法)
    1. 以太网
        以太网提供不可靠的交付
        10Base-T: 10Mbps 
        Base:基带信号 
        T:双绞线
        
    1. 令牌环网
        逻辑上是环形拓扑结构

    1. FDDI网(Fiber Distributed Data Interface) 光纤分布式数据接口
        逻辑上是环形拓扑结构

    1. ATM网(Asynchronous Transfer Mode)

    1. 无线局域网 IEEE 802.11标准

IEEE802标准
    IEEE802系列标准 是局域网
    802.3:以太网
    802.5:令牌环网
    802.8:FDDI
    802.11:无线局域网

IEEE 802标准所描述的局域网参考模型只对应OSI参考模型的数据链路层与物理层,它将数据链路层划分为 LLC 和 MAC









## 以太网（Ethernet）

联合开发的基带总线局域网规范, 采用 CSMA/CD 技术

以太网只实现无差错接收，不实现可靠传输


CSMA/CD 要求最少64Byte 对应MAC帧 46Byte
    单工才使用CSMA/CD

Preamble    Start of frame delimiter    帧          Interpacket gap
7Byte        1Byte                        [64,1518]   12Byte


帧最小间隔: 9.6微秒, 即96bit
    为了接收缓存处理等



## 广域网

主要使用[分组交换]技术



### PPP
只支持全双工

支持认证计费等


### HDLC



网段:一般指一个计算机网络中使用同一物理层设备（传输介质，中继器，集线器等）能够直接通讯的那一部分.


网桥
    透明网桥
    源路由网桥

交换机
    直通式交换机
        延迟小
        无法支持具有不同速率的端口的交换
    存储转发式交换机
        支持具有不同速率的端口的交换




## 网络层

路径是双向的

arp 广播中的 destination mac address 是全F, 因为交换机只能识别数据链路层


RIP
OSPF
ICMP
IGMP
RIP


ttl 减 1得零，路由器返回不可达信息




## 传输层

netstat -tlnpu

tcp6
udp6
    simply means TCP/UDP protocol over IP v6

windows类似grep的命令findstr

### 常用端口号

RDP     TCP 3389
POP3    TCP 110
SMTP    TCP 25
FTP     TCP 21


### TCP

面向字节流

自动重传请求ARQ(automatic Repeat Request)


三次握手中的停止等待协议
累计确认机制


选项字段
    MSS:Maximum Segment Size，最大报文长度
    NOP
    SACK permitted 选择性确认
        用于和累计确认配合

拥塞控制：是一个全局性的过程，涉及到

### UDP




