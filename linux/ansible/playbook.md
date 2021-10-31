
# playbook

1. 每一个 play 都是以断横线开始的
2. 每一个 play 都是一个 YAML 字典格式

```一个例子
---
- key1: value1
  key2: value2
  key3: value3
...
```

```一个包含3个play的例子
---
- key1: value1
  key2: value2
  key3: value3
- key4: value4
  key5: value5
  key6: value6
- key7: value7
  key8: value8
  key9: value9
...
```


## Play 属性

常用属性
    name        : 每个 play 的名字
    hosts       : 每个 play 涉及的被管理的服务器, 同 ad-hoc 中的 pattern
    tasks       : 每个 play 中具体要完成的任务, 以列表的形式表达
    become      : 如果需要提权，则加上 become 相关属性
    become_user : 提权到哪个用户
    remote_user : 指定连接到远程节点的哪个用户. 若不指定，则默认使用当前执行 Ansible Playbook 的用户


## 一个完整的剧本

一个含有一个play的例子

    ```
    ---
    - name: the first play example
      hosts: all
      remote_user: root
      tasks:
        - name: install nginx package
          yum: name=nginx state=present
        - name: copy nginx.conf to remote server
          copy: src=nginx.conf dest=/etc/nginx/nginx.conf
        - name: start nginx server
          service:
            name: nginx
            enabled: true
            state: started
    ...
    ```

task 属性中人物的多种写法

    以启动 nginx 服务, 并增加开机启动为例

    1. 一行的形式
        service: name=nginx enabled=true state=started

    2. 多行的形式
        service: name=nginx
                 enabled=true
                 state=started

    3. 多行写成字典的形式
        service:
          name: nginx
          enabled: true
          state: started


## 如何对 Playbook 进行语法教研

下面校验的方法，只能校验 Playbook 是否正确，而不能校验 YAML 文件是否语法正确

    ` ansible-playbook myplaybook.yml --syntax-check
    ` ansible-playbook -i hosts myplaybook.yml --syntax-check

我们同样可以使用检查 YAML 的语法格式的方法进行 Playbook 


## 执行 Playbook

ansible-playbook myplaybook.yml

ansible-playbook -i hosts myplaybook.yml


## 单步调试

ansible-playbook -i hosts myplaybook.yml --step

    C: 继续
    Y: yes


ansible-playbook -i hosts myplaybook.yml -C
    
    -C, --check
        don't make any changes; instead, try to predict some of the changes that may occur

    --step
        one-step-at-a-time: confirm each task before running

    --syntax-check
        perform a syntax check on the playbook, but do not execute it


## 变量

1. 全局变量

2. 剧本变量

3. 资产变量


### 全局变量

使用 ansible 或者 ansible-playbook 时，手动通过 -e 传递给 ansible 的变量

-e, --extra-vars
    set additional variables as key=value or YAML/JSON, if filename prepend with @

    文件是 YAML 或 JSON 都可以, 但是要是字典形式

    cat a.json
    ```
    {"name":"foo","type":"school"}
    ```

    cat a.yml
    ```
    ---
    name: foo
    type: school
    ...
    ```
    ansible all -i localhost, -m debug -a "msg='name' is {{name}}, type is {{type}}" -e @a.json


### 剧本变量

此种变量和 playbook 有关

1. 通过 play 属性 vars 定义

```
---
- name: test the play vars
  hosts: all
  vars:
    user: lilei
    home: /home/lilei
...
```

2. 通过 vars_files 文件来定义, YAML 或 JSON

```
---
- name: test play vars
  hosts: all
  vars_files:
    - vars/usrs/yml
...
```

cat /var/users.yml
```
---
user: lilei
home: /home/lilei
...
```

调用的例子

```
- name: test play vars
  hosts: all
  vars:
    user: lilei
    home: /home/lilei
  tasks:
    - name: create the user {{user}}
      user:
        name: "{{user}}"            // 这里一定要加引号, Alwasy quote template expresson brackets when they start a value
        home: "{{home}}"
```

这样错误的主要原因是 playbook 是 yaml 的文件格式， 当 ansible 分析 yaml 文件时,
有可能会误认为类似 name: {{ user }} 是一个字典的开始. 因此加于对变量的引用，加
上双引号，避免 ansible 错误解析




### 资产变量

1. 主机变量

[webs]
172.11.11.1  user=lilei port=3389


    -m debug -a "msg='{{user}} {{port}}'"

2. 主机组变量

    [webs:vars]
    home='/home/lilei'


3. 优先级
    主机变量优先

4. 变量的继承

    [web]
    1.1.1.1

    [dev]
    1.1.1.2

    [all]
    [all:children]
    web
    dev


    [all:vars]
    user=lilei


Inventory 内置变量

    ansible_ssh_host    将要连接的远程主机名,
    ansible_ssh_port
    ansible_ssh_user    默认的 ssh 用户名, 默认是执行 ansible playbook 的用户
    ansible_ssh_pass    ssh 密码, 这种方式不安全，建议使用 --ask-pass 或 ssh 密钥
    ansible_sudo_pass   
    ansible_sudo_exe    (new in version 1.8) sudo 命令路径
    ansible_ssh_private_key_file    使用的私钥文件. 适用于有多个密钥, 而你不想使用SSH代理的情况
    ansible_python_interpreter      远程主机使用的python解释器路径
        


    1.1.1.1   ansible_ssh_port 2222



## Facts 变量

不包含在前文中介绍的全局变量、剧本变量和资产变量之内。

Facts 变量不需要我们人为去声明变量名和赋值

它的声明和赋值完全由 ansible 中的 setup 模块完成

它收集了有关被管理服务器的操作系统版本、服务器IP地址、主机名、磁盘使用情况、CPU
个数、内存大小等有关被管理服务器的私有信息

在每次Playbook 运行的时候都会发现在 Playbook 执行前都会有一个 Gathering Facts
的过程。这个过程就是收集被管理的服务器的Facts信息的过程。


### 手动收集 Facts 变量

收集的所有信息

    `ansible all -i localhost, -m set

    `ansible all -i localhost, -m set | less

过滤选择 memory 相关的

    `ansible all -i localhost, -m setup -a "filter=*memory*"

过滤选择 ipv4 相关的

    `ansible all -i localhost, -m setup -a "filter=*ipv4*"


ansible playbook 中可以直接使用 Facts 变量

    {{ansible_default_ipv4.address}}


### 在playbook 中去关闭 Facts 变量的获取

gather_facts: no

- name: test facts
  hosts: web
  gater_facts: no
  remote_user: root
  tasks:
    -name: install nginx package
     ...


## 注册变量

往往用于保存一个 task 任务的执行结果, 以便于 debug 时使用

或者将此次 task 任务的结果作为条件, 去判断是否去执行其他 task 任务

注册变量在 Playbook 中通过 register 关键字去实现

```
---
- name: install a package and print the result
  hosts: web
  remote_user: root
  tasks:
    - name: install nginx package
      yum: name=nginx state=present
      register: install_result
    - name: print result
      debug: var=install_result
...

```

### 变量优先级

全局变量 > 剧本变量 > 资产变量
                        (主机变量 > 主机组变量)


## 任务控制

### 1. 条件判断 when

    ```
    name: 
    hosts: web
    gather_facts: no
    tasks:
        - name: check nginx syntax
          shell: /usr/sbin/nginx -t
          register: nginxsyntax             rc 任务是否成功，0：成功
        
        - name: print nginx syntax
          debug: var=nginxsyntax
        
        - name: start nginx
          service: name=nginx state=started
          when: nginxsyntax.rc == 0
    ```

1. 在when关键字中引用变量时，变量名不需要加"{{ }}"

==
!=
> >=
< <=

and
or
not
()


### 循环控制

with_items,   $i 变量只能是关键字 item

```
vars:
  createuser:
    - tomcat
    - www
    - mysql
tasks:
  - name: create user
    user: name={{ item }} state=present
    with_items: "{{ createuser }}"
```


新版本:

```
- name: loop item
  hostas: all
  gather_facts: no
  vars:
    somelist:
      - 'a'
      - 'b'
      - 'c'
    number:
      - 1
      - 2
      - 3
  tasks:
    - name: show item
      debug:
        var: "{{item}}"
      loop: "{some_list}"
    - name: show item when item > 2
      debug:
        var: "{{ item }}"
      loop: "{{ numbaer }}"
      when: item > 2
```
