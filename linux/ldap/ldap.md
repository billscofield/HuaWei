# openldap

目录是一类为了浏览和搜索数据而设计的特殊的数据库

https://www.openldap.org/doc/admin24/slapdconf2.html

## what is ldap? what does X in X.500 stand for?

X.500 is a set of standards for directory services, which provide a way to
store and organize information about network resources in a centralized,
hierarchical database. The X.500 standards were developed by the International
Telecommunication Union (ITU) in the 1980s.

**The "X" in X.500 stands for "Xerox," which was one of the companies involved in
the early development of the standards**. Initially, the X.500 standards were
developed as a way to create a distributed directory service for the Xerox
Corporation's Ethernet network. However, the standards were later adopted by
other organizations and became widely used as a way to manage network
resources.

LDAP, or Lightweight Directory Access Protocol, is a simpler, lightweight
version of X.500 that was developed in the 1990s. LDAP is designed to be faster
and more efficient than X.500, and is now the most widely used protocol for
directory services. While LDAP is not a direct successor to X.500, it was
influenced by the X.500 standards and is often used as a replacement for X.500
in many organizations.

-- From ChatGPT

## 什么是LDAP？

（一）在介绍什么是LDAP之前，我们先来复习一个东西：“什么是目录服务？”

    1. 目录服务是一个特殊的数据库，用来保存描述性的、基于属性的详细信息，支持过
       滤功能。

    2. 是动态的，灵活的，易扩展的。

    如：人员组织管理，电话簿，地址簿。

（二）了解完目录服务后，我们再来看看LDAP的介绍：

X.500是一套已经被国际标准化组织（ISO）接受的**目录服务系统标准**，它定义了一个机构
如何在全局范围内共享其名字和与之相关的对象。X.500是层次性的，其中的管理域（机构、
分支、部门和工作组）可以提供这些域内的用户和资源信息。在PKI体系中，X.500被用来
唯一标识一个实体，该实体可以是机构、组织、个人或一台服务器。X.500被认为是实现目
录服务的最佳途径，但X.500的实现投资较大，并且比其他方式速度慢，而其优势具有信息
模型、多功能和开放性

LDAP（Lightweight Directory Access Portocol），它是基于X.500标准的轻量级目录访
问协议。

目录是一个为查询、浏览和搜索而优化的数据库，它成树状结构组织数据，类似文件目录
一样。

目录数据库和关系数据库不同，它有优异的读性能，但写性能差，并且没有事务处理、回
滚等复杂功能，不适于存储修改频繁的数据。所以目录天生是用来查询的，就好象它的名
字一样。

LDAP目录服务是由目录数据库和一套访问协议组成的系统。

（三）为什么要使用

LDAP是开放的Internet标准，支持跨平台的Internet协议，在业界中得到广泛认可的，并
且市场上或者开源社区上的大多产品都加入了对LDAP的支持，因此对于这类系统，不需单
独定制，只需要通过LDAP做简单的配置就可以与服务器做认证交互。“简单粗暴”，可以大
大降低重复开发和对接的成本。

**可以和微软的AD域打通**

OpenLDAP 默认以 Berkeley DB 作为后端数据库，Berkeley DB 数据库主要以散列的数据
类型进行数据存储，如以键值对的方式进行存储。

OpenLDAP 通过 ACL 灵活控制用户访问数据的权限

OpenLDAP 基于推和拉的机制实现节点间数据同步，简称赋值(replication)

支持几乎所有平台(linux, windows, macos, unix ...)

LDAP的主要产品

细心的朋友应该会主要到，LDAP的中文全称是：轻量级目录访问协议，说到底LDAP仅仅是一
个访问协议，那么我们的数据究竟存储在哪里呢？

我们一起看下下面的表格：

+-------------+----------------------------+-----------------------------------------+
|厂商         | 产品                       |介绍                                     |
+-------------+----------------------------+-----------------------------------------+
|SUN          | SUNONE Directory Server    |基于文本数据库的存储，速度快 。          |
+-------------+----------------------------+-----------------------------------------+
|IBM          | IBM Directory Server       |基于DB2 的的数据库，速度一般。           |
+-------------+----------------------------+-----------------------------------------+
|Novell       | Novell Directory Server    |基于文本数据库的存储，速度快, 不常用到。 |
+-------------+----------------------------+-----------------------------------------+
|Microsoft    | Microsoft Active Directory |基于WINDOWS系统用户，对大数据量处理速度  |
|             |                            |般，但维护容易，生态圈大，管理相对简单   |
+-------------+----------------------------+-----------------------------------------+
|Opensource   | Opensource                 |OpenLDAP 开源的项目，速度很快，但是非主流|
|             |                            |应用。                                   |
+-------------+----------------------------+-----------------------------------------+

有两个国际标准:

    X.500 和 LDAP(实际上是X.500的简化版本, 是X.500的子集), 应该是衍生物

    X.500, a **directory protocol standard** developed by the International
    Telecommunications Union (ITU).

    LDAP, a derivative of the X.500 protocol developed as an open source
    project by the Open System Interconnection – Directory Services (OSI-DS)
    and the Internet Engineering Task Force (IETF)

    [link](https://www.collectionscanada.gc.ca/iso/ill/document/ill_directory/X_500andLDAP.pdf)

    X.500 is a directory service standard that was introduced by the
    International Organization for Standardization (ISO) in 1988. It defines a
    directory service that is used to store and retrieve information about
    network resources, such as users, computers, and other network resources.

    LDAP, which stands for Lightweight Directory Access Protocol, is an
    Internet standard protocol that was originally created to provide access to
    X.500-based directory services over the Internet. **LDAP is a simplified
    version of the X.500 directory service protocol, designed to be easier to
    use and more lightweight.**

    LDAP is based on the same concepts as X.500, but with a simpler and more
    efficient design. It is used to access and manage information in directory
    services, and is often used in conjunction with X.500-based directory
    services.

    In summary, LDAP is a simplified version of X.500, designed for use over
    the Internet. While X.500 defines the directory service standard, LDAP
    provides a simpler, more lightweight protocol for accessing and managing
    directory services based on X.500.

    From [chatGPT]

    ---

    X.500 实际上是一个协议族，包括了从 X.501 到 X.525 

    apt-cache search openldap

        slapd - OpenLDAP server (slapd)
            The SLAPD (Standalone LDAP Daemon)

            SLURPD (Stand-alone LDAP update replication daemon) 

    LDAP是基于TCP/IP的,运行在TCP/IP或者其他的面向连接的传输服务之上, X.500 基于
    OSI协议


DNS 是一个典型的大范围分布式目录服务的例子

是一个安全的协议，LDAP v3 支持SASL(Simple Authentication and Security Layer)、
SSL(Secure Socket Layer) 和 TLS(Transport Layer Security)

OpenLDAP 服务默认使用非加密的 TCP/IP 协议来接收服务的请求，并将查询结果传回到客
户端。由于大多数目录服务都是用于系统的安全认证部分比如：用户登录和身份验证，所
以它也支持使用基于 SSL/TLS 的加密协议来保证数据传送的保密性和完整性。OpenLDAP
是使用 OpenSSL 来实现 SSL/TLS 加密通信的。

X.500特征
    分散维护
    搜索性能


## 实际上整个 OpenLDAP 的架构大致包含 3个部分:

1. OpenLDAP

    首先，是 OpenLDAP 的服务器本身，这个东西其实只相当于是一个 mysql 数据库，它
    是没有酷炫的图形界面的，如果你愿意每次都手敲一大堆代码，也可以用它，但这种
    反人类的设计真的不是给人用的。

2. phpLDAPadmin

    所以，你需要安装一个叫作 phpLDAPadmin的工具，好歹这是一个图形界面，虽然奇丑
    无比，并且配置起来也并不容易。

    LdapAdmin:  a free Windows LDAP client and administration tool for LDAP
    directory management

3. PWM

    光装管理工具还不够，你总要给用户提供一个修改密码的地方。

4. 客户端

5. 最后，你还需要配置各种工具。

## OpenLDAP Software is an open source implementation of the Lightweight Directory Access Protocol.

https://www.openldap.org/

The suite includes:

    1. lloadd - stand-alone LDAP Load Balancer Daemon (server or slapd module)

    2. slapd - stand-alone LDAP daemon (server)

    3. libraries implementing the LDAP protocol, and utilities, tools, and sample clients.

Also available from the OpenLDAP Project:

    1. Fortress - Role-based identity access management Java SDK

    2. JLDAP - LDAP Class Libraries for Java

    3. JDBC-LDAP - Java JDBC - LDAP Bridge Driver
    
    4. LMDB - Lightning Memory-Mapped Database

## 名词解释

entry

    The LDAP information model is based on entries.  An entry is a collection
    of attributes that has a globally-unique Distinguished Name (DN). The DN is
    used to refer to the entry unambiguously. 
    
    Each of the entry's attributes has a type and one or more values. The types
    are typically mnemonic strings, like "cn" for common name, or "mail" for
    email address. 

cn ou dc 

uid ou dc 

1. dc      Domain Component
    域名的部分，其格式是将完整的域名分成几部分，如域名为example.com变成
    dc=example,dc=com（一条记录的所属位置）

1. ou      Organization Unit
    组织单位，组织单位可以包含其他各种对象（包括其他组织单元），如“oa组”（一条
    记录的所属组织）, 其他人

    ou 也是一种条目-容器条目，ou下边即真正的用户条目

1. cn      Common Name???
    公共名称，如“Thomas Johanson”（一条记录的名称）

1. uid     User Id
    用户ID songtao.xu（一条记录的ID）

1. sn      Surname
    姓，如“许”

1. dn      Distinguished Name
    一条记录的位置（唯一）每个对象都有一个唯一的名称，如 “uid=songtao.xu,ou=oa
    组,dc=example,dc=com”，

    类似于关系数据库的主键，它是一个识别属性，通常用于检索.

    DN的两种设置:
        1. 基于 cn (姓名), cn=test,ou=auth,dc=abc,dc=org, 最常见的cn是
           /etc/group 转来的条目

        2. 基于 uid (User ID), uid=test,ou=auth,dc=abc,dc=org, 最常见的uid是
           /etc/passwd 转来的条目

    Base DN
        目录树的最顶部就是根

    LDIF 格式 
        用于 LDAP 数据导入、导出的格式.

        LDAP Interchange Format   在RFC2849中定义的标准，用于规范LDAP的配置和目
        录内容等详细信息的保存，后续的例子中将会较多地使用LDIF进行增删改查的操作
        。 ASCII 文件格式

    LDIF 文件特点
        1. 通过空行分割一个条目

        2. 注释以 hash 开头

        3. 属性: 值     冒号后有一个空格

        4. 属性可以被重复赋值。

        5. 每个属性独立一行，结尾不允许有空格

1. rdn     Relative dn

    相对辨别名，类似于文件系统中的相对路径，它是与目录树结构无关的部分，如“
    uid=tom”或“cn= Thomas Johansson”

1. c    country 国家

1. o    organization 组织名

Directory   目录，用于存放信息的单元

Entry       条目，LDAP的基本信息单元

    条目是具有分辩名 DN(Distinguished Name) 的属性-值对(Attribute-Value,简称AV)
    的集合

    每个Entry都可以有多个属性，而每个属性都有特定的类型和一个或多个取值，比如cn
    （Common Name）就是一个属性

    LDAP 目录通常也用 ROOT 作为根, 叫做 BaseDN

    LDAP允许你通过一种叫做 objectClass 的特殊属性来控制哪些属性是条目所必须的，
    哪些是可选的。

DIT(Directory Information Tree) 目录信息树

Root DSE (Root DSA-specifit entry) 根节点项

## configuration

Although the slapd-config system stores its configuration as (text-based) LDIF
files, **you should never edit any of the LDIF files directly**.  Configuration
changes should be performed via LDAP operations, e.g. ldapadd, ldapdelete, or
ldapmodify.

## 常见 objectClass

dcobject

organizationalUnit

posixAccount

## Attribute

o           organizationName 一个组织的名字

posixGroup:     cn   gidNumber userPassword
posixAccount:   cn    gidNumber    homeDirectory    uid    uidNumber

```
dn: uid=user01,ou=People,dc=etiantian,dc=org
    objectClass: posixAccount
    objectClass: inetOrgPerson
    objectClass: organizationalPerson
    homeDirectory: /home/
    loginShell: /bin/bash

objectClass 特殊属性，包含数据存储的方式以及相关属性信息

rdn

uid         userid 某个用户的登录名，与linux系统中用户的uid不同
```
sn          一个人的姓

givenName   一个人的名字

I           通常指一个地方的名字

dc

ou          organizationUnitName 指一个组织单元的名字

cn          common name, 通常指一个对象的名称，如果是人，需要使用全名

mail

telephoneNumber

c           country, 通常指一个二位国家的名称，如 CN, US


schema 生产 objectClass, objectClass 生成 attribute, attribute 的产生主要是为了
方便人们所理解，单位了方便计算机处理，通常使用一组数字来标识这些对象，类似于
SNMP 中 MIB2 概念


|           c=GB        c=US
|                        |
|                       \|/
|                  st=California
|                        |
|                       \|/
|                     o=Acme                    // Th Organization
|                       /\
|                      /  \
|                     /    \
|                 ou=Sales  ou=Marketing        // Organization Unit
|                   /
|           cn=Alice                            // Person
|
|   LDAP directory tree (traditional naming)
|
|
|
|
|          +------+------+
|         /       |       \
|        /        |        \
|   dc=net      dc=com      dc=org
|                 |
|               dc=lca                  //The organisation
|                / \ 
|       ou=People   ou=Servers          //Organisation Unit
|   cn
|
|   LDAP directory tree (Internet naming)

## LDIF 文件

1. 通过空行来分割一个条目或定义
2. sharp 注释
3. 赋值,  属性:值
4. 属性可以被重复赋值,例如 objectlcass, 
5. 每个树形一行
6. 结尾不能有空行

## LDAP 的几个重要配置模式

1. 基本的目录查询服务
2. 目录查询代理服务
3. 异机复制数据

## 安装

sed -i '/SELINUX/s/enforcing/disabled/' /etc/selinux/config
setenforce 0

systemctl disable firewalld.service
systemctl stop firewalld.service

yum install -y openldap
yum install -y openldap-servers
yum install -y openldap-clients
yum install -y compat-openldap
yum install -y openldap-servers-sql 
yum install -y openldap-devel
yum install -y migrationtools

chown -R ldap. /var/lib/ldap/DB_CONFIG

systemctl restart slapd

systemctl enable slapd

systemctl status slapd

```
nscd
nss-pam-ldapd
nss-*
pcre
pcre-*
```

slappasswd -s [管理员名称]

    将生成的密码写进 slapd.conf

    rootpw 

## OpenLDAP 相关信息

/var/lib/ldap/                  openldap 数据文件存储位置

/etc/openldap/slapd.d/

/usr/share/openldap-servers/DB_CONFIG.example       模板数据库配置文件模板

/etc/openldap/schema/           openldap schema 规范存放位置

默认监听端口: 389(明文数据传输)
加密监听端口: 636(密文数据传输)

### 配置文件

vi /etc/slapd.conf

    database    bdb     指定数据库，伯克利db
    suffix
    rootdn      "cn=admin,dc=etiantian,dc=com"  root管理员名称

从 OpenLDAP 2.3 版本开始所有配置数据都保存在 /etc/openldap/slapd.d/中，建议不再
使用 slapd.conf 作为配置文件。

配置 OpenLDAP 最正确的姿势是通过ldapmodify命令执行一系列自己写好的 ldif 文件，
而不要修改任何 OpenLDAP 装好的配置文件。

所有配置都保存在/etc/openldap/slapd.d目录下的cn=config文件夹内，不再使用
slapd.conf作为配置文件。配置文件的后缀为 ldif，且每个配置文件都是通过命令自动生
成的，任意打开一个配置文件，在开头都会有一行注释，说明此为自动生成的文件，请勿
编辑，使用ldapmodify命令进行修改

### 数据库配置

centos:

    cp /usr/share/openldap-servers/DB_CONFIG.example  /var/lib/ldap/DB_CONFIG

    chown -R ldap:ldap /var/lib/ldap

### 安装和配置 phpLDAPadmin Web 页面

apt-get install phpldapadmin

yum install phpldapadmin

vim /etc/phpldapadmin/config.php

## 启动 openldap 服务

service ldap start 或 /etc/rc.d/init.d/ldap 或 /usr/sbin/slapd

## 实际操作

以 slap 开头的命令（如： slapcat slapcat）是服务端工具。

以 ldap 开头的命令（如： ldapsearch）是客户端工具;

slaptest    测试 slapd 是否跑起来了

ldapsearch 

数据的增删改

    ldapmodify [ldap服务器地址] [用户名] [密码] [ldif文件地址]

yum provides ldapadd

    openldap-clients

ldapadd

    -x     Use simple authentication instead of SASL.

    -H ldapuri 

        Specify URI(s) referring to the ldap server(s); only the
        protocol/host/port fields are allowed; a list of URI, separated by
        whitespace or commas is expected.

    -D binddn

        Use the Distinguished Name binddn to bind to the LDAP directory.  For
        SASL binds, the server is expected to ignore this value.

    -w passwd

        Use passwd as the password for simple authentication.

    -f file

        Read the entry modification information from file instead of from
        standard input.

    ldapadd -x -H ldap://127.0..2:389 -D "cn=admin,dc=example,dc=org" -w admin

ldapsearch

    -b searchbase

        Use searchbase as the starting point for the search instead of the
        default.

    ldapsearch-x -H ldap://127.0.0.2:389 -b dc=examle,dc=org -D "cn=admin,dc=example,dc=org" -w admin

ldapdelete

    ldapdelete -x -H ldap://127.0.0.2 -D "cn=admin,dc=examle,dc=org" -w admin "cn=Barbara,dc=example,dc=org"

ldapmodify

    ldapmodify, ldapadd - LDAP modify entry and LDAP add entry tools

密码

    ldappasswd
        
        管理员使用，用于重置其他用户的密码
        
        生成随机密码并回显
        
        -s newPasswd
            Set the new password to newPasswd.

    ldapmodify

slapcat 数据导出

## how to let linux use windows AD 

To let a Linux machine use a Windows Active Directory (AD), you need to
configure the Linux machine to use an LDAP client that can connect to the AD
server. Here is a high-level overview of the steps you need to take:

1. Install and configure an **LDAP client** on the Linux machine. There are several
   LDAP clients available for Linux, including **SSSD**, **nss-pam-ldapd**, and **LDAP
   authentication module for PAM**.

2. Join the Linux machine to the AD domain. This can be done using the "realm
   join" command or by editing the "/etc/krb5.conf" file.

3. Configure the LDAP client to use the AD server

---

### what is Kerberos

Kerberos is a computer network authentication protocol that provides a secure
method of authenticating a user or host over an unsecured network. It uses a
client-server model to enable mutual authentication between a client and a
server, as well as secure transmission of user credentials over the network.

In a Kerberos authentication process, a client sends a request for a
ticket-granting ticket (TGT) to the Kerberos authentication server (AS). The AS
responds with the TGT, which the client then presents to the ticket-granting
server (TGS) to obtain a service ticket for the requested service. The TGS
responds with the service ticket, which the client then presents to the service
to gain access.

Kerberos is widely used in enterprise environments to provide a single sign-on
(SSO) authentication mechanism. **It is commonly used with Microsoft Active
Directory to provide secure authentication and authorization for Windows-based
systems**

-- From ChatGPT

### what is sssd?

SSSD stands for System Security Services Daemon. It is a software package for
Linux and Unix-like systems that provides a way to connect to identity and
authentication providers(它是一个用于Linux和类Unix系统的软件包，提供了一种连接
身份和身份验证提供商的方法), such as LDAP, Kerberos, or Active Directory, and
cache the data locally on the system.

SSSD acts as a client for these services, allowing Linux and Unix-like systems
to authenticate against an external identity provider(SSSD 充当这些服务的客户端，
允许 Linux 和类 Unix 系统针对外部身份提供者进行身份验证。). It also provides a
range of caching and performance improvements, making it faster and more
efficient to authenticate users and groups.

In addition to authentication, SSSD provides other security-related services,
such as SELinux user mapping, local credential caching, and integration with
smart cards. It is commonly used in enterprise environments to enable
centralized identity management and authentication across a range of systems.

### what is realm?

realmd is a tool for configuring authentication and domain membership on Linux
systems. It is designed to make it easier to join Linux hosts to an Active
Directory (AD) domain or a Kerberos realm. It works by abstracting the complex
configuration steps needed to join a domain or realm, providing a simple
command-line interface and a set of configuration files that can be easily
modified.

With realmd, users can easily join Linux hosts to an AD domain or a Kerberos
realm, and configure authentication and authorization using the users and
groups defined in the domain or realm. It can also be used to manage keytab
files, which are used to authenticate users and services against the domain or
realm.

Realmd supports a range of authentication mechanisms, including Kerberos, LDAP,
and SMB, and can be used to configure a wide range of Linux-based systems, from
servers to desktops and laptops. It is also designed to work well with other
authentication and identity management tools, such as SSSD and FreeIPA.

In order to join a Windows AD domain, you need to use the realmd package, which
provides a simple way to discover and join identity domains, including Windows
AD domains.

1. Install the realmd package on your Linux system.

2. to discover the Windows AD domain

    realm discover

    realm discover example.com

3. to join the Windows AD domain

    realm join

    realm join example.com -U Administrator

4. Once the join process is complete, you can use the id command to verify that
   the Linux system can now see the Windows AD users and groups:

        id username@example.com

    Replace "username" with the name of a Windows AD user.

### what is the difference of openldap-clients and realmd?

OpenLDAP-Client is a set of LDAP client utilities that allow you to interact
with an LDAP server. It includes tools like ldapadd, ldapsearch, ldapmodify,
and ldapdelete, which are used to add, search, modify, and delete LDAP
directory entries.

On the other hand, realmd is a system daemon and a command-line tool that
simplifies the configuration of network authentication and domain membership.
It provides a simple and consistent way to discover and join identity and
authentication domains, such as Active Directory or LDAP, and it also
configures underlying Linux system services like SSSD or Winbind.

In summary, while OpenLDAP-Client provides a set of tools to interact with LDAP
servers, realmd simplifies the configuration of network authentication and
domain membership for various directory services.

### what is difference of sssd and realmd

SSSD (System Security Services Daemon) and realmd are both tools for joining
Linux systems to Active Directory domains. However, they serve different
purposes and work in different ways.

SSSD is a system daemon that provides authentication, authorization and caching
services to clients using various protocols, including LDAP, Kerberos and
Active Directory. It also provides the ability to create user and group
profiles for disconnected operation. SSSD is designed to work with a variety of
identity and authentication systems, including AD, LDAP, and Kerberos, and can
be used on a variety of Linux distributions.

realmd is a command-line tool that simplifies the process of joining a Linux
system to an Active Directory domain. It does this by automating the
configuration of the necessary system files, including PAM, NSS, and SSSD, and
provides a simple command-line interface for joining a domain. It also supports
features like automatic discovery of domains and configuration of trust
relationships between domains. realmd is designed to work specifically with
Active Directory and is available on several Linux distributions, including Red
Hat Enterprise Linux and CentOS.

In summary, SSSD is a more powerful and flexible tool that provides a wider
range of services and can work with a variety of identity and authentication
systems, while realmd is a more specialized tool that simplifies the process of
joining a Linux system to an Active Directory domain.

### can i only use sssd to join AD without realmd?

Yes, you can use SSSD (System Security Services Daemon) to join an Active
Directory (AD) domain without using realmd.

SSSD is a service daemon that provides a way for Linux and Unix machines to
authenticate against remote identity and authentication providers, including
AD. It includes an LDAP and Kerberos client, and it can cache user and group
information locally to improve performance.

To configure SSSD to join an AD domain, you will need to modify the SSSD
configuration file (/etc/sssd/sssd.conf) and specify the domain name, domain
administrator credentials, and other relevant settings. Once you have
configured SSSD, you can use the realm permit command to allow users in the AD
domain to log in to the local machine.

However, realmd provides a simpler way to configure SSSD to join an AD domain
by automatically configuring the SSSD configuration file based on the
information provided during the realmd setup process.

### can i only use realmd to join AD without sssd?

no, you have to install these:

    realm: Couldn't join realm: Necessary packages are not installed: oddjob,
    oddjob-mkhomedir, sssd, adcli

    yum install -y oddjob oddjob-mkhomedir sssd adcli

Yes, it's possible to use realmd to join an AD domain without using sssd.
However, sssd is a recommended component to enable authentication and
authorization services in the domain environment. When you join a domain using
realmd, it will automatically configure sssd with the appropriate domain
information, and you can use it to authenticate users from the domain.

In summary, realmd is a tool that helps with domain join configuration, and
sssd provides user authentication and authorization services for domain users.
While realmd can be used without sssd, it is recommended to use both to get the
best experience when using AD authentication on a Linux system.

### ?what is nss-pam-ldapd?

nss-pam-ldapd is a name service switch and Pluggable Authentication Module (PAM)
that provides a consistent interface to system name services, such as user and
group accounts, across different protocols, including LDAP. It allows Linux
systems to use an LDAP directory for authentication, authorization, and account
management.

The nss-pam-ldapd package provides the necessary components to configure and
authenticate to LDAP directories through the Name Service Switch (NSS) and
Pluggable Authentication Module (PAM) interfaces. This allows system
administrators to centralize user accounts and group management in a single,
secure, and scalable directory server.

### how to make windows server 2022 have the "unix attributes" in ad role

depracted

In order to add the "unix attributes" tab to Active Directory Users and
Computers (ADUC) on a Windows Server 2022 machine, you will need to install the
"Identity Management for Unix" (IDMU) feature.

Here are the steps to install IDMU:

1. Open the "Server Manager" on your Windows Server 2022 machine.
2. Click on "Add Roles and Features" from the dashboard.
3. Click "Next" on the "Before you begin" screen.
4. Select "Role-based or feature-based installation" and click "Next."
5. Select the appropriate server from the "Server Selection" screen and click
   "Next."
6. Scroll down to the "Features" section and expand the "Remote Server
   Administration Tools" feature.
7. Expand the "Role Administration Tools" feature.
8. Expand the "AD DS and AD LDS Tools" feature.
9. Check the box next to "Identity Management for Unix" and click "Next."
10. Review the installation summary and click "Install" to start the
    installation.

Once the installation is complete, you should be able to see the "unix
attributes" tab in ADUC.

### as dentity Management for UNIX extension used in the following section is now deprecated, how can i manage unix attributes in AD?

In Windows Server 2003 R2 and earlier versions, Microsoft provided the **Identity
Management for UNIX (IDMU)** extension, which allowed administrators to manage
UNIX attributes in Active Directory. However, as you mentioned, IDMU has been
deprecated and is no longer recommended.

In newer versions of Windows Server, including Windows Server 2022, Microsoft
recommends using the **Services for NFS role** or the **Lightweight Directory
Services (LDS) role** to manage UNIX attributes in Active Directory.

Services for NFS is a feature that allows you to share files and directories
between UNIX and Windows systems. It includes a component called User Name
Mapping (UNM) that maps UNIX identities to Windows identities, and vice versa.
This can be used to manage UNIX attributes in Active Directory.

Lightweight Directory Services (LDS) is a role that provides a lightweight,
standalone directory service that can be used to manage directory data. LDS can
be used to create a separate directory for managing UNIX attributes, which can
then be integrated with Active Directory.

Both Services for NFS and Lightweight Directory Services can be installed using
the Server Manager tool in Windows Server. Once installed, you can configure
the appropriate settings to manage UNIX attributes in Active Directory.

### 

wbinfo is a command-line tool used to query and manage users and groups in a
Windows domain. It is part of the Samba suite of tools and provides an
interface to the winbind service, which allows Linux and Unix systems to
integrate with Windows domains.

The realm command, on the other hand, is part of the realmd package, which is
used to join Linux and Unix systems to a Windows Active Directory domain. It is
typically used to automate the process of configuring and joining systems to
the domain, including setting up Kerberos and SSSD for authentication and
authorization.

While both tools are used in the context of integrating Linux and Unix systems
with Windows domains, they have different purposes and capabilities. wbinfo is
primarily used for managing user and group information, while realm is used for
configuring the domain integration itself.

samba-winbind-clients提供了 wbinfo 命令




If the smb.conf file does not have an idmap entry, then the ID mapping for the
AD users and groups is probably being handled by the default ID mapping
settings in Samba.

By default, Samba uses the tdb backend to store its internal state, including
ID mapping information. The default range of IDs used for mapping AD user and
group SIDs to UNIX UIDs and GIDs is from 10000 to 20000. If you have not
specified any other range of IDs for mapping, then the IDs assigned to AD users
and groups will fall within this range.

You can check the current range of IDs used by Samba for mapping by running the
following command:

    pdbedit -L -v

    ldapscripts - Add and remove users and groups (stored in a LDAP directory)

but i didn't find this command in company's linux

This will display a list of all Samba user accounts, along with their assigned
UNIX UID and GID numbers. You can then verify that the assigned UIDs and GIDs
fall within the expected range.

### isnot the map handled by sssd?

Yes, the mapping between the AD and the local system users and groups is
typically handled by SSSD, which is a system daemon for managing access to
remote directories and authentication mechanisms, including AD.

However, Samba and Winbind can also be used to handle the mapping of AD users
and groups to the local system. This is often used for specific scenarios, such
as providing SMB/CIFS file sharing services to Windows clients from a Linux
server that is integrated into an AD domain.

If you're using SSSD for user authentication and you have not configured Samba
or Winbind, then you do not need to have any idmap configuration in smb.conf.

### how to list users of windows AD with sssd

To list users of a Windows AD domain using SSSD, you can use the getent
command. Here's an example command that will list all users:

    getent passwd

This will list all users on the system, including those from AD that have been
cached by SSSD.

Note that this will only show the AD users that have been cached by SSSD. If a
user has not logged in to the system recently, their information may not be
cached and they will not appear in the list. You can use the sssd command to
manually refresh the cache:

    systemctl restart sssd


### how many types are there to join linux into window AD?

There are multiple ways to join Linux into a Windows AD, but some of the most
common methods are:

1. SSSD:
    SSSD is a system daemon for authentication and authorization that provides
    an interface to connect to a variety of identity and authentication
    providers, including Active Directory.

    Realmd: Realmd is a system service that provides a way to discover and join
    identity domains. It provides a simple command-line and GUI tool to
    discover and join domains.

2. Samba:

    Samba is an open-source implementation of the SMB/CIFS networking protocol,
    which includes tools for integrating Linux servers and desktops into a
    Windows network, including joining a domain.

3. OpenLDAP:

    OpenLDAP is an open-source implementation of the LDAP protocol. It can be
    used to authenticate and authorize Linux users against a Windows AD.

These methods have their own advantages and disadvantages, and the choice of
which one to use depends on the specific requirements and constraints of your
environment.




### how to use openldap to join centos7 into a windows AD detailly

    yum install
        samba-common
            包含
            samba-common-4.10.16-20.el7_9.noarch

        openldap
            openldap-clients 依赖该项
        openldap-clients
            openldap-2.4.44-25.el7_9.x86_64
            openldap-clients-2.4.44-25.el7_9.x86_64

        samba-common-tools
            包含
            samba-client-libs-4.10.16-20.el7_9.x86_64
            samba-common-tools-4.10.16-20.el7_9.x86_64
            samba-common-libs-4.10.16-20.el7_9.x86_64
            samba-libs-4.10.16-20.el7_9.x86_64

        samba-winbind
            samba-winbind-clients 依赖该项
        samba-winbind-clients
            samba-winbind-4.10.16-20.el7_9.x86_64
            samba-winbind-modules-4.10.16-20.el7_9.x86_64
            samba-winbind-clients-4.10.16-20.el7_9.x86_64
        nss-pam-ldapd
            安装前忘记看了
            nss-pam-ldapd-0.8.13-25.el7.x86_64
        authconfig

### how to use openldap without winbind to join AD

To use OpenLDAP without Winbind to join AD, you can configure OpenLDAP to use
the AD server as an LDAP backend. Here are the basic steps:

1. Install OpenLDAP on your Linux system.

2. Install the necessary packages for OpenLDAP to work with AD:

    yum install openldap-clients sssd oddjob-mkhomedir adcli samba-common-tools

3. 

### how to use openldap without winbind ,samba , sssd and openldap-server to join AD

    yum install openldap-clients





