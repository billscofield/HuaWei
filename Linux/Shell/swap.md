创建分区文件

    dd if=/dev/zero of=/root/a.swap


格式化swap分区

    mkswap  a.swap


临时挂载分区

    swapon a.swap

永久挂载分区

    -a, --all                enable all swaps from /etc/fstab

    vim /etc/fstab
    /dev/vdb6    swap     swap       defaults      0    0 
    swapon -s
    swapon -a
    swapon -s



查看swap分区情况

    swapon -s --summary
