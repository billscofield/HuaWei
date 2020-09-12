
xauth - X authority file utility

The  xauth  program  is used to edit and display the authorization information used in connecting to the X
server.  This program is usually used to extract authorization records from one machine and merge them  in
on  another  (as  is  the case when using remote logins or granting access to other users).  Commands (described below) 
may be entered interactively, on the xauth command line, or in  scripts.   Note  that  this program  does  not  contact  
the X server except when the generate command is used.  Normally xauth is not
used to create the authority file entry in the first place; the program that starts the  X  server  (often xdm or startx) 
does that.


## 

错误信息如下:

/usr/bin/xauth: file /home/user/.Xauthority does not exist

是因为添加用户时没有授权对应的目录，仅仅执行了useradd user而没有授权对应的家目录

直接解决办法如下(执行如下命令，以后就登录到终端上就不会出现上面的错误信息):

chown username:username -R /home/user_dir
不过一般是可以避免这种情况的出现，添加用户执行如下命令即可:

useradd username -m (-m 相当于会创建对应的用户家目录)

usermod -s /bin/bash username (指定shell，否则会非常不便于终端操作)



新安装的 Ubuntu 18.04.3 第一次用 ssh 登录，也会报这个错误，但是第二次登录就没有问题了
