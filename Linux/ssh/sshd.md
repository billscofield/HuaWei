1. Port 22

ListenAdress 0.0.0.0

1. AddressFamily

    Specifies which address family should be used by sshd(8).  Valid arguments
    are any (the default), inet (use IPv4 only), or inet6 (use IPv6 only).

1. LoginGraceTime

    The server disconnects after this time if the user has not successfully
    logged in.  If the value is 0, there is no time limit.  The default is 120
    seconds.

1. Compression

    Specifies whether compression is enabled after the user has authenticated
    success‐fully.  The argument must be yes, delayed (a legacy synonym for
    yes) or no.  The de‐fault is yes.



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

    Specifies whether user authentication based on GSSAPI is allowed.  The default is no.




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
