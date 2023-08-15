
# [etcd](etcd.io)

go 语言编写

CoreOS 公司

是 k8s 内部的关键组件

用于**配置共享**和**服务发现**的**键值存储系统**

**高可用**，**强一致性**,**kv数据存储服务**

共享配置，服务发现，集群监控，leader选举，分布式锁

CAP原则
    分区容错性(Partion tolerance)
    一致性(Consistency)/可用性(Availability) (只能二选一)

集中管理配置信息

分布式键值数据库


```
Raft        raft算法，etcd实现一致性的核心              etcd 有 etcd-raft 模块
Follower    raft中的从属节点                            竞争 leader 失败
Leader      raft中的领导协调节点，用于处理数据提交      leader 节点协调整个集群
Candidate   候选节点                                    当 follower 接收 leader 节点的消息超时会变为 candidate
Node        raft状态机的实例                            raft中涉及多个节点
Member      etcd 实例，管理着对应的节点                 可处理客户请求
Peer        同一个集群中的另一个member                  其它成员
Cluster     etcd集群                                    拥有多个 etcd member
Lease       租期                                        租期，过期删除
Watch       监测机制                                    监控键值对的变化
Term        任期                                        某个节点成为 leader, 到下一次竞选的时间
Wal         预写式日志                                  用于持久化存储日志格式
Client      客户端                                      向etcd发起请求的客户端
```

特点
    简单
    存储:
        分级存储在目录中
    Watch
    安全通信
    高性能
    一致可靠


## 安装和部署

1. centos7

    方法一: yum install etcd

    方法二: 二进制

        ```

        wget https://github.com/etcd-io/etcd/releases/download/v3.5.9/etcd-v3.5.9-linux-amd64.tar.gz
        解压
        ./etcd --version

        后台启动etcd, 日志输出到 /tmp/etcd.log
        nohup ./etcd >/tmp/etcd.log 2>&1 &

        将etcd和etcdctl 复制到 /usr/local/bin/， 系统中可以直接调用 etcd/etcdctl
        cp etcd etcdctl /usr/local/bin


        存
            etcdctl put name fox
            etcdctl put name fox --endpoints=localhost:2379
        取
            etcdctl get name

        ---

        ETCD_VER=v3.4.23

        # choose either URL
        GOOGLE_URL=https://storage.googleapis.com/etcd
        GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
        DOWNLOAD_URL=${GOOGLE_URL}

        rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
        rm -rf /tmp/etcd-download-test && mkdir -p /tmp/etcd-download-test

        curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
        tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/etcd-download-test --strip-components=1
        rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz

        /tmp/etcd-download-test/etcd --version
        /tmp/etcd-download-test/etcdctl version
        ```

    方法三: 源码

        1. go 环境

        2. git clone https://github.com/etcd-io/etcd.git

2. 单节点多个实例

    etcd server 默认使用 2380 端口舰艇集群中其它 server 的请求，但是入托同一台
    机器上有多个 etcd server 都在同一个端口上监听，那么会导致端口冲突。

    本例为单节点3个 etcd server 为例，分辨监听在 12380,22380,32380 端口上

    ```
    # 安装 goreman, 依赖 go 环境

    go install github.com/mattn/goreman@latest
    goreman help

    # 利用 goreman 创建3个节点 etcd 集群

    1. 编写 local-cluster-profile 文件

    ``` local-cluster-profile

    etcd1: etcd --name infra1 --listen-client-urls http://127.0.0.1:12379 --advertise-client-urls http://127.0.0.1:12379 --listen-peer-urls http://127.0.0.1:12380 --initial-advertise-peer-urls http://127.0.0.1:12380 --initial-cluster-token etcd-cluster-1 --initial-cluster 'infra1=http://127.0.0.1:12380,infra2=http://127.0.0.1:22380,infra3=http://127.0.0.1:32380' --initial-cluster-state  new

    etcd2: etcd --name infra2 --listen-client-urls http://127.0.0.1:22379 --advertise-client-urls http://127.0.0.1:22379 --listen-peer-urls http://127.0.0.1:22380 --initial-advertise-peer-urls http://127.0.0.1:22380 --initial-cluster-token etcd-cluster-1 --initial-cluster 'infra1=http://127.0.0.1:12380,infra2=http://127.0.0.1:22380,infra3=http://127.0.0.1:32380' --initial-cluster-state  new

    etcd3: etcd --name infra2 --listen-client-urls http://127.0.0.1:32379 --advertise-client-urls http://127.0.0.1:32379 --listen-peer-urls http://127.0.0.1:32380 --initial-advertise-peer-urls http://127.0.0.1:32380 --initial-cluster-token etcd-cluster-1 --initial-cluster 'infra1=http://127.0.0.1:12380,infra2=http://127.0.0.1:22380,infra3=http://127.0.0.1:32380' --initial-cluster-state  new

    --name : etcd 节点的名字
    --initial-cluster : etcd 启动的时候，通过这个配置找到其它 etcd 节点的地址列表，格式："节点名称1=http://ip:2380, 节点2=http://ip:2380,..."
    --initial-cluster-state: 初始化的时候，集群的状态 "new" 或者 "existing" 两种状态，new 代表新建的集群，existing 代表已经存在的集群
    --listen-client-urls: 监听客户端请求的地址列表, 格式:"http://localhost:2379" 多个用逗号分隔
    --advertise-client-urls: 如果配置了 --listen-client-urls, 这个参数可以给出，建议客户端使用什么地址访问 etcd
    --listen-peer-urls: 服务端节点之间通讯的监听地址, 格式: "http://localhost:2380"
    --initial-advertise-peer-urls: 建议服务端之间通讯使用的地址列表
    ```

    2. 启动集群

        goreman -f ./local-cluster-profile start

    3. 访问任意一个 etcd server 获取集群 member 信息

        etcdctl --endpoints=http://localhost:12379 member list

        输出:8e9e05c52164694d: name=default peerURLs=http://localhost:2380 clientURLs=http://0.0.0.0:2379 isLeader=true

    4. 关闭某个节点

        goreman run stop etcd2

    5. 重启某个节点

        goreman run restart etcd2

    6. 向某个集群写入数据

        etcdctl put user fox --endpoints=http://localhost:22379
        etcdctl get user fox --endpoints=http://localhost:12379

3. 多节点多个实例

    方法一: 静态方式

    ```

    节点1：10.0.0.1
        etcd --name infra1 --listen-client-urls http://10.0.0.1:2379 --advertise-client-urls http://10.0.0.1:2379 --listen-peer-urls http://10.0.0.1:2380 --initial-advertise-peer-urls http://10.0.0.1:2380 --initial-cluster-token etcd-cluster-1 --initial-cluster 'infra1=http://10.0.0.1:2380,infra2=http://10.0.0.2:2380,infra3=http://10.0.0.1:2380' --initial-cluster-state  new

    节点2：10.0.0.2
        etcd --name infra1 --listen-client-urls http://10.0.0.2:2379 --advertise-client-urls http://10.0.0.2:2379 --listen-peer-urls http://10.0.0.2:2380 --initial-advertise-peer-urls http://10.0.0.2:2380 --initial-cluster-token etcd-cluster-1 --initial-cluster 'infra1=http://10.0.0.1:2380,infra2=http://10.0.0.2:2380,infra3=http://10.0.0.1:2380' --initial-cluster-state  new

    节点3：10.0.0.3
        etcd --name infra1 --listen-client-urls http://10.0.0.3:2379 --advertise-client-urls http://10.0.0.3:2379 --listen-peer-urls http://10.0.0.3:2380 --initial-advertise-peer-urls http://10.0.0.3:2380 --initial-cluster-token etcd-cluster-1 --initial-cluster 'infra1=http://10.0.0.1:2380,infra2=http://10.0.0.2:2380,infra3=http://10.0.0.1:2380' --initial-cluster-state  new

    ```

    访问任意一个 etcd server 获取集群 member 信息

        etcdctl --endpoints=http://10.0.0.1:2379 member list



    方法二: 动态发现

        实现机制:(服务发现协议)

            **Discovery Service Protocol 可以帮助新的 etcd 成员使用共享 url 在集
            群引导阶段发现所有其他成员.** 该协议使用新的发现令牌来引导一个唯一的
            etcd 集群, 一个发现令牌异能代表一个 etcd 集群, 只要此令牌上的发现协
            议启动，即使它中途失败, 也不能用于引导另一个 etcd 集群

            与 --initial-cluster 标志相同的功能, 即设置所有集群的成员信息

        注意: Discovery service protocol 仅仅用于集群引导阶段，不能用于运行时重新配置或集群监控

        静态配置前提是在搭建集群之前已经提前知道个节点的信息，而实际应用中可能
        存在预先并不知道各节点 ip 的情况，这是可以通过已经搭建的 etcd 来辅助搭
        建新的 etcd 集群. 通过已有的 etcd 集群作为数据交互点，然后在扩展新的集
        群时，实现通过已有集群进行服务发现的机制. 比如官方提供的:
        discovery.etcd.io

        ```
        1. 环境准备

            name            ip
            etcd1           10.0.0.1
            etcd2           10.0.0.2
            etcd3           10.0.0.3

            所有节点需要安装 etcd

            创建etcd日志保存目录
                mkdir -p /var/log/etcd

            创建单独的 etcd 数据目录
                mkdir -p /data/etcd

        2. 创建集群发现

            使用公共 etcd 发现服务

                curl https://discovery.etcd.io/new?size=3

            生成的 url

                https://discovery.etcd.io/eksjdfklhasdljfkefhldhjskafj

        3. 启动集群

            etcd1
                etcd --name infra1 --data-dir /data/etcd \
                    --listen-client-urls http://10.0.0.1:2379 --advertise-client-urls http://10.0.0.1:2379 --listen-peer-urls http://10.0.0.1:2380 \
                    --initial-advertise-peer-urls http://10.0.0.1:2380 \
                    --initial-cluster-token etcd-cluster-1 --initial-cluster 'infra1=http://10.0.0.1:2380,infra2=http://10.0.0.2:2380,infra3=http://10.0.0.1:2380' --initial-cluster-state  new


        4. 集群检测

            etcdctl member list
        ```


    方法三: DNS 动态发现



## 

etcdctl: a command line tool for interacting with the etcd server

The API version used by etcdctl to speak to etcd may be set to version 2 or 3
via the ETCDCTL_API environment variable. By default, etcdctl on master (3.4)
uses the v3 API and earlier versions (3.3 and earlier) default to the v2 API.

Note that any key that was created using the v2 API will not be able to be
queried via the v3 API. A v3 API **etcdctl get** of a v2 key will exit with 0 and
no key data, this is the expected behaviour.

    export ETCDCTL_API=3

etcdctl version and Server API version can be useful in finding the appropriate
commands to be used for performing various operations on etcd.

    API version 影响命令的名称
    api v3 是put v2 是 set






etcdctl put key ff      // set
etcdctl get key

---

etcdctl watch key       // 增删改

etcdctl put key mab     // 另一个终端中输入

etcdctl del key         // rm

---

etcdctl get key -w json         // key的历史版本
etcdctl get key --ver=47        // 版本为47的值

---

事务(tran)

etcdctl txn i
compare:
value("key") = "ff"
put key helo
get key

success ...


fail
del key





$ etcdctl get liu -w json
{
  "header": {
    "cluster_id": 14841639068965180000,
    "member_id": 10276657743932975000,
    "revision": 3,                              // 全局版本号，只要etcd进行修改，就会加1
    "raft_term": 2                              // 任期, 64bit 整数，全局单调递增
  },
  "kvs": [
    {
      "key": "bGl1",
      "create_revision": 3,                     // 创建 key 的版本，和上边的那个 revision 是一致的
      "mod_revision": 3,                        // 修改 key 的时候的全局版本号
      "version": 1,
      "value": "amlhbw=="
    }
  ],
  "count": 1
}


内存中是
    B+ 树, key -> revision
磁盘中
    B+ 树, revision -> value
    




etcdctl lease grant 30                      // 30秒的租期
etcdctl put a lease=694d85bd1f1b6729        // 过期后 a 被删除




选举超时: 每个节点都有，决定成为候选者, 谁先走完(超时)谁成为候选者，term++, 开启新一轮的任期

    只有候选者可以给自己投票，

    当收到拉票信息时，进行投票 (n+1)/2


heartbeat timeout

    follower 收到数据同步报，重置两个超时




## etcd DB SIZE

[参考](https://www.cnblogs.com/yuhaohao/p/13292085.html)

etcd的数据库空间配额大小默认限制为2G，当数据达到2G的时候就不允许写入。这里如果
想继续写入，必须对历史数据进行压缩，或者调整etcd数据库的空间配额大小限制。

当空间配额满载时，会提示mvcc: database space exceeded

1. 查看etcd的配额使用量

    export ETCDCTL_API=3
    etcdctl endpoint status --write-out table

    +----------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+
    |    ENDPOINT    |        ID        | VERSION | DB SIZE | IS LEADER | IS LEARNER | RAFT TERM | RAFT INDEX | RAFT APPLIED INDEX | ERRORS |
    +----------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+
    | 127.0.0.1:2379 | 8e9e05c52164694d |   3.5.9 |   25 kB |      true |      false |         3 |         33 |                 33 |        |
    +----------------+------------------+---------+---------+-----------+------------+-----------+------------+--------------------+--------+

2. 开启磁盘碎片整理

    1. 获取历史版本号

        export ETCDCTL_API=3
        etcdctl endpoint status --write-out="json" | egrep -o '"revision":[0-9]*' | egrep -o '[0-9].*'

        8991138

    2. 压缩旧版本

        etcdctl compact 8991138

    3. etcd进行碎片整理

        etcdctl defrag

    4. 查看etcd数据库大小

        etcdctl endpoint status --write-out table

3. 修改etcd空间配额大小

    cat /etc/systemd/system/etcd.service

    --quota-backend-bytes=10240000000    // 这里单位是字节

    systemctl daemon-reload
    systemctl restart etcd
