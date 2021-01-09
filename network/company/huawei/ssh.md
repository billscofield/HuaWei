

## ssh 


    10.0.0.1/24             10.0.0.254/24
    +------+                  +--------+
    | R PC | ---------------- | Router |
    +------+                  +--------+
    GE 0/0/0                GE 0/0/0


1. Router配置

    ```
    [Router]aaa

    [Router]local-user tom password cipher tom-pass privilege 15

    [Router]local-user tom service-type ssh

    [Router]quit

    [Router]ssh user tom authentication-type password  // 配置用户的认证方式

    [Router]stelnet server enable //开启ssh服务

    ```

1. 生成RSA密钥对

    ```
    [Router]rsa local-key-pair create

    ```

1. 3、配置VTY（虚拟终端）界面，身份认证方式为AAA认证，允许用户以SSH的方式接入

    ```
    [Router]user-interface vty 0 4

    [Router-ui-vty0-4]authentication-mode aaa

    [Router-ui-vty0-4]protocol inbound ssh

    ```

1. Router PC 客户端配置命令：

    ```
    [SW1]ssh client first-time enable //客户端第一次登录时需要下载公用秘钥对

    [SW1]stelnet 10.1.11.1
    ```



[stelnet小插曲]

    SSH Telnet( 简称Stelnet），在华为的网络设备上，它只是“SSH”的另一种叫法（而实际Stelnet和SSH的区别也只是叫法上不同而已），
    那为什么其它品牌的网络设备中都叫“SSH”，然而到了华为的设备上SSH却被命名为Stelnet，这就要说到SSH安全协议的发展历程了，
    在SSH安全协议发明之前，有一个叫Telnent的远程协议当时主要作为远程登录协议来使用，但由于不安全的明文传输方式，就有了SSH
    安全协议的诞生（第一个版本发布于1995年），而华为在其网络设备中使用SSH安全协议最早可追溯到2000年，那时大家提到网络设备
    的远程登录，首先想到的就是Telnent远程登录（在网络管理员看来“Telnet远程登录”比Telnent协议本身更为出名），但一说到关于SSH
    安全协议可能都不知道这是用来干嘛的，因此华为在最起初采用了Stelnent这种命名方式，来告诉大家我们的网络设备可以使用安全加
    密、非明文传输，保险可靠的Stelnent进行远程登录（不排除为了提高设备销量，才如此命名的嫌疑[尴尬]）。而这一命名就一直延续到
    了这个信息不再闭塞的今天...... )
