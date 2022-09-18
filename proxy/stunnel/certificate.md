

X.509 是定义公钥证书格式的标准。


X.509 is a standard format for **public key certificates**, **digital
documents** that securely associate cryptographic key pairs with identities
such as websites, individuals, or organizations.

公钥证书是将加密密钥对与网站、个人或组织等身份安全地关联起来的数字文档。


In cryptography, X.509 is an International Telecommunication Union (ITU)
standard defining the format of public key certificates.

An X.509 certificate binds an identity to a public key using a digital
signature. A certificate contains an identity (a hostname, or an organization,
or an individual) and a public key (RSA, DSA, ECDSA, ed25519, etc.), and is
either signed by a certificate authority or is self-signed.



When a certificate is signed by a trusted certificate authority, or validated
by other means, someone holding that certificate can use the public key it
contains to establish secure communications with another party, or validate
documents digitally signed by the corresponding private key.


1. ITU

    International Telecommunication Union

    ITU's work is organized into three Sectors:(https://www.itu.int/en/mediacentre/backgrounders/Pages/itu-study-groups.aspx)
        1. ITU-R (Radiocommunication).
        2. ITU-T (Standardization).
        3. ITU-D (Development).

2. ITU-T

    ITU Telecommunication Standardization Sector (ITU-T)


    The main products of ITU-T are normative Recommendations.
    ITU-T的主要产品为规范性建议书。


    Recommendations are standards that define how telecommunication networks
    operate and interwork. ITU-T Recommendations are non-binding, however they
    are generally complied with due to their high quality and because they
    guarantee the interconnectivity of networks and enable telecommunication
    services to be provided on a worldwide scale.

    建议书是确定电信工作运行和互通方法的标准，虽不具有约束力，但由于其质量高且
    能够保证网络互连并实现电信服务的全球提供，而普遍得到遵守。


    The vast majority of all Recommendations are available in electronic (PDF)
    form, free of charge to all, once the final, edited version is published.
    Texts that are not free of charge include common ITU-T | ISO / IEC texts
    for which special arrangements exist. 

    ITU-T的绝大多数建议书一经完成最后编辑工作，即以PDF格式免费向普通公众提供。
    非免费文件包括适用特殊安排的 ITU-T | ISO / IEC 通用文件


[ITU-T Recommendation series structure ITU-T建议书的结构](https://www.itu.int/en/ITU-T/publications/Pages/structure.aspx)


    1. ITU-T A-Series Recommendations:

        Organization of the work of ITU-T
         ITU-T工作的组织

    2. ITU-T D-Series Recommendations:

        Tariff and accounting principles and international
        telecommunication/ICT economic and policy issues
        一般资费原则

    3. ITU-T E-Series Recommendations:

        Overall network operation, telephone service, service operation and
        human factors
        综合网络运行、电话业务、业务运行和人为因素

    4. ITU-T F-Series Recommendations:

        Non-telephone telecommunication services
        非话电信业务

    5. ITU-T G-Series Recommendations:

        Transmission systems and media, digital systems and networks
        传输系统和媒质、数字系统和网络

    ...

    21. ITU-T X-Series Recommendations:

        Data networks, open system communications and security
        数据网络、开放系统通信和安全

        X.1-X.199   Public data networks
        X.200-X.299 Open Systems Interconnection
        X.300-X.399 Interworking between networks
        X.400-X.499 Message Handling Systems
        X.500-X.599 Directory
            [link](https://www.itu.int/itu-t/recommendations/index.aspx?ser=X)
            X.500: The Directory: Overview of concepts, models and services
            X.509: The Directory: **Public-key and attribute certificate frameworks**


        X.600-X.699 OSI networking and system aspects
        X.700-X.799 OSI management
        X.800-X.849 Security
        X.850-X.899 OSI applications
        X.900-X.999 Open distributed processing
        X.1000-X.1099   Information and network security


2. WTSA

    World Telecommunication Standardization Assembly(WTSA 世界电信标准化大会)
    is held every four years and defines the next period of study for ITU-T


    WTSA-16 took place in Yasmine Hammamet, Tunisia, from 25 October to 3
    November 2016 preceded by the Global Standards Symposium on 24 October 2016

    2016年世界电信标准化全会（WTSA-16）于2016年10月25日至11月3日在突尼斯哈马马
    特-亚斯敏召开，会前于2016年10月24日举办了全球标准专题研讨会

    https://www.itu.int/zh/ITU-T/wtsa16/Pages/default.aspx


    WTSA-20 took place in Geneva, Switzerland, 1 to 9 March 2022 preceded by
    the Global Standards Symposium on 28 February 2022.

    WTSA-20于2022年3月1日至9日在瑞士日内瓦举行，之前于2022年2月28日举行了全球标
    准专题研讨会。


3. ITU-T Study Group 17 (SG17)

    TU-T Study Group 17 (SG17) is a statutory group of the ITU
    Telecommunication Standardization Sector (ITU-T) concerned with security.

    what does 17 mean?

4. How many ITU study groups are there?
    
    [link](https://www.itu.int/zh/mediacentre/backgrounders/Pages/itu-study-groups.aspx)

    ITU study groups are renewed every four years. The number of ITU study
    groups changes over time, as study groups are established or disbanded. The
    authority to establish or disband ITU study groups rests with the governing
    body of the respective Sector.

    国际电联研究组每四年更新一次。随着研究组的成立或解散，国际电联的研究组数量
    随时间而变化。各相关部门的管理机构有权成立或解散国际电联研究组。

        1. ITU-R currently operates six study groups
        
        2. ITU-T currently operates eleven study groups
            
            SG17 - Security
            
            [Study Group 17 at a glance](https://www.itu.int/en/ITU-T/about/groups/Pages/sg17.aspx)
            
        3. ITU-D currently operates two study groups

## 加密三要素

1. 明文/密文

    明文：原始数据

    密文：加密后的数据

2. 密钥

    定长的字符串

    对称加密：自己生成

    非对称加密：有对应的算法直接生成

        所有的非对称加密算法都有生成密钥对的函数

        公钥比较小，私钥比较大
        可以通过私钥推出公钥, 公钥包含很多东西

3. 算法

    加密算法
        对称加密
            加密效率高
            加密强度不如非对称加密
            密钥分发很困难(因为密钥要保密分发)

        对称加密算法
            DES/3DES
                DES
                    已经被破解
                    密钥长度 8Byte(每隔7bit 设置一个错误检查，实际内容就是7字节56bit)
                    对数据分段加密, 8Byte 一组,如果最后一组不足8Byte 会进行填充, 一般会多8Byte
                    密文和原文长度是一致的
                ???3DES
                    密钥长度 24Byte
                    对数据分段加密, 8Byte 一组,如果最后一组不足8Byte 会进行填充, 一般会多8Byte
                    在算法内部会被平均分成3份，每一份8Byte

                    用第一个8Byte 密钥加密
                    用第二个8Byte 密钥再加密
                    用第三个8Byte 密钥再加密
            AES
                比较安全，效率比较高的
                密钥长度: 可选16Byte, 24Byte, 32Byte
                ???对数据分段加密, 16Byte 一组, 每组密文和明文的长度相同，都是16Byte
            Blowfish
            RC2/RC4/RC5
            IDEA
            SKIPJACK

        非对称加密
            加密效率比较低，速度慢
            加密轻度高
            密钥分发比较容易

        非对称加密算法

            RSA:数字签名和密钥交换

            ECC(椭圆曲线加密算法,数字签名)

            Diffie-Hellman(DH,密钥交换)
            El Gamal(数字签名)
            DSA(数字签名)

    解密算法



### 密钥交换

因为对称密钥分发比较困难，使用非对称密钥对对称密钥进行分发



### Hash 算法(单向散列函数)

1. 得到的结果的长度都是定长的
2. ???二进制字符串
3. 有很强的抗碰撞性
    原始数据不同，通过哈希算法得到的值就不一样
    因此可以用来做数据校验
4. 不可逆
5. 哈希运算的结果有很多名字
    散列值
    指纹
    摘要

MD4/MD5
    散列值是 16Byte
    **抗碰撞性已经被破解**
SHA-1
    散列值是 20Byte
SHA-2
    SHA-2 是一类算法，包括
        1. sha224       224bit  28Byte
        1. sha256       256bit  32Byte
        1. sha384       384bit  48Byte
        1. sha512       512bit  64Byte
SHA-3
    SHA-3 是一类算法，包括
        sha3-224
        sha3-256
        sha3-384
        sha3-512

哈希不是加密，因为不能解密


### 消息认证码 HMAC

在通信的时候，校验通信的数据有灭有被篡改

消息认证码的本质是一个散列值

(原始数据 + 密钥) x 哈希函数 = 消息认证码

    最关键的数据是密钥(类似盐)

校验的过程:

    1. 数据发送方A, 数据接收方B
    2. 在A或B端生成一个密钥X, 及你想那个分发，AB都有了X
    3. A端进行散列值运算，(原始数据 + X ) x 哈希函数 = 得到散列值
    4. A:将**原始数据**和**散列值**发给B
    5. B 通过做相同的运算检查内容是否正确

不能鉴别消息的所有者

所以不如使用签名



### 数字签名

可以对数据进行完整性验证(数据有没有被篡改)
可以验证消息所有者

数字签名的过程
    服务端生成一个密钥对，发布公钥
    hash 原始数据
    **使用私钥对散列值进行加密, 形成密文(签名)**
    将原始数据和密文一起发送给接收者

    没有对数据内容加密

校验签名的过程
    A的公钥
    签名
    原始数据

    1. 对原始数据进行 hash 运算
    2. 并用A的公钥解密签名 得到散列值
    3. 比较二者

    

## openssl

安全套接字层密码库, 囊括主要的密码算法，常用的密钥和证书封装管理功能及SSL协议

SSL(Secure Socket Layer) 可以在 Internet 上提供保密性传输

Netscape 公司在推出第一个 Web 浏览器的同时，提出了 SSL 协议标准



tar xf xxtar.gzip
./config
make && make install

openssl version -a


/etc/ld.so.conf
ldconfig


## .pem

PEM格式通常用于数字证书认证机构（Certificate Authorities，CA），扩展名为
    .pem
    .crt
    .cer
    .key

内容为 Base64 编码的 ASCII 码文件，有类似"-----BEGIN CERTIFICATE-----" 和
"-----END CERTIFICATE-----"的头尾标记。


OpenSSL 使用 PEM 文件格式存储证书和密钥。PEM 实质上是 Base64 编码的二进制内容，
再加上开始和结束行，如证书文件的

-----BEGIN CERTIFICATE-----
和
-----END CERTIFICATE-----

服务器认证证书，中级认证证书和私钥都可以储存为PEM格式（认证证书其实就是公钥）。


## .der

DER格式与PEM不同之处在于其使用二进制而不是Base64编码的ASCII。

扩展名为.der，但也经常使用.cer用作扩展名，所有类型的认证证书和私钥都可以存储为DER格式。

Java 是其典型使用平台


## 可以使用OpenSSL命令行工具在不同证书格式之间的转换

PEM to DER

   openssl x509 -outform der -in certificate.pem -out certificate.der

PEM to PFX

   openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile CACert.crt



DER to PEM

    openssl x509 -inform der -in certificate.cer -out certificate.pem

PFX to PEM

    openssl pkcs12 -in certificate.pfx -out certificate.cer -nodes     

    PFX转PEM后certificate.cer文件包含认证证书和私钥，需要把它们分开存储才能使用。


知识点：

1、使用公钥操作数据属于加密

2、使用私钥对原文的摘要操作属于签名

3、公钥和私钥可以互相加解密

4、不同格式的证书之间可以互相转换

5、公钥可以对外公开，但是私钥千万不要泄露，要妥善保存

注意：在我们备份证书信息的时候，最好使用.jks或者.pfx文件进行保存，这样备份的证书文件可以被完整的导出。



--- 


genrsa 
    -out filename
        Output the key to the specified file. If this argument is not specified then standard output is used.

        生成私钥


生成私钥

    genrsa -out 私钥文件

利用私钥生成公钥
    
    rsa -in 上边的私钥文件 -pubout -out 公钥文件


    -pubout

        By default a private key is output: with this option a public key will
        be output instead. This option is automatically set if the input is a
        public key.


生成数字签名

    data.txt

    dgst -sign Aprikey.pem -sha1 -out file.signd data.txt


    验证:

    用公钥解密

    dgst -verify Apublic.pem -sha1 -signature file.signd data.txt



---



plaintext   未经加密的消息，任何人都可以读
ciphertext  加密后的消息，不可读
key         密钥，用于加密和解密


|
| plaintext  -> encryption  -> ciphertext  ->  decryption  ->  plaintext
|                key                             key
|


证书 certificate 是一个在数字世界里用来认证哟农户或者设备的，这个文件可以用来证
明一个**密钥(公钥)**属于特定的用户和设备，用户和设备从而可以使用该认证过的**密
钥(公钥)**来代表自己的身份，进行消息的传递


这种用来签发证书的机构，我们称之为**certificate authority(CA)**, 经由他签发的"
文件"我们称之为 certificate证书



## 证书里有什么

1. 证书拥有者的基本信息(比如 HTTPS的话，包括拥有者的域名，CNAME, 公司或组织名称，地点等)

2. 证书颁发者的基本信息

3. 证书拥有者的公钥

4. 对公钥和其他信息的签名



|
|Server                                                      | CA
|                                                            |
|    生成私钥                                                |                                                              +------------+
|                                                            |                                                              |  crt 证书  |
|                                                            |                                                              |            |
|    生成公钥    ----+               发送到 CA 进行证书申请  |                                                              |    签名    |
|                    +----csr文件--------------------------------> 吧 csr 用hash生成摘要 ---> 用 CA 的私钥加密，生成签名--->|            |
|    申请者信息等----+                                       |                                                              |  csr 内容  |
|                                                            |                                                              |            |
|                   +                                        |                                                              +------------+
|                  /|\                                                                                                             |
|                   |                                                                                                              |
|                   +--------------------------------------------------------<-<-<-------------------------------------------------+
|                                                                      返回证书给申请者
|

通过**CA机构的公钥**解密证书文件 



## 自签名证书


|
|Server                                                      | 模拟CA
|                                                            |
|    生成私钥                                                |                                                              +------------+
|                                                            |                                                              |  crt 证书  |
|                                                            |                                                              |            |
|    生成公钥    ----+               发送到 CA 进行证书申请  |                                                              |    签名    |
|                    +----csr文件--------------------------------> 吧 csr 用hash生成摘要 ---> 用 CA 的私钥加密，生成签名--->|            |
|    申请者信息等----+                                       |                                                              |  csr 内容  |
|                                                            |                                                              |            |
|                   +                                        |                                                              +------------+
|                  /|\                                                                                                             |
|                   |                                                                                                              |
|                   +--------------------------------------------------------<-<-<-------------------------------------------------+
|                                                                      返回证书给申请者
|




```CA

mkdir /ca
openssl genrsa -des3 -out ca.key 2048                   // -des3 对私钥加密
openssl req -x509 -key ca.key -out ca.crt -days 365

    这个证书是根证书，CA机构的证书

    req PKCS#10 X.509 Certificate Signing Request (CSR) Management.

    -days n
        When the -x509 option is being used this specifies the number of days
        to certify the certificate for, otherwise it is ignored. n should be a
        positive integer. The default is 30 days.


    Enter pass phrase for ca.key:
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [AU]:ZH
    State or Province Name (full name) [Some-State]:Beijing
    Locality Name (eg, city) []:Beijing
    Organization Name (eg, company) [Internet Widgits Pty Ltd]:testcompany
    Organizational Unit Name (eg, section) []:testcompany
    Common Name (e.g. server FQDN or YOUR name) []:www.testcompany.com
    Email Address []:admin@testcompany.com

    crt 里包含了CA的私钥，上述信息


    查看证书文件
    openssl x509 -in ca.crt -text -noout

```

windows 查看证书
    certmgr

    Issuer 颁发机构



``` 模拟 www.baidu.com 似有网站
mkdir /baidu.com

openssl genrsa -out baidu.com.key 2048

生成 csr 文件

openssl req -new -key baidu.com.key --out baidu.com.csr
输入相关CSR信息

查看 csr 文件内容
openssl req -text -noout -verify -in baidu.com.csr

```


CA机构如何对我们的 csr 进行签名
```
openssl x509 -req -in /baidu.com/baidu.com.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out baidu.com.crt -day 365

openssl x509 -in baidu.com.crt -text -noout

    CA 机构的信息

    Subject 证书持有者的信息

```
