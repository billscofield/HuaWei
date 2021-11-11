


/etc/vsftpd/vsftpd.conf


----------------------------------------------\/

/etc/pam.d/vsftpd

```cat /etc/pam.d/vsftpd

#%PAM-1.0
session    optional     pam_keyinit.so    force revoke
auth       required     pam_listfile.so item=user sense=deny file=/etc/vsftpd/ftpusers onerr=succeed
auth       required     pam_shells.so
auth       include      password-auth
account    include      password-auth
session    required     pam_loginuid.so
session    include      password-auth

```
/etc/vsftpd/ftpusers

---------------------------------------------/\



write_enable
    This controls whether any FTP commands which change the filesystem are
    allowed or not. These commands are: STOR, DELE, RNFR, RNTO, MKD, RMD, APPE
    and SITE.  Default: NO

##  anonymous

anonymous_enable
    Controls whether anonymous logins are permitted or not. If enabled, both the usernames ftp and anonymous are recognised as anonymous logins.
    Default: YES


anon_root
    This option represents a directory which vsftpd will try to change into after an anonymous login. Failure is silently ignored.
    Default: (none)
    /var/ftp


no_anon_password
    When enabled, this prevents vsftpd from asking for an anonymous password - the anonymous user will log straight in.
    Default: NO


anon_world_readable_only
    When enabled, anonymous users will only be allowed to download files which are world readable. This is recognising(认识，承认) that the ftp user may own files, especially in the presence of uploads.
    Default: YES

    world readable: 是其他人有读的权限???
    anon_world_readable_only的意思是，当他为YES时候，文件的其他人必须有读的权限才允许下载，单单文件所有人为ftp且有读权限是无法下载的，必须其他人也有读权限，才允许下载；
    若为NO则只要ftp用户对文件有读权限即可下载
    是系统的那个ftp用户?

    https://blog.csdn.net/wzt888_/article/details/100763045


    ** write_enable **


anon_upload_enable
    If set to YES, anonymous users will be permitted to upload files under certain conditions. 
    **For this to work, the option write_enable must be activated, **
    and the anonymous ftp user  must  have write  permission  on  desired  upload  locations. 

    **This setting is also required for virtual users to upload; **
    **by default, virtual users are treated with anonymous (i.e. maximally restricted) privilege.**

    Default: NO


anon_mkdir_write_enable
    If set to YES, anonymous users will be permitted to create new directories under certain conditions. 

    **For this to work, the option write_enable must be activated, **

    and the anonymous  ftp  user must have write permission on the parent directory.
    Default: NO

anon_other_write_enable
    If  set  to  YES,  anonymous  users will be permitted to perform write operations other than upload and create directory, 
    such as deletion and renaming. This is generally not recommended but included for completeness.
    Default: NO


anon_umask
    The value that the umask for file creation is set to for anonymous users. 
    NOTE! If you want to specify octal values, remember the "0" prefix otherwise the value will be treated as a base  10 integer!
    Default: 077
















## guest

guest_enable
    If enabled, all non-anonymous logins are classed as "guest" logins. A guest login is remapped to the user specified in the guest_username setting.
guest_username




## local_user


local_enable
    This must be enable for any non-anonymous login to work, including virtual users.



---------------------------------------------\/


userlist_enable
userlist_deny                               // This  option  is  examined  if  userlist_enable  is  activated.
userlist_file=/etc/vsftpd/user_list







    links:
    https://unix.stackexchange.com/questions/162047/disable-operations-outside-users-home-directory-with-chroot-jail

chroot_local_user
    This will place all local users in a chroot jail, 
    however, if this is set then the chroot_list becomes a list of users who DO NOT go in a chroot jail

chroot_list_enable
chroot_list_file=/etc/vsftpd/chroot_list    // This option is only relevant(有意义) if the option chroot_list_enable is enabled









https://serverfault.com/questions/362619/why-is-the-chroot-local-user-of-vsftpd-insecure




