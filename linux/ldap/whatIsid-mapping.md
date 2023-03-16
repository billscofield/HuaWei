# what is id-mapping

The uid in Linux is usually different from the ID set in Windows AD because
Linux and Windows have different ways of handling user and group IDs.

In Linux, user and group IDs are stored as integers in the /etc/passwd and
/etc/group files. These IDs are used by the system to manage file permissions
and access control. When a new user is created in Linux, the system assigns a
unique UID (user ID) to that user.

In Windows AD, user and group IDs are stored as Security Identifiers (SIDs)
which are unique alphanumeric identifiers. Windows AD SIDs are not compatible
with Linux UID/GID values, and vice versa. When a user is created in AD, the
system assigns a unique SID to that user.

When integrating Linux and Windows AD environments, it is important to map the
AD SIDs to Linux UID/GID values to ensure consistency in file permissions and
access control. This can be achieved using software tools such as **Samba**, **realmd**,
or **SSSD**, which provide support for mapping AD SIDs to Linux UID/GID values.

---

In a setup where both realmd and sssd are used for managing AD authentication
in Linux, there is a hierarchy of which one is the master for a given aspect.
Here are a few examples:

1. Domain discovery and joining: This is usually handled by realmd. It is
   responsible for discovering the AD domain and joining the Linux machine to
   it.  Once joined, it writes some configuration files in /etc/realmd and
   /etc/sssd to inform sssd of the joined domain.

2. User authentication and authorization: This is usually handled by sssd. It
   is responsible for communicating with the AD server to authenticate users
   and check their access permissions. It maintains a local cache of user/group
   information for faster lookups.

3. Access control: This is usually handled by the PAM (Pluggable Authentication
   Module) framework. The PAM modules are responsible for enforcing
   authentication and authorization policies, and they can be configured to use
   sssd or other backends for this purpose.

To see which component is responsible for a particular aspect, you can check
the configuration files in /etc/realmd, /etc/sssd, and /etc/pam.d. You can also
consult the system logs (e.g., /var/log/messages or /var/log/secure) to see
which component is generating log messages related to the authentication
process.


## how does sssd handle the map of AD uid and linux uid

When SSSD is used to authenticate Linux clients against an Active Directory
domain, it needs to map AD user and group IDs to local Linux user and group
IDs. The process is called ID mapping.

By default, SSSD uses the ID mapping service provided by the system's Name
Service Switch (NSS) to map AD users and groups to Linux users and groups. NSS
looks up the mapping information in the /etc/nsswitch.conf file, which
specifies which mapping services to use.

For AD users and groups that do not have a defined mapping, SSSD will assign
them a dynamic range of IDs to ensure that they do not conflict with the
existing local users and groups. The default ranges for these dynamic IDs can
be configured in the sssd.conf file.

When SSSD retrieves information about AD users and groups, it also retrieves
the POSIX attributes associated with them, such as the user's login shell and
home directory. SSSD maps these POSIX attributes to the corresponding Linux
attributes, such as the user's shell and home directory.

Overall, SSSD provides a flexible and configurable way to map AD users and
groups to Linux users and groups, and allows for custom ID mapping schemes if
needed.


