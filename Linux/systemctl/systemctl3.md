## 单一服务

systemctl 
    status
    start
    stop
    restart
    reload
    is-active
    is-enabled
    enable
    disable


Loaded:
    enabled
    disabled
    static
    mask

Active:
    active(running)
    active(exited)
    active(waiting)
    inactive(dead)

    active(listening)       (socket)

## 查看服务

列出启动的 unit, -all 列出所有的，包括未启动的
    systemctl   默认是 list-units
    systemctl list-units


依据 /usr/lib/systemd/system/ 中的
    systemctl list-unit-files



查看指定类型 --type=service

    -t target
    --type=target

## 操作环境

graphical.target
multi-user.target
rescue.target
emergency.target
shutdown.target
getty.target


runlevel0.target
runlevel1.target
runlevel2.target
runlevel3.target
runlevel4.target
runlevel5.target
runlevel6.target


systemctl 
    get-default
    set-default
    isolate



systemctl 
    poweroff
    reboot
    suspend             挂起
    hibernate           休眠
    rescue
    emergency


    Suspend stops operation of all applications and system state **is saved in RAM**, the machine go into a low-power mode, 
    in this state, the system still requires power . Various triggers can resume the machine, among them pressing a key 
    or quickly pressing and releasing the power button.

    Hibernate Moves the contents of memory **into swap**, tells the bootloader to boot directly into the appropriate kernel, 
    and shuts the machine down, in this state, the system does not require power. You turn on the machine by powering up, 
    which causes the kernel to reload the contents of memory from swap.




## 依赖

systemctl list-dependencies [unit] [--reverse]

    --reverse: 反向追踪谁用了这个 unit 

systemctl list-dependencies graphical.target 

systemctl list-dependencies graphical.target  --reverse


## systemctl 配置文件

[Unit]      unit 的解释、执行和依赖性有关
Description=
Documentation=
After=
Before=
Requires=
Wants=      这个unit之后最好还要启动什么服务
Conflicts=

---

[Service]           与实际执行的命令参数有关
Type=simple         默认
    =forking
    =oneshot
    =dbus
    =idle
    =notify         在启动后会发送一个通知消息
EnvironmentFile=    配置文件
ExecStart=
ExecStop=
ExecReload=
Restart=1           当此 Daemon 服务终止后，会再次启动此服务
RemainAfterExit
TimeoutSec=
KillMode=
RestartSec=
PIDFile=/var/run/liujiao.pid

[Device]
[Socket]
[Timer]
[Mount]
[Automount]
[Path]
[Snapshot]  系统快照
[Swap]      用于标识 swap 设备
 

systemctl -t help
    service
    socket
    target      用于模拟运行级别
    device      用于定义内核识别的设备
    mount
    automount
    swap
    timer
    path
    slice
    scope

---

[Install]   要挂载到那个 target 下面
Alias       别名, systemctl command alias.service
RequiredBy
WantedBy
Also        安装本服务的时候还要安装别的相关服务


已 "#" 开头的是注释


对于新创建的 unit 文件，或者修改了的 unit 文件，要通知 systemd 重载此配置文件
    systemctl daemon-reload





条件式重启(已启动才重启，否则不做操作)              servoice name condrestart                   systemctl try-restart name.service
重载或重启服务(先加载，再启动)                                                                  systemctl reload-or-restart name.service
重载或条件式重启服务                                                                            systemctl reload-or-try-restart name.service


开机自启                                            chkconfig name on                           systemctl enable name.service
开机禁止启动                                        chkconfig name off                          systemctl disable name.service
查看所有服务的开机自启状态                          chkconfig --list                            systemctl list-units -t service -a
列出改服务在哪些运行级别下启用和禁用                chkconfig sshd --list                       find /etc/systemd/system/*.wants -name "sshd.service"
查看服务是否开机自启                                -                                           systemctl is-enabled name.service


查看依赖关系                                        -                                           systemctl list-dependencies name.service
杀掉进程                                            -                                           systemctl kill name.service

