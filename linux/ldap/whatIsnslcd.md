# what is nslcd

nslcd stands for Name Service LDAP Client Daemon. It is a daemon that allows a
Linux system to access directory services such as LDAP (Lightweight Directory
Access Protocol).

When nslcd is running, it listens for LDAP requests from various system
components such as PAM, NSS, and sudo, and then sends these requests to the
LDAP server. It is used to authenticate users against an LDAP server and to
look up user and group information from an LDAP directory.

nslcd provides a bridge between the Linux system and the LDAP server, allowing
for centralized management of user and group accounts. It is commonly used in
conjunction with other software such as sssd or openldap to provide LDAP
authentication and authorization services to Linux systems.

## is nslcd called by nss-pam-ldapd to function something?

No, nslcd and nss-pam-ldapd are separate components that can be used
independently or together.

**nslcd is a daemon that provides LDAP client functionality and can handle
authentication, authorization, and name resolution via NSS.** 

**nss-pam-ldapd is a collection of PAM and NSS modules that allows
authentication and authorization against an LDAP directory.**

When used together, nss-pam-ldapd makes requests to nslcd to handle the LDAP
communication and nslcd provides the actual connection to the LDAP server and
retrieves the necessary information. In this way, nss-pam-ldapd acts as a layer
that interfaces with the system's PAM and NSS libraries and nslcd provides the
backend communication with the LDAP server.
