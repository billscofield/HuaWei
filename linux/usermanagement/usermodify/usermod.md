## usermod

usermod [options] LOGIN

- -l <new_login> Change login name to different. **You have to manually rename home_dir and mail spool**
    
    更改 home_dir 名称
    > usermod -d 新目录 用户名

- -L Lock account. Basically it puts ! in front of encrypted password in passwd or shadow file.

- -U Unlock account. It removes!


- **-m, --move-home**  Moves home_dir to new_dir. -d is mandatory to use with it.

- **-d, --home HOME_DIR**
    The user's new login directory.

    If the -m option is given, the contents of the current home directory will
    be moved to the new home directory, which is created if it does not already
    exist.  (将home目录下的东西剪切到新的家目录下, 如果新家目录不存在则创建)

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

