
## What does TIME+ (cpu time, hundredth) in top mean?

[link](https://superuser.com/questions/1148884/what-does-time-cpu-time-hundredth-in-top-mean)

The time column has a colon separating two values so saying it is any one unit
makes no sense.

What the manual page (and your link) are saying is that the TIME+ column has a
granularity([ˌɡrænjəˈlærəti] 间隔尺寸，粒度) of hundredths of a second.

The units are still minutes:seconds, you just get fractions(小数部分) of
seconds as well after the decimal point.

These fractions of seconds have a granularity of hundredths of seconds, hence
there are at most two digits after the decimal point.


PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
7830 root      20   0   20.0g  16.0g  15.9g S  54.0  12.7   5029:17 VirtualBoxVM

top 的时间最大是分钟


## ps time

➜  Downloads ps -p 7830
    PID TTY          TIME CMD
    7830 ?        3-11:48:29 VirtualBoxVM       // 3天11小时48分钟29秒

