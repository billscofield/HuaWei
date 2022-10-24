# mt5

ctrl m  市场报价
ctrl u  show symbols list 显示所有品种
    major   直盘
    crosses 交叉盘
    
ctrl d  数据窗口，就是当前品种的高开低收等价格信息
ctrl n  导航
ctrl t  工具箱，仓位信息，交易量，新闻等
ctrl r  策略测试

alt m   聊天    command m



柱形图  alt 1       command 1
蜡烛图  alt 2       command 2
线形图  alt 3       command 3

网格    ctrl g

F8      产品属性
    默认我们的卖价线是灰色的, 我们的买价线是红色的
    show
        show period separator   时间分割线


OHLC    开高低收


F1  帮助文档
F4  MetaEditor  代码编辑器
F9  新订单
F2  任务管理器
F3  全局变量

ctrl o      选项
    server  变更密码

可以锁仓(hedge), mt4 不支持

支持了期权，股票，债券等

支持 ECN 模式

EA 回测历史数据
    可以达到 ticket 精度

支持多货币对回测

EA回测支持分布式
    支持在回测的过程中调试代码

支持脚本代码格式化
    工具 / 风格
    ctrl ,

支持市场深度(国内的股票叫做盘口数据)

继承财经日历，可以编程获取相关信息, 并可以在图表上显示

代码可以备份到云端(激活MQL5存储)

项目(project) 协同开发


下单方式
检索订单方式
订单历史数据架构
    同一个单子分成好几个了


脚本
EA
指标


ask是“要”的意思，就卖家喊出来的价
bid是“投标”的意思，是买家愿意出的最高价。
    ask 是卖家的卖价
    bid 投标，是买家的买价
    ask > bid

    现价买进时，需要在最低的ask报价之上（含最低）下单，才能现价立即成交
    现价卖出时，需要在最高的bid报价之下（含最高）下单，才能现价立即成交

Manage profiles 图表模板



Algo Trading 必须激活才可以自动交易



## order

instant execution   市价单

pending order   挂单

    buy limit
    sell limit
        为获得更好的进场点位的价格
        v字形

    buy stop
    sell stop
        想要快速成交
        直线型

    buy stop limit
        先突破过stop，然后回调到limit 然后开buy单
    sell stop limit

stoploss 止损
takeprofit  止盈

spread 点差

slip point 滑点

commission 佣金

swap 隔夜利息

固定点差模式 (Fixed spread)

手续费模式(ECN)
    没有固定点差




alt b
    市场深度 depth of market




trailing 移动止盈止损

mql5 有中文帮助

编译后的格式: 


## 

### 数据类型

int
double
string
    双引号
color
    clrRed
datetime
    datetime 鼠标放在datetime 关键字上按F1, 查看示例，帮助文档
    D'2020.01.01 12:00'


Alert() 函数，打印到 experts 栏


### 类型转换 MQL5 Reference - Conversion Functions

IntegerToString(xxx)


## EA

OnInit()
OnDeinit(const int reason)
OnTicket(){
    double open = 
}



## script

OnStart()
