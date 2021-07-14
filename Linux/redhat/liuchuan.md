linuxprobe.com
linuxcool.com

## ifconfig

enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.16  netmask 255.255.255.0  broadcast 10.0.2.255             // 看这个
        inet6 fe80::a00:27ff:fe81:7e64  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:81:7e:64  txqueuelen 1000  (Ethernet)
        RX packets 137584  bytes 132110458 (125.9 MiB)                          // 接收到的包
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 41947  bytes 4765708 (4.5 MiB)                               // 发送的包
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0


## uname


## uptime

最低是2， 图形界面，一个 terminal


## free

默认 KB

              total        used        free      shared  buff/cache   available
Mem:          7.8Gi       319Mi       6.0Gi        81Mi       1.5Gi       7.1Gi
Swap:         974Mi          0B       974Mi


## w

历史登录信息，保存在 /var/log/messages, 可以认为修改, 第六章会详细介绍


## history 


## sosreport

redhat 特有的

/var/tmp/sosreport-xxx.tar.zx
/var/tmp/sosreport-xxx.tar.zx.md5



## ls


## tr

cat a.txt | tr [a-z] [A-Z]


## wc 

-c, --bytes

-m, --chars

-w, --words

-l, --lines


## stat

modify: 内容

change: 元信息, 属性信息


## cut

cut -d : -f 1 /etc/passwd
    -d, --delimiter
    -f, --fields    列

## diff

diff 
    -q, --brief
        report only when files diffe
    
    output only the left column of common lines


## dd

if : input file
of : output file
bs : block size , 字节
count : 次数

测读写速度: 完成后会有读写速度结论


## tar

可以没有dash

-c: 创建压缩文件
-x: 解压缩文件
-z: gzip
-j: bzip2
-v: verbose
-f: 目标文件名

-C: --directory=DIR
-p: --perserve-permissions, --same-permissions
-t, --list

## wget

-P --directory-prefix=prefix
-c --continue
-b --background
-t --tries                      最大尝试次数
-p ???


## grep

行 
cut -d delimiter -f 列号

-n : --line-number

## find



## timedatectl 

status                   Show current time settings
show                     Show properties of systemd-timedated
set-time TIME            Set system time
set-timezone ZONE        Set system time zone
list-timezones           Show known time zones
set-local-rtc BOOL       Control whether RTC is in local time
set-ntp BOOL             Enable or disable network time synchronization


1. timedatectl status
```
               Local time: Fri 2021-07-02 08:29:29 CST
           Universal time: Fri 2021-07-02 00:29:29 UTC
                 RTC time: Fri 2021-07-02 00:29:29
                Time zone: Asia/Shanghai (CST, +0800)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no

```


2.  timedatectl show

```
Timezone=Asia/Shanghai
LocalRTC=no
CanNTP=yes
NTP=yes
NTPSynchronized=yes
TimeUSec=Fri 2021-07-02 08:32:25 CST
RTCTimeUSec=Fri 2021-07-02 08:32:25 CST
```

3. timedatectl list-timezones
    列出所有的时区

4. timedatectl set-time 
    timedatectl set-time 2:00
    timedatectl set-time 2022-9-1

## ps

RSDZT
<NLsI






