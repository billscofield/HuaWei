## 方式

sssd

winbind

nslcd

/etc/krb5.conf

    这个配置文件有域的信息

    https://www.jb51.net/article/44306.htm

## 公司的

yum install -y
    pam_krb5
    pam_krb5.x86_64
    authconfig-gtk
    nss-pam-ldapd
    openldap openldap-clients

yum -y remove sssd sssd-common

rsync -av krb5.conf nslcd.conf nsswitch.conf /etc/skel/

    nslcd(local LDAP name service daemon)
        Naming services LDAP client daemon

        Description-en: daemon for NSS and PAM lookups using LDAP This package
        provides a daemon for retrieving user accounts and similar system
        information from LDAP. It is used by the libnss-ldapd and libpam-ldapd
        packages but is not very useful by itself.

    nsswitch

        yum search nsswitch
        yum info nss-pam-ldapd.x86_64

        Summary     : An nsswitch module which uses directory servers
        URL         : http://arthurdejong.org/nss-pam-ldapd/
        License     : LGPLv2+
        Description : The nss-pam-ldapd daemon, nslcd, uses a directory server to look up name
                    : service information (users, groups, etc.) on behalf of a lightweight
                    : nsswitch module.

## 我的实验

yum install -y
    krb5-workstation
    realmd
    adcli
    oddjob
    oddjob-mkhomedir
    samba samba-common-tools
    sssd samba-common

centos 只要安装上述包，然后 realm join xx.com -U administrator 就可以加入 windows 域了, 但是和公司的不一样

## 安装包 

1. 软件包1

    yum install -y gamin.x86_64

    Description-en: File and directory monitoring system
    Gamin is a file and directory monitoring system which allows
    applications to detect when a file or a directory has been added,
    removed or modified by somebody else.
    .
    It can be used by desktops like KDE, GNOME or Xfce to have their
    virtual file systems keep track of changes to files and directories.
    For example, if a file manager displays a directory to the user, and
    the user removes one of the files via the command-line, gamin will
    notify the file manager of this change so that it can update the
    directory display.
    .
    Gamin has been designed as a drop-in replacement for FAM with security
    and maintainability in mind and can use Linux's advanced inotify
    service when available.

2. 软件包2

    yum -y install /media/liujiao/packages/libsasl2-2.1.19-5mdk.i586.rpm
    apt-cache show libsasl2-2

    Description-en: Cyrus SASL - authentication abstraction library
    This is the Cyrus SASL API implementation, version 2.1.
    .
    SASL is the Simple Authentication and Security Layer, a method for
    adding authentication support to connection-based protocols. To use
    SASL, a protocol includes a command for identifying and
    authenticating a user to a server and for optionally negotiating
    protection of subsequent protocol interactions. If its use is
    negotiated, a security layer is inserted between the protocol and the
    connection. See RFC 2222 for more information.
    .
    Any of: ANONYMOUS, CRAM-MD5, DIGEST-MD5, GSSAPI (MIT or Heimdal
    Kerberos 5), NTLM, OTP, PLAIN, or LOGIN can be used.

3. 软件包3

    ` yum install -y libfam*

    apt-cache search libfam
    apt-cache show libfam0

    Description-en: Client library to control the FAM daemon
    FAM monitors files and directories, notifying interested applications
    of changes.
    .
    This package provides a shared library to allow programs to connect to
    the FAM daemon and ask for files to be monitored.

    提供了另一种监视linux系统变化的机制。fam由两部分构成：famd，用以监听客户请
    求并在文件系统变化后提供通知的daemon进程；libfam,客户端应用程序与famd交互的
    接口。
