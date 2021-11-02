## parted 工具的一般步骤

帮助选项：

-h, --help                    显示此求助信息 
-l, --list                    列出所有设别的分区信息
-i, --interactive             在必要时，提示用户 
-s, --script                  从不提示用户 
-v, --version                 显示版本

操作命令：

cp [FROM-DEVICE] FROM-MINOR TO-MINOR           #将文件系统复制到另一个分区 

help [COMMAND]                                 #打印通用求助信息，或关于 COMMAND 的信息 

mklabel 标签类型                               #创建新的磁盘标签 (分区表) 

mkfs MINOR 文件系统类型                        #在 MINOR 创建类型为“文件系统类型”的文件系统 

mkpart 分区类型 [文件系统类型] 起始点 终止点   #创建一个分区 

mkpartfs 分区类型 文件系统类型 起始点 终止点   #创建一个带有文件系统的分区 

move MINOR 起始点 终止点                       #移动编号为 MINOR 的分区 

name MINOR 名称                                #将编号为 MINOR 的分区命名为“名称” 

print [MINOR]                                  #打印分区表，或者分区 

quit                                           #退出程序 

rescue 起始点 终止点                           #挽救临近“起始点”、“终止点”的遗失的分区 

resize MINOR 起始点 终止点                     #改变位于编号为 MINOR 的分区中文件系统的大小 

rm MINOR                                       #删除编号为 MINOR 的分区 

select 设备                                    #选择要编辑的设备 

set MINOR 标志 状态                            #改变编号为 MINOR 的分区的标志




### 操作实例：

1. 选择分区硬盘

首先类似fdisk一样，先选择要分区的硬盘，此处为/dev/hdd： ((parted)表示在parted中输入的命令，其他为自动打印的信息)

[root@10.10.90.97 ~]# parted /dev/hdd
GNU Parted 1.8.1
Using /dev/hdd
Welcome to GNU Parted! Type 'help' to view a list of commands.


2. 创建分区

选择了/dev/hdd作为我们操作的磁盘，接下来需要创建一个分区表(在parted中可以使用help命令打印帮助信息)：

(parted) mklabel
New disk label type? gpt    (我们要正确分区大于2TB的磁盘，应该使用gpt方式的分区表，输入gpt后回车)


3. 完成分区操作

创建好分区表以后，接下来就可以进行分区操作了，执行mkpart命令，分别输入分区名称，文件系统和分区 的起止位置

(parted) mkpart
Partition name? []? dp1
File system type? [ext2]? ext3
Start? 0           （可以用百分比表示，比如Start? 0% , End? 50%）
End? 500GB


4. 验证分区信息

分好区后可以使用print命令打印分区信息，下面是一个print的样例

(parted) print
Model: VBOX HARDDISK (ide)
Disk /dev/hdd: 2199GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Number Start End Size File system Name Flags
1 17.4kB 500GB 500GB dp1


5. 删除分区示例
如果分区错了，可以使用rm命令删除分区，比如我们要删除上面的分区，然后打印删除后的结果

(parted)rm 1               #rm后面使用分区的号码，就是用print打印出来的Number
(parted) print
Model: VBOX HARDDISK (ide)
Disk /dev/hdd: 2199GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Number Start End Size File system Name Flags


6. 完整示例
按照上面的方法把整个硬盘都分好区，下面是一个分完后的样例

(parted) mkpart
Partition name? []? dp1
File system type? [ext2]? ext3
Start? 0
End? 500GB
(parted) mkpart
Partition name? []? dp2
File system type? [ext2]? ext3
Start? 500GB
End? 2199GB

(parted) print
Model: VBOX HARDDISK (ide)
Disk /dev/hdd: 2199GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Number Start End Size File system Name Flags
1 17.4kB 500GB 500GB dp1
2 500GB 2199GB 1699GB dp2


7. 格式化操作

完成以后我们可以使用quit命令退出parted并使用系统的mkfs命令对分区进行格式化了。

[root@10.10.90.97 ~]# fdisk -l
WARNING: GPT (GUID Partition Table) detected on '/dev/hdd'! The util fdisk doesn't support GPT. Use GNU Parted.
Disk /dev/hdd: 2199.0 GB, 2199022206976 bytes
255 heads, 63 sectors/track, 267349 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Device Boot Start End Blocks Id System
/dev/hdd1 1 267350 2147482623+ ee EFI GPT
[root@10.10.90.97 ~]# mkfs.ext3 /dev/hdd1
[root@10.10.90.97 ~]# mkfs.ext3 /dev/hdd2
[root@10.10.90.97 ~]# mkdir /dp1 /dp2
[root@10.10.90.97 ~]# mount /dev/hdd1 /dp1
[root@10.10.90.97 ~]# mount /dev/hdd2 /dp2
