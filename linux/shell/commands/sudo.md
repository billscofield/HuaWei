
/etc/sudoers

```
Defaults        env_reset
Defaults        mail_badpass
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"

root    ALL=(ALL:ALL) ALL

%admin ALL=(ALL) ALL
%sudo   ALL=(ALL:ALL) ALL

#includedir /etc/sudoers.d
```

## Default Lines

1. Defaults env_reset
    
    resets the terminal environment to remove any user variables. This is a
    safety measure used to clear potentially harmful environmental variables
    from the sudo session.

2. Defaults mail_badpass

    tells the system to mail notices of bad sudo password attempts to the
    configured mailto user. By default, this is the root account.

3. Defaults secure_path=..., 

    specifies the PATH (the places in the filesystem the operating system will
    look for applications) that will be used for sudo operations. This prevents
    using user paths which may be harmful.

## User Privilege Lines

**root** ALL=(ALL:ALL) ALL The first field indicates the username that the rule will apply to (root).

root **ALL**=(ALL:ALL) ALL The first “ALL” indicates that this rule applies to all hosts.

    https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/managing-sudo-access_configuring-basic-system-settings

    which users can run what software on which machines  (the sudoers file can
    be shared between multiple systems).


    https://medium.com/kernel-space/linux-fundamentals-a-to-z-of-a-sudoers-file-a5da99a30e7f

    Most of the people understand HOSTS as remote HOSTS. It is the LOCAL
    HOSTNAME/IP-ADDRESS. HOSTS field will be rarely used, if you want to know
    more about HOSTS in Sudoers please refer :
    https://www.sudo.ws/docs/man/1.7.10/sudoers.man/


root ALL=(**ALL**:ALL) ALL This “ALL” indicates that the root user can run commands as all users.

root ALL=(ALL:**ALL**) ALL This “ALL” indicates that the root user can run commands as all groups.

root ALL=(ALL:ALL) **ALL** The last “ALL” indicates these rules apply to all commands.
