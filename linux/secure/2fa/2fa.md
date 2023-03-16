# 2FA，2 Factor Authentication

双因子验证，是一种安全密码验证方式。区别于传统的密码验证，由于传统的密码验证是
由一组静态信息组成，如：字符、图像、手势等，很容易被获取，相对不安全。2FA是基于
时间、历史长度、实物（信用卡、SMS手机、令牌、指纹）等自然变量结合一定的加密算法
组合出一组动态密码，一般每60秒刷新一次。不容易被获取和破解，相对安全。

TOTP 的全称是"基于时间的一次性密码"（Time-based One-time Password）。它是公认的
可靠解决方案，已经写入国际标准 RFC6238。

## 2FA 加密原理

2FA（Two-Factor Authentication）通常使用的是**非对称加密（asymmetric encryption）**，
其中一个常用的算法是RSA。2FA 的实现需要密钥对，私钥保存在客户端，公钥则保存在服
务器端。在 2FA 流程中，客户端使用私钥对用户输入的口令进行加密，生成一个令牌，然
后将令牌发送到服务器端。服务器使用保存在其上的公钥进行解密，并进行比对，以此来
验证用户的身份。

## 方案

1. Authy
    客户端

2. Google Authenticator
    服务端 + 客户端

3. Microsoft Authenticator
    服务端 + 客户端

4. PyOTP
    客户端
    [Pypi](https://pypi.org/project/pyotp/)

    ```python3
    pip install pyotp

    import pyotp
    totp = pyotp.TOTP('base32secret3232')   # 私钥
    totp.now() # => '492039'
    ```

5. AuthenticatorPro
    [Github](https://github.com/jamie-mh/AuthenticatorPro)

    A free open-source two factor authentication app for Android
    Authenticator Pro 在主界面进行了内容保护，无法被截图或映射

    如果你已经在使用其它二步验证工具，Authenticator Pro 也提供了导入功能。而对
    于那些并没有提供导出功能的二步验证器（例如 Authy），Authenticator Pro 在
    GitHub 上提供了导入教程

    Authenticator Pro 支持将验证密钥保存为加密文件、HTML 文件或是明文，方便你去
    做备份或迁移。


## 安装部署

https://www.digitalocean.com/community/tutorials/how-to-set-up-multi-factor-authentication-for-ssh-on-ubuntu-20-04

https://www.digitalocean.com/community/tutorials/how-to-set-up-multi-factor-authentication-for-ssh-on-centos-7


## 
