# what is NSS

**Name Service Switch (NSS)** is a facility in Unix-like operating systems that
provides a mechanism for various system databases to be configured through a
central configuration file (**/etc/nsswitch.conf**) rather than each service having
its own configuration file.

The NSS configuration file **specifies the order** in which different sources of
information, such as files, databases, or network services, are consulted when
resolving names or other information. This allows for flexibility and central
management of system database configuration.

For example, the passwd database, which contains user account information, can
be configured to look for this information in various sources such as local
files, NIS or LDAP network services. When a user logs in, the NSS subsystem
checks the configuration in /etc/nsswitch.conf to determine where to look for
user account information.
