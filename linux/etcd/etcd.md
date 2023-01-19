
# etcd

go 语言编写

CoreOS 公司

是 k8s 内部的关键组件

用于配置共享和服务发现的**键值存储系统**
**高可用**，**强一致性**,**kv数据存储服务**

共享配置，服务发现，集群监控，leader选举，分布式锁

CAP原则

集中管理配置信息

分布式键值数据库


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


## 安装和部署

1. centos7

    方法一: yum install etcd

    方法二: 二进制

        ```
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
