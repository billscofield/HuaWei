## linux 开机进入initramfs无法开机

使用光盘进入 secure 模式

umount /

fsck /dev/sda1

修复完成后，

mount /

最后reboot的时候，出现了下列错误：

init: /dev/initctl: no such file or directory

最后google找到了个解决方法，执行下列命令：

mkfifo /dev/initctl

reboot -f
