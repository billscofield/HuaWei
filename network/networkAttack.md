1. ip spoof
    1. https://www.bilibili.com/video/av12381067?p=3
1. smurf
    1. 攻击者使用victim ip 发送广播包-大量icmp request 报文，icmp reply 报文将使victim瘫痪
1. ICMP重定向  
    1. 更好的路径
1. ICMP不可达
    1. 伪造victim ip 发送大量icmp不可达 回复报文，让大家误以为victim 不可达
    1. 防范方法
        1. 关闭icmp不可达???
    
1. TCP欺骗
    1. 对B进行ddos攻击，使其瘫痪，在以B的身份和A通信

1. 缓冲区溢出攻击

总结一点就是: **request && reply**
缺乏身份验证机制


被动攻击(偷听)

主动攻击

中间人攻击:偷听 并修改
