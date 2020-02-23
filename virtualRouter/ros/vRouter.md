# software Router
一般认为用普通PC安装一套专用的路由器程序组成的系统称为软件路由器，PC电脑+免费的软件=专业的软件路由器

## 品牌
1. routeros(ROS,router operating system)
1. 海蜘蛛
1. openwrt
1. pfsense
1. m0n0wall
1. 爱快
1. LEDE
    Linux嵌入式开发环境项目（Linux Embedded Development Environment，LEDE），是路由器固件项目OpenWRT的一个复刻分支项目，并继承原来OpenWRT的开发目标。


## What’s a Virtual Router (vRouter)?
https://www.sdxcentral.com/networking/nfv/mano-lso/definitions/whats-a-virtual-router-vrouter/

## NFV - Computer Definition
    (Network Functions Virtualization) Virtualizing networking functions in commodity hardware rather than specialized devices. NFV is complementary to software-defined networking, in which fixed-function routing has been placed under software control. NFV deals with the many other devices in a network. For example, with NFV, dedicated hardware boxes such as CDN appliances, access servers, WAN accelerators and monitors become virtual appliances in standard server hardware. See software-defined networking, virtual appliance and virtual router.



## RouterOS
公司名称
    MikroTik(Mikrotiks SIA)
    东欧小国拉脱维亚

官网
    www.mikrotik.com
    www.routeros.com

最初 MikroTik 开发RouterOS 目的是解决无线局域网传输问题（WLAN），后来通过不断扩展功能实现了各种功能的应用

在国内最大的使用人群是网吧和小区宽带、这个和国外的情况有点差别，在国外 RouterOS 不仅用于解决路由管理，大多应用在 WLAN 的覆盖和传输，RouterOS 在基于 802.11abgn 协议上的高带宽传输有自己的明显优势，特别是他独有的 Nstrem 和 Nv2 协议。

从最开始的网吧多线路与流控和小区宽带，后来的 VPN 方案解和企业管理

如对一些功能提供较开放的设置，特别脚本编写，灵活的处理各种功能，让管理员能对路由器进行一些弹性的控制！


MikroTik  发展历程：
    1. 1995 年开始基于 WISP 方案解决；
    1. 1996 年将无线 ISP 计划推向全球；
    1. 1997 年开发 RouterOS 的软件，基于 Intel（PC）解决路由技术问题；
    1. 2002 年拥有 RouterBOARD 的硬件。

授权级别
    level 0 免费24小时
    level 2
    level 3 
    level 4
    level 5
    level 6


x86 硬件支持
    1. AMD、Intel、VIA 和其他 兼容的 x86 平台
    1. SMP – RouterOS 3.0 后兼容的多核心处理器和多处理器（RouterOS v5.x 对多核心处理做更好的优化）
    1. 内存：最小 32MB， 最大：RouterOS v2.9 仅支持 1G 内存，RouterOS v3.0 后支持 2G 内存
    1. 存储：IDE、SATA,、CF 存储卡、USB、DOM 闪存盘和 SCSI（5.x 版本），最小需要 64MB 空间， 建议系统硬盘不大于 80G
    1. Linux v2.6 内核支持的扩展槽 PCI、PCI-e、PCI-X


连接
    1. 如果不想这么麻烦，可以不设置ip，点击winbox的...，会自动看到routeros的mac地址，用这个地址进行连接，当然必须要在同一个网段下才可以。
        https://www.cnblogs.com/EasonJim/p/9548984.html
    1. WinBox
        1. Winbox 是 RouterOS 的一个 Windows 远程图形管理软件，使用 TCP 端口 8291
        1. 在VMware中配置好路由器后，登陆管理地址就可以下载WinBox了
    1. 本地 teminal console - PS/2 或 USB 键盘和 VGA 显示卡进行控制
    1. Serial console – 任何 (默认使用 COM1) RS232 异步串口，串口默认设置为 9600bit/s, 8 data bits, 1 stop bit, no parity, hardware (RTS/CTS) flow control。
    1. Telnet – telnet 服务默认运行在 TCP 端口 23
    1. SSH - SSH (安全 shell) 服务默认运行在 TCP 端口 22
    1. MAC Telnet - MikroTik MAC Telnet 协议被默认启用在所以类以太网卡接口上。

QoS
    简单快速的 QoS 工具(Simple queues)

监控软件
    Dude
        https://www.iiiff.com/article/96890

        6.37以下的版本，winbox会有安装后不显示Dude栏的问题，所以尽量安装更新版本
        dude版本需要跟ROS版本一致

安装
    所有 RouterBOARD 重装都必须通过 Netinstall



## 虚拟机安装教程
注意点
    1. 内核版本
        1. RouterOS 5.21
            LINUX内核版本为2.6.35
        1. RouterOS 6.x
            LINUX内核版本为3.3.5+
    1. 硬盘只能用IDE硬盘

操作
    1. p 上一个
    1. n 下一个
    1. spacebar 确定
    1. a :all
    1. M :minimum
    1. i : to install locally 
    1. q : cancel and reboot

输入a选择全部,i 安装
don't keep old configuration


## 语法

### 4中变量
:global - 定义全局变量, 可以在所有的 脚本 中调用共享 
:local - 定义本地变量，只能在其所要的 脚本 下调用，不能被其它 脚本 共享 
:loop index variables - 定义在for或foreach里的索引号变量 
:monitor variables - 监视变量 

### ROS算术操作 
操作数 和 运算符 原则上要有一个空格(/ 必须有空格)

1. 数学运算
    +
    -
    *
    /
        1. 对于

        1. 对于 有小数点的数字 被认为是ip, 数字默认是时间
            :put (2.1 * 2)
            Script Error: cannot multiply **ip prefix** by **time interval**
            :put (2 * 2.1)
            Script Error: cannot multiply time interval by ip prefix
            
        1. 数字被认为是 time interval, 但是没有时间单位
            put (6 / 4.0)
            Script Error: cannot divide time interval by ip prefix
            put (6.0 / 4)  
            Script Error: cannot divide ip prefix by time interval

1. 位运算
    &   位与
        Time interval 和 ip prefix 均可各自适用
    |   位或
           
    ~   取反(数位取反)
        不能用于时间（即不能用于纯数字）,用于ip地址
        put (~255.255.255.0)    //返回 0.0.0.255

    ^   异或

1. 逻辑运算
    &&
    ||
    !

    **逻辑运算不能用于 time interval，ip prefix**
    
1. 比较运算符
    >
    >=
    <
    <=
    =   等于
    !=

    time interval 和 ip prefix 均可各自应用
    
1. 位运算
    <<
    >>
    
    time interval , ip prefix ； do work in their separate field

    put (255.0 << 1 )       //返回 254.0
    put (255.0 >> 1 )       //返回 127.128.0
    
1. 输出
    put

### 运算 
1. 运算要放到()里

1. 
    put (-3*-2)             //返回6
    put ((-3)*(-2))
    put (4 / 3)             //返回1
    put (1.1.1.2 - 2.0.1)   //返回一个4278255873

1. **一个运算结果为Boolean**
    put (2=2=2) //返回false,2=2结果为true,true!=2
    put (2!=true)   //true

1. 时间运算
    put (1h+2m+3s+4ms)      //返回 01:02:03.004
    put (1h*2)
    put (2h-30s)
    put (60s/2)
    put (10s / 3)           //返回 00:00:03.333333333

    注意
        put (0:0.1 / 3)         //返回 00:00:02, 返回0.1分钟，也就是6秒钟
            put (0:1)           //返回 0小时，1分钟
            

1. ip地址运算
    put (1.1.1.1+2.2.2.2)   //返回3.3.3.3
    **put (1.1.1.1+1)         //返回1.1.1.2**
    put (1.1.1.250+6)       //返回2.2.3.0
    
    注意
        **数字和ip prefix 进行混合运算，会被当成ip**

1. 比较
    put (1.1.1.1 < 1.1.1.2)             //返回 true
    put (2.0.0.0 > 1.255.255.255)       //返回true

    **注意,优先级 "="的优先级高于","**
        put (1d,1h)             //返回 1d00:00:00;01:00:00
        put (1h,1d)             //返回 01:00:00;1d00:00:00

        put (1d,1h,1s = 1h,1d)              //返回 1d00:00:00;01:00:00;false;1d00:00:00
        put (1d,1h = 1h,1d)                 //返回 1d00:00:00;true;1d00:00:00
        put (1d,1h = 1h,1d)                 //返回 1d00:00:00;true;1d00:00:00
 
    **why?**
        put (bridge = routing)      //返回 true


1. 位操作
    put (~1.1.1.1)                    //返回254.254.254.254
    put (10.10.10.10 & 0.0.0.8)       //返回 0.0.0.2
    put (0.0.0.1 | 1.0.0.0)           //返回1.0.0.1

    put (1.0) 返回 1.0.0.0
    put (0.1) 返回 0.0.0.1
    put (1.0.1) 返回 1.0.0.1
    put (0.0.1) 返回 0.0.0.1
    
    put (1.1.0) 返回 1.1.0.0

    why?
        **put (0.1.1) 返回 0.1.0.1**

        **put (1.1)   返回 1.0.0.1**

    先考虑收尾两端的逻辑?

    put (0.1<<7)    //返回 0.0.0.128    看权位是多少，就是
    put (0.15<<1)   //返回 0.0.0.30

1. 连接
    put (1 . 2)        //返回 12  

    注意
        **put (1,2)          //返回 1;2**

    put (1,2.3,4)      //返回 1;2.0.0.3;4

    注意
        put (1 . 3 * 2)     //返回 16 乘法的优先级更高


1. 变量
    声明的同时进行赋值
        :global a "hello world"

    先声明再赋值
        :global a
        set a "it's"
        put ($a . OK)

    综合
        :global a "out";{:local a ”in"; :put $a}; :put ("\n");:put $a;
        :global a "out";{:local a ”in"; :put (":local is : " . $a)}; :put ("\n");:put (":global is " . $a);

    **why?**
        如何在局部引用全局变量


()      expression
[]
{}      substitution


保留字
    beep
    execute
global


保留字
    beep
    execute
    global
    list
    pick
    time
    toip
    typeof
    delay
    find
    if
    local
    put
    toarray
    tonum
    while
    do
    for
    led
    log
    resolve
    tobool
    tostr
    environment
    foreach
    len
    nothing
    set
        ???
        set a "/ip address print"
    toid
    totime

    list
    pick
    time
    toip
    typeof
    delay
    find
    if
    local
    put
    toarray
    tonum
    while
    do
    for
    led
    log
    resolve
    tobool
    tostr
    environment
    foreach
    len
    nothing
    set
    toid
    totime

## 音频
beep lenght 2s frequency 1000   //产生2s 1000Hz的音频

/h 换行

list interface ???


如果不是在根目录执行 put, 则要加上":" -> :put (1 . 2 * 3)


### pick 取字符串或数组的某一段，零开始
put [pick "i love you" 2 6]     //返回 love [)   前闭后开区间

### :time 执行命令所需要的时间
:put [:time [:resole www.z.cn]]


### delay 延迟默认为1s
:delay 3; :put ("hi")


### find 查找字符串或数组中第一个出现查找内容的位置
:put [:find abcdcba b]     //返回1
udo apt install sendanywhere
3hin1
exit


### if
:if (1<2) do={:put true}    //:if后面必须有空格

:if (1<2) do={:put ("1<2")} else={:put ("1>2")}
:if (1<2) do {:put ("1<2")} else {:put ("1>2")}


:local 定义本地变量

:while

:for
    :for i from=1 to=100 step=30 do={:put $i}
    :for i from 1 to 100 step 30 do {:put $i}

:foreach
    :foreach i in=[/interface find type=ether] do={:put [/interface get $i name]}   ???

:log 日志
    写文本到日志
    类型在/system logging 里可以找到

:resolve    解析域名的IP地址
    :put [:resolve www.sina.com]

:environment print      //显示所有变量及其值

:len    //字符串或数组的长度
    :put [:len ("hello")]   //这样的话必须加上双引号
    :put [:len hello]       
    :put [:len "1,2,3,4,5"] //返回9

:nothing    null








## 实际操作

1. interface   ,     print          查看网卡信息
1. /    返回根目录
1. ..   返回上级目录
1. ip   ,   address     进入ip地址配置目录
    1. add address 192.168.1.1/24 interface 网卡名


### 开启ftp服务
IP>services>ftp>available from
    192.168.1.0/24

还需要有相关的人员可以对其进行操作
system>users>group>
    新增一个 ftp group
然后在ftp group 中添加一个用户
    设置密码
    allowed address 默认0.0.0.0即可

### 增加Users
system>Users


### 备份
1. 网页端
    files > backup
        文件名
        可以选一个密码用于恢复时
        可以选择是否加密(Encrypt)

1. telnet下载备份
    telnet 10.0.1.11
    用户名，密码
    system backup save name=文件名
    file print
    上下键

    恢复备份文件
        system backup load name=文件名

1. ftp下载备份文件
    1. cmd方式
        cmd
        ftp
        o 10.0.1.11
        用户名,密码
        ls (我用的ftpuser1，提示没有权限;用admin登陆 ls 没反应-> cannot build data connection)
        get 文件名
        put 文件名  （上传文件）

    1. 浏览器可以，没有问题

### wan口
address :   ip address add address 192.168.2.1/30 interface wan
gateway :   ip route ,add gateway 192.168.2.2
    A:active
    C:connected
    D:dynamic
    S:static
dns     :   ip dns, set server 8.8.8.8,8.8.4.4,223.5.5.5,223.6.6.6
ping测试:   tool ping,???  //命令行里边的ping不好用啊



## 重启
/system reboot
