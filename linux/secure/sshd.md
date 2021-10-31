
PermitRootLogin
    是否允许 root 登录。可用值如下：
    "yes"(默认)                 表示允许。"no"表示禁止。
    "without-password"(centos)  表示禁止使用密码认证登录。prohibit-passwd(debian)
    "forced-commands-only"      表示只有在指定了 command 选项的情况下才允许使用公钥认证登录。
                                同时其它认证方法全部被禁止。这个值常用于做远程备份之类的事情。


PasswordAuthentication
    Specifies whether password authentication is allowed.  The default is yes.


PermitEmptyPasswords
    是否允许密码为空的用户远程登录。默认为"no"

MaxAuthTries
    指定每个连接最大允许的认证次数。默认值是 6 。
    如果失败认证的次数超过这个数值的一半，连接将被强制断开，且会生成额外的失败日志消息。???

MaxStartups???
    最大允许保持多少个未认证的连接。默认值是 10 。    
    默认值: MaxStartups 10:30:100
    到达限制后，将不再接受新连接，除非先前的连接认证成功或超出 LoginGraceTime 的限制。

    start:rate:full

    sshd will refuse connec‐tion attempts with a probability of rate/100 (30%)
    if there are currently start (10) unauthenticated connections.  The
    probability increases linearly and all connection attempts are refused if
    the number of unauthenticated connections reaches full (100).


