## GRUB

GRand       极重要的

unified     统一的

GRand Unified Bootloader

Legacy      遗产, 遗赠财物




## /etc/default/grub文件详解

GRUB_DEFAULT=0 ->设置默认启动项，按menuentry顺序。比如要默认从第四个菜单项启动，数字改为3，若改为 saved，则默认为上次启动项。

GRUB_HIDDEN_TIMEOUT=0

GRUB_HIDDEN_TIMEOUT_QUIET=true ->隐藏菜单，grub2不再使用，不管

GRUB_TIMEOUT="3" ->设置进入默认启动项的等候时间，默认值10秒，按自己需要修改

GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash" ->添加内核启动参数，这个为默认

GRUB_CMDLINE_LINUX="noresume" ->手动添加内核启动参数，比如 acpi=off noapic等可在这里添加

//Uncomment to disable graphical terminal (grub-pc only)
#GRUB_TERMINAL=console ->设置是否使用图形介面。去除前面#，仅使用控制台终端，不使用图形介面

# The resolution used on graphical terminal
# note that you can use only modes which your graphic card supports via VBE
# you can see them in real GRUB with the command `vbeinfo'
# GRUB_GFXMODE=640x480 设定图形介面分辨率，如不使用默认，把前面#去掉，把分辨率改为800x600或1024x768

# Uncomment if you don't want GRUB to pass "root=UUID=xxx" parameter to Linux
#GRUB_DISABLE_LINUX_UUID=true ->设置grub命令是否使用UUID，去掉#，使用root=/dev/sdax而不用root=UUDI=xxx
# Uncomment to disable generation of recovery mode menu entrys
#GRUB_DISABLE_LINUX_RECOVERY="true" ->设定是否创建修复模式菜单项
