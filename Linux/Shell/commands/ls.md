links:

    https://unix.stackexchange.com/questions/103114/what-do-the-fields-in-ls-al-output-mean

--full-time


-t     sort by modification time, newest first





## 目录下没有任何内容，为什么该目录的硬链接数为何是2


1. 对于目录，不可以创建硬链接，但可以创建软链接。

2. 对于目录的软链接是生产场景运维中常用的技巧（apache）

3. 猜测为何不能给目录创建硬链接：目录的硬链接不能跨越文件系统（硬链接原理）

4. 每个目录下都有一个硬链接"."号，和对应上级目录的硬链接".."。

5. 再父目录里创建一个子目录，父目录的链接数增加1（每个目录里都有..来指向父目录
   ）。但是在父目录里创建文件，父目录的链接数不会增加。

. 和 .. 所以是两个

目录的 硬链接数 代表的是这个目录下边的目录个数(一级目录数，子子目录不计算在内)
，= 隐藏目录数 + 普通目录数


## What do the fields in ls -al output mean?

In the order of output;

-rwxrw-r--    1    root   root 2048    Jan 13 07:11 afile.exe

1. file permissions (-rwxrw-r--),

2. number of (hard) links (1),

3. owner name (root),

4. owner group (root),

5. file size in bytes (2048),

6. time of last modification (Jan 13 07:11), and

7. file/directory name (afile.exe)


x = executable (for files) or accessible (for directories)

this may be followed by some other character of there are extended permissions,
like e.g. Linux ACL that are marked with a +.

The number of hard links means the number of names the inode has, i.e. links
created with ln without the -s option.

## commands start with ls

ls

lsa alias lsa='ls -lah'

lsattr

    list file attributes on a Linux second extended file system

lsblk

    list block devices

lsb_release

    print distribution-specific information

lscpu display information about the CPU architecture

lsusb

lspci list all PCI devices

lshw

    list hardware

lsintramfs

    list content of an initramfs image

lsipc

    show information on IPC facilities currently employed in the system

lslocks

    list local system locks

lslogins

    display information about known users in the system

lsmod

    Show the status of modules in the Linux Kernel

lsof

    list open files

lspgpot

    extracts the ownertrust values from PGP keyrings and list them in GnuPG
    ownertrust format.









