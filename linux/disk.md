
## 查看 uuid
UUID (globally unique identifier)，唯一的身份识别

ll -a /dev/disk/by-uuid

或者

blkid


ubuntu 添加了一块硬盘后会自动挂载，如果不想让其自动挂载可以:

vi /etc/fstab

uuid号  挂载点  ext4    noauto  0   0
卷标  挂载点  ext4    noauto  0   0


