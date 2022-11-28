links:

    https://www.cnblogs.com/xz816111/p/9479139.html

单纯就RSA来说，公钥/私钥是通过随机大素数，成对生成的（自己看欧拉定理）。而不是通过私钥生成公钥。

SSH（Secure Shell）是一套协议标准，可以用来实现两台机器之间的安全登录以及安全的
数据传送，其保证数据安全的原理是非对称加密。

传统的对称加密使用的是一套秘钥，数据的加密以及解密用的都是这一套秘钥，可想而知所
有的客户端以及服务端都需要保存这套秘钥，泄露的风险很高，而一旦秘钥便泄露便保证不
了数据安全。

非对称加密解决的就是这个问题，它包含一对儿秘钥 - 公钥以及私钥，其中公钥用来加密，
私钥用来解密，并且通过公钥计算不出私钥，因此私钥谨慎保存在服务端，而公钥可以随便
传递，即使泄露也无风险。(也可以私钥加密，公钥解密) 私钥签名

保证 SSH 安全性的方法，简单来说就是客户端和服务端各自生成一对儿私钥和公钥，并且互
相交换公钥，这样每一条发出的数据都可以用对方的公钥来加密，对方收到后再用自己的私
钥来解密。


       client                                                                                           server
 +-------------------+                                                                             +------------------+
 |                   |          Public Key B                              Private Key B            |                  |
 |   Public Key A    |   客户端利用服务端的公钥加密数据   +------+   服务端利用自己的私钥解密数据  |  Public Key B    |
 |                   |----------------------------------->|      |-------------------------------->|                  |
 |   Private Key A   |                                    | 密文 |                                 |  Private Key B   |
 |                   |<-----------------------------------|      |<--------------------------------|                  |
 |   Public Key B    |   客户端利用自己的私钥解密         +------+   服务端利用客户端的公钥加密    |  Public Key A    |
 |                   |          Private Key A                             Public Key A             |                  |
 +-------------------+                                                                             +------------------+


在没有生成个人用户的密钥对时，ssh 已经生成了本主机的密钥对, 例如:/etc/ssh/ssh_host_rsa.key, 首次通信时的提示就是这个密钥对的指纹信息, 是否信任。

所以加入到 hnow_hosts 的是主机的公钥，而不是个人的

```
/etc/ssh/sshd_config.d/*.conf files are included at the start of the configuration file, so options set there will override those in /etc/ssh/sshd_config.

 IgnoreUserKnownHosts
    Specifies whether sshd(8) should ignore the user's ~/.ssh/known_hosts
    during HostbasedAuthentication and use only the system-wide known hosts
    file /etc/ssh/known_hosts.  The default is“no”.
```




## 连接创建

由上一张图可以看出来，两台机器除了各自的一套公、私钥之外，还保存了对方的公钥，因
此必然存在一个交换各自公钥的步骤。实际上并不是简单的各自发送公钥，而是存在一些专
门的算法。这一步在首次链接时、数据传送之前发生。


|
|                                                           首次链接时的公钥交换
|
|           
|           Client          Server
|           
|           +--------------------------------+                                                  +-----------------------------------+
|           |                                |                       Connect                    |                                   |
|           |                                |------------------------------------------------> |   Public Key B                    |
|           |                                |                                                  |   Private Key B                   |
|           |                                |                                                  |                                   |
|           |                                |                                                  |                                   |
|           |                                |                                                  |                                   |
|           |                                |                                                  |                                   |
|           |  生成密钥对                    |                                                  |                                   |
|           |                                |                   Public Key B                   |                                   |
|           |  Public Key A                  | <----------------------------------------------  |                                   |
|           |  Private Key A                 |                      会话ID                      |                                   |
|           |                                |                                                  |                                   |
|           |                                |                                                  |                                   |
|           |                                |                                                  |                                   |
|           |                                |                                                  |                                   |
|           |                                |                                                  |                                   |
|           |  Res=ID ^ Public Key A         |                                                  |                                   |
|           |               |                |                                                  |                                   |
|           |  Public key B | 服务端公钥加密 |                                                  |           UmVzID0gSuQgXiBQ        |
|           |              \|/               |                 UmVzID0gSuQgXiBQ                 |                  |                |
|           |       UmVzID0gSuQgXiBQ         | ---------------------------------------------->  |   Private Key B  |  服务端私钥B   |   A^B = C
|           |                                |                                                  |                 \|/               |   C^A = B
|           |                                |                                                  |               Res^ID              |   C^B = A
|           |                                |                                                  |                  |                |
|           |                                |                                                  |                  |                |
|           |                                |                                                  |                 \|/               |
|           |                                |                                                  |               Publick Key A       |
|           |                                |                                                  |                                   |
|           |                                |                                                  |                                   |
|           |  最终持有                      |                                                  |   最终持有                        |
|           |  Public Key A                  |                                                  |   Public Key B                    |
|           |  Private Key A                 |                                                  |   Private Key B                   |
|           |  Publick Key B                 |                                                  |   Public Key A                    |
|           |                                |                                                  |                                   |
|           +--------------------------------+                                                  +-----------------------------------+
|


1. 客户端发起链接请求

2. 服务端返回自己的公钥，以及一个会话ID（这一步客户端得到服务端公钥）

3. 客户端生成密钥对

4. 客户端用自己的公钥异或会话ID，计算出一个值，并用服务端的公钥加密

5. 客户端发送加密后的值到服务端，服务端用私钥解密

6. 服务端用解密后的值异或会话ID，计算出客户端的公钥（这一步服务端得到客户端公钥）

7. 至此，双方各自持有三个秘钥，分别为自己的一对公、私钥，以及对方的公钥，之后的
   所有通讯都会被加密

这里有一个有趣的地方，两台机器第一次使用SSH链接时，当服务端返回自己的公钥（第2步）
的时候，客户端会有一条信息提示，大意是无法验证对方是否可信，并给出对方公钥的MD5
编码值，问是否确定要建立链接。


```
ssh 10.0.0.1(Debian)
The authenticity of host '10.0.0.1(10.0.0.1)' can't be established.
RSA key fingerprint is 08:88:a8:5f:68:88:ce:8e:88:e6:b9:a3:ad:1b:88:9fa .
Are you sure you want to continue connecting (yes/no)?




➜  ssh pwd   (debian)
/etc/ssh
➜  ssh ls
moduli      sshd_config       ssh_host_dsa_key.pub  ssh_host_ecdsa_key.pub  ssh_host_ed25519_key.pub  ssh_host_rsa_key.pub
ssh_config  ssh_host_dsa_key  ssh_host_ecdsa_key    ssh_host_ed25519_key    ssh_host_rsa_key          ssh_import_id

➜  ssh-keygen -E md5 -lf ssh_host_rsa_key.pub
2048 MD5:08:88:a8:5f:68:88:ce:8e:88:e6:b9:a3:ad:1b:88:9f root@raspberrypi (RSA)

    -E      Specifies the hash algorithm used when displaying key fingerprints.  Valid options are: ``md5'' and ``sha256''.  The default is ``sha256''
    -f      Specifies the filename of the key file
    -l      Show fingerprint of specified public key file.



```
key.public 要去掉 ssh-rsa AAAAB3... 中的 ssh-rsa 描述, 得到纯的 public, 仅仅去掉前边的 ssh-rsa, 不要删别的任何内容, 但是去掉之后 ssh-keygen -E md5 -lf 就不识别了
base64 -d key.public | md5sum





这是因为SSH虽然传输过程中很安全，但是在首次建立链接时并没有办法知道发来的公钥是
否真的来自自己请求的服务器，如果有人在客户端请求服务器后拦截了请求，并返回自己的
公钥冒充服务器，这时候如果链接建立，那么所有的数据就都能被攻击者用自己的私钥解密
了。这也就是所谓的中间人攻击。


The authenticity of host '10.0.0.133 (10.0.0.133)' can't be established.
ECDSA key fingerprint is SHA256:IH1w0FlO7wYTTkYLeURm5NleBdSXjdS5FfmyPlXPYXc.
Are you sure you want to continue connecting (yes/no)? ^C





## 利用密码登录

SSH还常用来远程登录到别的机器，有两种常用的方法，第一种便是账号密码登录。

|                                                           密码登录
|
|           client                                                                                        server
|   +-----------------------------------+                                                   +-----------------------------------+
|   |                                   |                                                   |                                   |
|   |   Public Key A                    |------------------------------------------------>  |  Public Key B                     |
|   |                                   |                  Exchange Public Key              |                                   |
|   |   Private Key A                   |<------------------------------------------------  |  Private Key B                    |
|   |                                   |                                                   |                                   |
|   |   Public Key B                    |                                                   |  Public Key A                     |
|   |                                   |                                                   |                                   |
|   |                                   |                                                   |                                   |
|   |                                   |                                                   |                                   |
|   |                                   |                                                   |                                   |
|   |                                   |                                                   |                                   |
|   |                                   |                                                   |                                   |
|   |          Password:1234            |                                                   |                                   |
|   |               |                   |                 Login Request                     |           dGVzdGhha               |
|   |  Publick key  | 服务器公钥加密    |------------------------------------------------>  |                |                  |
|   |              \|/                  |                                                   |  Privage Key B |服务器私钥解密    |        |
|   |           dGVzdGhha               |                                                   |               \|/                 |
|   |                                   |                                                   |          Password:1234            |
|   |                                   |                                                   |                                   |
|   |                                   |                                                   |                                   |
|   |                                   |                                                   |                                   |
|   |                                   |                                                   |                                   |
|   |                                   |                                                   |                                   |
|   |                                   |                                                   |                                   |
|   |                                   |                                                   |            验证结果               |
|   |                                   |                                                   |  Public Key A  | 客户端公钥加密   |
|   |                                   |                 Login Response                    |               \|/                 |
|   |         aBgxyujkldf               | <-----------------------------------------------  |           aBgxyujkldf             |
|   |               |                   |                                                   |                                   |
|   | Private Key A | 客户端私钥解密    |                                                   |                                   |
|   |              \|/                  |                                                   |                                   |
|   |                                   |                                                   |                                   |
|   |                                   |                                                   |                                   |
|   +-----------------------------------+                                                   +-----------------------------------+


1. 服务端收到登录请求后，首先互换公钥，详细步骤如上一节所述。

1. 客户端用服务端的公钥加密账号密码并发送

1. 服务端用自己的秘钥解密后得到账号密码，然后进行验证

1. 服务端用客户端的公钥加密验证结果并返回

1. 客户端用自己的秘钥解密后得到验证结果


## 利用公钥登录

有些时候并不是开发者手动去连接服务器，而是客户端的程序需要连接到服务器，这时候用
密码登录就比较不方便，一是需要处理输入密码的问题，二是需要想办法安全的储存密码到
程序里，这种情况下便可以利用公钥来进行无密码登录。






|                                                           公钥登录
|           client                                                                                        server
|   +-----------------------------------+                                                   +-----------------------------------+
|   |                                   |                                                   |        authorized_keys            |
|   |   Public Key A                    |------------------------------------------------>  |  +-----------------------------+  |
|   |                                   |         手动添加 Public Key A 到 server           |  |                             |  |
|   |   Private Key A                   |                                                   |  |        Public Key           |  |
|   |                                   |                                                   |  |                             |  |
|   |                                   |                                                   |  +-----------------------------+  |
|   |                                   |                                                   |                                   |
|   |                                   |                 Login Request                     |      生成随机字符串: 12895        |
|   |                                   |------------------------------------------------>  |                |                  |
|   |                                   |                                                   |   Public Key A | 客户端公钥加密   |
|   |                                   |                                                   |               \|/                 |
|   |                                   |                                                   |         hahjfdkiourfakdf          |
|   |                                   |                                                   |                                   |
|   |                                   |                 hahjfdkiourfakdf                  |                                   |
|   |         hahjfdkiourfakdf          | <-----------------------------------------------  |                                   |
|   |               |                   |                                                   |                                   |
|   | Private Key A | 客户端私钥解密    |                                                   |                                   |
|   |              \|/                  |                                                   |                                   |
|   |    随机字符串: 12895              |                                                   |                                   |
|   |                                   |                随机字符串                         |                                   |
|   |                                   | ----------------------------------------------->  |                                   |
|   |                                   |                                                   |                                   |
|   |                                   |                                                   |                                   |
|   |                                   |                                                   |                                   |
|   |                                   |                Login Response                     |                                   |
|   |                                   | <-----------------------------------------------  |                                   |
|   |                                   |                                                   |                                   |
|   +-----------------------------------+                                                   +-----------------------------------+





1. 客户端用户必须手动地将自己的公钥添加到服务器一个名叫authorized_keys的文件里，
   顾名思义，这个文件保存了所有可以远程登录的机器的公钥。

2. 客户端发起登录请求，并且发送一个自己公钥的指纹（具有唯一性，但不是公钥）

3. 服务端根据指纹检测此公钥是否保存在authorized_keys中

4. 若存在，服务端便生成一段随机字符串，然后利用客户端公钥加密并返回

5. 客户端收到后用自己的私钥解密，再利用服务端公钥加密后发回

6. 服务端收到后用自己的私钥解密，如果为同一字符串，则验证通过

利用公钥登录的关键是必须手动将客户端的公钥添加到服务端，比如GitHub便有这一步骤，
添加了之后便可无密码登录。


## ssh-agent

将私钥交给ssh-agent(密码管理器)保管, 就不用输入私钥的密码了

实ssh-agent就是一个密钥管理器，运行ssh-agent以后，使用ssh-add将私钥交给
ssh-agent保管，其他程序需要身份验证的时候可以将验证申请交给ssh-agent来完成整个
认证过程。

**ssh-agent is a program to hold private keys used for public key authentication.**

Through use of environment variables the agent can be located and automatically
used for authentication when logging in to other machines using ssh

    手动启动:
        ssh-agent $SHELL, 也可以指定 shell

    自动启动:
        ssh-agent
        
    手动添加私钥
        ssh-add ~/.ssh/idrsa

    查看加载的秘钥
        ssh-add -l

    关闭ssh-agetn
        ssh-agent -k
