# in joining windows AD, which software provide authentication and authorize

When joining a Linux system to a Windows Active Directory domain, the
authentication and authorization are typically provided by the SSSD (System
Security Services Daemon) software. SSSD can communicate with the Active
Directory domain controller using the **Kerberos protocol** and **LDAP (Lightweight
Directory Access Protocol)**.

Kerberos provides secure authentication between the Linux system and Active
Directory, while LDAP allows SSSD to retrieve information about users, groups,
and other objects in Active Directory, and to translate between Windows and
Linux identity attributes.

In addition to SSSD, other software such as Winbind and OpenLDAP can also be
used to integrate Linux with Windows Active Directory, depending on the
specific use case and requirements.

---


