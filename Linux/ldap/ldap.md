## 什么是LDAP？

（一）在介绍什么是LDAP之前，我们先来复习一个东西：“什么是目录服务？”

    1. 目录服务是一个特殊的数据库，用来保存描述性的、基于属性的详细信息，支
持过滤功能。

    2. 是动态的，灵活的，易扩展的。

    如：人员组织管理，电话簿，地址簿。

（二）了解完目录服务后，我们再来看看LDAP的介绍：

LDAP（Lightweight Directory Access Portocol），它是基于X.500标准的轻量级目录访问协议。

目录是一个为查询、浏览和搜索而优化的数据库，它成树状结构组织数据，类似文件目录一
样。

目录数据库和关系数据库不同，它有优异的读性能，但写性能差，并且没有事务处理、回滚
等复杂功能，不适于存储修改频繁的数据。所以目录天生是用来查询的，就好象它的名字一
样。

LDAP目录服务是由目录数据库和一套访问协议组成的系统。

（三）为什么要使用

LDAP是开放的Internet标准，支持跨平台的Internet协议，在业界中得到广泛认可的，并且
市场上或者开源社区上的大多产品都加入了对LDAP的支持，因此对于这类系统，不需单独定
制，只需要通过LDAP做简单的配置就可以与服务器做认证交互。“简单粗暴”，可以大大降低
重复开发和对接的成本。


可以和微软的AD域打通


OpenLDAP 默认以 Berkeley DB 作为后端数据库，Berkeley DB 数据库主要以散列的数据
类型进行数据存储，如以键值对的方式进行存储。



OpenLDAP 通过 ACL 灵活控制用户访问数据的权限

OpenLDAP 基于推和拉的机制实现节点间数据同步，简称赋值(replication)

支持几乎所有平台(linux, windows, macos, unix ...)


LDAP的主要产品

细心的朋友应该会主要到，LDAP的中文全称是：轻量级目录访问协议，说到底LDAP仅仅是一
个访问协议，那么我们的数据究竟存储在哪里呢？

来，我们一起看下下面的表格：


厂商    产品                        介绍

SUN     SUNONE Directory Server     基于文本数据库的存储，速度快 。

IBM     IBM Directory Server        基于DB2 的的数据库，速度一般。

Novell  Novell Directory Server     基于文本数据库的存储，速度快, 不常用到。

Microsoft   Microsoft Active Directory  基于WINDOWS系统用户，对大数据量处理速度
一般，但维护容易，生态圈大，管理相对简单

Opensource  Opensource              OpenLDAP 开源的项目，速度很快，但是非主流应用。



有两个国际标准:
    
    X.500 和 LDAP(实际上是X.500的简化版本, 是X.500的子集)

    X.500 实际上是一个协议族，包括了从 X.501 到 X.525 

    apt-cache search openldap

        slapd - OpenLDAP server (slapd)

    LDAP是基于TCP/IP的,运行在TCP/IP或者其他的面向连接的传输服务至上， 
    X.500 基于OSI协议


DNS 是一个典型的大范围分布式目录服务的例子


是一个安全的协议，LDAP v3 支持SASL(Simple Authentication and Security Layer)、
SSL(Secure Socket Layer) 和 TLS(Transport Layer Security)

OpenLDAP 服务默认使用非加密的 TCP/IP 协议来接收服务的请求，并将查询结果传回到客
户端。由于大多数目录服务都是用于系统的安全认证部分比如：用户登录和身份验证，所
以它也支持使用基于 SSL/TLS 的加密协议来保证数据传送的保密性和完整性。OpenLDAP
是使用 OpenSSL 来实现 SSL/TLS 加密通信的。


## 实际上整个 OpenLDAP的架构大致包含 3个部分:

1. OpenLDAP

    首先，是 OpenLDAP的服务器本身，这个东西其实只相当于是一个 mysql数据库，它是
    没有酷炫的图形界面的，如果你愿意每次都手敲一大堆代码，也可以用它，但这种反人
    类的设计真的不是给人用的。


1. phpLDAPadmin

    所以，你需要安装一个叫作 phpLDAPadmin的工具，好歹这是一个图形界面，虽然奇丑
    无比，并且配置起来也并不容易。


1. PWM

    光装管理工具还不够，你总要给用户提供一个修改密码的地方。

1. 客户端

1. 最后，你还需要配置各种工具。



## 名词解释

cn ou dc 

uid ou dc 


1. dc      Domain Component

    域名的部分，其格式是将完整的域名分成几部分，如域名为example.com变成
    dc=example,dc=com（一条记录的所属位置）

1. ou      Organization Unit

    组织单位，组织单位可以包含其他各种对象（包括其他组织单元），如“oa组”（一条记
    录的所属组织）

    ou 也是一种条目-容器条目，ou下边即真正的用户条目

1. cn      Common Name

    公共名称，如“Thomas Johanson”（一条记录的名称）

1. uid     User Id

    用户ID songtao.xu（一条记录的ID）

1. sn      Surname

    姓，如“许”

1. dn      Distinguished Name

    一条记录的位置（唯一）每个对象都有一个唯一的名称，如 “uid=songtao.xu,ou=oa组
    ,dc=example,dc=com”，

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

Directory   目录，用于存放信息的单元

Entry       条目，LDAP的基本信息单元
    
    条目是具有分辩名DN(Distinguished Name)的属性-值对(Attribute-Value,简称AV)的
    集合

    每个Entry都可以有多个属性，而每个属性都有特定的类型和一个或多个取值，比如cn
    （Common Name）就是一个属性

    LDAP允许你通过一种叫做 objectClass 的特殊属性来控制哪些属性是条目所必须的，
    哪些是可选的。



DIT(Directory Information Tree) 目录信息树

Root DSE (Root DSA-specifit entry) 根节点项


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


## 安装

setenforce 0

yum install openldap openldap-servers openldap-clients

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
