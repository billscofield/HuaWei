# what is sssd

SSSD (System Security Services Daemon) and realmd are both tools for joining
Linux systems to Active Directory domains. However, they serve different
purposes and work in different ways.

SSSD is a system daemon that provides authentication, authorization and caching
services to clients using various protocols, including LDAP, Kerberos and
Active Directory. It also provides the ability to create user and group
profiles for disconnected operation. SSSD is designed to work with a variety of
identity and authentication systems, including AD, LDAP, and Kerberos, and can
be used on a variety of Linux distributions.

SSSD is a service daemon that provides a way for Linux and Unix machines to
authenticate against remote identity and authentication providers, (SSSD是一个
服务守护程序，它为Linux和Unix机器提供了一种针对远程身份和身份验证提供者进行身份
验证的方法)including AD. It includes an LDAP and Kerberos client, and it can
cache user and group information locally to improve performance.

To configure SSSD to join an AD domain, you will need to modify the SSSD
configuration file (/etc/sssd/sssd.conf) and specify the domain name, domain
administrator credentials, and other relevant settings. Once you have
configured SSSD, you can use the realm permit command to allow users in the AD
domain to log in to the local machine.

However, **realmd provides a simpler way to configure SSSD to join an AD domain
by automatically configuring the SSSD configuration file based on the
information provided during the realmd setup process.**




