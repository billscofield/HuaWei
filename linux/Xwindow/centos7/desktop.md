

1. 

每个用户的登录后都会在这个目录创建一个以登录名为文件名的文件, 包含了登陆时选择的 mate 还是  gnome

    /var/lib/AccountsService/users
    ```
    [User]
    Language=
    XSession=mate
    Icon=/home/xxx/.face
    SystemAccount=false
    ```


2. [AccountsService](https://www.freedesktop.org/wiki/Software/AccountsService/)

AccountsService is a D-Bus service for accessing the list of user accounts and
information attached to those accounts.

AccountsService has been developed in and is used by the GNOME project but
should be usable in other desktops. It is a young project and is being kept
pliable to update to requirements as they arise. See also **SSSD** which may
replace / absorb AccountsService in the future.


3. [Configure a user default session](https://help.gnome.org/admin/system-admin-guide/stable/session-user.html.en)

    The default session is retrieved from a program called AccountsService.
    AccountsService stores this information in the
    **/var/lib/AccountsService/users/** directory.

    In GNOME 2, the .dmrc file in the user home directory was used to create
    default sessions. This .dmrc file is no longer used.

    To specify a default session for a user, update the user’s account service
    in the **/var/lib/AccountsService/users/username** file;

4. [How to set a default desktop environment at system start?](https://superuser.com/questions/685970/how-to-set-a-default-desktop-environment-at-system-start)

    For RHEL/CentOS 7 you can set the file **/etc/sysconfig/desktop** to
    contain DESKTOP=KDE which will default it to KDE.

    This also works for VNC.

    我记得 /etc/sysconfig/desktop 在 gdm 的配置脚本中有出现, /etc/gdm/ 还是那里


5. [如何在运行 Amazon Linux 2 的 Amazon EC2 实例上安装 GUI？](https://aws.amazon.com/cn/premiumsupport/knowledge-center/ec2-linux-2-install-gui/)

    将 MATE 定义为您的默认桌面。

    要为所有用户定义 MATE：

    sudo bash -c 'echo PREFERRED=/usr/bin/mate-session > /etc/sysconfig/desktop'

    但是没有效果

6. 

    On Debian, you should set the x-session-manager default command to choose your default session manager:

    update-alternatives --config x-session-manager
