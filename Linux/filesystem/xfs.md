
## xfs

### 分区备份

apt install xsfdump

xfsdump [ options  ] -f dest [ -f dest ...  ] filesystem

    filesystem: 分区的挂载路径或者设备文件, 注意：备份的路径最后不能以"/"结尾

    xfsdump -f /opt/sdb1_bak_1 /dev/sdb1
    或
    xfsdump -f /opt/sdb1_bak_1 /mnt

    提示输入 label , 说明性的文字
    提示输入关于 media 的描述



    一步: 

    xfsdump -f /opt/dump_sdb1_2 /sdb1 -L dump_sdb1_2 -M sdb1_2
        -L : session label
        -M : Specifies a label for the first media object  (media lable)

---

备份指定路径或文件

    -s 文件路径 

    xfsdump -f 备份文件存放位置 -s 要备份的文件或目录的相对位置 备份文件所在的分区 -L .. -M ..


    xfsdump -f /opt/sdb1_test_a_bak -s test/a.txt /mnt/sdb1 -L .. -M  ..


    目录

    xfsdump -f /opt/sdb1_test_a_bak -s test2 /mnt/sdb1 -L ..  -M  ..

### 查看备份信息

备份成功后，可以在 /var/lib/xfsdump/inventory 目录下生成档案信息
    
    xfsdump -I      包含所有历史备份信息


### 分区恢复

xfsrestore -f /opt/dump_sdb1_1 /sdb1

不一定必须非要放回原始位置



恢复单个文件或目录

xfsrestore -f /opt/dump_sdb1_1 -s 恢复的文件或路径(相对路径)  绝对路径



注意:

xfsdump 必须使用 root 进行操作

只能备份 xfs 系统

是完全备份

备份的数据只能使用 xfsrestore 解析




增量备份 的还原需要一步步还原

xfsdump -f /opt/one.bak  /sdb1 -L ... -M ...
xfsdump -l 1 -f /opt/one.bak  /sdb1 -L ... -M ...
xfsdump -l 2 -f /opt/one.bak  /sdb1 -L ... -M ...
    -l : 第几次增量备份


    首先恢复第一次完全备份的那个部分
    然后恢复 -l 1 的那次
    然后恢复 -2 2 的那次
