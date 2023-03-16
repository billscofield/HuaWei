## 实验环境

名称            IP              用途
ldap master01    10.0.11.        
ldap master02    10.0.11.        
ldap client01    10.0.11.        
ldap client02    10.0.11.        

## 0. 配置yum源

mv CentOS-Base.repo CentOS-Base.repo.ori && mv CentOS-7.repo CentOS-7.repo.ori
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

yum clean all && yum makecache

## 1. 时钟同步

```
* */1 * * * ntpdate time.windows.com &>/dev/null
```

## 2. 关闭selinux和防火墙firewalld

sed -i '/SELINUX/s/enforcing/disabled/' /etc/selinux/config¬
setenforce 0

systemctl disable firewalld.service
systemctl stop firewalld.service

## 3. 安装OpenLDAP

yum install -y openldap
yum install -y openldap-servers
yum install -y openldap-clients

yum install -y compat-openldap
yum install -y openldap-servers-sql
yum install -y openldap-devel
yum install -y migrationtools

    OpenLDAP is an open source suite of LDAP (Lightweight Directory Access
    Protocol) applications and development tools. LDAP is a set of protocols
    for accessing directory services (usually phone book style information, but
    other information is possible) over the Internet, similar to the way DNS
    (Domain Name System) information is propagated over the Internet. 

1. OpenLDAP
    The openldap package contains configuration files, libraries, and
    documentation for OpenLDAP.

2. openldap-servers
    This package contains the slapd server and related files.

3. openldap-clients
    The openldap-clients package contains the client programs needed for
    accessing and modifying OpenLDAP directories.

4. compat-openldap
    The compat-openldap package includes older versions of the OpenLDAP shared
    libraries which may be required by some applications.

5. openldap-servers-sql
    This package contains a loadable module which the slapd server can use to
    read data from an RDBMS.

6. openldap-devel
    Install this package only if you plan to develop or will need to compile
    customized LDAP clients.

7. migrationtools
    The MigrationTools are a set of Perl scripts for migrating users, groups,
    aliases, hosts, netgroups, networks, protocols, RPCs, and services from
    existing nameservices (flat files, NIS, and NetInfo) to LDAP.

## 4. 配置OpenLDAP

[root@master1 openldap]# pwd
/etc/openldap
[root@master1 openldap]# tree
.
├── certs
│   ├── cert8.db
│   ├── key3.db
│   ├── password
│   └── secmod.db
├── check_password.conf
├── ldap.conf
├── schema
│   ├── collective.ldif
│   ├── collective.schema
│   ├── corba.ldif
│   ├── corba.schema
│   ├── core.ldif
│   ├── core.schema
│   ├── cosine.ldif
│   ├── cosine.schema
│   ├── duaconf.ldif
│   ├── duaconf.schema
│   ├── dyngroup.ldif
│   ├── dyngroup.schema
│   ├── inetorgperson.ldif
│   ├── inetorgperson.schema
│   ├── java.ldif
│   ├── java.schema
│   ├── misc.ldif
│   ├── misc.schema
│   ├── nis.ldif
│   ├── nis.schema
│   ├── openldap.ldif
│   ├── openldap.schema
│   ├── pmi.ldif
│   ├── pmi.schema
│   ├── ppolicy.ldif
│   └── ppolicy.schema
└── slapd.d
    ├── cn=config
    │   ├── cn=schema
    │   │   └── cn={0}core.ldif
    │   ├── cn=schema.ldif
    │   ├── olcDatabase={0}config.ldif
    │   ├── olcDatabase={-1}frontend.ldif
    │   ├── olcDatabase={1}monitor.ldif
    │   └── olcDatabase={2}hdb.ldif
    └── cn=config.ldif

5 directories, 39 files
[root@master1 openldap]# rpm -qa | grep openldap
openldap-servers-2.4.44-24.el7_9.x86_64
openldap-clients-2.4.44-24.el7_9.x86_64
openldap-2.4.44-24.el7_9.x86_64

NOTE:

    从openldap2.4.23版本开始，所有配置都保存在 **/etc/openldap/slapd.d** 目录下的
    cn=config文件夹内，不再使用slapd.conf作为配置文件。配置文件的后缀为 ldif，
    且每个配置文件都是通过命令自动生成的，任意打开一个配置文件，在开头都会有一
    行注释，说明此为自动生成的文件，请勿编辑，使用ldapmodify命令进行修改

    > # AUTO-GENERATED FILE - DO NOT EDIT!! Use ldapmodify.

### [Configuration Layout](https://openldap.org/doc/admin24/slapdconf2.html)

The slapd configuration is stored as a special LDAP directory with a predefined
schema(架构) and DIT.

There are specific objectClasses used to carry global configuration options,
schema definitions, backend and database definitions, and assorted(各种各样的，
混杂的) other items.

| Sample configuration tree:
|   
|                       +-----------------------+
|                       | cn=config             |
|                       | Global config options |
|                       +-----------------------+
|                                   |
|            +----------------------+---------------------+
|            |                      |                     |
|           \|/                    \|/                   \|/
|   +------------------+    +---------------+   +---------------------+
|   | cn=module{0}     |    | cn=schema     |   | olcDatabase={1}bdb  |
|   | A set of modules |    | System schema |   | A back-bdb instance |
|   +------------------+    +---------------+   +---------------------+
|                                   |
|                                  \|/
|              +--------------------+---------------------+
|             \|/                                        \|/
|   +---------------+                             +---------------+
|   | cn={0}core    |                             | cn={1}cosine  |
|   | Core schema   |                             | COSINE schema |
|   +---------------+                             +---------------+
|   


Other objects may be part of the configuration but were omitted from the illustration for clarity.
(其他对象可能是配置的一部分，但为了清晰起见，在插图中省略了。)

The slapd-config configuration tree has a very specific structure. 
The root of the tree is named **cn=config** and contains global configuration settings.
Additional settings are contained in separate child entries:

    1. Dynamically loaded modules
        These may only be used if the --enable-modules option was used to configure the software.
        
    2. Schema definitions
        The cn=schema,cn=config entry contains the system schema (all the schema that is hard-coded in slapd).
        Child entries of cn=schema,cn=config contain user schema as loaded from config files or added at runtime.
        
    3. Backend-specific configuration
        
    4. Database-specific configuration
        Overlays are defined in children of the Database entry.
        Databases and Overlays may also have other miscellaneous children.

Some of the entries listed above have a numeric index "{X}" in their names.

While most configuration settings have an inherent(内在的，固有的) ordering
dependency (i.e., one setting must take effect before a subsequent one may be
set), LDAP databases are inherently unordered.

The numeric index is used to enforce a consistent ordering in the configuration
database, so that all ordering dependencies are preserved.

In most cases the index does not have to be provided; it will be automatically
generated based on the order in which entries are created.

Configuration directives are specified as values of individual attributes. 

Most of the attributes and objectClasses used in the slapd configuration have a
prefix of "olc" (OpenLDAP Configuration) in their names.

Generally there is a one-to-one correspondence between the attributes and the
old-style slapd.conf configuration keywords, using the keyword as the attribute
name, with the "olc" prefix attached.

A configuration directive may take arguments. If so, the arguments are
separated by whitespace. If an argument contains whitespace, the argument
should be enclosed in double quotes "like this". In the descriptions that
follow, arguments that should be replaced by actual text are shown in brackets
<>.

The distribution contains an example configuration file that will be installed
in the /usr/local/etc/openldap directory. A number of files containing schema
definitions (attribute types and object classes) are also provided in the
/usr/local/etc/openldap/schema directory.

### 配置示例

[link](https://www.qiansw.com/how-to-install-openldap-in-centos7-system.html)

安装openldap后，会有三个命令用于修改配置文件，分别为
    ldapadd
    ldapmodify
    ldapdelete
顾名思义就是添加，修改和删除。而需要修改或增加配置时，则需要先写一个ldif后缀的
配置文件，然后通过命令将写的配置更新到slapd.d目录下的配置文件中去，

1. 生成管理员密码

    ```
    slappasswd -s mima
    >> {SSHA}U7scarx5fP28oJ0QLpxHDSgH80cjAV14
    ```

    // 新增修改密码文件,ldif为后缀，文件名随意，不要在 /etc/openldap/slapd.d/
    目录下创建类似文件

    // 生成的文件为需要通过命令去动态修改ldap现有配置，如下，我在家目录下，创建
    文件

    ```cd ~ ; vim changepwd.ldf

    dn: olcDatabase={0}config,cn=config

    ```

2. 配置 OpenLDAP 服务器

    1. OpenLDAP服务器配置文件位于 /etc/openldap/slapd.d/。要开始配置LDAP，我们
       需要更新变量 olcSuffix 和 olcRootDN。

    2. olcSuffix - 数据库后缀，它是LDAP服务器提供信息的域名。简单来说，它应该更
       改为您的域名。

    3. olcRootDN - 具有对LDAP执行所有管理活动的无限制访问权限的用户的根专有名称
       （DN）条目，如root用户。

    4. olcRootPW - 上述RootDN的LDAP管理员密码。

    以上条目需要在 /etc/openldap/slapd.d/cn=config/olcDatabase={2}hdb.ldif 文件
    中更新。不要手动编辑LDAP配置文件，所有的变动都应该使用 ldapmodify 命令行工
    具来操作，执行该命令行工具时，手动操作所做的变动都会丢失。

---

    1. 创建一个.ldif文件。添加以下条目，需要将域名和SSHA 密码更换为你自己的正确值：

        ```
        dn: olcDatabase={2}hdb,cn=config
        changetype: modify
        replace: olcSuffix
        olcSuffix: dc=qiansw,dc=com
        
        dn: olcDatabase={2}hdb,cn=config
        changetype: modify
        replace: olcRootDN
        olcRootDN: cn=root,dc=qiansw,dc=com
        
        dn: olcDatabase={2}hdb,cn=config
        changetype: modify
        replace: olcRootPW
        olcRootPW: {SSHA}U7scarx5fP28oJ0QLpxHDSgH80cjAV14
        ```

    2. 将配置发送到LDAP服务器：

        执行 ldapmodify -Y EXTERNAL -H ldapi:/// -f db.ldif，输出：
        
        ```
        SASL/EXTERNAL authentication started
        SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
        SASL SSF: 0
        modifying entry "olcDatabase={2}hdb,cn=config"
        
        modifying entry "olcDatabase={2}hdb,cn=config"
        
        modifying entry "olcDatabase={2}hdb,cn=config"
        ```
    
    3. 对/etc/openldap/slapd.d/cn=config/olcDatabase={1 }monitor.ldif （不要手
       动编辑）文件进行更改，以仅将监视器访问限制为ldap root（root）用户而不是
       其他用户。
        
       创建 monitor.ldif，输入使用以下信息：
        
       ```
       dn: olcDatabase={1}monitor,cn=config
       changetype: modify
       replace: olcAccess
       olcAccess: {0}to * by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external, cn=auth" read by dn.base="cn=root,dc=qiansw,dc=com" read by * none
       ```
    4. 更新文件后，将配置发送到LDAP服务器。

    执行 ldapmodify -Y EXTERNAL -H ldapi:/// -f monitor.ldif 输出：

    ```
    SASL/EXTERNAL authentication started
    SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
    SASL SSF: 0
    modifying entry "olcDatabase={1}monitor,cn=config"
    ```

3. 设置 OpenLDAP 数据库

    1. 将示例数据库配置文件复制到/var/lib/ldap并更新文件权限。

        ```
        cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
        chown ldap:ldap /var/lib/ldap/ -R
        ```

    2. 添加cosine和nis LDAP模式。

        ```
        ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/cosine.ldif
        ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/nis.ldif 
        ldapadd -Y EXTERNAL -H ldapi:/// -f /etc/openldap/schema/inetorgperson.ldif
        ```

    3. 创建 base.ldif 为您的域生成文件。使用以下信息。您可以根据自己的要求进行修改。

        ```
        dn: dc=qiansw,dc=com
        dc: qiansw
        objectClass: top
        objectClass: domain
        
        dn: cn=root ,dc=qiansw,dc=com
        objectClass: organizationalRole
        cn: root
        description: LDAP Manager
        
        dn: ou=People,dc=qiansw,dc=com
        objectClass: organizationalUnit
        ou: People
        
        dn: ou=Group,dc=qiansw,dc=com
        objectClass: organizationalUnit
        ou: Group
        ```

        构建目录结构：ldapadd -x -W -D "cn=root,dc=qiansw,dc=com" -f base.ldif
        此次需要输入上面步骤设置的 root 密码。

4. 创建 LDAP 用户

    您可以将本地用户迁移到LDAP，而不是创建新用户。

    我们为名为 raj 的新用户创建一个LDIF文件。

    ```
    vim raj.ldif
    dn: uid=raj,ou=People,dc=qiansw,dc=com
    objectClass: top
    objectClass: account
    objectClass: posixAccount
    objectClass: shadowAccount
    cn: raj
    uid: raj
    uidNumber: 9999
    gidNumber: 100
    homeDirectory: /home/raj
    loginShell: /bin/bash
    gecos: Raj [Admin (at) qiansw]
    userPassword: {crypt}x
    shadowLastChange: 17058
    shadowMin: 0
    shadowMax: 99999
    shadowWarning: 7
    ```

    使用带有上述文件的ldapadd命令在OpenLDAP目录中创建名为“ raj ” 的新用户。

    ldapadd -x -W -D "cn=root,dc=qiansw,dc=com" -f raj.ldif

    输出：adding new entry "uid=raj,ou=People,dc=qiansw,dc=com"
    变更 raj 的密码为 password123：

    ldappasswd -s password123 -W -D "cn=root,dc=qiansw,dc=com" -x "uid=raj,ou=People,dc=qiansw,dc=com"

    -s指定用户名的密码
    -x用户名，密码已更改
    -D要对LDAP服务器进行身份验证的可分辨名称。

    1. 验证LDAP条目。

    ldapsearch -x cn=raj -b dc=qiansw,dc=com

    输出：
    ```
    # extended LDIF
    #
    # LDAPv3
    # base <dc=qiansw,dc=com> with scope subtree
    # filter: cn=raj
    # requesting: ALL
    #

    # raj, People, qiansw.com
    dn: uid=raj,ou=People,dc=qiansw,dc=com
    objectClass: top
    objectClass: account
    objectClass: posixAccount
    objectClass: shadowAccount
    cn: raj
    uid: raj
    uidNumber: 9999
    gidNumber: 100
    homeDirectory: /home/raj
    loginShell: /bin/bash
    gecos: Raj [Admin (at) qiansw]
    shadowLastChange: 17058
    shadowMin: 0
    shadowMax: 99999
    shadowWarning: 7
    userPassword:: e1NTSEF9MlZkUVJFWEhUemdyRnhBT3dDS3lyb1B4eVFrbWhaM0M=

    # search result
    search: 2
    result: 0 Success

    # numResponses: 2
    # numEntries: 1
    ```

    1. 从LDAP中删除条目（可选）。

        ldapdelete -W -D "cn=root,dc=qiansw,dc=com" "uid=raj,ou=People,dc=qiansw,dc=com"

    还可以使用 Apache Directory Studio 图形化 LDAP 管理工具 来管理 ldap。

5. 防火墙-Firewall

    如果开启了防火墙，还需要将 LDAP 服务添加到防火墙（TCP 389）。

    firewall-cmd --permanent --add-service=ldap
    firewall-cmd --reload

6. 启用LDAP日志记录

    配置Rsyslog以将LDAP事件记录到日志文件/var/log/ldap.log。

    vim /etc/rsyslog.conf
    将以下行添加到/etc/rsyslog.conf文件中。

    local4.* /var/log/ldap.log

    重新启动rsyslog服务。
    systemctl restart rsyslog

7. LDAP客户端配置以使用LDAP服务器

    在客户端计算机上安装必要的LDAP客户端软件包。
        yum install -y openldap-clients nss-pam-ldapd

    执行以下命令将客户端计算机添加到LDAP服务器以进行单点登录。将“192.168.1.10”替换为LDAP服务器的IP地址或主机名。
        authconfig --enableldap --enableldapauth --ldapserver=192.168.1.10 --ldapbasedn="dc=51cto,dc=com" --enablemkhomedir --update

    重新启动LDAP客户端服务。
        systemctl restart nslcd

    验证LDAP登录
    使用getent命令从LDAP服务器获取LDAP条目。
        getent passwd raj

    输出：
        raj:x:9999:100:Raj [Admin (at) qiansw]:/home/raj:/bin/bash

    要验证LDAP，请使用客户端计算机上的LDAP用户“ raj ” 登录。
