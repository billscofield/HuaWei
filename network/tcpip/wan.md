

https://www.bilibili.com/video/BV1i7411Z7LW?p=7

## 


modem: 调制解调器


线缆: PSTN(公共电话网), 点到点专线(SDH, MSTP), 无线 GSM, 卫星

IP数据

数据链路层
    1. PPP
        速度比较快
        配置比较简单
        带宽比较灵活
    1. HDLC
    1. FR(帧中继)
    1. X.25
    1. ATM
    1. ADSL
        速度慢
        价格昂贵
        配置比较复杂
        带宽不够灵活, 固定的
    1. PPPOE


物理层: 线缆问题，信号问题


## 物理层

### CSU/DSU

成对儿出现的

CSU: Channel Service Unit 信道服务单元
    用来做数据传输

DSU: Data Service Unit    数据服务单元
    用来做帧的转换, 帧的转码, 将一种编码转为另一种编码


### DCE/DTE

DCE: Data Communication Equipment 数据通信设备
    提供时钟服务, 集成 CSU/DSU
    类似console线

DTE: Data Terminal Equipment 数据终端设备


## 数据链路层

### HDLC : High-Level Data Link Control 

Cisco 点对点默认封装就是 HDLC, 各个厂家单独实现, 所以有了 PPP
WIC-2T 模块

show interfaces serial 0/3/0
输出
    ...
    Encapsulation HDLC
    ...

更改封装方式, 不同品牌设备需要
```
int s0/3/0          //进入这个接口后
encapsulation ppp   //更改封装方式
```

### PPP  : Point-to-Point Protocol

工作分为两个过程 Subprotocol

LCP: Link Control Protocol 链路控制协议，协商一些链路控制信息，认证

NCP: Network Control Protocol 网络控制协议，协商数据报封装的类型和格式



PPP认证

有两种认证方式

1. PAP认证(Password Authentication Protocol)

    可以是单向认证，是明文认证


    ```我需要你输入账号认证, 单向认证，LCP 阶段

    
    int s0/3/0
    ppp authentication ?
    ppp authentication pap

    username 账号 password 密码         //本地数据库



    请求连接的一方

    int s0/3/0
    ppp pap sent-username 账号 password 密码

    ```

1. CHAP认证(Challenge Handshake Authentication Protocol)

    MD5密文认证，必须是双向认证

    三次握手


    ```
    int s0/3/0
    encapsulation ppp
    ppp authentication chap
    exit
    username 对端设备的主机名hostname password 密码

    int s0/3/0
    ppp authentication chap
    exit
    username 对端设备的主机名hostname password 密码

    这两个密码是一样的
    ```

### PPP扩展功能, MLPPP(Multilink PPP)

多条 PPP 聚合

```
int s1/0
encapsulation ppp
interface multilink 12
ppp multilink 12
exit


ppp multilink group 12
end
show ip int bri

```

## PPP 的应用应用场景

ADSL 是一种连接方式, 电话线根据频率一分为三，一电话，一上传，一下载

1.高速下行信道：位於50kHz到1MHz频段
2.中速上行信道：位於4kHz到50Hz频段
3.普通的雙向電話信道：位於0到4kHz频段

因为有人耳能听到的频率，所以会发出“猫”叫声

PPPoE 




