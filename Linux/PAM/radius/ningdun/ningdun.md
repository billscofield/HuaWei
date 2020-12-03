

## 

/etc/pam.d/common-auth-radius           // ASCII text

    ```
    auth    [success=1 default=ignore]      pam_radius_auth.so
    auth    requisite                       pam_deny.so
    auth    required                        pam_permit.so

    ```

/etc/pam_radius_auth.conf

    ```
    # server[:port] shared_secret      timeout (s)
    192.168.1.111   abc                3                // DKEY TMS服务器的地址，abc 为 DKEY TMS 默认域(abc)的认证客户端密码

    ```



```
cd /usr/lib/
find . -iname "*radius*"
./proftpd/mod_radius.so
./proftpd/mod_quotatab_radius.so
./pppd/2.4.7/radius.so

```

----

1. 添加 /etc/pam_radius_auth.conf 文件, 由宁盾提供

    仅有一条认证服务器地址和密码

1. sshd_config

    ChallengeResponseAuthentication 由 no 改为 yes

1. /etc/pam.d/sshd

    @include common-auth        注释掉 改为 @include common-auth-radius
    
1. 添加 /etc/pam.d/system-auth-radius
    
    ```
    auth    [success=1 default=ignore]      pam_radius_auth.so
    auth    requisite                       pam_deny.so
    auth    required                        pam_permit.so
    ```

    原来的是 system-auth

    ```
    auth    [success=1 default=ignore]      pam_unix.so nullok_secure
    auth    requisite                       pam_deny.so
    auth    required                        pam_permit.so
    ```

service ssh restart





## ubuntu 安装配置

### 安装 PAM RADIUS

apt-cache show libpam-radius-auth

apt install libpam-radius-auth

    ```
    This is the PAM to RADIUS authentication module. It allows any PAM-capable
    machine to become a RADIUS client for authentication and accounting
    requests. You will, however, need to supply your own RADIUS server to
    perform the actual authentication
    ```

### 配置 PAM RADIUS

vi /etc/pam_radius_auth.conf

将默认的配置注释掉或者删除，添加DKEY TMS配置信息（可以增添多条配置以实现热备）：

默认:
    127.0.0.1       secret             1            注释掉
    other-server    other-secret       3            注释掉


添加: 
    192.168.1.111  dkeyserver 30


### 启用PAM RADIUS

大多数Linux发行版有一个通用的PAM配置文件，使用PAM进行认证的组件通过include语句引用通用配置文件。比如Ubuntu下的通用配置文件为/etc/pam.d/common-auth，RedHat系列为/etc/pam.d/system-auth

如果直接修改通用配置文件，那么所有使用PAM的组件（系统本地登录，SSH，FTP等）均会受影响。大部分使用动态口令保护的Linux系统仅需要在SSH登录时需要输入动态口令，所以建议将通用配置文件单独做一个启用RADIUS认证的拷贝，如Ubuntu下cp -L /etc/pam.d/common-auth /etc/pam.d/common-auth-radius，RedHat系列和红旗Linux cp -L /etc/pam.d/system-auth /etc/pam.d/system-auth-radius。配置好通用RADIUS配置文件后将要启用动态口令认证的配置文件中的include项改为xxx-xxx-radius


cp -L /etc/pam.d/common-auth /etc/pam.d/common-auth-radius

编辑/etc/pam.d/common-auth-radius，找到
    auth … pam_unix.so

    一行，修改为
    
        auth required pam_unix.so not_set_pass

    在该行下面添加

        auth [success=1 default=ignore] pam_radius_auth.so


配置SSH登录时使用RADIUS进行动态口令认证，则修改sshd文件，将@include common-auth一行修改为@include common-auth-radius：

    vi /etc/pam.d/sshd

如启用系统本地登录使用动态口令，则修改login文件





### 实践

#### ssh 只需要更改两个地方

1. 修改一

/etc/pam.d/sshd
    @include common-auth

2. 修改二

/etc/ssh/sshd_config

    ChallengeResponseAuthentication 改为 no


#### xrdp

/etc/pam.d/xrdp-sesman  -> /etc/pam.d/sesman

```
#@include common-auth-radius
@include common-auth
```
