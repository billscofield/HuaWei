
## 静态IP/MAC绑定

### 方法一

1. 临时添加

    arp -s [IP] [MAC]

    该添加为临时添加，系统重启后，就失效了

2. 查看添加成功后的ARP表项

    arp -a

3. 删除绑定的IP/MAC

    arp -d [IP]


### 方法二

此方法适用于 输入"arp -s "后回车若出现提示“ARP 项添加失败：拒绝访问” 的情况

1. 查看网口的Idx值

    DOS界面下，输入命令【netsh i i show in】 ，查看本地网卡对应的"Idx"值
    【netsh i i show in】 为【netsh interface ipv4 show interfaces 】的缩写


2. 定IP/MAC 

    netsh -c "i i" add ne [IP] [MAC]                // 绑定IP与MAC,，默认是永久生效

    netsh -c "interface ipv4" add neighbors 的缩写

    若只需临时绑定ARP表项，跟上参数：store=active ,即：【netsh -c "i i" add ne 18    192.168.1.1 00-11-00-62-c6-09 store=active】.

3. 查看是否绑定成功

    arp -a

4. 删除绑定的IP/MAC

    netsh -c "i i" delete neighbors 18      // "18"是文章前面提及的Idx值
