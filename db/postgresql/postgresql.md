
## 

[link](https://www.zhihu.com/question/20010554)

目前流行的数据库访问技术

ODBC: Open Database Connectivity
JDBC: Java Database Connectivity
PDO:    PHP Data Object


## 1. PostgreSQL 搭建


#### 1. 安装

[官网](https://www.postgresql.org/download/)


1. 切换用户

    安装完毕后，系统会创建一个数据库超级用户 postgres，密码为空

2. 进入postgresql

    这时使用以下命令进入 PostgresSQL，输出以下信息，说明安装成功：

    ```
    postgres@hello:~$ which psql
    /usr/bin/psql

    postgres@liujiao:~$ psql
    psql (14.1 (Debian 14.1-1.pgdg110+1))
    Type "help" for help.

    postgres=#

    ```

3. 退出 postgresql

    \q

4. 服务的启动

    PostgreSQL 安装完成后默认是已经启动的，

    systemctl restart posqgresql

5. 帮助

    进入命令行工具，我们可以使用 \help 来查看各个命令的语法

    \help <command_name>

#### 2. 服务管理

su - postgres
pwd
/var/lib/postgresql

1. pg_ctl
    
    centos

2. pg_ctlcluster

    pg_ctlcluster is Ubuntu-specific pg_ctl wrapper.

    pg_ctlcluster 14 main status
    pg_ctlcluster 14 main stop
    pg_ctlcluster 14 main start

3. systemctl

    systemctl status postgresql


## 2. 库操作

### 2. 创建数据库

PostgreSQL 创建数据库可以用以下三种方式：

1. 使用 CREATE DATABASE SQL 语句来创建。
2. 使用 createdb 命令来创建。

    createdb 是一个 SQL 命令 CREATE DATABASE 的封装。

    createdb 命令语法格式如下：

    createdb [option...] [dbname [description]]
    参数说明：

        dbname：要创建的数据库名。
        
        description：关于新创建的数据库相关的说明。
        
        options：参数可选项，可以是以下值：
            
            1. -h host
            2. -p port         指定服务器监听的端口，或者 socket 文件
            3. -U username     连接数据库的用户名
            4. -w              忽略输入密码
            5. -W              连接时强制要求输入密码
            6. -E encoding     指定数据库的编码
            7. -l locale       指定数据库的语言环境
            
            8. -D tablespace   指定数据库默认表空间
            9. -e              将 createdb 生成的命令发送到服务端
            10. -T template     指定创建此数据库的模板

    > createdb -h localhost -p 5432 -U postgres runoobdb
    
3. 使用 pgAdmin 工具。


### 3. 选择数据库

\l              列出所有数据库
\c 数据库名称   选择数据库

系统命令行窗口
    在系统的命令行查看，我么可以在连接数据库后面添加数据库名来选择数据库：

    > $ psql -h localhost -p 5432 -U postgres runoobdb

### 4. 删除数据库

1. 使用 DROP DATABASE SQL 语句来删除。

    DROP DATABASE 会删除数据库的系统目录项并且删除包含数据的文件目录。

    DROP DATABASE 只能由超级管理员或数据库拥有者执行。

    DROP DATABASE [ IF EXISTS  ] name

2. 使用 dropdb 命令来删除。

    dropdb 是 DROP DATABASE 的包装器。

    dropdb 用于删除 PostgreSQL 数据库。

    dropdb 命令只能由超级管理员或数据库拥有者执行。

    dropdb [connection-option...] [option...] dbname
        
        -e      显示 dropdb 生成的命令并发送到数据库服务器。
        
        -i      在做删除的工作之前发出一个验证提示。
        
        -V      打印 dropdb 版本并退出。
        
        -w      连接数据库的用户名。
        
        -W      连接时强制要求输入密码。
        
        --help  显示有关 dropdb 命令的帮助信息。
        
        -h host         指定运行服务器的主机名。
        
        -p port         指定服务器监听的端口，或者 socket 文件。
        
        -U username     连接数据库的用户名。
        
        --if-exists     如果数据库不存在则发出提示信息，而不是错误信息。
        
        --m intenance-db=dbname     删除数据库时指定连接的数据库，默认为 postgres，如果它不存在则使用 template1。

3. 使用 pgAdmin 工具。


## 2. 表操作

### 1. 创建表

\d 命令来查看表格(display, show tables)

\d tablename 查看表格信息

### 2. 删除表

DROP TABLE table_name;


## 3. PostgreSQL 模式（SCHEMA）

PostgreSQL 模式（SCHEMA）可以看着是一个表的集合


1. 创建

    create schema myschema;
    create table myschema.mytable(...);


2. 删除模式

    删除一个为空的模式（其中的所有对象已经被删除）：

    DROP SCHEMA myschema;
    删除一个模式以及其中包含的所有对象：

    DROP SCHEMA myschema CASCADE;
