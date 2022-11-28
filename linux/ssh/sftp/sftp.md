
# 开启sftp日志并限制用户访问目录

## 1. 开启sftp日志

1.1 修改sshd_config

    注释掉Subsystem行,然后写入新Subsystem,信息如下

    ```
    Subsystem sftp internal-sftp -l INFO -f local5
    LogLevel INFO
    ```

1.2 修改syslogs

    在最后增加如下配置

    ```
    authauthpriv.*,local5.* /var/log/sftp.log
    ```

1.3 重启服务查看日志

    /etc/init.d/rsyslog restart
    /etc/init.d/sshd restart
    tail -f /var/log/sftp.log


## 2. 限制sftp用户操作目录

如果要让sftp用户只能使用规定的目录,则需要再配置文件中开启ChrootDirectory,并
限定目录作为sftp用户登录的根目录.

但这里规定的根目录,属主必须是root,文件夹权限只能是755,因此sftp用户对此根目
录只有读取权限,需要再在根目录下创建一个属主为改sftp用户的文件夹,用于该用户
上传数据

由此规则,可以产生两种sftp方案

### 2.1 home目录做根目录

创建用户时,不指定-M参数,默认会在home目录下生产该用户的家目录,用户对该目录具有完
全操作权限,且不能访问其他用户的家目录,因此适合作为sftp目录

    ChrootDirectory写法

1. 创建用户

    useradd test_sftp && echo "123456" | passwd --stdin test_sftp

2. 修改sshd_conf
    
``` /etc/ssh/sshd_config
Match User test_sftp
ChrootDirectory /home
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp
```

3. 重启 sshd 服务

    /etc/init.d/sshd restart


**重要说明:配置在Match User字段中的用户,会被禁止使用ssh方式登录系统**


### 2.2 单独创建目录做根目录

单独创建一个目录做根目录,然后再创建下级的操作目录,此方法需要按要求配置主目录及
下级目录的权限和属主等信息

    用户
    创建用户, 加-M 参数
    主目录
    创建主目录 /data/sftp; 授权 755; 属主 root.root
    创建下级目录 /data/sftp/test_sftp
    授权 755
    属主 test_sftp.test_sftp
    ChrootDirectory写法
    ChrootDirectory /data/sftp/

1. 创建用户
    
    useradd -M test_sftp && echo "123456" | passwd --stdin test_sftp

2. 创建主目录并授权
    
    mkdir -p /data/sftp
    chown -R root:root /data/sftp
    chmod 755 /data/sftp

3. 创建操作目录并操作

    mkdir -p /data/sftp/test_sftp
    chown -R test_sftp:test_sftp /data/sftp/test_sftp
    chmod 755 /data/sftp/test_sftp

4. 修改sshd_conf

```
Match User test_sftp
ChrootDirectory /data/sftp
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp
```

5. 重启 sshd 服务

    /etc/init.d/sshd restart




## internal-sftp & sftp-server

From a functional point of view, the sftp-server and internal-sftp are almost
identical. They are built from the same source code.

The main advantage of the internal-sftp is, that it requires no support files
when used with ChrootDirectory directive.

Quotes from the sshd_config(5) man page:

    For Subsystem directive:

        The command sftp-server implements the SFTP file transfer subsystem.

        Alternately the name internal-sftp implements an in-process SFTP
        server. This may simplify configurations using ChrootDirectory to force
        a different filesystem root on clients.

        就是说配置了 ChrootDirectory 就会默认使用 internal-sftp

        Configures an external subsystem (e.g. file transfer daemon).
        Arguments should be a subsystem name and a command (with optional
        arguments) to execute upon subsystem request.

        ```
        Subsystem sftp /usr/libexec/openssh/sftp-server -s "/usr/bin/sudo /usr/libexec/openssh/sftp-server"

            -s Specifies the SSH2 subsystem or the path for an sftp server on the remote host.

        centos7 有这个/usr/libexec/openssh/sftp-server 路径，Debian 是 /usr/lib/openssh/sftp-server 这个路径
        ```

    For ForceCommand directive:

        Specifying a command of internal-sftp will force the use of an
        in-process SFTP server that requires no support files when used with
        ChrootDirectory.

    For ChrootDirectory directive:

        The ChrootDirectory must contain the necessary files and directories to
        support the user's session. For an interactive session this requires at
        least a shell, typically sh, and basic /dev nodes such as null, zero,
        stdin, stdout, stderr, and tty devices. For file transfer sessions
        using SFTP no additional configuration of the environment is necessary
        if the in-process sftp-server is used, though sessions which use
        logging may require /dev/log inside the chroot directory on some
        operating systems (see sftp-server for details).

Another advantage of the internal-sftp is a performance, as it's not necessary
to run a new sub-process for it.

It may seem that the sshd could automatically use the internal-sftp, when it
encounters the sftp-server, as the functionality is identical and the
internal-sftp has even the above advantages. But there are edge cases, where
there are differences.

Few examples:

    Administrator may rely on a login shell configuration to prevent certain
    users from logging in. Switching to the internal-sftp would bypass the
    restriction, as the login shell is no longer involved.

    Using the sftp-server binary (being a standalone process) you can use some
    hacks, like running the SFTP under sudo.

    For SSH-1 (if anyone is still using it), Subsystem directive is not
    involved at all. An SFTP client using SSH-1 tells the server explicitly,
    what binary the server should run. So legacy SSH-1 SFTP clients have the
    sftp-server name hard-coded.


---

There exist alternative SFTP implementations that can be used together with OpenSSH:
    



?

you can prevent ssh and scp but still allow sftp if you use /sbin/nologin

    那目录能随便看喽?
