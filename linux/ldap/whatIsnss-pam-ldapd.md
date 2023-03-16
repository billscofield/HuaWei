# what is nss-pam-ldapd

nss-pam-ldapd is a name service switch and Pluggable Authentication Module (PAM)
that provides a consistent interface to system name services, such as user and
group accounts, across different protocols, including LDAP.

It allows Linux systems to use an LDAP directory for authentication,
authorization, and account management.

The nss-pam-ldapd package provides the necessary components to configure and
authenticate to LDAP directories through the Name Service Switch (NSS) and
Pluggable Authentication Module (PAM) interfaces. This allows system
administrators to centralize user accounts and group management in a single,
secure, and scalable directory server.

nss-pam-ldapd is a collection of PAM and NSS modules that allows authentication
and authorization against an LDAP directory.

## is nslcd called by nss-pam-ldapd to function something?

No, nslcd and nss-pam-ldapd are separate components that can be used
independently or together. nslcd is a daemon that provides LDAP client
functionality and can handle authentication, authorization, and name resolution
via NSS.  nss-pam-ldapd is a collection of PAM and NSS modules that allows
authentication and authorization against an LDAP directory.

When used together, nss-pam-ldapd makes requests to nslcd to handle the LDAP
communication and nslcd provides the actual connection to the LDAP server and
retrieves the necessary information. In this way, nss-pam-ldapd acts as a layer
that interfaces with the system's PAM and NSS libraries and nslcd provides the
backend communication with the LDAP server.

When a user wants to log in via SSH, SSH uses NSS to look up user and group
information. NSS then uses PAM for authentication and authorization. PAM, in
turn, uses nss-pam-ldapd to communicate with the LDAP server, which includes
nslcd. So, nslcd is responsible for communicating with the LDAP server and
retrieving the necessary user and group information for PAM and NSS to use.
