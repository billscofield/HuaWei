

On-Premises                         本地部署            在家自己做
IAAS: Infrastructure as a Service   基础设施即服务      买成品回家做
PAAS: Platform as a Service         平台即服务          叫外卖
SAAS: Software as a Service         软件即服务          去披萨店吃





  --------->-------------------------------------------
  |                                                   |
  --------->------------------------                  |
  |                                |                  |
  --------->--------               |                  |
  |                |               |                  |
------          ------         ----------          --------          ------
|开发|  提交->  |测试|  通过-> |上线准备|  通过->  |预上线|   通过-> |上线|
------          ------         ----------          --------          ------
  |                                                                    |
开发             测试                              运维工程师         |
  |                                                                    |
  ------------------------<-故障回滚------------------------------------


1. 开发环境

1. 测试环境

1. 发布环境 

    代码发布机，有些公司为堡垒机(安全屏障), 往往至少需要两个(主备)

1. 生产环境

1. 灰度环境
    
    往往该版本功能变更较大，为保险期间特意先让一部分用户优化体验该功能，待这部分用户使用没有重大问题的时候，再全量发布至所有服务器

    可以基于服务器
    可以基于用户
    可以基于地区


发布路径
    /webapp/tu      软连接
    /webapp/tu1.1
    /webapp/tu1.2

发布过程


1. 常见的自动化运维工具

ansible

saltstack

puppet
    
    功能强大，配置复杂，重型，适合大型环境

    开发语言：ruby


## Ansible

已被红帽收购

开发语言：Python

特点：SSH协议通讯，全平台(win,linux)，无需编译，模块化部署管理, Agentless, 基于ssh

Playbook脚本编写规范

ansible 这个名词来源于科幻小说

适合几百台这样的规模

关键模块

    1. Paramiko: 远程管理用的模块

    1. PyYAML:

    1. Jinja2: 模板语言

幂等性: 一个任务执行1次和执行n次效果一样，不因为重复执行而带来意外情况


## Saltstack

开发语言：Python

C/S架构，模块化

**YAML**脚本编写规范，适合大规模集群部署


## Ansible的优势和应用场景

轻量级无客户端（Agentless)

开源,学习成本低

使用Playbook作为核心配置架构，统一的脚本格式批量化部署

强大的稳定性和兼容性

社区比较活跃


## ansible 的安装方式

1. apt install 

1. git clone 

1. pip install ansible


## ansible 配合 virtualenv 安装配置

python 自带的 virtualenv

apt install ansible //任意用户都可以使用,全局状态


推荐源代码安装

git clone https://github.com/ansible/ansible.git

1. 预先安装python3.6
    (root)

1. 安装virtualenv
    pip install virtualenv
    (root)

1. 创建Ansible账户并安装python3.6版本virtualenv实例

    useradd deploy && su - deploy

    virtualenv -p /usr/local/bin/python3 .py3-a2.5-env


1. git源代码安装ansible2.5

    cd /home/deploy/.py3-a2.5-env

    git clone https://github.com/ansible/ansible.git

    mv ansible ~/.py3-a2.5-env/ 

    cd ansible && git checkout stable-2.5


1. 加载python3.6 virtualenv环境

    source /home/deploy/.py3-a2.5-env/bin/active


1. 安装ansible 依赖包

    pip install paramiko PyYAML jinja2


1. 在python3.6虚拟环境下加载ansible2.5
    
    source /home/deploy/.py3-a2.5-env/ansible/hacking/env-setup -q


1. 验证ansible2.5

    ansible --version


针对centos
    
```
    systemctl stop firewalld

    systemctl disable firewalld

    ---

    getenforce 

    vi /etc/sysconfig/selinux
        SELINUX=disabled

    reboot
```




            Ansible's Automation Engine
            -------------------------
users -->---| inventory  |   api    |---->  Hosts
  |         |------------|----------| 
  |         |  modules   | Plugins  |---->  Networking
  |         -------------------------
Ansible         |
PlayBooks --->---


### Ansible 操作的对象

hosts 主机

Networking 网络设备

windows 不能安装主控端


### 利用 Ansible 实现管理的方式

1. Ad-Hoc 即ansible命令，主要用于临时命令使用场景

1. Ansible-Playbook 主要用于长期规划好的，大型项目的场景，需要有提前的规划


## 编写部署脚本 Ansible playbooks 

mkdir testplaybooks
cd testplaybooks && mkdir inventory
cd testplaybooks && mkdir roles


inventory/                      Server详细清单目录   inventory(存货，详细清单)
    testenv文件                 具体清单与变量声明文件, 包含要部署的Server IP
roles/                          roles 任务列表,下边可以存放多个role, 通常命名为具体的名称
    testbox/                    testbox详细任务（项目名称）
        tasks/                  
            main.yml            testbox主任务文件
deploy.yml                      Playbook任务入口文件


1. 详细目录testenv

[testservers]           Server组列表, 域名或IP地址
test.example.com        目标部署服务器主机名


[testservers:vars]              Server组列表参数
server_name=test.example.com
user=root
output=/root/test.txt

---




1. 主任务文件main.yml

```
- name:Print server name and user to remote testbox     任物名称
shell:"echo 'Currentl {{ user }} is logining {{ server_name }}'>{{ output }}"       使用shell模块执行命令

```


1. 任务入口文件 deploy.yml

```
- hosts:'testservers'           对应testenv下的主标签
  gather_facts:true             获取server的基本信息
  remote_user:root
  roles:
    - testbox                   进入roles/testbox任务目录
```


SSH 免密码秘钥认证

ansible服务器
    ssh-keygen -t rsa
    ssh-copy-id -i /home/deploy/.ssh/id_rsa.pub root@test.example.com



执行playbooks

    ansible-playbook --version

    部署到testenv环境

    ansible-playbook -i inventory/testenv ./deploy.yml




## 

启动好python虚拟环境后

cd 
mkdir test_playbooks
cd test_playbooks

mkdir inventory
mkdir roles
cd inventory
vi testenv
    [testservers]
    test.example.com
    
    [testservers:vars]
    server_name=test.example.com
    user=root
    output=/root/test.txt
cd ../roles
mkdir testbox
cd testbox
mkdir tasks
cd tasks
vi main.yml
    - name: 测试任务 
      shell: "'echo 'current {{ user }} is logining {{ server_name }}'>{{ output }}'"
cd ../../.. (test_playbook)
vi deploy.yml
    - hosts: "testservers"
      gather_facts: true
      remote_user: root
      roles:
        - testbox


ssh-keygen -t rsa
ssh-copy-id -i /home/deploy/.ssh/id_rsa.pub root@192.168.a.a

测试ssh免密码登录

cd test_playbooks

    ansible-playbook -i inventory/testenv .deploy.yml



## 常用模块

### file

在目标主机创建文件或目录，并赋予权限

- name: create a file
  file: 'path=/root/foo.txt state=touch mode=0755 owner=foo group=foo'

### copy 模块

实现ansible服务端到目标主机的文件传送

- name: copy a file
  copy: 'remote_src=no src=roles/testbox/files/foo.sh 
        dest=/root/foo.sh mode=0644 force=yes'


### stat

获取远程文件状态信息

- name: check if foo.sh exists
  stat: 'path=/root/foo.sh'
  register: script_stat             // 将 stat 信息传给 script_stat


### debug模块

打印语句到ansible执行输出

- debug: msg=foo.sh exists
  when: script_stat.stat.exists


### command/shell

用来执行linux目标主机命令行

**command 不能使用重定向**

shell 模块会调用目标机器的/bin/bash, 所以推荐使用这个


- name: run the script
  command: "sh /root/a.sh"


- name: run the script
  shell: "echo 'test' > /root/a.txt"


### template

实现ansible服务端到目标主机的jinja2模板传送

- name: write the nginx config file
  template: src=roles/testbox/templates/nginx.conf.j2 dest=/etc/nginx/nginx.conf


### packing

调用目标主机系统包管理工具（yum, apt)进行安装

- name: ensure nginx is at the latest version
  yum: pkg=nginx state=latest                   //redhat

- name: ensure nginx is at the latest version
  apt: pkg=nginx state=latest                   //debian


## service

管理目标主机系统服务

- name: start nginx service
  service: name=nginx state=started









