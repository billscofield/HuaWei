## Ansible

开发语言：Python
特点：SSH协议通讯，全平台，无需编译，模块化部署管理
无client,
Playbook脚本编写规范

## Saltstack

开发语言：Python
C/S架构，模块化
YAML脚本编写规范，适合大规模集群部署

## Ansible的有事和应用场景

轻量级无客户端（Agentless)
开源,学习成本低
使用Playbook作为核心配置架构，统一的脚本格式批量化部署
强大的稳定性和兼容性


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
    useradd deploy $$ su - deploy

    virtualenv -p /usr/local/bin/python3 .py3-a2.5-env

1. git源代码安装ansible2.5

    cd /home/deploy/.py3-a2.5-env
    git clone https://github.com/ansible/ansible.git
    cd ansible $$ git checkout stable-2.5

1. 加载python3.6 virtualenv环境
    source /home/deploy/.py3-a2.5-env/bin/active

1. 安装ansible 依赖包

    pip install paramiko PyYAML jinja2

1. 在python3.6虚拟环境下加载ansible2.5
    
    source /home/deploy/.py3-a2.5-env/ansible/hacking/env-setup -q

1. 验证ansible2.5

    ansible --version

## 编写部署脚本 Ansible playbooks 

inventory/                      Server详细清单目录   inventory(存货，详细清单)
    testenv                     具体清单与变量声明文件
roles/                          roles 任务列表
    testbox/                    testbox详细任务（项目名称）
        tasks/                  
            main.yml            testbox主任务文件
deploy.yml                      Playbook任务入口文件


1. 详细目录testenv
[testservers]           Server组列表
test.example.com        目标部署服务器主机名

[testservers:vars]              Server组列表参数
server_name=test.example.com
user=root
output=/root/test.txt

1. 主任务文件main.yml
- name:Print server name and user to remote testbox     人物名曾
shell:"echo 'Currentl {{ user }} is logining {{ server_name }}'>{{ output }}"       使用shell模块执行命令


1. 任务入口文件 deploy.yml
- hosts:'testservers'           对应testenv下的
  gather_facts:true             获取server的基本信息
  remote_user:root
  roles:
    - testbox                   进入roles/testbox任务目录


SSH 免密码秘钥认证

ansible服务器
    ssh-keygen -t rsa
    ssh-copy-id -i /home/deploy/.ssh/id_rsa.pub root@test.example.com



执行playbooks

    ansible-playbook --version

    部署到testenv环境

    ansible-playbook -i inventory/testenv .deploy.yml




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
  register: script_stat


### debug模块
打印语句到ansible执行输出

- debug: msg=foo.sh exists
  when: script_stat.stat.exists


### command/shell
用来执行linux目标主机命令行

command 不能使用重定向


### template
实现ansible服务端到目标主机的jinja2模板传送

- name: write the nginx config file
  template: src=roles/testbox/templates/nginx.conf.j2 dest=/etc/nginx/nginx.conf


### packing
调用目标主机系统包管理工具（yum, apt)进行安装

- name: ensure nginx is at the latest version
  yum: pkg=nginx state=latest

- name: ensure nginx is at the latest version
  apt: pkg=nginx state=latest


## service
管理目标主机系统服务

- name: start nginx service
  service: name=nginx state=started
