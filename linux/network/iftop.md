
## iftop

```
|195Kb                  391Kb                  586Kb                  781Kb              977Kb                           // 这个是刻度尺，在有流量的时候，下边每一行都会反显，表示进度
|mqqqqqqqqqqqqqqqqqqqqqqvqqqqqqqqqqqqqqqqqqqqqqvqqqqqqqqqqqqqqqqqqqqqqvqqqqqqqqqqqqqqqqqqqqqqvqqqqqqqqqqqqqqqqqqqqqqq
|10.0.2.15                                    => 10.0.6.180                                   1.09Kb  1.00Kb  0.98Kb     // 有流量时，这里会反显
|<=                                              5.55Kb  5.02Kb  4.91Kb
|10.0.2.15                                    => 10.0.2.2                                     3.84Kb  4.09Kb  6.80Kb
|<=                                              1.59Kb  1.50Kb  3.53Kb
|
|                                                                                           //2秒     10秒    40秒   平均流量
|
|qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
|TX:             cum:   1.10MB   peak:   17.2Kb                                      rates:   4.94Kb  5.09Kb  7.79Kb
|RX:                    1.50MB           14.3Kb                                               7.14Kb  6.52Kb  8.44Kb
|TOTAL:                 2.61MB           30.8Kb                                               12.1Kb  11.6Kb  16.2Kb
|
```


中间部分右边：实时参数分别是该访问 ip 连接到本机 2 秒，10 秒和 40 秒的平均流量

=>代表发送数据，<= 代表接收数据

表示发送，接收和全部的流量

TX：发送流量

RX：接收流量

TOTAL：总流量

Cumm：运行iftop到目前时间的总流量   cumulative [ˈkjuːmjələtɪv] adj. 累积的

peak：流量峰值

rates：分别表示过去 2s 10s 40s 发送、接收及总的平均流量

### 交互
General:
    P - pause display
    h - toggle this help display
    b - toggle bar graph display
    B - cycle bar graph average, 2s bar , 10s bar and 40s bar
    T - toggle cumulative line totals. 显示/隐藏每个 ip 的 cumm
    j/k - scroll display。 vim 中的上下
    f - edit filter code
    l - set screen filter
    L - lin/log scales
    ! - shell command
    q - quit

Host display:
    n - toggle DNS host resolution
    s - toggle show source host
    d - toggle show destination host
    t - cycle line display mode

Port display:
    N - toggle service resolution. port resolution
    S - toggle show source port
    D - toggle show destination port
    p - toggle port display

Sorting:
    1/2/3 - sort by 1st/2nd/3rd column
    < - sort by source name
    > - sort by dest name
    o - freeze current order

