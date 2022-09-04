


Linux客户端执行挂在命令

mount -t cifs -o username=admin,password=123456,uid=nfsuser,gid=root //192.168.65.148/test/ /srv/test/

需要安装cifs-utils工具包，默认是已经安装。
常用参数说明 :
username , Window 系统登录用户名 ;
password : Window 系统登录密码 ;
uid：linux挂载目录的用户
gid：Linux挂载后目录的分组
//192.168.65.148/test/: 设置Window共享目录的路径 ;
/srv/test/ : 挂载到 Linux 下的那个目录
dir_mode=0777：参数设置挂载目录的权限
file_mode=0777：参数设置挂载文件的权限




## macos

mount -t smbfs //user@host/target mount-point



