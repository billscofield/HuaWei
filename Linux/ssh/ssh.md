Linux到windows:

    scp /linux目录/文件名 administrator@windowsIP:/d:/


ssh 默认的用户名 是当前系统你此时在用的用户名, 而不是 root
    例如, 当你用 windows ssh 登录远程 linux 主机时, 发现用户名是 administrator

## ssh 客户端配置文件

/etc/ssh/ssh_config
    自定义:

    Host 名称
        Hostname IP地址
        User 用户名
        Port 端口号
        IdentityFile 私钥
    ...

    默认如下:

    Host *


ssh -i ./id_rsa 用户@IP


## sshd 服务端配置文件

/etc/sshd/sshd_config
    PermitRootLogin prohibit‐password       //禁止密码,只允许 公钥登录
                    yes                     //允许任何方式登录
                    no                      //不允许 root 登录
    PasswordAuthentication no               //禁止所有用户密码登录




## 复制公钥到远程主机

方法一:
    ssh-copy-id 用户名@远程主机

    windows 没有 这条命令

方法二:
    cat ~/.ssh/id_rsa.pub | ssh 用户@远程主机 tee .ssh/authorized_keys




## curl 会返回协议信息

➜  Kali git:(master) ✗ curl localhost:22
SSH-2.0-OpenSSH_7.9p1 Debian-10+deb10u2
Protocol mismatch.
curl: (56) Recv failure: Connection reset by peer




## ssh 登录

ssh 第一次登录会提示你

    ```
    The authenticity of host 'server.com (10.10.10.24)' can't be established. 
    RSA key fingerprint is ad:2e:92:41:6f:31:b1:c1:35:43:eb:df:f1:18:a1:c1. 
    Are you sure you want to continue connecting (yes/no)?  yes 
    Warning: Permanently added 'server.com,10.10.10.24' (RSA) to the list of known hosts. 
    ```

    这个 fingerprint 是服务器端的公钥 hash

    输入yes继续连接后，就会确认该服务器为可信任服务器，然后添加到 known_hosts 文件中，下次不用再次确认，然后跳转到输入密 码的验证阶段。

    之所以用fingerprint（公钥指纹）代替key，主要是key过于长（RSA算法生成的公钥有1024位），很难直接比较。所以，对公钥 进行hash生成一个128位的指纹，这样就方便比较了。


ssh-keygen -R IP
