# OpenFire

[Wiki](https://wiki.xmpp.org/web/Openfire)

Openfire (previously known as Wildfire, and Jive Messenger) is an XMPP server
written in Java and dual-licensed under both a proprietary license and the
Apache License 2.0.

## More on the Renaming of Wildfire

[link](https://discourse.igniterealtime.org/t/more-on-the-renaming-of-wildfire/68578)

Thanks to everyone for the feedback on our need to move to a new name
for Wildfire. We are still working on a new name to take the
place of Wildfire. Also, based on the blog posts we received, we
realized that we should provide more clarification on how the trademark
issue arose, and our need to move to a new name. Here’s the story -

It started in December 2005, when we adopted the Wildfire name,
believing it to be available for use with our IM server. In 2006, a
company by the name of HBN, Inc. became aware of our usage, and HBN
noted that there was possible overlap with their usage of the Wildfire
name. They pointed out that they were first to use the Wildfire name
and requested that we rename our product to avoid any potential
confusion in the future. We agreed on it after some discussions around
the issue. When we first announced this situation, we did not mention
HBN but that is part of the story and our reason for changing names.

We’ll be moving forward with the new name shortly…

## About

[Download](https://www.igniterealtime.org/downloads/)

[Github](https://github.com/igniterealtime/Openfire)

Openfire supports the following features:

    - Web-based administration panel
    - Plugin interface
    - Customizable
    - SSL/TLS support
    - User-friendly web interface and guided installation
    - Database connectivity (i.e. embedded Apache Derby or other DBMS with JDBC 3 driver) for storing messages and user details
    - LDAP connectivity
    - Platform independent, pure Java
    - Full integration with Spark
    - The proprietary extension to Openfire allows multiple server instances to work together in one clustered environment. This extension is now open source as well.

## Server Install

### Centos/Rocky

As of Openfire version 4.7.0, a Java Runtime Environment (JRE) is no longer distributed with the Openfire release.
自 Openfire 4.7.0版本以来，一个 JRE (JRE)不再随 Openfire 发布。

1. java

    yum install java-17-openjdk

2. systemctl enable openfire --now


3. 开放防火墙9090端口
    /sbin/iptables -I INPUT -p tcp --dport 9090 -j ACCEPT #为指定端口9090
    /etc/rc.d/init.d/iptables save #将更改进行保存
    /etc/init.d/iptables restart #重启防火墙以便改动生效

4. http://127.0.0.1:9090 进入配置界面

    默认账号: admin

### Windows
