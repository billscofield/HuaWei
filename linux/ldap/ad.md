




主控        linux               windows

方式    openldap/samba


client  linux/windows/mac    linux/windows/mac


## 1. windows AD

### 1. linux 加入 windows AD 域

使用pbis-open使Linux服务器加入AD域控

    https://github.com/BeyondTrust/pbis-open/releases/

    https://blog.csdn.net/algebra007/article/details/127923530


## 2. Linux openldap




## 理解


nslcd
sssd
    nslcd 并没有缓存的功能，它是专门为本地处理有关 LDAP 名称服务查询的后台进程，
    查询结果依然由 nscd 缓存。

    Migrating authentication from nslcd to SSSD

    **Realmd** provides a simplified way to discover and interact with Active
    Directory domains. It employs **sssd** to do the actual lookups required
    for remote authentication and other heavy work of interacting with the
    domain.

    sssd on a Linux system is responsible for enabling the system to access
    authentication services from a remote source such as Active Directory. In
    other words, it is the primary interface between the directory service and
    the module requesting authentication services, realmd.

nscd
    nscd目前只支持缓存四种名称服务: passwd, group, hosts, services


nss(name service switch)
    The  **getent** command displays entries from databases supported by the Name
    Service Switch libraries, which are configured in /etc/nsswitch.conf.


在RedHat系统中可以使用authconfig命令查看当前的认证模式配置，例如：
    authconfig --test | egrep -i 'ldap|sss'
    authconfig --test | egrep -i 'ldap|sss|pam|nss'

在Debian/Ubuntu系统中则可使用auth-client-config工具查看当前的NSS和PAM配置




https://www.cnblogs.com/somata/p/LinuxLDAPUserAuthentication.html
