[教程](https://www.bilibili.com/video/BV14K4y1t7rs?spm_id_from=333.880.my_history.page.click)


## 1. 前世今生

资源管理

1. Apache 的 MESOS

    开源的分布式资源管理框架

2. Docker 的 SWARM

    开源的分布式资源管理框架

    功能较少

    很小，几十兆

3. kubernetes

    Logo:方向舵

    Kubernetes的架构设计基本上是参照了Google Borg，谷歌16年容器使用经验，borg 容器管理平台，使用 golang 重构 borg

    特点：

        1. 轻量级: 消耗资源小
        
        2. 开源
        
        3. 弹性伸缩
        
        4. 负载均衡: ipvs框架



K8S 集群架构

|                +--------+
|                | Master |
|                +---+----+
|                    |
|        +-----------+-----------+
|       \|/         \|/         \|/
|    +-------+   +-------+   +-------+
|    |Worker1|   |Worder2|   |Worker3|
|    +-------+   +-------+   +-------+


## 2. 知识图谱

1. 


2. 

3. 资源清单
    1. 

    2. 

    3. 

    4. 


4. Pod 控制器
    
    1. 什么是控制器

    2. 控制器类型说明
        ReplicationController && ReplicaSet
        Deployment
        DaemonSet
        Job
        CronJob
        StatefulSet
        Horizontal Pod Autoscaling

5. 服务发现(svc)
    
    1. Service 含义

    2. Service 常见分类
        ClusterIP
        NodePort
        ExternalName

    3. Service 实现方式

    4. 服务分类
        1. 有状态服务
        2. 无状态服务

6. 存储

    1. 

    1. PV

7. 调度器

    1. 调度器的概念
        1. 概念
        2. 调度过程
        3. 自定义调度器
    2. 

8. 集群安全机制

    1. 认证
    2. 鉴权

9. HELM
    1. HELM概念
        1. HELM 概念说明
        2. 

10. 运维
    1. Kubeadm 源码修改
    2. Kubernetes 高可用构建



## 3. 组件说明

### borg


|       +-----------+       +-----------+
|       |  kubectl  |       |  web UI   |
|       +-----------+       +-----------+
|           |                   |
|           +-------------------+----+
|   +--------------------------------|------+
|   |                               \|/     |
|   |   +-------------+         +---------+ |
|   |   | scheduler   |----->---|         | |       
|   |   +-------------+         |         | |       +------+
|   |                           | API     |<------->| etcd |分布式键值对数据库
|   |   +-------------+         | Server  | |       +------+
|   |   | replication |----->---|         | |       
|   |   | controller  |         |         | |
|   |   +-------------+         +---------+ |
|   |                                |      |
|   +--------------------------------|------+
|                                    |
|   node    +----------------------------------+
|           |  kubelet          kube proxy     |
|   node    | +------------+   +-------------+ |
|           | | Pod        |   | Pod         | |     firewall
|           | | +---------+|   | +---------+ | |
|           | | |container||   | |container| | |
|           | | +---------+|   | +---------+ | |
|           | +------------+   +-------------+ |
|           |               node               |
|           +----------------------------------+



etcd: 可信赖的分布式键值存储服务，它能够为整个分布式集群存储一些关键数据，协助分布式集群的正常运转

    天生支持集群化

    V2版 放到 Memory

    V3版 放到 Database

    推荐在 Kubernetes 集群中使用 Etcd v3, v2 版本在 Kubernetes v1.11 中弃用

    http协议

客户端

    1. kubelet: 
        
    2. kube proxy:
        操纵 firewall
        
    3. container

API Server: 所有服务的访问统一入口

Controller Manager: 维持副本期望数目

Scheduler: 负责接收任务，选择合适的节点进行任务分配

etcd: 键值对数据库， 存储 K8s 集群所有重要信息(持久化)

Kubelet: 直接跟容器引擎交互实现容器的生命周期管理

Kube-porxy: 负责写入规则至 Iptables、IPVS 实现服务映射访问



CoreDNS: 可以为集群中的 SVC 创建一个域名IP的对应关系解析

Dashboard: 给 K8S 集群提供的一个 B/S 结构访问体系

Ingress Controller: 官方只能实现四层代理，Ingress 可以实现七层代理

Federtation: 提供一个可以跨集群中心多K8S统一管理功能

Prometheus:

ELK: 集群日志统一分析平台

高可用副本数据最好是 >=3 的奇数


### ETCD

|               +--------------------+    
|               |        ETCD        |
|               +--------------------+    
|
|   +----------------------------------------------+
|   |                   HTTP Server                |
|   +----------------------------------------------+
|       |                               |
|       |                               |
|   +---------+ -------<-->---- +------------------+
|   |   Raft  |                 |                  |
|   +---------+--<->----+       |                  |
|       |               |       |                  |
|   +---------------+   |       |                  |
|   |   |  WAL      |   |       |                  |
|   | +---------+   |   |       |     Store        |
|   | |  Entry  |   |   |       |                  |
|   | +---------+   |   |       |                  |
|   | +---------+   |   |       |                  |
|   | | Snapshot|--------       |                  |
|   | +---------+   |           |                  |
|   +---------------+           +------------------+





### 1. Pod 

k8s 中的最小单位

一个pod可以包含一个或多个容器，每个Pod有自己的虚拟IP。一个工作节点可以有多个Pod,
主节点会考虑负载自动调度 pod 到哪个节点运行

|
|               +---------------+
|               | Control Plane |
|               +-------+-------+
|                       |
|                       |
|           +-----------+-----------+
|           |           |           |
|          \|/         \|/         \|/
|       +-------+   +-------+   +-------+
|       | +---+ |   | +---+ |   | +---+ |
|       | |Pod| |   | |Pod| |   | |Pod| |
|       | +---+ |   | +---+ |   | +---+ |
|       | +---+ |   | +---+ |   | +---+ |
|       | |Pod| |   | |Pod| |   | |Pod| |
|       | +---+ |   | +---+ |   | +---+ |
|       +-------+   +-------+   +-------+
|         Node1       Node2       Node3







分类

    1. 自主式 Pod(不是被控制器管理的 Pod )

    1. 控制器管理的 Pod(被控制器管理的 Pod)


一个Pod 会先启动第一个容器( 这个容器叫 pause)

Pod 可以有多个容器，这些容器共享 第一个容器的网络栈(pause的)，可以通过
localhost 的不同端口相互访问，

pod 中的容器仅网络不隔离, 端口不能冲突

    共享存储卷
    共享网络


ReplicationController
    
    用来确保容器应用的副本数始终保持在用户定义的副本数，即如果有容器异常退出，
    会自动创建新的 Pod 来替代; 而如果一场多出来的容器也会自动回收.

    在新版本的 Kubernets 中建议使用 ReplicaSet 来取代 ReplicationController

Deployment

ReplicaSet
    
    和 ReplicationController 没有本质的不同，只是名字不一样，并且 ReplicaSet 支
    持集合式的 selector

Horizontal Pod Autoscaling  水平Pod自动扩展


StatefulSet
    
    1. 稳定的持久化存储

    1. 稳定的网络标志

    1. 有序部署，有序扩展

    1. 有序收缩，有序删除


DaemonSet


Job: 负责批处理任务，即仅执行一次的任务，它保证批处理任务的一个或多个 Pod 成功结束


服务发现






### 2. 网络通讯方式





## 安装方式

1. minikube
    
    只是一个 K8S 集群模拟器, 只有一个节点的集群, 只为测试用，master 和 worker
    都在一起

    需要提前安装好 docker

    ```
    启动集群
    minikube start

    查看节点
    kubectl get node

    停止集群
    minikube stop

    清空集群
    minikube delete -all

    安装可视化 Web UI 控制台
    minikube dashboasrd
    ```

2. 直接用用云平台(Kubernetes)

    腾讯云，阿里云
    
    可视化搭建
    优点: 安装简单，生态齐全

    ```
    腾讯云/容器服务

    ```

3. 裸机安装(Bare Metal)

    主节点
        docker(也可以是其他容器)
        kubectl 集群命令行交互工具
        kubeadm 集群初始化工具

    工作节点
        docker(也可以是其他容器)
        kubelet 管理 Pod 和容器，确保他们健康稳定运行
        kube-proxy 网络代理，负责网络相关的工作

    开始安装

    ```
    1. 每个节点分别设置对应主机名
    hostnamectl set-hostname master
    hostnamectl set-hostname node1
    hostnamectl set-hostname node2

    2. 所有节点都修改 hosts
    vim /etc/hosts
    172.16.32.2 node1
    172.16.32.6 node2
    172.16.0.3 master

    3. 关闭 selinux

    4. 关闭防火墙

    5. 添加k8s安装源， docker 安装源(可以所有都安装)
    yum install -y kubelet kubeadm kubectl docker-ce

    6. 启动 kubelet, docker 并设置开机启动(所有节点)
    systemctl enable kubelet
    systemctl enable docker
    systemctl start kubelet
    systemctl start docker

    7. 修改 docker 配置(所有节点)
    kubernetes 官方推荐 docker 等使用 systemd 作为 cgroupdriver, 否则 kubelet 启动不了

    cat <<EOF>daemon.json
    {
        "exec-opts":["native.cgroupdriver=systemd"],
        "registry-mirrors":["https://xxx.com"]
    }
    EOF
    mv daemon.json /etc/docker/

    systemctl daemon-reload
    systemctl restart docker

    8. 使用 kubeadm 初始化集群(主节点)
    初始化集群控制台 Control Plane
    失败了可以用 Kubeadm reset 重置
    kubeadm init --image-repository=registry.aliyuncs.com/google_containers

    把输出的 kubeadmin join xxx 保存起来
    如果忘记了重新获取: kubeadm token create --print-join-command

    复制授权文件，以便 kubectl 可以有权限访问集群
    mkdir -p $HOME/.kube
    cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    chown $(id -u):$(id -g) $HOME/.kube/config

    在其他机器上创建  ~/.kube/cofnig 文件也能通过 kubectl 访问到集群

    9. 将工作节点加入集群
    粘贴运行上面复制的命令

    10. 查看节点
    kubectl geat node
    可以看淡三个节点，一个master,两个过哦管你做节点, status 是 not ready

    11. 安装网络插件,否则 node 是 NotReady 状态(主节点跑) 
    kubectl apply -f https://raw.githubsercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
    稍微等一会儿就能看到 status 变了

    ```

## 部署应用到集群中

kubectl run testapp(是pod 名字) --image=docker镜像

或者写成 yaml 文件运行
kubectl apply -f ./pod.yaml

kubectl get pod 进行查看
kubectl get pod -o wide

kubectl describe pod [pod名]

kubectl logs [pod名]
kubectl logs [pod名] -f

kubect exec -it [pod名]



