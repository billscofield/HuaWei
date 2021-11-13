
debian
    apt install -y nfs-kernel-server
    apt install -y nfs-common

    nfs-common - NFS support files common to client and server
    nfs-kernel-server - support for NFS kernel server


yum install nfs-utils
systemctl start nfs-server
systemctl enable nfs-server


/etc/exports    共享文件夹的路径
    格式
    共享目录绝对路径    授权访问的IP或网段(权限1,权限2)
    /test  192.168.1.0/24(ro)
    /test  *(ro)

## nfs 管理命令

exportfs

-r      Reexport  all  directories,   synchronizing   /var/lib/nfs/etab   with
        /etc/exports  and files under /etc/exports.d.  This option removes en‐
        tries in /var/lib/nfs/etab which have been deleted  from  /etc/exports
        or files under /etc/exports.d, and removes any entries from the kernel
        export table which are no longer valid.

-v      Be  verbose. When exporting or unexporting, show what's going on. When
        displaying the current export list, also display the  list  of  export
        options.


-a      Export or unexport all directories.

-s      Display the current export list suitable for /etc/exports.

        showmount - show mount information for an NFS server



由于客户端挂载用户是 nfsnobody  ???是吗

mount -t nfs
    默认 -o rw, 但是还是要根据 server 的共享选项来决定
