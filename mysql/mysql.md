表 和 OOP的类 很相似，所以字段会出现在Python中,每一列类似属性

show tables from 库名;
select database();
select version();
select user();

create database `aaa` default character utf8 collate utf8_general_ci;


varchar(N) N是字符,不是字节


truncate table `teacher_info`

desc 表名;


sql语句不区分大小写，但是库、表、字段、区分大小写

单行注释 #
单行注释 -- --

多行注释 /* */


DDL定义语言define
DML（data manipulation language）数据操纵语言：
DCL
DQL查询语言
    select 字段、常量、表达式、函数
        函数: database();
    没有字符 和 字符串的概念，单引号即可
TCL 事务控制语言


别名 as (可以省略)

建议用双引号

去重 select distinct 字段
    select distinct a,b from 表名;

+ 的作用
    1. 字符串可以转换为数字:数学运算
        select '123'+1
    1. 字符串不可以转换为数字:字符转换为零
        select 'name'+1
    1. 有一个操作数是 Null，则结果为Null


concat
    select concat(a,b,...);
    select concat(a,',',b,...);

    **如果某条记录的某一个字段值为Null,则 concat的结果只有一个Null**

IFNULL(为Null的字段,你希望显示的默认值)
    select concat(a,IFNULL(name,"无名氏")) from 表名;


=
!=

and or not 
    主要用来连接条件表达式
    select * from schoolinfo
    where self_desc is NULL
    and score>90;

>
**not >**
    select * from schoolinfo 
    where not (id>4);


like
not like
    %
    _单个字符
    转义\
    或者 用ESCAPE指定转义符号
        select * from schoolinfo where name like '_$_%' escape '$';

    **like '%' 不能匹配NULL**
    相比较于 concat , where name like '%' or id like '%' 不会像concat那样，有一个字段为NULL，就整个为NULL，like 会更普通

    可以判断数值型
    
between and 
not between and 
    [] 闭区间
    等价于 >=  <=，两个操作数不能颠倒顺序

in 
not in
    等价于 = and 
    wehre field in(值1,值2);
    当然了这个字段的值类型是一样的
    in里面的值不支持模糊

is null
is not null
    和null相关的计算都是null
        lenght,char_length

isnull 函数
    isnull(filed) 是返回1,否返回0

安全等于 <=>
    可以判断NULL
    = plus is NULL



select 数据 from 表明  where 条件;
    对每一条数据进行条件匹配,如果没有条件，则每一条记录都为True，会执行select输出
    select更像是print




排序
    order by 字段 desc;降序
    order by 字段 asc;升序
    order by 表达式
    order by 别名


length()
    null 的length 还是null

## 常见函数

show variables like "%chara%"

### 单行函数
    1. 字符函数
        length
            返回的时字节数    
        char_length
            返回字符数

    1. concat

    1. upper()
    1. lower()
    
    1. substr/substring('string',start[,char_length])
        索引从1开始
        双闭区间

    1. instr('helloworld','hello')  参数二在参数一中第一次出现时的索引
        没有则返回零

    1. trim(' helo ') 去除前后空格
        char_length 和 length 都会计算空格字符' '
        \t \n 等算一个字符

    1. trim( 'a' from '目标字符串')

    1. lpad('a',num,'char')
        num是总长度
        lpad('刘蛟', 5, '*') => ***刘蛟
    1. rpad('abc',num,'char')

    1. replace('hello world','hello','HELLO')

### 数学函数
1. round(1.65)    四舍五入,默认到整数
    round(1.65,2)   2 表示小数保存两位)
1. ceil() 向上取整
1. floor() 向下取整
1. truncate(1.29,1)  小数点后截断只剩1位
1. mod(10,3)    `**取余数  a-a/b*b**
            
### 日期函数
1. now()    2019-06-18 16:44:03 
1. curdate()    
1. curtime()
1. date(now())
1. time(now())

1. year(now())
1. month(now())
    monthname(now()) 英文名字
1. day(now())   几号
    dayname(now())  星期几
1. hour()
1. minute()
1. second()

1. str_to_date('02-05-2019','%d-%m-%Y') 转换为默认的 年-月-日 格式 => 2019-05-02

1. date_format('2019/6/6','%Y年%m月%d日')   也就是说sql会自动识别日期中的 - 或 / ,只要是 年月日 顺序
1. date_format(now(),'%Y年%m月%d日')
    转换为指定格式

1. 时间运算
    datediff(date1,date2) date1靠后, date2靠前  这两个参数必须有 date
    timediff(time1,time2) time1靠后, time2靠前  这两个参数必须有 time
    
    select timediff('2018-01-02 12:00:00','2018-01-01 11:00');
        1 day, 1:00:00 

    select timediff('2018-01-02 12:00:00','2018-01-01 13:00')
        23:00:00

    https://www.cnblogs.com/yangjinwang/p/6253131.html

### 流程控制
1. if(表达式,表达式为真的结果,表达式为假的结果)
    select if(10>2,'Hello','world');

1. case
    case 将会是一个新的列
    1. 类似switch
        case 表达式 
        when 常量1 then 要显示的值1或语句1
        when 常量2 then 要显示的值2或语句2
        else 要显示的值n或语句n
        end as 别名
        from 表名;

        ```
        select name,salary,
        case name
        when 'A' then salary*2
        else salary
        end as new_salary
        from teacher_info;
        +--------+----------+--------------+
        | name   |   salary |   new_salary |
        |--------+----------+--------------|
        | A      |     9000 |        18000 |
        | B      |     8000 |         8000 |
        | Ac     |     8500 |         8500 |
        | bc     |     7000 |         7000 |
        | A      |    10000 |        20000 |
        | B      |    20000 |        20000 |
        | BB     |   <null> |       <null> |
        | 刘     |    90000 |        90000 |
        +--------+----------+--------------+
        ```

    1. 类似多重if
        case 
        when 条件1 then 要显示的值1或语句1
        when 条件2 then 要显示的值2或语句2
        ...
        else 要显示的值n或语句n
        end

        ```
        select salary,
        case
        when salary<10000 THEN 'Z'
        when salary>20000 THEN 'A'
        when salary>10000 then 'b'
        else 'd'
        END as 工资级别
        from teacher_info;
        +----------+------------+
        |   salary | 工资级别   |
        |----------+------------|
        |     9000 | Z          |
        |     8000 | Z          |
        |     8500 | Z          |
        |     7000 | Z          |
        |    10000 | d          |
        |    20000 | b          |
        |   <null> | d          |
        |    90000 | A          |
        +----------+------------+
        ```



### 分组函数(统计函数，聚合函数，组函数)
功能:用作统计使用

avg

sum
    select name,sum(salary) from teacher_info group by name;
    一定要group by 分组的依据,条件
    参数为字符串的话 结果为0
    Null没有参与运算
        select sum(self) from (select self_desc AS self from teacher_info where id in (9,10)) as tab;

max
    可以用于字符串
    可以用于时间

min
    可以用于字符串
    可以用于时间

count
    任何类型,非空不计算在内
    count(*) 一条记录中只要有一个字段不为null,就算在count里
    count(1) 相当于加了一列值为1的列 求count

    MYISAM下 count(*) 效率高
    INNODB下 count(*) 和 count(1) 效率差不多,但比count(字段) 高, 字段要去判断是否为null

**以上分组函数当中,Null 均没有参与运算**


和 distinct 配合使用
    select sum(distinct salary),sum(salary) from test;
    select count(distinct salary) from test;


根据查找后的结果集上进行筛选
    having


