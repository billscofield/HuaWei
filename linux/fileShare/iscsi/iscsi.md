
是一个协议

将设备通过 tcp/ip 的方式共享到客户端，仿真本地设备
让本地计算机可以像管理直连存储一样进行分区格式化等操作

c/s 架构

服务端
    称之为 Target, 每个 Target 可包含多个 LUN(Logical Unit Number)
    真正提供服务的是 LUN
    一个LUN就是一个设备


IPSAN 是在 SAN 后产生的，SAN 指的是 FCSAN, 光纤通道构建存储网络
IPSAN 则以IP网络构建存储网络


|  c
   |
| \|/
| scsi
   |
| \|/
| iscsi
   |
| \|/
| tcp/ip
   |
| \|/
| 

将存储服务器 192.168.1
