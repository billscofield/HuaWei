# what is wbinfo

yum install -y samba-winbind-clients

**wbinfo is a command-line tool used to query information about users, groups,
and other resources from a Windows domain controller using the winbind service.**

The winbind service is part of the Samba suite of programs and provides
integration between Linux/Unix systems and Windows domains, allowing Linux/Unix
systems to use Windows authentication and authorization mechanisms.

The wbinfo command can be used to query information about users and groups in a
Windows domain, including their SIDs (Security Identifiers), Unix IDs
(UIDs/GIDs), and other properties. It can also be used to test connectivity to
the domain controller, authenticate users against the domain, and display
diagnostic information.

Some common uses of the wbinfo command include:

1. wbinfo -u : lists all users in the domain
2. wbinfo -g : lists all groups in the domain
3. wbinfo -i username : displays detailed information about a particular user,
   including their Unix UID/GID and group memberships
4. wbinfo -a username% password : tests authentication of a user against the
   domain controller
5. wbinfo -p : displays the current winbindd daemon's PID (Process ID)

The wbinfo command can be a useful tool for troubleshooting domain
authentication and authorization issues in a mixed Linux/Unix and Windows
environment.


getent

    getent - get entries from Name Service Switch libraries


    DESCRIPTION

    The  getent  command displays entries from databases supported by the Name
    Service Switch libraries, which are configured in /etc/nsswitch.conf.

    If one or more key arguments are provided, then only the entries that match
    the supplied keys will be displayed.  Otherwise, if no key is provided, all
    entries will be displayed (unless the database does not support enumeration)
    .
