# about disk block size

## 1. fdisk -l 查看 block size

fdisk -l /dev/sda1

    fdisk -l /dev/sda1
    Disk /dev/sda1: 930.56 GiB, 999178633216 bytes, 1951520768 sectors
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 4096 bytes                      <---
    I/O size (minimum/optimal): 4096 bytes / 4096 bytes                         <---

## 2. stat命令查看block size

    stat /

      File: /
      Size: 4096            Blocks: 8          IO Block: 4096   directory                       <---
    Device: 8,1     Inode: 2           Links: 37
    Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root)
    Access: 2023-07-25 23:45:55.377306103 +0800
    Modify: 2023-07-25 23:45:54.385300183 +0800
    Change: 2023-07-25 23:45:54.385300183 +0800
     Birth: 2021-10-25 10:06:52.000000000 +0800

- File: The name of the file for which the information is being displayed. If the provided file is a symlink, then the name will be different.
- Size: The size of the given file in bytes.
- Blocks: The number of blocks allocated to the file on the file system.
- IO Block: The input/output block size of the file system.
- Device: The device on which the file is located.
- Access: The timestamp of when the file was last accessed.
- Modify: The timestamp of when the file was last modified.
- Change: The timestamp of when the file was last changed (for example, a change in permissions).
- Birth: The timestamp of when the file was created (on file systems that support this feature).
- File type: The type of the file. This can be a regular file, a directory, a symbolic link, a block device, a character device, a named pipe, a socket, or a door.
- Protection: The access permissions of the file in octal form. This includes read, write, and execute permissions for the owner, group, and others.
- User ID: The numerically-encoded user ID of the owner of the file.
- Group ID: The numerically-encoded group ID of the owner of the file.
- Device type (if inode device): The type of the device file for the inode.

## 3. tune2fs 命令查看 block size

$ tune2fs -l /dev/sda1

    tune2fs 1.46.2 (28-Feb-2021)
    Filesystem volume name:   <none>
    Last mounted on:          /
    Filesystem UUID:          39d05c70-5b42-4189-9903-431b7a4b413c
    Filesystem magic number:  0xEF53
    Filesystem revision #:    1 (dynamic)
    Filesystem features:      has_journal ext_attr resize_inode dir_index filetype needs_recovery extent 64bit flex_bg sparse_super large_file huge_file dir_nlink extra_isize metadata_csum
    Filesystem flags:         signed_directory_hash
    Default mount options:    user_xattr acl
    Filesystem state:         clean
    Errors behavior:          Continue
    Filesystem OS type:       Linux
    Inode count:              60989440
    Block count:              243940096                         <---
    Reserved block count:     12197004
    Overhead clusters:        4110572
    Free blocks:              147999465                         <---
    Free inodes:              58183560                      <---
    First block:              0
    Block size:               4096                      <---
    Fragment size:            4096
    Group descriptor size:    64
    Reserved GDT blocks:      1024
    Blocks per group:         32768
    Fragments per group:      32768
    Inodes per group:         8192
    Inode blocks per group:   512
    Flex block group size:    16
    Filesystem created:       Mon Oct 25 10:06:52 2021
    Last mount time:          Sun Jun  4 23:59:42 2023
    Last write time:          Sun Jun  4 23:59:38 2023
    Mount count:              43
    Maximum mount count:      -1
    Last checked:             Mon Oct 25 10:06:52 2021
    Check interval:           0 (<none>)
    Lifetime writes:          4502 GB
    Reserved blocks uid:      0 (user root)
    Reserved blocks gid:      0 (group root)
    First inode:              11
    Inode size:               256
    Required extra isize:     32
    Desired extra isize:      32
    Journal inode:            8
    First orphan inode:       3934934
    Default directory hash:   half_md4
    Directory Hash Seed:      fc517dfd-dd51-4eab-bf60-46a34db1adc3
    Journal backup:           inode blocks
    Checksum type:            crc32c
    Checksum:                 0x1625fa50


对于LVM文件系统，可以使用下面命令

     tune2fs -l /dev/mapper/VolGroup04-LogVol00


## 4. blockdev 查看 block size

    blockdev --getbsz /dev/sda1
    4096

    --getbsz

        Print  blocksize  in bytes.  This size does not describe device
        topology.  It's size used internally by kernel and it maybe modified
        (for example) by filesystem driver on mount.

    --getss

        Print logical sector size in bytes – usually 512.

