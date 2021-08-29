
# useradd

[/etc/shadow](https://kerneltalks.com/user-management/understanding-etc-shadow-file/)

1. Inactive days

A number of days after **password expiry**, the account will be disabled. This
means if the user doesn’t log in to the system after his/her password expiry
(so he doesn’t change the password) then after these many days account will be
disabled. **Once the account is disabled, the system admin needs to unlock it.**


1. Expiry

Its number of days since 1 Jan 1970, the account is disabled.  Calculations we
already saw in the ‘last password change’ section.



/etc/default/useradd
/etc/login.defs
/etc/skel


## 关于添加用户时的默认组(primary group)

1. /etc/login.defs 中有一个选项: USERGROUPS_ENAB yes


    同 useradd -U, --user-group, 或者 useradd -N, --no-user-group

2. USERGROUP_ENAB no

    If the variable is set to no (or -N/--no-user-group is specified on the
    command line), useradd will set the primary group of the new user to the
    value specified by the GROUP variable in **/etc/default/useradd**, or 100 by
    default.

3. useradd -U or -N 

    useradd 到底是用 -U 还是 -N 作为默认值呢? 这个是由 /etc/login.defs 中的

    > USERGROUPS_ENAB yes

    定义的, USERGROUPS_ENAB yes <=> -U 而 USERGROUPS_ENAB no <=> -N

## /etc/default/useradd

查看 /etc/default/useradd 中的值

    > cat /etc/default/useradd
    或者
    > useradd -D

    ```
    GROUP=100
    HOME=/home                  // HOME_DIR, 如果这个值为空, /etc/passwd 中家目录就是根目录 **/用户名**, 但那是这个文件又不存在
    INACTIVE=-1                 // 如果 useradd 没有-m 选项, 也是一样的, /etc/passwd 中家目录是 /home/用户名, 但是没有这个文件夹
    EXPIRE=
    SHELL=/bin/sh
    SKEL=/etc/skel
    CREATE_MAIL_SPOOL=no
    ```

如何更改这些默认值
    
    useradd -D -s /bin/bash

## /etc/shadow && /etc/passwd

Username: Encrypted password: Last password change: Min days: Max days: Warn days: Inactive days: Expiry
    1              2                3                   4        5          6           7           8

Username: Encrypted password: UID: GID: Comment: Home directory: Shell
    1              2           3    4     5          6             7


## useradd 

- -b, --base_dir
    If the home directory is not specified this one is mandatory.

- -c, --comment
    Any text like a description of the account

- -d, --home_dir
    Home directory

- -e, --expire_date
    Account expiry date in YYYY-MM-DD

- -f, --inactive
    No of days after which acc will be disabled after password expiry

- -g, --gid
    group id

- -u, --uid
    User id

- -G, --groups
    Secondary groups

- -k, --skel_dir
    Files within skel_dir will be copied to home_dir of the user after creation

- -K, --key=value
    To override default parameters in /etc/login.defs

- -m, --create-home
    Create the home directory if it doesn’t exist.

- -o, --non-unique
    Allow non-unique UID

- -p, --password
    Encrypted password (not normal text one). It can be obtained from the crypt command.

- -r, --system
    Create a system account. This won’t have password aging and UID from system UID range

- -s, shell


## usermod

usermod [options] LOGIN

- -l <new_login> Change login name to different. **You have to manually rename home_dir and mail spool**
    
    更改 home_dir 名称
    > usermod -d 新目录 用户名

- -L Lock account. Basically it puts ! in front of encrypted password in passwd or shadow file.

- -U Unlock account. It removes!

- -m <new_home> Moves home_dir to new_dir. -d is mandatory to use with it.

- -u, --uid UID
    1. The new numerical value of the user's ID.

    2. The user's mailbox, and any files which the user owns and which are
       located in the user's home directory will have the file user ID changed
       automatically.

    3. The ownership of files outside of the user's home directory must be fixed manually.



-  -a, --append
    Add the user to the supplementary group(s). Use only with the -G option.

-  -G, --groups GROUP1[,GROUP2...[,GROUPN]]

    If the user is currently a member of a group which is not listed, the user
    will be removed from the group. This behaviour can be changed via the -a
    option, which appends the user to the current supplementary group list.

