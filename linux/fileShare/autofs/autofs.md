# autofs

apt install -y autofs
yum install -y autofs

systemctl enable autofs
systemctl restart autofs

挂载是由访问产生的，卸载是由超时产生的

/etc/autofs.conf
    timeout = 300       在不访问的情况下，自动退出挂载的时间
    browse_mode = yes   是否显示被挂载的目录，我们改为yes，默认no

/etc/auto.master
    /rhome  /etc/auto.rhome
    监视目录    具体监视项

    /rhome  /etc/auto.rhome --ghost
        
        The --ghost option keeps the mountpoint folder visable on the file
        system, which makes things smoother for some programs.

vi /etc/auto.rhome
    testuser -rw,sync   10.0.0.1:/working

## 挂载 cifs samba

1. 帐号密码直接输入

    手动挂载

        mount.cifs -o username=myuser,uid=youruser,gid=yourgroup //xxx.xxx.xx.xx/myfolder /mnt/windowsshare/

    这里是挂载 windows 共享
    uid linux用的的id
    会提示输入密码

        mount.cifs -o username=myuser,password=mypassword,uid=youruser,gid=yourgroup //xxx.xxx.xx.xx/myfolder /mnt/windowsshare/

            多加了一个 password 会提示 permission denied

        mount -t cifs -o username=myuser //xxx.xxx.xx.xx/myfolder /mnt/windowsshare/
            
            https://unix.stackexchange.com/questions/436485/change-ownership-of-a-share-drive

            I'm trying to create a folder inside the mounted share but I can't.
            I've checked the permissions of the mounted folder and it says

            "You are not the owner, so you cannot change these permissions"

2. 帐号密码配置文件

    /etc/auto.master
        /mounts/  /etc/auto.mymounts --ghost

    /etc/auto.mymounts
        /mnt/windowsshare/ -fstype=cifs,rw,credentials=/etc/credentials.autofs ://xxx.xxx.xx.xx/myfolder

        /etc/credentials.autofs
            dom=TARGETDOMAIN
            user=TARGETUSER
            password=TARGETPASSWORD

    This may need extended for some enviornments. NOTE: The vers=2\.1 option
    will need to be specified if SMB 1 has been turned off on the remote
    server.

## problems

1. showmount -e 127.0.0.1 报错，提示：clnt_create: RPC: Program not registered

    service rpcbind stop
    service nfs stop
    service rpcbind start
    service nfs start
