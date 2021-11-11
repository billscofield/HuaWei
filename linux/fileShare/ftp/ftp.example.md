

## limit local user in his home directory

从2.3.5之后，vsftpd增强了安全检查，如果用户被限定在了其主目录下，则该用户的主目
录不能再具有写权限了！如果检查发现还有写权限，就会报该错误。

要修复这个错误，可以用命令chmod a-w /home/user去除用户主目录的写权限，注意把目
录替换成你自己的。或者你可以在vsftpd的配置文件中增加下列两项中的一项：


chroot_local_user=yes
allow_writeable_chroot=YES
