e2label可以获取一个设备分区的卷标。比如获取/dev/sda1的卷标:

e2label /dev/sda1
 

e2label也可以设置一个设备的分区的卷标。比如将/dev/sda1的卷标设置为/dira1

e2label /dev/sda1 /dira1
然后可以使用卷标进行文件系统挂载

mount LABEL=/dira1 /mnt/dira1

这种做法的好处是当把硬盘从主板的某个接口换到另一个接口时，内核仍能正确挂载该分区。
