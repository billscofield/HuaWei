unRAID
    http://bbs.pceva.com.cn/forum.php?mod=viewthread&tid=125557&page=1
    https://www.chiphell.com/thread-1913454-1-1.html
    https://www.lxg2016.com/52738.html

    http://bbs.pcbeta.com/viewthread-1813655-1-1.html
        哈哈，linus正好也提了，不过我从去年11月份就开始琢磨啦，目前自认为unRAID是最佳选择，因为有“CPU固定”功能。
        借助这个功能，可以把处理器的某个核心分配给unRAID宿主系统，然后8个核心分配给macOS虚拟机，4个核心给Windows虚拟机打游戏，剩余核心给docker，这样就不会出现虚拟机满载的时候宿主机无法分配到资源导致宿主无响应，进而整个机器都挂掉的情况。



vm做不到硬件直通，这点不如kvm



KVM和Docker的对比
    https://www.qstack.com.cn/archives/148.html
        KVM：全虚拟化，需要模拟各种硬件
        docker：严格来说不算是虚拟化技术，只是进程隔离和资源限制
    https://blog.csdn.net/wzyzzu/article/details/67644316
