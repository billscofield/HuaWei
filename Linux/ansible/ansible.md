
## 1. 操作系统预备自动化

1. pxe
2. kickstart
3. cobbler

## 2. 配置自动化(本章)

    1. ansible
        - python 编写
        - 开箱即用，使用ssh协议, 简洁
        - 无主无从架构
        - python > 2.6 管理端, python > 2.4 被管理节点
        
    2. saltstack
        需要agent端配合，配置部署速度快
        
    3. puppet
        需要agent端配合
        
    4. chef


## 3. 监控自动化
    
    1. 系统与应用监控

    2. 日志监控

## 4. 代码持续集成与代码持续发布自动化

    git github jenkins docker



On-Premises                         本地部署            在家自己做
IAAS: Infrastructure as a Service   基础设施即服务      买成品回家做
PAAS: Platform as a Service         平台即服务          叫外卖
SAAS: Software as a Service         软件即服务          去披萨店吃



## ansible 原理




|
|
|
|                   +-----------------------------------------------------------+
|   +-----------+   |                                                           |   +--------------------+              +-----------+
|   |  Host     |   |                                                           |   |                    |              |           |
|   | Inventory |   |                                                           |   |                    | --------->   |           |
|   | 主机清单  |   |                        Ansible                            |   | Connection Plugins |              |   Hosts   |
|   +-----------+   |                                                           |   |                    | --------->   |           |
|                   |                                                           |   |                    |              |           |
|   +-----------+   +-----------------------------------------------------------+   +--------------------+              +-----------+
|   |           |
|   | Playbooks |   +--------------+    +----------------+  +---------------------------+
|   |           |   |              |    |                |  |                           |
|   +-----------+   | Core Modules |    | Custom Modules |  | Plugins: email,logging... |
|                   |              |    |                |  |                           |
|                   +--------------+    +----------------+  +---------------------------+
|

主机必须在主机清单中








  +-------->------------------------------------------+
  |                                                   |
  +-------->-----------------------+                  |
  |                                |                  |
  +-------->-------+               |                  |
  |                |               |                  |
+----+          +----+         +--------+          +------+          +----+
|开发|  提交->  |测试|  通过-> |上线准备|  通过->  |预上线|   通过-> |上线|
+-----          +----+         +--------+          +------+          +----+
  |                                                                    |
开发             测试                              运维工程师          |
  |                                                                    |
  +---------------------<---故障回滚------<----------------------------+


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

## 和 saltstack 的比较

### 1. Ansible

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


### 2. Saltstack

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

### 1. 通常的方式

1. 系统包管理器

    1. debian
        apt install ansible

    2. centos
        yum install -y epel-release
        yum install py ansible

1. git clone 

1. pip install ansible





### 2. ansible 配合 virtualenv 安装配置

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
            +------------+----------+
users -->---| inventory  |   api    |---->  Hosts
  |         |------------+----------+ 
  |         |  modules   | Plugins  |---->  Networking
  |         +------------+----------+
Ansible         |
PlayBooks --->--+


### ansible 配置文件

ansible --version

ansible 2.7.7
  **config file** = /etc/ansible/ansible.cfg
  **configured module search path** = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  **ansible python module location** = /usr/lib/python3/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.7.3 (default, Jan 22 2021, 20:04:44) [GCC 8.3.0]

1. /etc/ansible/ansible.cfg
    inventory = /etc/ansible/hosts





### Ansible 操作的对象

hosts 主机

Networking 网络设备

windows 不能安装主控端


### 主机清单, 资产

ansible controller 

实现主机分组

主机清单的定义

    主机清单存储位置    /etc/ansible/hosts

    方法一:
        直接在清单文件中写入 IP 或主机名

    方法二:
        在清单中添加分组，然后再写IP 或主机
        
        [web]
        192.168.1.1
        [dev]
        192.168.2.1

1. 静态资产
    /etc/ansible/hosts      // 没有的话创建

        www[001:006].example.com
        192.168.1.[1:250]

        [db_servers]
        192.168.1.8

        [web_servers]
        192.168.1.8

        [all_servers]
        [all_servers:children]          // 这个必须有, 还必须是 :children
        db_servers
        web_servers

    没有在组中的属于 all 组

    ansible all --list-hosts                            // 列出所有/etc/ansible/hosts中的资产
    ansible all -i inventory.ini --list-hosts           // 列出所有自定义资产
    ansible db_servers -i inventory.ini --list-hosts    // 列出这个组的


2. 动态资产

### 案例

1. 主机互通性测试

    免密登录
        ssh-keygen -t rsa -f /root/.ssh/id_rsa -N ''
        -f keyfile          // 私钥位置
        -N new_passphrase   // 私钥密码
        ssh-copy-id -i /root/.ssh/id_rsa.pub root@192.168.1.1

    ping 是个假象，ssh

    ansilbe 主机清单中IP或分组名称   -m  模块

        ansible 192.168.1.1 -m ping
        
        ```
        10.0.4.127 | SUCCESS => {
            "changed": false,
            "ping": "pong"
        }
        ```


2. cron 模块实现配置多主机时间同步
    时钟源服务器
        国内: time1.aliyun.com
        国外: time.windows.com

    ansible 主机清单 -m 模块 -a 参数

    cron 模块

        ansible light -m cron -a 'name="test cron1" job="ntpdate time1.aliyun.com" minute=0 hour=*/1'
        job : 命令
        
        ```
        192.168.1.55 | CHANGED => {
            "changed": true,
            "envs": [],
            "jobs": [
                "time test"
            ]
        }
        ```
        
        在远程主机上查看结果:
            crontab -l


**是不能用 crontab -e 进行编辑的, 否则 ansible 无法再次操作它**

    name    指定一个 cron job 的名字, 一定要指定，用于删除
    minute  分, */5
    hour    时，*/24
    day     天
    month   月
    weekday 星期(0-6, Sunday-Saturday)
    job     指定要执行的内容，通常是一个脚本或者一段内容
    state   absent 删除, present 新增(deafult)


3. copy 模块实现多主机配置文件同步
    
    仅用于将本地文件/文件夹拷贝到远程主机

    ansible inventory -m copy -a 参数

    ansible function1 -m copy -a "src=/etc/hosts dest=/etc/hosts"





### ansible 资产选择器

all, 叫做pattern, 匹配, 匹配 -i 指定的资产的一部分
    -i, --inventory, --inventory-file, 逗号分割

    ansible all -i 192.168.1.1, 192.168.1.2 -m ping

    ` ansible 1.1.1.1 -i inventory.ini --list-hosts       // inventory.ini 里是什么就写什么, 不要转换为域名
    ` ansible 1.1.1.1* -i inventory.ini --list-hosts       // inventory.ini 里是什么就写什么, 不要转换为域名
        1.1.1.12,  13 ..., 111, 112 ...

并集 :
    ansible 'web:db' -i inventory.ini --list-hosts

交集 :&
    ansible 'web:&db' -i inventory.ini --list-hosts

差集 :!
    ansible 'web:!db' -i inventory.ini --list-hosts     // 只在前组中的，不在后组中的


会在远程主机家目录创建 .ansible 文件夹, 脚本放到这里边执行


### 利用 Ansible 实现管理的方式

1. Ad-Hoc 即 ansible 命令，主要用于临时命令使用场景, 类似命令

    1. Ad-Hoc（点对点）模式：ad-hoc模式就和以前的直连双绞线概念一样，是P2P的连
       接

    1. Ad Hoc源自于拉丁语，意思是“for this”引申为“for this purpose only”，即“为
       某种目的设置的，特别的”意思

1. Ansible-Playbook 主要用于长期规划好的，大型项目的场景，需要有提前的规划, 类
   似shell


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

1. 核心模块(core module)

2. 附加模块(extra module)

3. 自定义模块(consume module)


列举所有核心模块和附加模块
    ansible-doc -l

查询某个模块的用法
    ansible-doc 模块名
    -s, --snippet  简洁信息
        Show playbook snippet for specified plugin(s)



### command & shell 模块

都是再远程服务器上执行命令

command 是 ad-hoc 的默认模块, 若不指定模块名字时默认使用此模块


ansible all -i hosts -a "echo 'hello'"



shell 模块可以执行 SHELL 的内置命令和特性(比如管道符)

command 模块无法执行SHELL的内置命令和特性


```
ansible all -m shell  -a "echo 'hello' | grep -o 'o'"
```


### script 模块

将管理节点上的脚本传输到被管理节点上进行执行, 理论上此模块的执行完全不需要被管
理的服务器上有python


ansible all -i inventory.ini -m script -a '/root/a.sh'




### file 模块

在目标主机创建文件或目录，并赋予权限

- name: create a file
  file: 'path=/root/foo.txt state=touch mode=0755 owner=foo group=foo'


gourp   文件或目录的属组
owner   文件或目录的属主
mode    文件或目录权限
path    文件或目录的路径
recurse 地柜设置文件或目录的属性
src     只用于state, 真
dest    只用于state, 假

state 
    - directory   如果目录不存在则创建
    - file        文件不存在则创建，存在则返回文件的信息, 常用于检查文件是否存在
    - link        创建软连接文件
    - hard        创建硬链接文件
    - touch       
    - absent      删除文件，目录或取消链接文件


创建文件
    ansible web -i hosts -m file -a "path=/root/a.txt state=touch"

创建目录
    ansible web -i hosts -m file -a "path=/root/a.txt state=directory"

改变文件所有者及权限
    ansible web -i hosts -m file -a "path=/root/a.txt owner=nobody group=nobody mode=644"

创建一个软连接
    ansible web -i hosts -m file -a "src=/root/.tmux.conf  dest=/git/ubuntumate/.tmux.conf state=link"

删除一个文件
    ansible web -i hosts -m file -a "path=/root/shell/docker1.sh state=absent"

ansible web -i hosts -m file -a 








### copy 模块

实现ansible服务端到目标主机的文件传送

- name: copy a file
  copy: 'remote_src=no src=roles/testbox/files/foo.sh 
        dest=/root/foo.sh mode=0644 force=yes'


    backup 拷贝文件前，若原始目标文件发生变化，则对目标文件进行备份(目标主机上已有这个文件，内容不一样)
    woner   指定新拷贝文件的所有者
    group   指定新拷贝文件的所有组
    mode    指定新拷贝文件的权限

    ansible all -i hosts -m copy -a "src=./nginx.repo dest=/etc/yum.repos.d/ backup=yes mode=644 owner=nobody group=nobody"



### repository 模块

name : 仓库名称, 必须添加的参数

description :仓库描述信息, 必须添加的参数

baseurl : yum 存储库 "repodata" 目录所在目录的URL, 必须添加的参数, 也可以是多个URL的列表

file    : 仓库文件保存到本地的文件名, 不包含 .repo, 默认是 name 的值

stat    : preset 确认添加仓库文件; absent,确认删除仓库文件

gpgcheck: 是否检查 GPG   yes | no, 没有默认值, 使用 /etc/yum.conf 中的值



ansible web -i hosts -m repository -a "name=epel baseurl='http://10.0.0.1/.../Packages' description='epel'"

删除
    ansible web -i hosts -m repository -a "name=epel stat=absent""

好像是只能删除自己创建的



### yum 模块

name 名称，多个用逗号隔开

state   对当前指定的软件安装，移除操作(present installed latest absent removed) 
    present         确保已安装，但不升级
    installed       确保已经安装
    latest          确保安装，且升级为最新
    absent/removed  确保已删除


ansible web -i hosts -m yum -a "name=nginx state=present"

ansible web -i hosts -m yum -a "name=nginx state=absent"

软件包组，要有一个@
    ansible web -i hosts -m yum -a "name='@Development tools' state=present"



### systemd 模块

Centos6 之前的版本使用 service 模块

管理远程节点上的 systemd 服务,就是 systemd 所管理的服务

    daemon_reload   重新载入 systemd, 扫描新的或有变动的单元

    enabled         是否开机自动启动 yes|no

    name            必选项, 服务名称, 比如 httpd vsftpd

    state           对当前服务执行启动，停止，重启，重新加载等操作
        started, stopped, restarted, reloaded


    ansible web -i hosts -m systemd -a "name=httpd state=started"



### group

对组进行管理

name    组名
system  是否为系统组
state   创建或删除, presetn/absent


### user

name                用户名
password            密码, 没有默认值,接收加密的值
update_password     更新密码
home                指定用户家目录所在目录,/home/ 还是别的?
shell               默认shell
comment             描述信息
create_home         是否创建家目录, 默认创建，不创建设置为no
group               主组
groups              附加组, 默认会把用户从其他组中删除
append              yes|no, 和groups 配合使用, yes 时不会把用户从其他组中删除
system              yes|no, yes为系统账号
expire              过期时间, 
generate_ssh_key    yes|no, 为用户生成秘钥，不会覆盖原来的秘钥
ssh_key_type        秘钥类型, 默认 rsa
state               yes|absent, yes 为添加, absent 为删除
remove              当与state=absent 一起使用， 删除一个用户及关联目录，如家目录，邮箱目录


创建用户并设置密码
    pass=$(echo "123456"| openssl passwd -l -stdin)
    ansible web -i hosts -m user -a "name=foo password=${pass}"

有效期
    ansible web -i hosts -m user -a "name=foo expires=$(date +%s -d 20210101) groups=db_admin append=yes"


date 命令
    1. 3小时后是几点几分
        date +%T -d '3 hours'

    2. 任意日期的前N天，后N天的具体日期
        date +%F -d "20190910 1 day"
        date +%F -d "20190910 -1 day"

    3. 两个日期的差值
        d1=$(date +%s -d 20190102)
        d2=$(date +%s -d 20190101)
        echo $(((d1-d2)/86400))


### stat 模块

获取远程文件状态信息

- name: check if foo.sh exists
  stat: 'path=/root/foo.sh'
  register: script_stat             // 将 stat 信息传给 script_stat


### debug模块

打印语句到ansible执行输出

- debug: msg=foo.sh exists
  when: script_stat.stat.exists

主要用于调试，通常的作用是将一个变量的值打印出来

    var     直接打印一个指定的变量值

    msg     打印一段可以格式化的字符串

    ansible web -i hosts -m debug -a "var=role" -e "role=web"       // -e 传变量, role 最终等于 'web'

    ansible web -i hosts -m debug -a "msg='role is {{role}}' " -e "role=web"    // 输出 role is web




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

它的每次使用都会被 ansible 标记为 changed 状态, 文件以 .j2 结尾

    src     ansible 控制端的文件路径
    dest    ansible 被控制端的文件路径
    owner   指定文件的属主
    group   指定文件的属组
    mode
    backup  创建一个包含时间戳的备份文件， 这样就可以恢复了 yes/no

    
    ```cat.j2
    Hello {{var}}!
    ```

    ansible web -m template -a "src=cat.j2 dest=/root/a.txt" -e "var=world"

### lineinfile 模块 ???

用正则表达式的方式对目标文件的一行内容进行修改删除等操作, 一次只能一行

如果要讲匹配的多行都进行处理，参考 replace

如果想对一个文件进行一次性添加、更新、删除多行等操作，参考 blockinfile

    path    被管理目标文件路径
    state   absent 删除 present 替换(默认)
    regexp  正则
    line    要在文件中插入、替换的行，需要 state=present
    create  文件不存在时，是否要创建文件并添加内容


    ansible web -i host -m lineinfile -a "path=/etc/sudoers regexp='^%whell' state=absent"

    ansible web -i host -m lineinfile -a "path=/etc/sudoers regexp='^SELINUX='  line='SELINUX=disabled' state=present"


### blockinfile

ansible web -i host -m blockinfile -a "path=/etc/sudoers block='hello\nworld'"          // 插到文件最后

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









