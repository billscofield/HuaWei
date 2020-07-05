
# 马哥

主控端
  IP: 192.168.30.7

受控端
  PC1
    IP: 192.168.30.101
    hostname: node1

  PC2
    IP: 192.168.30.102
    hostname: node2

  PC3
    IP: 192.168.30.103
    hostname: node3



## 主控端安装

apt-cache show ansible

apt-get install ansible

主配置文件:
    /etc/ansible/ansible.cfg
    /etc/ansible/hosts          //主机清单
    /etc/ansible/roles

    模块
        dpkg --listfiles | less

ansible --version

    config file = /etc/ansible/ansible.cfg
    configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
    ansible python module location = /usr/lib/python3/dist-packages/ansible
    executable location = /usr/bin/ansible

/usr/bin/
    ansible
    ansible-config -> ansible
    ansible-connection
    ansible-console -> ansible          //基于console界面与用户交互的执行工具
    ansible-doc -> ansible              //查看帮助
    ansible-galaxy -> ansible           //下载、上传优秀代码或Roles模块的官方平台
    ansible-inventory -> ansible
    ansible-playbook -> ansible         //定制自动化任务，编排剧本工具/usr/bin/ansible-pull远程执行命令的工具
    ansible-pull -> ansible
    ansible-test
    ansible-vault -> ansible            //文件加密工具





### 主机清单

语法
    ansible <host-pattern> [options]

    -m 'MODULE_NAME', --module-name 'MODULE_NAME'
        module name to execute (default=command)

    -k 用户名密码

    ---

    必须首先配置host

        vi /etc/ansible/hosts
            添加主机ip
            192.168.30.101
            192.168.30.102
            192.168.30.103

    ansible 192.168.30.101 -m ping -k             //走的是ssh协议
        返回一个 "ping": "pong" 说明成功了

    ansible 192.168.30.101,192.168.30.102,192.168.30.103  -m ping -k
        需要存放主机的公钥到自己的 know_hosts, ssh yes 一次即可
        适用于所有服务器的口令全都一样的情况


    ansible all -m ping     
        all 所有主机

主机
    
    1. 单独写IP

    1. 分组
        [webserver]
        192.168.1.1
        192.168.1.2:ssh端口号

        [dbserver]
        192.168.1.[3:5]

        文件中有具体的例子




/etc/ansible/ansible.cfg

```
[defaults]

# some basic default values...

#inventory      = /etc/ansible/hosts
#library        = /usr/share/my_modules/
#module_utils   = /usr/share/my_module_utils/

#remote_tmp     = ~/.ansible/tmp                        
#local_tmp      = ~/.ansible/tmp   //执行命令的时候，会将命令转换成python脚本放到此目录，然后复制到 remote_tmp 目录中, 执行完毕会删除远程单独该目录

#plugin_filters_cfg = /etc/ansible/plugin_filters.yml
#forks          = 5                 //并发执行多少个命令
#poll_interval  = 15

#sudo_user      = root              
#ask_sudo_pass = True
#ask_pass      = True
#transport      = smart
#remote_port    = 22
#module_lang    = C
#module_set_locale = False


# uncomment this to disable SSH key host checking   不检查known_host, 可以设置false
#host_key_checking = False


# logging is off by default unless this path is defined
# if so defined, consider logrotate
#log_path = /var/log/ansible.log        取消注释即可


修改配置文件不用重启服务，不是以服务方式运行的

```



### ansible-doc

帮助文档

ansible-doc [-l|-F|-s] [options] [-t <plugin type> ] [plugin]

-a, -all 

    显示所有模块的文档

-l, --list

    列出所有可用模块

    ansible-doc -l | wc -l  --> 2078

-s, --snippet

    Show playbook snippet for specified plugin(s)

    简单显示下主要内容


例子:

    ansible-doc ping

### ansible

ansible <host-pattern> [options]

-m 制定模块名
-a 'MODULE_ARGS', --args 'MODULE_ARGS'
          module arguments

--version

-v 详细过程 -vv -vvv 更加详细

--list, --list-hosts 显示主机列表

    ansible all --list

-k, --ask-pass      提示输入ssh连接密码，默认Key验证

-K, --ask-become-pass   输入sudo时的口令

-C, --check         

-u, --user=REMOTE_USER      执行远程执行的用户
    
    ansible 192.168.30.1 -m ping -u linux_user -k

-b, --become

    ansible 192.168.30.1  -m command -a 'ls /root' -u linux_user -k -b  -K

    在受控端配置了 sudo NOPASSWD:ALL 后就不用输入 -K 了


    ansible 192.168.30.1 -m command -a 'ls /root' 
    
    这样的话就需要设置 Publick key 

    ssh-copy-id 192.168.30.101 即可


#### pattern 匹配

1. All 所有Inventory中的所有主机

`ansible all -m ping 

1. \*通配符

主机清单里有的

```
ansible "*" -m ping 

ansible 192.168.1.* -m ping 

ansible "*srvs" -m ping 

```

1. 或(并集) 

两者都

```
ansible "websrvs:apprvs" -m ping

ansible "192.168.1.1:192.168.1.2" -m ping
```


1. 与(交集)

在websrvs组，且在dbsrvs组中的主机

```
ansible 'websrvs:&dbsrvs' -m ping       //也可以用双引号，也可以不用引号，因为这里有&,所以要加引号
```


1. 非

`ansible 'websrvs:!dbsrvs' -m ping      //这个只能用单引号, 所以所有的都用单引号吧

websrvs中的主机，且不在dbsrvs中的


1. 正则表达式


## ansible命令的执行过程

### ansible命令的执行过程
1. 加载配置文件 /etc/ansible/ansible.cfg

1. 加载自己对应的模块, 例如默认的command

1. 通过ansible讲模块或命令生成对应的临时py文件, 并讲该文件传输(PUT命令)至远程服务器的对应执行用户 $HOME/.ansible/tmp/ansible-tmp-数字/XXX.py 文件

1. 给文件 +x 执行
    ansible all -m ping -vvv | grep chmod

1. 执行并返回结果

1. 删除临时py文件，sleep 0 退出
    ansible all -m ping -vvv | grep rm 
    



### 执行状态

绿色: 执行成功并且未对目标主机做出改变

黄色：执行成功，并且对目标主机做出了修改, 例如删除，更改

红色：执行失败

/etc/ansible/ansible.cfg 中的 [colors] 有说明



### 常用模块

1. command

    ansible all -m command -a "mkdir /data"
    ansible all -m command -a "ls -ld /data"
    ansible all -m command -a "df -h"

    ansible-doc command

    creates
        If it already exists, this step *won't* be run.     //存在则不执行, 不存在则执行

    removes
        If it already exists, this step *will* be run.      //不存在则不执行, 存在则执行

        没有creates、removes 将都执行

    ansible all -m command -a 'remove=/etdjf/fs cat /etdjf/fs'


    chdir
        Change into this directory before running the command.


        ansible all -m command -a 'chdir=/etdjf/fs ls -al'

        ansible 192.168.1.1 -m command -a 'chdir=/data ./a.sh'      //要写#!/usr/bin/bash


1. shell

    ansible 192.168.1.1 -m shell -a 'echo $HOSTNAME'                //双引号有问题

    ansible 192.168.1.1 -m shell -a 'echo bill:bill | chapasswd'

    ansible all -m shell -a 'reboot'


1. script, 运行脚本

   ansible all -m script -a '/root/hostname.sh'                     //脚本在主控端

1. copy, copy files to remote locations

    backup
        Create a backup file including the timestamp information so you can get the original file back if you somehow
        clobbered it incorrectly.
        [Default: no]
        type: bool
        备份文件是原名称+suffix(suffix 是随机数字+日期)

    src=

    dest=

    mode=644

    owner=bill

    group=bill

    ansible 192.168.1.1 -m copy -a 'src=/etc/ssh/sshd_config dest=/etc/ssh/sshd_config backup=yes'

    ansible 192.168.1.1 -m copy -a 'src=/etc/ssh/sshd_config dest=/etc/ssh/sshd_config backup=yes '


1. fetch 

    It is used for fetching files from remote machines and storing
    them locally in a file tree, organized by hostname. This module is also supported for Windows targets.

    只能复制远程的单个文件，不能是目录

    src=

    dest= 要是个目录


1. file

Sets attributes of files, symlinks, and directories, or removes files/symlinks/directories. Many other modules
support the same options as the `file' module - including [copy], [template], and [assemble]. For Windows
targets, use the [win_file] module instead.

path/name/dest

    ansible all -m file -a 'name=/data/f1 state=touch'


state

    1. If 'directory', all intermediate subdirectories will be created if they do not exist. Since Ansible 1.7 they 
will be created with the supplied permissions. 

    1. If 'file', the file will NOT be created if it does not exist; see
the 'touch' value or the [copy] or [template] module if you want that behavior.  

    1. If 'link', the symbolic link will be created or changed. Use 'hard' for hardlinks. 

    1. If 'absent', directories will be recursively deleted, and files or symlinks will be unlinked. 
Note that 'absent' will not cause `file' to fail if the 'path' does not exist as the state did not change. 

    1. If 'touch' (new in 1.4), an empty file will be created if the 'path' does not exist, while an existing file or 
directory will receive updated file access and modification times (similar to the way 'touch' works from the command line).

(Choices: absent, directory, file, hard, link, touch)[Default: file]


    ansible all -m file -a 'name=/data/f1 state=absent'     //删除

    ansible all -m file -a 'name=/data/dirf1 state=absent'     //删除文件夹

    ansible all -m shell -a 'rm -rf /data/*'     //删除文件夹下所有文件

    ansible all -m file -a 'name=/data/dirf1 state=directory'     //创建文件夹

    ansible all -m file -a 'src=/etc/fstab name=/etc/fstab.link state=link'     //创建软链接
    
    
1. hostname

    ansible 192.168.1.1 -m hostname -a 'name=db1'       //未更改hosts文件


1. Cron 

    ansible all -m cron -a 'minute=* weekday=1,3,5 job="/usr/bin/wall hello world" name=sayhello'       //创建

    crontab -e

    ansible all -m cron -a 'disabled=true job="/usr/bin/wall hello world" name=sayhello'                //禁用

    ansible all -m cron -a 'disabled=true job="/usr/bin/wall hello world" name=sayhello state=absent'   //删除


1. apt

   ansible debians -m apt -a 'name=ascii state=latest'  //安装
   ansible debians -m apt -a 'name=ascii,jp2a,mycli state=latest'  //安装

   ansible debians -m apt -a 'name=ascii state=absent'  //卸载

   ansible debians -m apt -a 'list=installed' 


1. service

    enabled 开机启动

    name

    state: (Choices: reloaded, restarted, started, stopped)[Default: (null)]


    ansible all -m service -a 'name=vsftpd state=started enabled=true'


1. user

    remove:
        This only affects `state=absent', it attempts to remove directories associated with the user. The behavior is
        the same as `userdel --remove', check the man page for details and support.


    ansible websrvs -m user -a 'name=nginx shell=/sbin/nologin system=yes home=/var/nginx groups=附加组 comment="描述"'

    ansible websrvs -m user -a 'name=nginx state=absent remove=yes'

1. group

    ansible websrvs -m group -a 'name=nginx system=yes'     //默认state=present


1. setup

This module is automatically called by playbooks to gather useful variables about remote hosts that can be used
in playbooks. It can also be executed directly by `/usr/bin/ansible' to check what variables are available to a
host. Ansible provides many `facts' about the system, automatically. This module is also supported for Windows
targets.

    ansible all -m setup 

    ansible all -m setup -a 'filter=ansible_fqdn'   //过滤查找 ansible_fqdn 变量

    yaml playbook：

    ```
    cd ~/ansible/

    vi var.yml

    ---
    - hosts: websrvs
      remote_user: root

      tasks:
        - name: create log file
          file: name=/data/{{ ansible_fqdn }}.log state=touch mode=644 own=w



    ansible-playbook -C var.yml     //检查语法
    ansible-playbook var.yml        //执行
    ```

    ---

    ansible all -m setup | grep mem     //内存相关

    ansible all -m setup -a 'filter=ansible_memtotal_mb'


### 变量的使用

#### 变量的来源

1. ansible setup facts 远程主机的所有变量都可以直接调用

1. 在/etc/ansible/host中定义
    
    普通变量：主机组中主机单独定义，优先级高于公共变量

    公共(组)变量：针对主机组中所有主机定义统一变量

1. 通过命令行制定变量，优先级最高
    
    ansible-playbook -e varname=value

1. 在 playbook 中定义

    vars:
      - var1: value1
      - var2: value2

1. 在独立的变量YAML文件中定义

1. 在role中定义


   
cd ~/ansible

vi var.yml

```
var1: 值
var2: 值
var3: 值


---
- hosts: websrvs
  remote_user: root
  vars_file:
    - vars.yml

    tasks:
      - name: install package
        apt: name={{ var1 }}

      - name: touch file
        file: name=/data/{{ var2 }}.log state=touch
```




## template 模板

/etc/nginx/nginx.conf
    work_processes auto;    //和硬件相关

ps aux | grep nginx | grep "worker process"     //查看worker进程数目

根据硬件配置生成相对应的配置文件

Jinja2 语言

数字: 整数，浮点数

列表: [item1,item2,...]

元组:(item1,item2,...)

字典:{key1:value1,key2:value2,...}

布尔型: true/false

算数运算: `+, -, *, /, //(整除), %, **

比较操作: ==, !=, >, >=, <, <=

逻辑运算: and, or, not

流表达式: For If When


可以放到任何目录，一般会放到一个固定的独立的文件夹中, 比如 ~/ansible/templates/xxx.j2



template 本身也是一个模块,Templates a file out to a remote server

    只能用于playbook, 不能用于命令行(ansible all -m template 不能这么用)


template 实现 worker_processes 数目是cpu 的2倍

    1. 步骤一:查看cpu

        ansible websrvs -m setup | grep cpus

    1. 步骤二: 修改模板文件

    cp /etc/nginx/nginx.conf ~/ansible/templates/nginx.conf.j2

    vi ~/ansible/templates/nginx.conf.j2


    ```nginx.conf.j2

    worker_processes {{ ansible_processor_vcpus*2 }};     //从步骤一得到

    ```

    1. 步骤三,playbook

    ```~/ansible/nginx.yml
    ---
    - hosts: websrvs
      remote_user: root

      tasks:
        - name: install nginx
          apt: name=nginx

        - name: copy template
          tempalte: src=nginx.conf.j2 dest=/etc/nginx/nginx.conf        //src如果是在ansible目录中可以不写绝对路径, 是要在/etc/ansible吗?
          notify: restart service                           //和下边的handlers一起用???

        - name: start service
          service: name=nginx state=started enabled=true


      handlers:                                             //好像是触发器一样的东西
        - name: restart service
          service: name=nginx state=reloaded
    ```

    1. 步骤四

    ansible-playbook -C nginx.yml

    1. 步骤五

    ansible-playbook nginx.yml

    1. 查看

    ansible websrvs -m shell -a 'ss -tlnpu'

    ansible websrvs -m shell -a 'ps -aux | grep nginx'



    ---

    在主机清单中使用变量

    /etc/ansible/hosts
    ```
    [websrvs]
    192.168.1.1 http_port=801
    192.168.1.2 http_port=802

    [websrvs:vars]
    http_port=80
    ```

    playbook中定义变量

    ```
    ---
    - hosts: websrvs
      remote_user: root
      vars:
       - http_port: 88
    ```


    命令行中使用变量

    ansible websrvs -e 'http_port=99' nginx.yml


    变量优先级
        命令行>playbook>主机清单


## when

不同的发行版，或者不同版本，配置文件不一样，这样可以做N个模板，适配N个不同发行版、不同版本的主机
