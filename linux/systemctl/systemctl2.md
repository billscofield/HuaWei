
## system

### systemd 优势

1. 并行处理, 加快开机速度

    init 是顺序执行，单一队列，有不同的runlevel, 如 /etc/rc.d/rcN.d(debian现在是 /etc/rcN.d), 里边S开头的是开始，
    K开头的是结束, 后边的数字是顺序

    有一些服务，他们是不相关的，但是依然要按照前后顺序执行，所以会比较浪费时间，systemd 是按照并行方式处理

1. 统一管理，on-demand(按需)启动服务

    systemd仅有一个 systemctl 指令, 不像 systemV 需要 init, chkconfig, service, ... 等等指令。

    此外, systemd 常驻内存，可以按需处理后续的 daemon 启动服务

1. 服务依存关系自我检查

    systemd 可以对服务的依存关系进行检查，这样管理员就不需要启动了一个服务，要先分析它依存了哪些其他服务

1. 根据 daemon 的功能进行分类

    systemd 定义所有的服务为一个服务单元(unit), 并将该 unit 归类到不同的服务类型 (type) 中。

    旧的 init 仅分为 stand alone(独立) 与 super daemon(超级守护进程), 这显然是不够的

    systemd 将服务单位(unit) 区分 service(系统服务), socket(套接字服务), target(多目标服务), path(目录路径服务), snapshot(快照服务), timer(定时服务) 等多种不同的类型(type), 方便管理

1. 将多个 daemons 集合成一个群组
    
    如同 systemV 的 init 有一个 runlevel 的特色, systemd 也可以将多个功能集合成一个所谓的 target 项目, 这个项目主要用于构建一个操作环境, 所以是集合了许多个 daemons, 即是执行某个 target 就是执行好多个 daemon, 共同营建某一总操作环境

1. 向下兼容 init 服务脚本

    init 启动脚本也能够通过 systemd 管理


### systemd 配置

/usr/lib/systemd/system/        每个服务最主要的启动脚本保存的地方，类 /etc/init.d/下的文件

/run/systemd/system/            系统执行过程中产生的服务脚本, 它们的优先级要比 /usr/lib/systemd/system/ 高

/etc/systemd/system/            管理员创建的脚本, 类/etc/rc.d/rc5.d/Sxx之类的链接，优先级比 /run/systemd/system/ 高
                                都是软连接文件, 指向/usr/lib/systemd/system/

### systemd 的 unit

1. .service

1. .socket

    内部进程信息交换

1. .target

1. .mount / .automount

1. .path

1. .timer

### 命令格式

command:

1. status
1. start
1. stop
1. restart
1. reload
1. enable
1. disable
1. is-active
1. is-enable


### 状态

1. active(runnint)  
1. active(exited)      仅执行一次就正常结束的服务，如quotaon(磁盘配额),只需要开机或挂载执行一次
1. active(waiting)     
1. inactive            当前服务没有运行

daemon的预设状态
1. enabled
1. disabled
1. static               开机不启动，可以被其他服务唤醒
1. mask                 无论如何都不启动, systemctl unmask 服务
                            ln -s /dev/null /etc/systemd/system/cups.path

#### 查看系统服务
