1. Port 22

ListenAdress 0.0.0.0

1. AddressFamily

    Specifies which address family should be used by sshd(8).  Valid arguments
    are any (the default), inet (use IPv4 only), or inet6 (use IPv6 only).

    inet 就是 ipv4

    Common Protocol Suites:

        1. net—Supports IP protocol traffic, including OSPF, BGP, and Internet
           Control Message Protocol (ICMP).
        
        1. Inet6—Supports IPv6 protocol traffic, including RIP for IPv6
           (RIPng), IS-IS, and BGP.
        
        1. ISO—Supports IS-IS traffic.
        
        1. MPLS—Supports MPLS.
        
        1. ccc—Circuit cross-connect (CCC).
        
        1. mlfr-uni-nni—Multilink Frame Relay (MLFR) FRF.16 user-to-network
           network-to-network (UNI NNI).
        
        1. mlfr-end-to-end—Multilink Frame Relay end-to-end.
        
        1. mlppp—Multilink Point-to-Point Protocol.
        
        1. tcc—Translational cross-connect (TCC).
        
        1. tnp—Trivial Network Protocol. This Juniper Networks proprietary
           protocol provides communication between the Routing Engine and the
           device's packet forwarding components. Junos OS automatically
           configures this protocol family on the device's internal interfaces
           only.

1. LoginGraceTime

    The server disconnects after this time if the user has not successfully
    logged in.  If the value is 0, there is no time limit.  The default is 120
    seconds.

1. Compression

    Specifies whether compression is enabled after the user has authenticated
    successfully.  The argument must be yes, delayed (a legacy synonym for
    yes) or no.  The default is yes.
        
        yes:
        delayed:
        no:



1. UseDNS  

    Specifies whether sshd(8) should look up the remote host name, and to check
    that the resolved host name for the remote IP address maps back to the very
    same IP address.

    If this option is set to no (the default) then only addresses and not host
    names may be used in ~/.ssh/authorized_keys from and sshd_config Match Host
    directives.


GSSAPI ( Generic Security Services Application Programming Interface ) 是一套类
似Kerberos 5的通用网络安全系统接口。该接口是对各种不同的客户端服务器安全机制的
封装，以消除安全接口的不同，降低编程难度。但该接口在目标机器无域名解析时会有问
题


1. GSSAPIAuthentication

    Specifies whether user authentication based on GSSAPI is allowed.

    The default is no.


    http://jaminzhang.github.io/linux/GSSAPI-related-options-in-ssh-configuration/

    昨天看了一个脚本中关于配置 SSH 的部分，遇到 GSSAPI 相关配置，这个之前没怎么
    见过。 于是查了下，解释如下：

    GSSAPI：Generic Security Services Application Program Interface，GSSAPI 本
    身是一套 API，由 IETF 标准化。

    其最主要也是著名的实现是基于 Kerberos 的。一般说到 GSSAPI 都暗指 Kerberos 实现。

    GSSAPI 是一套通用网络安全系统接口。该接口是对各种不同的客户端服务器安全机制
    的封装，以消除安全接口的不同，降低编程难度。

    上面说的 GSSAPI 相关具体配置是什么？主要是 GSSAPIAuthentication，这个默认值
    为 yes。

    网上搜索 GSSAPI 的关键字，就会出现一大堆 SSH 登录慢的网页中有说到修改这个
    GSSAPIAuthentication 为 no，可以加快 SSH 登录。

    为何呢？

    SSH 默认开启了 GSSAPIAuthentication 认证，

    一般 SSH 依次进行的认证方法的是 publickey, gssapi-keyex, gssapi-with-mic,
    password， 这个你可以ssh -v开启 debug 模式在连接日志看到。   一般用户只使用
    password 认证方式，但前面 3 个认证过程系统还是会尝试，这就浪费时间了，也就
    造成 SSH 登录慢。
    
    关于 GSSAPI 相关的认证，消耗的时间比较多，具体可以查看 SSH 连接日志。

    GSSAPI 主要是基于 Kerberos 的，因此要解决这个问题也就变成要系统配置有
    Kerberos， 一般用户是没有配置 Kerberos的，反正我是没见过这种方式 SSH 登录的。
    所以那就直接把 SSH 服务端的 GSSAPIAuthentication 直接关掉吧，客户端也可以关
    掉。



## known_hosts

常见的数字签名算法主要有RSA、DSA、ECDSA三种

产生的短指纹可用于验证一个很长的公共密钥。例如，一个典型RSA公共密钥的长度会在
1024位以上，MD5或SHA-1的指纹却只有128或160位。

生成公钥指纹

    cd /etc/ssh

    -rw-r--r-- 1 root root 173 Jan 26  2021 ssh_host_ecdsa_key.pub
    -rw-r--r-- 1 root root  93 Jan 26  2021 ssh_host_ed25519_key.pub
    -rw-r--r-- 1 root root 393 Jan 26  2021 ssh_host_rsa_key.pub

    ssh-keygen -lf ssh_host_ecdsa_key.pub -E sha256

        -l      Show fingerprint of specified public key file.
        
        -f filename     Specifies the filename of the key file.
        
        -E fingerprint_hash
        
            Specifies the hash algorithm used when displaying key fingerprints.
            Valid options are: “md5” and “sha256”.  The default is “sha256”.
        
        -R hostname
            
            Removes all keys belonging to hostname from a known_hosts file.
            This option is useful to delete hashed hosts (see the -H option
            above).


### known_hosts 文件中的内容:

一般，初次登陆，ssh会自动将远程主机的公钥添加到用户的known_hosts文件

HashKnownHosts no 时

    10.0.5.213 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBCfq/1ChgW1iGzDlQZrunAkTLiTFfA/Skq6m1k4PMha80IzhVuWiKIFU+/weMSPOqDY7bJbamQQ/AK9LyNVkkoU=¬

HashKnownHosts yes 时(debian 默认yes)

    |1|mJH5lfBpiDYLOiUg9On3T9h2qQQ=|o/QfinE0J4l99RaAwJ5C0NMKHZM= ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBCfq/1ChgW1iGzDlQZrunAkTLiTFfA/Skq6m1k4PMha80IzhVuWiKIFU+/weMSPOqDY7bJbamQQ/AK9LyNVkkoU=

    len(salt)=28


-F hostname

    Search for the specified hostname in a known_hosts file, listing any
    occurrences found.  This option is useful to find hashed host names or
    addresses and may also be used in conjunction with the -H option to print
    found keys in a hashed format.


ecdsa-sha2-nistp256 算法


这些文件中的每一行都包含以下字段：标记 （可选），主机名，位，指数，模数，注释。
字段直接用空格隔开。

或者主机名可以以哈希加密形式存储，这样可以隐藏主机名称和IP地址对外暴露。 哈希过
的主机名以” |”字符开头。每一单行上只能允许一个哈希主机名出现，并且上述否定或通
配符操作都不适用。

另外一种格式是上面以IP开头的那种格式，包含主机名（可选，取决于是否设置别名），
主机IP，随机产生的加密盐，采用SHA-1加密的IP信息及该主机的公钥，字段直接以空格分
开。




HashKnownHosts

https://github.com/chris408/known_hosts-hashcat
