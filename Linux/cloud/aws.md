
## AWS 简介 AWS Overview
Amazon Web Services

云计算:通过互联网按需提供IT资源，并且采用按使用量付费的定价方式。

三种云部署模式
    1. 公有云(一体式云)
    1. 混合, 不能全部部署到公有云上
    1. 私有云(本地)

Amazon Web Services 于2006年上线

### 对比学习

安全性
            防火墙  ACL         管理员进行权限分配      
    aws ->  安全组  NACL        AWS IAM(AWS Identity and Access Management)

联网
            路由器  网络管道    交换机
    aws ->  Amazon VPC      ELB(弹性负载均衡)

服务器
            本地服务器
    aws ->  AMI --->>  Amazon EC2

存储和数据库
            DAS     SAN     NAS                              RDBMS(关系型数据库)
    aws ->  Amazon EBS      Amazon EFS      Amazon S3        Amazon RDS



AWS Multi-Factor Authentication (MFA)



区域(Region)
    地理位置
    至少有两个可用区组成
    异地灾备

可用区(Availability Zone)
    由一个或多个数据中心组成
    专为故障隔离而设计（比如物理的，高可用）

边缘站点(Ponits of Presence)
    AWS Web Application Firewall (WAF)
    AWS Shield
    ...


AWS Local Zones

AWS Wavelength
    嵌入到运营商5G网络中

AWS Outposts
    将AWS部署到本地
    由AWS维护
    统一的管理界面
    标准42U机柜

https://infrastructure.aws/

Step Function

Lambda 函数

Rekognition 

CloudFormation

aws.training

## 计算服务(AWS Compute Services)

Amazon Elastic Compute Cloud (EC2虚拟机)

通过管理控制台 启动EC2实例
    1. 选择区域
    1. 选择AMI
        AMI（Amazon Machine Image）是一种使用亚马逊云计算服务时创建的机器镜像，机器镜像中包括操作系统、应用程序和配置设置。
        是一种包含软件配置的**模板**
        可基于以下特征选择要使用的AMI
            区域
            支持的架构：x86 or ARM
            架构: 32bit or 64bit
            虚拟化类型：HVM or PV
            操作系统
            启动许可(哪些账号可以使用)
            跟设备存储类型
        https://activity.virtualevent.net/index.php?m=AWSWebinar&c=user&a=video&id=2&t=1&frm=aws_landingpage
    1. 选择实例类型(硬件类型)
    1. 配置实例
        IAM角色
        用户数据:启动时运行的脚本
    1. 添加存储
    1. 添加标签
    1. 配置安全组
        防火墙服务
    1. 审核启动

AMI的获取方式
    1. AWS预构建
    1. AWS Marketplace
        有偿

    1. 自行创建
    1. 社区AMI
        由世界各地的人们创建，
        AWS不会审查社区AMI
        最好要自己检查


EC2 Image Builder

    原始镜像 -> EC2 Image Builder -> 自定义软件部署 -> AWS安全镜像模板扫描 -> AWS安全镜像测试 -> Golden Image 多区域部署

实例类型
    1. 通用型
        A1
        M5
        T2 T3

    1. 计算优先型
        C5
        C5n

    1. 内存优化型
        R5
        X1
        X1e
        z1d
        数据库等

    1. 加速计算
        P3
        G3
        F1

    1. 存储优化
        H1
        I3
        D2

可以通过 CloudWatch 观察应用在实例上的运行情况


EC2登录及使用
    ssh -i key.pem  ec2-user@ip/host


EC2定价模型

    1. 按需实例
        为计算容量付费
        解决对及时计算容量的需求

    1. 预留实例(Reserved Instances,RI)
        如果客户同时使用预留实例和按需实例，则优先适用预留实例费率，以最大程度降低成本。
        您只需在预留实例期限内按小时支付很低的每小时使用费（这意味着无论您在一小时之内的用量如何，都将向您按小时收取费用）。
        如果您在特定一小时内的运行实例总数超过了您拥有的适用预留实例数，则按按需费率给您计费。
         
        例如，如果您拥有 3 个预留实例，且这些实例均具有相同的实例属性和区域 (可用区，如果适用)，则账单系统将检查每小时使用情况，了解您总共运行了多少个匹配这些参数的实例。
              如果总数等于或小于 3，则将依据预留实例费率对该小时内运行的每个匹配的实例收取费用。如果运行的实例超过 3 个，则将依据按需实例费率对额外实例收取费用。

        https://amazonaws-china.com/cn/ec2/pricing/reserved-instances/buyer/
        
    1. Spot实例
        1折
        随时会停止，两分钟前通知，会保留状态

    1. Saving Plan
        承诺消费换区折扣
        与实例类型无关


## 存储服务(Storage Services)

S3: Amazon Simple Storage Service

## 网络服务(Networking Service)

## 数据库服务(Database Services)
Amazon RDS, Amazon Aurora


## AWS 安全、身份和访问管理


## AWS 上的弹性、高可用架构
AWS ELB, Amazon Cloudwatch, AWS AutoScaling


## AWS 架构完善的框架 Well Architected Framework

### EC2

Elastic([ɪˈlæstɪk] 弹性的) Compute Cloud 


弹性IP费用
    弹性IP地址未与正在运行的实例关联，或者它已与停止的实例或未附加的网络接口关联，则会收取小额费用。当您的实例正在运行时，您无需为与该实例关联的某个弹性IP地址付费，但需为与该实例关联的所有其他弹性IP地址付费。








## 教程:
    https://activity.virtualevent.net/index.php?m=AWSWebinar&c=user&frm=aws_landingpage&rand=9557.300394516104
