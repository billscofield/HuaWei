## 

核心算法 CRUSH 设计算法
    CRUSH(Controlled Replication复制,反响 Under Scalable Hashing)
    基于哈希的数据分布算法
    CRUSH最重要的基本选择算法
        straw 及其改进版本 straw2

OpenStack的默认存储后端

Ceph 是一种软件定义存储, 可以运行在所有主流的Linux上，2016年，将Ceph从x86架构一直到了ARM架构中


最初，ceph 使用cephFS（分布式文件系统），随着虚拟化和云计算，开始着力发展分布式块存储服务组件-RBD

RADOS
    RBD:            提供块访问接口, 快对象组件 
                    RADOS Block Device
                    RADOS (Reliable, Autonomic[ˌɔːtˈnɒmɪk]自主的，自发的 Distributed Object Store) 是Ceph的核心之一
                    对象存储

    RADOSRGW:       提供对象访问接口, 对象存储网关
                    RADOS GateWay
                    RADOS GW是一个提供与Amazon S3和Swift兼容的RESTful API的gateway，以供相应的对象存储应用开发使用

    CephFS:         提供文件访问接口
        若要运行CephFS client，还需要Ceph metadata server。
        CEPHFS则提供了POSIX接口，用户可直接通过客户端挂载使用。它是内核态的程序，所以无需调用用户空间的librados库。它通过内核中的net模块来与Rados进行交互。



OSD(object storage device)
    每个osd节点可以设置一个目录作为实际存储区域，也可以是一个分区，一整块硬盘。

    每个osd监听4个端口，分别用于接收客户请求、传输数据、发送心跳、同步数据等操作
    osd节点默认监听tcp的6800到6803端口，如果同一台服务器上有多个osd节点，则依次往后排序。

    在生产环境中的osd最少可能都有上百个，所以每个osd都有一个全局的编号，类似osd0，osd1，osd2........序号根据osd诞生的顺序排列，并且是全局唯一的。
    存储了相同PG的osd节点除了向mon节点发送心跳外，还会互相发送心跳信息以检测pg数据副本是否正常。

    每个osd节点都包含一个journal文件, 默认大小为5G，也就说每创建一个osd节点，还没使用就要被journal占走5G的空间。这个值是可以调整的，具体大小要依osd的总大小而定。

BlueStore 对象存储引擎 

传统的三副本数据备份方式
纠删码方式适合对时延不敏感的冷数据（例如备份数据）应用


PG,Placement Group,中文翻译为归置组
    PG 可以在OSD之间（根据CRUSH的实时计算结果）自由进行迁移，这是ceph赖以实现自动数据恢复、自动数据平衡等高级特性的基础



AWS 要求存储系统能够提供与传统块、文件存储都不相同的第三类接口- 对象存储接口，并采用自定义的S3协议通过互联网（http）进行传输。
在此背景下，Ceph兼容以S3为代表的对象存储协议簇的翠香存储网关-RGW 应运而生
Swift 不是文件系统或者实时的数据存储系统，而是对象存储，用于长期存储永久类型的静态数据(OpenStack 的 Swift)
    Ceph不同于swift，客户端所有的读写操作都要经过代理节点。一旦集群并发量增大时，代理节点很容易成为单点瓶颈。Ceph本身并没有主控节点，
    扩展起来比较容易，并且理论上，它的性能会随着磁盘数量的增加而线性增长。

作者：魏镇坪
链接：https://www.jianshu.com/p/25163032f57f
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

权重大（对应容量大）的设备分担更多的数据
权重小（对应容量小）的设备分担更多的数据


OSD:Object Store Daemon
    用于集群中所有数据与对象的存储。处理集群数据的复制、恢复、回填、再均衡。并向其他osd守护进程发送心跳，然后向Mon提供一些监控信息。

OSD(primary)
OSD(replica)
OSD(replica)




CRUSH算法基于权重将数据映射至所有存储设备之间，这个过程是受控的并且高度依赖于集群的拓扑描述-cluster map,
不同的数据分布策略通过制定不同的placement rule 实现，后者实际上是一组包括最大副本数、容灾级别等在内的自定义约束条件，
例如，我们通过一条 placement rule 将互为镜像的3个数据副本分别写入位于不同机架的主机磁盘之上，以避免副本同时掉电从而导致业务中断

CRUSH 的计算过程中仅仅使用 x, cluster map 和 placement rule 作为哈希函数的输入


## 集群的层级化描述 - cluster map


## 数据分部策略 - Placement Rule
take
select
emit


## 





每个对象都会有一个唯一的OID，由ino与ono生成，虽然这些名词看上去很复杂，其实相当简单。ino即是文件的File ID，用于在全局唯一标示每一个文件，而ono则是分片的编号。
比如：一个文件FileID为A，它被切成了两个对象，一个对象编号0，另一个编号1，那么这两个文件的oid则为A0与A1。Oid的好处是可以唯一标示每个不同的对象，并且存储了对象与文件的从属关系。

OID:唯一标识每个不同的对象
    ino:标识这个文件的编号
    ono:标识这个文件的分片


PG是一个逻辑概念，我们linux系统中可以直接看到对象，但是无法直接看到PG。它在数据寻址时类似于数据库中的索引：每个对象都会固定映射进一个PG中，所以当我们要寻找一个对象时，
只需要先找到对象所属的PG，然后遍历这个PG就可以了，无需遍历所有对象。而且在数据迁移时，也是以PG作为基本单位进行迁移，ceph不会直接操作对象。


对象时如何映射进PG的？还记得OID么？首先使用静态hash函数对OID做hash取出特征码，用特征码与PG的数量去模，得到的序号则是PGID。
由于这种设计方式，PG的数量多寡直接决定了数据分布的均匀性，所以合理设置的PG数量可以很好的提升CEPH集群的性能并使数据均匀分布。

最后PG会根据管理员设置的副本数量进行复制，然后通过crush算法存储到不同的OSD节点上（其实是把PG中的所有对象存储到节点上），第一个osd节点即为主节点，其余均为从节点。

