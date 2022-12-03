#


静态 nat (Static Translation)
    一个公网对一个私网

动态 nat (Dynamic Translation)
    公网地址池
    私有地址从公网地址池中随机选择一个
    一个公网对一个私网

端口 nat 端口多路复用(Port Address Translation, PAT)
    复用

    原始地址        NAT后地址
    192.168.1.1     100.0.0.1:
    192.168.1.2     100.0.0.1
    192.168.1.3     100.0.0.1
    192.168.1.4     100.0.0.1



## 静态

    ``` cisco
    show ip route
    ```

## 动态


## PAT









锥形NAT
    限制型 NAT
        IP限制型
            只能内部主机进行发起，外界进来的会被drop
            内部主机a:porta(网关A:portA) 和外部主机 B:protB 进行通信，主机B的其他端口也可以和 A:portA 主动通信，但其他主机不可以
        端口限制型
            其实是ip+端口限制
            内部主机a:porta(A:portA) 和外部主机 B:protB 进行通信，主机B的其他端口不可以和 A:portA 主动通信，其他主机任何端口都不可以
    完全锥型
        一个端口可以复用, 可以和任何的外界进行通信
        内部主机a:porta(A:portA) 和外部主机 B:protB 进行通信，主机C可以通过 A:portA 和其进行主动通信

对称NAT
    生成一个新的端口和外界连接
    一对一的关系
    内部主机a:porta(A:portA) 和外部任何一台主机:port 进行通信，网关都会生成一个新端口和其进行通信, 网关:port <-> 外部某个主机:port
    外部其他主机无法利用这个 portA 和 porta 进行复用
    只能主机a 主动发起，否则外部主机无法和主机 a 进行通信



打洞
    两台 NAT 内部主机通信


1. 全锥形
2. IP锥形
3. 端口锥形
4. 对称型



全锥型          全锥型          ok
全锥型          IP锥型          ok
全锥型          端口锥型        ok
全锥型          对称型          ok

IP锥型          IP锥型          ok
IP锥型          端口锥型        ok
IP锥型          对称锥型        ok

端口锥形        端口锥型        ok
端口锥形        对称锥型        X

对称型          对称型          X



