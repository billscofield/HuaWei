## laaS PaaS SaaS

Saas, Software as a Service 软件即服务, 例如公司邮箱服务，

Paas, Platform as a Service 平台即服务, 软件的运行环境php,java,python,go
    一般用docker来实现

Iaas, Infrastructure as a Service 基础设施即服务, ECS主机，
    openstack    


ksm 内存压缩技术, 超卖

阿里云：
    金牌用户(派驻)
    大客户(技术专家在线)
    小用户(提工单)

## 架构

传统网站架构 MVC
    首页：www.jd.com/index.html
    秒杀：www.jd.com/miaosha/index.html


SOA 架构(拆业务)
    把每一个功能都拆成一个独立的web服务, 每一个独立的服务都至少有一个集群
    首页：www.jd.com/index.html
    秒杀：miaosha.jd.com/index.html

    openstack 就是 SOA 架构的

微服务
    亿级
    阿里云的 dubbo
    开源的 Spring Boot



自动化代码上线      Jenkins + gitlab  ci
自动化代码质量检查  sonarqube



### openstack

docs.openstack.org

版本：A-Z

Mitaka


用的 kvm 虚拟化

一个controller
    ip:192.100.0.253
    内存 3G+
    更改计算机名
    更改host

compute1
    ip:192.100.0.1
    内存 1G+
    更改计算机名
    更改host


安装 chrony 时间服务器

#### keystone 登录认证


#### Horizon 控制面板界面 dashboard


#### Heat 编排服务

#### Glance 



