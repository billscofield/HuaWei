# keepalive

其他高可用方案
    heartbeat
    pacemaker
    piranha

HA: High A

MTTF: mean time to failure 平均无故障时间
MTTR: mean time to restoration 平均故障维修时间

HA = MTTF(/MTTF+MTTR)

高可用集群的衡量标准

    ```
    可用性级别     年度停机时间
    99%             87.6 hours
    99.9%           8.8 hours
    99.99%          53 minutes
    99.999%         5 minutes
    ```

自动切换/故障转移(FailOver)

自动侦测

    心跳线

    脑裂:

        在高可用集群中，当心跳线断开时，本来为一个整体，动作协调的HA系统，就分
        裂为2个独立的个体。由于相互失去了联系，都以为是对方出现了故障，两个节点
        上的HA软件就像脑裂一样，争抢"共享资源", 争抢"应用服务", 就会发生严重后
        果:

            1. 或者共享资源被瓜分
            2. 2边服务都起不来
            3. 2边服务都起来了，但是同时读写"共享存储", 导致数据损坏(常见数据库轮询这的联机日志出错)

        解决办法:

            1. 添加心跳线
            2. 启用磁盘锁
            3. 设置仲裁机制
            4. 脑裂的监控报警

## keepalive 工作原理

是以 VRRP 协议为基础

VRRP(Virtual Router Redundancy Protocol), 虚拟路由冗余协议

将 N 台提供相同功能的服务器组成一个服务器组，这个组里面有一个 master 和多个
backup, master 上面有一个对外提供服务的 vip(该服务器所在局域网内其他机器的默认
路由为该 vip), master 会发组播，当backup 收不到 vrrp 包时就认为 master 宕掉了，
这时就需要根据 vrrp 的优先级来选举一个 backup 当作 master

## VRRP 协议

```
      |                           |
    +----+                      +----+
    | R1 |                      | R2 |
    +----+                      +----+
      | 10.0.0.1                  | 10.0.0.2
      |                           |
      |      10.0.0.3(虚拟网关)   |
    +----+                      +----+
    | S1 |                      | S2 |
    +----+                      +----+
      |                           |
      +---------------+-----------+
                      |
                    client
```

## keepalive 主要的3个模块

1. core

    core模块是 keepalive 的核心，负责主进程的启动，维护以及全局配置文件的加载和解析

2. check

    check 模块负责健康检查，包括常见的各种检查方式

3. vrrp

    vrrp 模块用来实现 vrrp 协议

配置文件 /etc/keepalived/keepalived.conf
    ! 开头的行是注释, 其上不能有空行
    # 是注释行

## 实战案例1

环境

    server01: 10.0.6.183
    server02: 10.0.6.187
    VIP: 10.0.6.190

拓扑

```
             |                            |
        +----------+                +----------+
        | server01 |                | server02 |
        +----------+                +----------+
             |                            |


                        +--------+
                        | client |
                        +--------+
```

server01
server02
    yum install -y keepalived

server01

    ```
    global_defs {
        router_id 1                         # * 设备id, 不能一样即可
    }

    vrrp_instance VI_1 {                    # 实例名, 主备两台路由要相同
        state MASTER                        # * 主或从状态 MASTER/BACKUP
        interface ens192                    # * 监控网卡, 如果有多快网卡，尽量不用业务网卡
        mcast_src_ip 10.0.6.183             # * 心跳源ip
        virtual_router_id 55                # 虚拟路由编号，主备要一致
        priority 100                        # [0,255] 越大越优先, 一主多从时有用
        advert_int 1                        # 心跳间隔(秒)
        authentication {                    # 密钥认证
            auth_type PASS                  #
            auth_pass 1111                  # 加入集群的密码
        }
        virtual_ipaddress {                 # VIP
            10.0.6.190
        }
    }
    ```

server02

    ```
    global_defs {
        router_id 2                         # * 设备id, 不能一样即可
    }

    vrrp_instance VI_1 {                    # 实例名, 主备两台路由要相同
        state BACKUP                        # * 主或从状态 MASTER/BACKUP
        interface ens192                    # * 监控网卡, 如果有多快网卡，尽量不用业务网卡
        mcast_src_ip 10.0.6.187             # * 心跳源ip
        virtual_router_id 55                # 虚拟路由编号，主备要一致
        priority 99                         # [0,255] 越大越优先, 一主多从时有用
        advert_int 1                        # 心跳间隔(秒)
        authentication {                    # 密钥认证
            auth_type PASS                  #
            auth_pass 1111                  # 加入集群的密码
        }
        virtual_ipaddress {                 # VIP
            10.0.6.190
        }
    }
    ```

## 实战案例2

上述案例中，keepalive 无法确定 server01 的 nginx 状态, 不关心服务

因此我们让 keepalived 和具体的服务产生关联

vim /etc/keepalived/ch_ng.sh
```
counter=$(ps -C nginx --no-heading | wc -l)

if [ ${counter} -eq 0 ];then
    systemctl restart nginx
    sleep 5
    counter=$(ps -C nginx --no-heading | wc -l)
    if [ ${counter} -eq 0 ];then
        systemctl stop keepalived
    fi
fi
```

```
global_defs {
    router_id 2                         # * 设备id, 不能一样即可
}

vrrp_script chk_nginx {
    script "/etc/keepalived/ch_ng.sh"
    interval 2
    weight -5                           # 减去优先级
    fall 3                              # 运行3次
}

vrrp_instance VI_1 {                    # 实例名, 主备两台路由要相同
    state BACKUP                        # * 主或从状态 MASTER/BACKUP
    interface ens192                    # * 监控网卡, 如果有多快网卡，尽量不用业务网卡
    mcast_src_ip 10.0.6.187             # * 心跳源ip
    virtual_router_id 55                # 虚拟路由编号，主备要一致
    priority 99                         # [0,255] 越大越优先, 一主多从时有用
    advert_int 1                        # 心跳间隔(秒)
    authentication {                    # 密钥认证
        auth_type PASS                  #
        auth_pass 1111                  # 加入集群的密码
    }
    virtual_ipaddress {                 # VIP
        10.0.6.190
    }

    track_script {                      # 
        chk_nginx
    }
}
```

## 实战案例3

keepalive lvs

```

                +------------+          +-------+
                | lvs1       |          | nginx |
                | keepalived |          |       |
                +------------+          +-------+

client

                +------------+          +-------+
                | lvs2       |          | nginx |
                | keepalived |          |       |
                +------------+          +-------+



```
