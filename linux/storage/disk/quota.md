## Quota

磁盘配额应用在组上没啥用，这个组最大多少，不限制成员

容量限制
文件个数限制

软限制
硬限制

    软设置10，硬设置13   (soft,hard]
    第10个可以，第11个可以(会报警) , 第12个、13个可以，14不可以, 第15个才不可以 

宽限时间

    默认是 7 天，如果达到了宽限时间，用户的使用超过软限制，那么软限制会升级为硬限制

### 前提条件

1. 内核支持

    ```
    ➜  disk git:(master) ✗ grep "CONFIG_QUOTA" /boot/config-4.19.0-8-amd64

    CONFIG_QUOTA=y
    CONFIG_QUOTA_NETLINK_INTERFACE=y
    # CONFIG_QUOTA_DEBUG is not set
    CONFIG_QUOTA_TREE=m
    CONFIG_QUOTACTL=y
    CONFIG_QUOTACTL_COMPAT=y
    ```

1. 要安装 quota 工具

1. xfs 文件系统 和 ext4 有差异


### 步骤

#### 1. 分区开启 quota

ext4

临时开启Quota

    mount -o remount,usrquota,grpquota /disk

永久开启Quota
    
    vi /etc/fstab
    /dev/sdb1   /disk   ext4    defaults,usrquota,grpquota  0   0
    
    findmnt -x
    mount -o remount,uquota,gquota /disk
    mount

---

xfs

临时开启Quota

    umount /disk
    mount /dev/xxx /disk -o uquota,gquota

永久开启Quota

    vi /etc/fstab
    /dev/sdb1   /disk   xfs     defaults,uquota,gquota  0   0

    findmnt -x
    mount -o remount,uquota,gquota /disk
    mount

#### 2. 建立磁盘配额的配置文件

**xfs 分区可以省略这一步骤**

quotacheck - scan a filesystem for disk usage, create, check and repair quota files

SYNOPSIS
    quotacheck [ -gubcfinvdMmR  ] [ -F quota-format  ] -a | filesystem

Options
    -a: 扫描 /etc/fstab 文件中所有开启磁盘配额功能的分区，如果有此选项，命令后面就不需要加入分区名了
    -c: 不管原有的配置文件，重新扫描并建立新的配置文件
    -u: 建立用户配额的配置文件，即 aquota.user 文件
    -g: 建立组配额的配置文件，即 aquota.group 文件
    -v: 显示扫描过程
    -m: 强制以读写的方式扫描文件系统，和 -M 类似，一般扫描根分区时使用
    -f: 强制扫描文件系统，并写入新的配置文件，一般扫描新添加的硬盘分区时使用

    -M, --try-remount

        This flag forces checking of filesystem in read-write mode if a remount
        fails. Do this only when you are sure no process will write to a
        filesystem while scanning.

    -m, --no-remount

        Don't try to remount filesystem read-only. See comment with option -M.


    quotacheck -augv

    如果需要给根分区开启配额功能,添加 m: quotacheck -augvm

    会在磁盘分区下生成两个二进制文件: aquota.user 和 aquota.group

#### 3. 设置用户的配额配置文件

即配置 aquoto.user 和 aquota.group

edquota - edit user quotas

    -u, --user
        Edit the user quota. This is the default.

    -g, --group
        Edit the group quota.

    -p, --prototype=protoname
        Duplicate the quotas of the prototypical user specified for each user specified.  
        This is the normal mechanism used to initialize quotas for groups of users.
            
        edquota -p usersource -p usernew

edquota -u user1        //会用 vi 打开文件

```
Filesystem  blocks  soft    hard    inodes  soft    hard
                    4000    5000    0       0       0       单位是 KB

```

xfs 还支持一种命令

    xfs_quota - manage use of quota on XFS filesystems

        
        -x      Enable expert mode.  All of the administrative commands (see the ADMINISTRATOR COMMANDS section below) which 
                allow modifications to the quota system are available only  in expert mode.

        -c cmd  xfs_quota  commands  may  be run interactively (the default) or as arguments on the command line. Multiple -c 
                arguments may be given.  The commands are run in the sequence given, then the program exits.


    实践
        xfs_quota -x -c 'limit bsoft=30m bhard=40m isoft=3 ihard=5 user1' /disk
        xfs_quota -x -c report /home

#### 启动和关闭配额

quotaon, quotaoff - turn filesystem quotas on and off

    -a: 依据 /etc/mtab 文件启动所有的配额分区。如果不加 -a, 一定要指定分区名
    -u: 启动用户配额
    -g: 启动组配额
    -v: 显示详细过程

    quotaon -augv
    quotaoff -a

#### 磁盘配额查询

quota 
    -u
    -g
    -v
    -s, --human-readable
        option will make quota(1) try to choose units for showing limits, used space and used inodes.

    quota -uvs user1

        grace:宽限时间

repquota - summarize quotas for a filesystem

#### 测试

dd if=/dev/zero of=/disk/testfile bs=1M count=60

#### 删除磁盘配额

方式一:

方式二:

## findmnt 

    Note that it is a bad practice to use mount -a for fstab checking. The recommended solution is findmnt --verify.
    

    -x, --verify
    
        Check  mount  table  content.  The default is to verify /etc/fstab parsability and usability. It's possible to use this option also with --tab-file.  
        It's possible to specify source (device) or target (mountpoint) to filter mount table. The option --verbose forces findmnt to print more details.
    
    --verbose
        Force findmnt to print more information (--verify only for now).
        
    -F, --tab-file path
        Search in an alternative file.  If used with --fstab, --mtab or --kernel, then it overrides the default paths.  
        If specified more than once, then tree-like output is disabled
        (see the --list option).


如果需要及时生效可以运行以下命令而不用重启：
    sudo mount -a
    -a：将 /etc/fstab 中定义的所有档案系统挂上

lrwxrwxrwx 1 root root 19 Mar  9 11:21 /etc/mtab -> ../proc/self/mounts
