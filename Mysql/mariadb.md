## 

MySQL AB是由MySQL创始人和主要开发人创办的公司。MySQL AB最初是由David Axmark、
Allan Larsson和Michael“Monty”Widenius在瑞典创办的。

Mysql -> SUN -> Oracle


C/S


## mysql

Step 1 — Installing MariaDB

    apt install -y mariadb-server

    apt install -y libmariadb-dev

Step 2 — Configuring MariaDB

    mysql_secure_installation

Step 3 — (Optional) Adjusting User Authentication and Privileges

    mysql -u -h -P

    GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;

    FLUSH PRIVILEGES;

    exit

    ```
    mysql root@(none):mysql> select host,user,password,authentication_string from user;
    +-----------+------+-------------------------------------------+-----------------------+
    | host      | user | password                                  | authentication_string |
    +-----------+------+-------------------------------------------+-----------------------+
    | localhost | root |                                           |                       |
    | localhost | bill | *843A281F0C343C9E6162F4EEFF3129BD41F9E29D |                       |
    +-----------+------+-------------------------------------------+-----------------------+

    ```

Step 4 — Testing MariaDB
    
    systemctl status mariadb

    For an additional check, you can try connecting to the database using the
    mysqladmin tool, which is a client that lets you run administrative
    commands. For example, this command says to connect to MariaDB as root and
    return the version using the Unix socket:

    ```
    mysqladmin version


    You should receive output similar to this:


    mysqladmin  Ver 9.1 Distrib 10.3.29-MariaDB, for debian-linux-gnu on x86_64
    Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

    Server version      10.3.29-MariaDB-0+deb10u1
    Protocol version    10
    Connection          Localhost via UNIX socket
    UNIX socket         /var/run/mysqld/mysqld.sock
    Uptime:             46 min 38 sec

    Threads: 7  Questions: 529  Slow queries: 0  Opens: 175  Flush tables: 1  Open tables: 31  Queries per second avg: 0.189

    ```

    If you configured a separate administrative user with password
    authentication, you could perform the same operation by typing:

    ```
    mysqladmin -u admin -p version

    ```

## 

ll /usr/bin/mysql
-rwxr-xr-x 1 root root 4.0M May 10 11:06 /usr/bin/mysql

ll /usr/bin/mariadb
lrwxrwxrwx 1 root root 5 May 10 11:06 /usr/bin/mariadb -> mysql


utf8 不是 utf-8

mysql 的root密码和linux的root不是一回事儿, 默认没有密码


```/etc/mysql/mariadb.conf.d/50-server.cnf
[mysqld]¬
¬
# * Basic Settings¬
user                    = mysql
pid-file                = /run/mysqld/mysqld.pid
socket                  = /run/mysqld/mysqld.sock
#port                   = 3306
basedir                 = /usr¬                         安装目录
datadir                 = /var/lib/mysql                数据存放位置
tmpdir                  = /tmp
lc-messages-dir         = /usr/share/mysql
#skip-external-locking

# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
bind-address            = 127.0.0.1


# * Character sets
#
# MySQL/MariaDB default is Latin1, but in Debian we rather default to the full¬
# utf8 4-byte character set. See also
character-set-server  = utf8mb4¬
collation-server      = utf8mb4_general_ci
```


```/etc/mysql/mariadb.conf.d/50-client.cnf

[client]¬
# Default is Latin1, if you need UTF-8 set this (also in server section)¬
default-character-set = utf8mb4

# socket location¬
socket = /var/run/mysqld/mysqld.sock                    // /var/run -> /run
```


## 客户端工具

SQLyog: 会自动将关键字转为大些


## 常见命令

不区分大小写，但是建议关键字大些，表名、列名小写

select database()                                       //当前所在数据库

select version()                                        //查看版本

## 注释

hash     单行注释
--空格   单行注释
/* */    多行注释


## DQL 

SELECT 字段,常量,表达式，函数
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT

字段可以添加 着重号

1. 基础查询

    ```
    select 'hello';     常量
    select 4*4;         表达式
    select version();   函数

    别名
        select 'helo' as result;  或者  select 'helo' result;
        别名有空格或特殊符号时，可以加双引号(或单引号)
    
    +
        只做数学运算
        有一个是null, 结果总为null
        字符串同php
        
        使用 concat 进行拼接
    ```

2. 条件查询
    where
    
    条件表达式
        >
        >=
        <
        <=
        !=
        <>
        <=>             //安全等于，可以代替 is ; 也可以普通使用
            WHERE salary <=> 12000;
            WHERE salary <=> null;

    逻辑运算符
        &&
        || 
        !
        and(mysql 中推荐使用这个)
        or(mysql 中推荐使用这个)
        not(mysql 中推荐使用这个)

    模糊查询
        like
        between A and B;    A 和 B 不能调换顺序
        in                  值类型要兼容; 不能使用通配符(因为不是模糊查询)
        is null
        is not null
        
        通配符
            '%a%'   任意多个(包含另个), 也可以匹配数值类型
            '_'     一个字符
                where department_id like '1__';
            '\_'    转义
            
        自定义转义符号
           where last_name LIKE '_a_%' ESCAPE 'a';

3. 排序查询

    order by asc(default)|desc

    别名，表达式

4. 常见函数
    
    单行行数
        count()                     非null个数
        sum()
        distinct()                  也可以不用括号
        concat()                    字符串拼接
        ifnull(表达式/列，值)
            select ifnull(commission_pct,0),last_name from employees;
        isnull(表达式/列)           是null返回1,否返回零
        length()                    字符串字符字节长度, 也可以是数字,小数(小数点也是一个),没有了 char_length(),和字符集有关
        user()
        password('')
        md5('')


    字符函数
        length()                        字节长度
        concat(,,)
        upper()
        lower()
        instr(main,sub)                 sub在main中的索引位置，没有则返回零
        
        substr(str,pos)                 索引从1开始
        substr(str,pos,length)
        
        trim(' ')                       清除首尾空格, 或字符
        trim('a' from 'aaahelloaaa');   清除首尾的字符a
        
        lpad(str,len,填充)              用制定的自负实现左填充制定长度, 当len小于str时，str会被截断
        rpad(str,len,填充)

    数学函数
        round(num[,digit])              digit:保留几位小数
        ceil()
        floor()
        truncate(num,digit)             截断，digit:小数保留几位
        mod(a,b)                        a%b 取余    a-a/b*b
        rand()                          (0,1) 之间的随机数

    日期函数
        now()                           2021-06-20 11:50:13
        curdate()                       2021-06-20
        curtime()                       11:51:05
        year()
        month()
        monthname()
        day()
        dayname()
        datediff(date1,date2)           返回天数
        
        可以进行比较
        
        str_to_date()
            str_to_date('2-13-1999','%c-%d-%Y')
            
            %Y 4
            %y 2
            %m 月份，01,02,...12
            %c 月份， 1,2,3,..12
            %d 日
            %H 24小时
            %h 12小时
            %i 分钟
            %s 秒
            
            select * from employees where hiredate = str_to_date('4-3 1992', '%m-%d %Y');
        
        date_format('2018/08/09','%Y/%m/%d');
        date_format(now(),'%Y/%m/%d');

    流程控制函数
        select if(10<5,真,假);
        select last_name,commission_pct,if(commission_pct is null,'没有奖金', '有奖金');
        
        case 1
            case 字段或表达式
            when 常量1 then 值1或语句1
            when 常量2 then 值2或语句2
            else 值2或语句2;
            end

        select last_name,department_id,salary,
        case department_id                          //从这里到end 算是一列
        when 30 then salary*1.1
        when 40 then salary*1.2
        else salary
        end as 新工资
        from employees;


        select salary,
        -> case
        -> when salary>2000 then 'a'
        -> else 'b'
        -> end as 级别
        -> from employees;



5. 分组函数(聚合函数)
    sum                 null 不参于运算 只能处理数值类型
    avg                 null 不参数预算 只能处理数值类型
    max                 null 不参数预算 可以处理任何数据类型
    min                 null 不参数预算 可以处理任何数据类型
    count               null 不参数预算 可以处理任何数据类型

    和 distinct 搭配
        select sum(distinct salary) from employees;

    count()
        列
        star    用于统计行数, 只要有一个字段不为null,
        常量    用于统计行数
        
        MYISAM  count(star) 效率最好
        INNODB  count(star) 和 count(1) 效率差不多

    分组前筛选 where
    分组后筛选 having

    能用分组前筛选的尽量用分组前筛选


6. 连接查询(多表查询)

    内连接(也可以用inner join,inner join 是c99的语法，没有 inner join 是c92的语法,join 可以省略)
        等值连接
        非等值连接
        自连接
        
    外连接
        左外连接(left join)
        右外连接(right join)
        全外连接(mysql不支持)(full join)
        
        没有匹配的主表中用 null 填充
        
        select 查询列表
        from 表1 别名 [连接类型]
        join 表2 别名 
        on 连接条件
        [where]
        [group by ]
        ...

    交叉连接(cross join)
        就是笛卡尔乘积

    
    等值连接
        where a.id = b.refid
        
        select last_name,department_name
        from employees a,departments b
        where a.department_id = b.department_id;
        
        如果为表设置了别名，列就不能用原来的表名进行限定, 而只能使用表别名
        
        n表连接至少需要n-1个条件
        
    非等值连接
        也是笛卡尔乘积取交集
        
    自连接

7. 子查询
    
    出现在其他语句中的select语句，称为子查询

    出现的位置
        select 后面
            仅仅支持标量子查询
            
            ```
            select d.*,(
                SELECT COUNT(*)
                FROM employees e
                WHERE e.department_id = d.department_id
                ) 个数
                FROM departments d;
            
            ```
            
        from 后面
            支持表子查询(Every derived table must have its own alias)
            
        where / having 后面
            标量子查询!!!
            列子查询!!!
            行子查询
            
        exists 后面(相关子查询)
            表子查询
            //是否有值，一个完整的select, 总是返回1或0
            select ixists(select employee_id from employees);
            
            //有员工的部门名
            select department_name
            from departments d
            where exists(
                select * 
                from employees e
                where d.department_id = d.department_id
            )
            
            可以用in代替
            select department_name
            from departments d
            where d.department_id
            IN (select department_id from employees)

            //没有女朋友的男生信息
            select bo.*
            from boys bo
            where bo.id NOT IN(
                select boyfriend_id
                from beauty
            )
            
            select bo.*
            from boys bo
            where NOT exists(
                select bo.id from beauty b
                where b.boyfriend_id = bo.id
            )

    结果集的行列数不同
        标量子查询  (结果集只有一行一列)
        列子查询    (结果集只有一列多行)
        行子查询    (结果集有一行多列)
        表子查询    (结果集有多行多列)

    单行操作符: > >= = < <= <>
    多行操作符: IN, ANY/SOME, ALL
        列子查询

        ANY/SOME: 和子查询返回的某一个值比较 a > any(select ...)    > min()
        ALL: 和子查询返回的所有值比较   > max()

        = any
        in 

        行子查询
            select *
            FROM employees
            WHERE (employee_id,salary)=(
                SELECT MIN(employee_id),MAX(salary)
                FROM employees


8. 分页查询
    limit offset(起始索引,从0开始),size

    limit 0,5;

    limit (page-1)xsize,size

9. union联合查询
    将条件拆分成多个

    要相同列数, 每一列的内容类型最好一致
    union 会自动去重复，可以使用 union all 


## DML

1. 插入语句
    insert into 表明
    set 列名x=值x,列名y=值y;

    insert into 表 values(),(),();

    insert into 表 select 
    insert into 表(x,y) select 'a','b';
    insert into 表(x,y) select 'a','b' union select 'c','d';        //union 合并的是select 的整体


2. 修改语句
    单表中的记录
        update 表 set 列=值,列2=值2 where

    修改多表
        update 表1 别名, 表2 别名       //92
        set 列=值
        where 
        and


        update 表1 别名                 //99
        inner|left|right join 表2 别名
        set 列=值
        where 
        and

3. 删除语句

    delete

    truncate table 表                               //清空，不能加别的关键字



    删除A的girlfriend
        
        delete b
        from beauty b 
        inner join boys bo on b.boyfrient_id = bo.id
        where bo.boyname = 'a';

    删除A和A的girlfriend
        
        delete b,bo
        from beauty b 
        inner join boys bo on b.boyfrient_id = bo.id
        where bo.boyname = 'a';


    delete 表1的别名, 表2的别名                     // 删除表1的记录就只写表1, 92语法
    from 表1 别名, 表2 别名
    where 
    and

    delete 表1的别名,表2的别名
    from 表1 别名
    inner|left|right join 表2 别名 on 条件
    where 


    delete 和 truncate 的区别:
        1. 自增,delete 从断点继续; truncate 从新从1开始
        2. truncate 无返回值，共0行受影响; delete 有返回值
        3. truncate 无法回滚，delete可以回滚



## DDL(Data Define Language)

1. 库和表的管理

    增: CREATE
        CREATE DATABASE [IF NOT EXISTS] 库名
        
        CREATE TABLE [IF NOT EXISTS] 表名(
            列1, 
            列2 
        )


    删: DROP
        DROP DATABASE [IF EXISTS] 库名;
        
        DROP TABLE [IF EXISTS] 表名;

    改: alter
        ALTER DATABASE 库名 CHARACTER SET gbk;
        
        表名
            ALTER TABLE 表名 RENAME TO 新表名;
         
        列名
            ALTER TABLE 表名 CHANGE COLUMN 列名 新列名 列类型;
         
        列类型
            ALTER TABLE 表名 MODIFY COLUMN 列名 列类型;
         
        添加列
            ALTER TABLE 表名 ADD COLUMN 列名 列类型;

    表的复制
        1. 仅仅复制表结构
            CREATE TABLE 新表名 LIKE 旧表名;
            
        2. 同时复制表结构+数据
            CREATE TABLE 表名 SELECT * FROM 旧表名
            CREATE TABLE 表名 SELECT 列名1，列名2 FROM 旧表名 条件;
            CREATE TABLE 表名 SELECT DB1.列名1，DB2.列名2 FROM 旧表名 条件; //可以跨库
            
            复制部分列
            CREATE TABLE 表名 SELECT 列名1，列名2 FROM 旧表名 WHERE 1=2;
            CREATE TABLE 表名 SELECT 列名1，列名2 FROM 旧表名 WHERE 0;

2. 常见数据类型介绍
    
    整型
        tinyint         1字节,可以无符号UNSIGNED    t1 UNSIGNED
        smalltint       2字节,可以无符号UNSIGNED
        mediumint       3字节,可以无符号UNSIGNED
        int/integer     4字节,可以无符号UNSIGNED    int(11) 显示长度
        bigint          8字节,可以无符号UNSIGNED
        
        默认有符号
        超出临界值，报警告，并出入临界值
        如果不设置长度，会有默认长度,(范围只是由类型界定，这个长度是显示宽度，要搭配zerofill使用，否则没有效果,并且有了zerofill 就默认是无符号)

    小数
        定点数
            DEC(M,D)            M+2字节, M:整数位+小数位的位数  D:小数点后的位数
            DECIMAL(M,D)        超过范围，就插入临界值 decimal(4.2), 插入11111.11 值就是999., 也可能不会插入, 要看配置
            DECIMAL(10,0)
            
        浮点数
            float       4字节
            double      8字节
            默认精度根据输入来的
        
    字符型
        较短的：char, varchar
            char(M)         //多少个字符, 而不是字节;M:[0,255], 默认为1
            varchar(M)      //[0,65535]
        较长的: text, blob
        
    ENUM枚举
        ENUM('a','b','c')    //不区分大小写
        
    SET
        SET('a','b','c')
        insert into 表明 values('a');
        insert into 表明 values('a,b');    //不区分大小写
        
    日期时间型
        date
        time
        year
        datetime            8字节
        timestamp           4字节, 和实际市区有关，和MySQL版本有关
            东八区插入的时间，如果此时更改为0时区，时间会自动减8
        
        除了 timestamp 类型支持系统默认值设置，其他类型都不支持, NOW() 或 DEFAULT CURRENT_TIMESTAMP() 
        set time_zone='+8:00'
        show variables like '%time_zone%'

3. 常见约束(6大约束)

    1. default 
    2. not null: 不能为空
    3. primary key, 主键，保证字段值唯一性,并且非空
    4. unique 唯一约束, 可以为空
    5. check 检查约束(mysql不支持,但是语法不报错), 比如年龄，性别
    6. foreign key, 外健，用于限制两个表的关系
        show index from 表

    约束的类型
        表约束
            除了 not null 和 default
        列约束
            6大约束都可以，但是外健约束没有效果

    ```列约束
    CREATE TABLE IF NOT EXISTS STUINFO(
        id INT NOT NULL PRIMARY KEY,
        stuname VARCHAR(20) NOT NULL,
        gender CHAR(1) CHECK(GENDER='男' or GENDER='女'),
        seat INT UNIQUE,
        age INT DEFAULT 18,
        majorid INT FOREIGN KEY REFERENCES MAJOR(ID);
    )
    ```

    ```表约束
    CREATE TABLE IF NOT EXISTS STUINFO(
        id INT,
        stuname VARCHAR(20),
        gender CHAR(1),
        seat INT,
        age INT,
        majorid INT,
        
        constraint pk primary key(id),      //主键名的约束名在mysql中总是 PRIMARY, 即使自己重命名
        constraint uq unique(seat),         //constraint uq 可以省略
        constraint ck check(gender='男' or gender='女'),
        constraint fk_stuinfo_major foreign key(majorid) references major(id);
    )

    SHOW INDEX FROM stuinfo;
    ```

    主键一般用列级，外健用表级



    创建表后修改约束
        列约束
        alter table 表名 modify
        
        表约束
        alter table 表名 add primary key(id);
        alter table 表名 add unique(seat);
        alter table 表名 add foreign key(majorid) feferences major(id);
        
        alter table 表名 add constraint 约束名 primary key(id);
        alter table 表名 add constraint 约束名 unique(seat);
        alter table 表名 add constraint 约束名 foreign key(majorid) feferences major(id);
            
        show index from 表名

        删除
        alter table 表名 drop 

### 主键 VS.唯一

        保证唯一性      是否允许为空                可以有几个      是否支持多列组合
主键        y               x                           1个         primary key(id,stuname), 可以但不推荐
唯一        y               y(只能一个null)             多个        unique(seat1,seat2), 可以但不推荐

### 外健

类型要一致或兼容

主表(如部门表)中的关联列必须是一个key,如 unique (一般是主键)

先插入主表，再插入从表
先删除从表，再删除主表


### 标识列

自增长列

auto_increment

show variables like '%auto_increment'
    auto_increment_increment    1   //步长
    auto_increment_offset 1         //起始值，mysql不支持修改

不是必须和主键搭配，但要求是一个key, 如 unique

一个表中只能有一个 auto_increment

只能是数值型，float，double 也可以


## TCL(Transaction Control Language) 事务和事务处理

事务:一个或一组sql语句组成一个执行单元，这个执行单元要么全部执行，要么全部不执行。

存储引擎: show engines

事务的属性 ACID

    原子性 Atomicity
        指事务是一个不可分割的工作单位，要么都发生，要么都不发生
        
    一致性
        从一个一致性状态变换到另一个一致性状态
        
    隔离性 Isolation
        事务互不干扰
        
    持久性 Durability

事务分类
    隐式事务: 没有明显的开契合结束标记, 如 insert,update,delete,delete

    显示事务: 有明显的开启与结束的标记,前提需要关闭自动提交

    ```

    show variables like "%autocommit%"
    set autocommit=off    或者 =0   //针对当前会话

    1、关闭自动提交
    SET autocommit=0;

    2、开启事务
    START TRANSACTION;

    3、事务语句
    ALTER TABLE girls MODIFY gname VARCHAR(20) NOT NULL;
    INSERT INTO girls VALUES(0,'张三123');

    4、明显的结束标记
    COMMIT;  #提交
    ROLLBACK;  #回滚

    #查看
    SELECT * FROM girls;

    注意点：
    1、关闭自动提交
    SET autocommit=0;

    2、开启事务
    START TRANSACTION;

    3、需要执行的sql代码
    sql1;
    sql2;
    .......

    4、明显的结束标志
    commit / rollback
    ```

数据库的隔离


    脏读:对于两个事务，t1,t2,如果T1读取了已经被t2修改过的但是还没有提交的数据，
    但是最后t2回滚了，t1读取的内容是临时并且无效的
        
        更新

    不可重复读:对于两个事务，T1，T2读取了一个字段的值，但是T2更新了这个字段,T1
    再次读取的时候，两读取的数据是不一致的

    幻读:对于两个事务T1,T2,T1从一个表中按照一定的条件读取数据，接着T2将表进行了
    更新，插入几行新数据，当T1再次以相同的条件进行读取的时候，会出现新的数据
        插入


## DCL


## 视图

## 存储过程

## 流程控制



## 数据备份与恢复

1. 备份：从数据库导出数据：

    格式：mysqldump -h链接ip -P(大写)端口 -u用户名 -p密码数据库名>d:XX.sql(路劲)

    示例：mysqldump -h132.72.192.432 -P3307 -uroot -p8888 htgl > bak.sql;

2. 备份导出示例：

    1、导出数据和表结构——将特定数据库特定表中的数据和表格结构和数据全部返回

    mysqldump --u  b_user -h 101.3.20.33 -p'H_password'  -P3306 database_di up_subjects > 0101_0630_up_subjects.sql

    2、导出表结构却不导出表数据——只返回特定数据库特定表格的表格结构，不返回数据,添加“-d”命令参数

    mysqldump --u  b_user -h 101.3.20.33 -p'H_password'  -P3306 -d database_di up_subjects > 0101_0630_up_subjects.sql

    3、导出表结构和满足挑顶条件的表数据——只返回特定数据库中特定表的表格结构和满足特定条件的数据

    mysqldump --u  b_user -h 101.3.20.33 -p'H_password'  -P3306 database_di up_subjects --where=" ctime>'2017-01-01' and ctime<'2017-06-30'" > 0101_0630_up_subjects.sql

      4、导出数据却不导出表结构——只返回特定数据库中特定表格的数据，不返回表格结构，添加“-t”命令参数

    mysqldump --u  b_user -h 101.3.20.33 -p'H_password' -t -P3306 database_di up_subjects  >0101_0630_up_subjects.sql

    5、导出特定数据库的所有表格的表结构及其数据，添加“--databases ”命令参数

    mysqldump  --u  b_user -h 101.3.20.33 -p'H_password' -P3306 --databases test  > all_database.sql

3. 恢复导入数据库数据：

将导出的本地文件导入到指定数据库

    1、系统命令行

    格式：mysql -h链接ip -P(大写)端口 -u用户名 -p密码 数据库名 < d:XX.sql(路劲) 

    mysql -uusername -ppassword db1 <tb1tb2.sql

    2、或mysql命令行

    mysql>

    user db1;

    source tb1_tb2.sql;

    3、恢复整个数据库的方法：

    mysql -u  b_user -h 101.3.20.33 -p'H_password' -P3306   < all_database.sql

