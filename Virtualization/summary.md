
Guest OS 运行在 VMM 上

VMM(Virtual Machine Monitor) 运行在 host OS 之上
    Hypervison

    商业解决方案
        VMWare VSphere,
        VMWare Fusion

    开开源解决方案
        OpenStack
        KVM

Host OS 负责真正对于底层硬件的调用


## System-level Virtualization

Server Virtualization method where the kernel allows multiple isolated user space instances.
不需要模拟硬件层
共享同一个Host OS 的Kernel
User Space Instance == Container

### 解决方案
LXC
    来自 Ubuntu

OpenVZ

Docker
    最早使用 lxc 作为container的引擎，目前使用 libcontainer 替换了 lxc
        libcontainer 是docker公司基于go开发
    采用 aufs 文件系统来管理 image 和 container
    C/S 架构，Server端采用 UnixSocket,也可以切换到 TCP Protocol

    aufs(advanced multi layer unification filesystem)
        可以实现把多个不同目录的内容合并在一起
        允许 read-only 和 read-write 目录并存

        docker 使用aufs来实现分层的文件系统的管理
            只读部分定义为 image, 可写部分定义为 container
            image 类似一个单链表系统，每个image包含一个指向 parent image 的指针
            没有 parent image 的image 是 base image

    docker 和 LXC
        docker 更关注于部署, LXC 专注于进程的隔离
        docker 有更好的API
        docker 有 dockfile 
        docker hub

Imctfy
    google开源的
