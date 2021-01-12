## 恢复密码

1. 通过Console口连接交换机，并重启交换机。当界面出现以下打印信息时，及时按下快捷键“Ctrl+B”并输入BootROM密码，进入BootROM主菜单。

    S系列框式交换机打印信息： 
        Press Ctrl+B to enter boot menu ... 1
        Password: //输入BootROM密码

    E系列和S系列盒式交换机打印信息： 
        Press Ctrl+B or Ctrl+E to enter BootROM menu ... 2
        password: //输入BootROM密码 

    说明：E系列交换机所有款型和S系列盒式交换机的某些款型支持使用快捷键“Ctrl+E”进入BootROM主菜单，请根据设备的界面提示操作。默认的BootROM密码如下：

    * E系列和S600-E系列交换机默认密码为Admin@huawei.com；

    * S系列盒式交换机在V100R006C05之前的版本，BootROM默认密码为huawei，在V100R006C05及之后的版本，默认密码为Admin@huawei.com；

    * S12700的默认密码为Admin@huawei.com；

    * S7700&S9700系列和S9300系列交换机在V100R006C00之前的版本，BootROM默认密码为9300，在V100R006C00及之后的版本，默认密码为Admin@huawei.com。


2. 在BootROM主菜单下选择“Clear password for console user”清除Console口登录密码。 


3. 根据交换机的提示，在BootROM主菜单下选择“Boot with default mode”启动设备。 


4. 完成系统启动后，对于V200R010C00之前版本，通过Console口登录时不需要认证，登录时按照系统提示配置登录密码。对于V200R010C00及之后版本，使用Console口登录设备的缺省用户名为“admin”，缺省密码为“admin@huawei.com”。

 
5. 登录交换机后，用户可以根据需要配置Console用户界面的认证方式及密码。

  ```
  [Switch] user-interface console 0

  [Switch-ui-console0] authentication-mode aaa    //设置Console用户认证方式为AAA认证。

  [Switch-ui-console0] quit

  [Switch] aaa

  [Switch-aaa] local-user admin1234 password irreversible-cipher Helloworld@6789    //创建名为admin1234的本地用户，设置其登录密码为Helloworld@6789。V200R003之前的版本，不支持irreversible-cipher，仅支持cipher关键字。

  [Switch-aaa] local-user admin1234 privilege level 15    //配置用户级别为15级。

  [Switch-aaa] local-user admin1234 service-type terminal    //配置接入类型为terminal，即：Console用户。

  [Switch-aaa] return

  <Switch>save

  ```


## vlan

vlan 数字

int g0/0/0
port default vlan 数字

int vlanif 数字

ip address 192.168.99.23 255.255.255.0

display this





## 屏蔽 MAC

mac-address blackhole f439-092c-f0b4 10.1.0.253 vlan 10


## arp

1. 清空动态 arp

```
reset arp dynamic
```

https://support.huawei.com/enterprise/zh/doc/EDOC1000178148/e48ffbd2
