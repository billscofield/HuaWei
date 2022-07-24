
## centos7 qt5

用的 virtualbox 虚拟机

安装增强功能时

    yum install gcc make perl

    yum install kernel-devel kernel-devel-3.10.0-693.11.1.el7.x86_64
        报错，NO package  kernel-devel-3.10.0... available
            根据报错 kernel headers 和  kernel 不匹配
            
            为什么会安装高版本的 kernel devel ???

    yum groupinstall "development tools"    //是小写 development tools   网上的大写，不行

