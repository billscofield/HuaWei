表 和 OOP的类 很相似，所以字段会出现在Python中,每一列类似属性

show tables from 库名;
select database();
select version();

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
