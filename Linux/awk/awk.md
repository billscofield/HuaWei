## awk gawk

awk 是一门语言, 有变量

1977年开发出来

Alfred Aho, Brian Kernighan, Peter Weinberger

在 GNU 当中，叫做 gawk

同sed一样，逐行操作

统计处理数据，支持判断，支持for和while循环

;  用来分割命令

不加动作命令，默认是打印{print $0}

    awk 'NR==1,NR==4' 文件

    awk '/root/' 文件


### 使用方式

有命令行模式和脚本模式


### 语法

awk 选项 '命令' 文件名      // 当引用变量时，用双引号，同sed


### 选项

-F: 字段分隔符, 默认是空格或者制表符

    多个分隔符的情况

        awk -F'[: ]' '/inet/'

        awk -F'[: ]+' '/inet/'


-v: 定义变量并赋值
    
    awk -v NUM=3 '{print NUM}' 文件                     //不能加$调用变量

    awk -v NUM="youyou" '{print NUM}' 文件              //不能加$调用变量

    awk -v NUM="youyou" 'BEGIN{print NUM}' 文件         //只输出一遍

    awk -v NUM="youyou" '{print NUM}'                   //没有输入，则键盘是输入


### 关于空格分隔符

http://www.mamicode.com/info-detail-3043393.html


1. 行中的连续空格不会分隔空字段。当 FS 的值为 " " 时，awk 首先从记录中去除行首和行尾的空白，然后再分割字段。

1. 如果 FS 是其他字符，比如”，“，连续两次出现将分隔一个空字段。如果字符出现在行首或行尾，也会分隔空字段。

   空格字符做为默认分隔符，是唯一不遵守这些规则的字符。

1. 如果通过 -F "[ ]" 指定，执表示通过单个空格分隔，此时，将失去其做为默认分隔符的特性，与其它字符一样，遵守同样的分隔规则。

```
文本内容：
zeroHash
#oneHash
##twoHash
###threeHash
####fourHash


awk -F'[#]' 'NR==1,NR==2{print $1}'  FILE  为空
# 号之前的^ 为 $1, #之后的为 $2

awk -F'[#]' 'NR==3{print $2}'  FILE  为空
第一个 # 号之前的^ 为 $1, 第一二个#号之间的为 $2

...

awk -F'[#]+' '{print $2}'  FILE  为空
awk -F'[#]*' '{print $2}'  FILE  为空 //用* 有点说不通，最少为零个做分隔符?所以用+, 但是效果是一样的

连续的多个#看成一个#, 这里是**贪婪匹配**


ip a | grep 'inet '|grep wlp4s0 | awk -F'[ : ]+' '{print $3RS$5RS}'

```


### 命令

必须用{}包裹, 多个语句用分号分隔

BEGIN:
    
    用于定义变量

    BEGIN{FS=":";OFS="---"}

END:

    

1. 地址定位
    
    正则表达式

        '/root/{语句}'

    变量

        'NR==1,NR==5{awk语句}'

        'NR==1{awk语句}'

    多个定位条件

        'NR==1,NR==5;/^root/{动作}' //分号之前的命令打印(没有动作则默认打印$0),分后后的命令又打印, sed 也是一样， sed -n '1{p;p;p}'


    支持逻辑运算符

        'NR==1 || NR==4{print $0}'              // sed -n '1p;4p' passwd

        'NR<=4{print $0}'                       // sed -n '1,4p' passwd

        'NR>=1 && NR<=4{print $0}'

        'NR>=1,NR<=4{print $0}'                 //这个好像是满足前边那个就可以了，直到最后一行!!!

            默认的范围只能用==, 当除了==之外，就要使用逻辑运算符

        awk '/^root/ && NR>=2 && NR<=3{print $0}' passwd


        awk '/root/ && NR<=5' 文件 这样是可以的，而NR==1,NR==5 这样的方式不能用?

            awk '/root/ && NR==1,NR==5' 错误,but why? 不能有圆括号?


        awk '$1=="root"{print $0}' passwd       //精确匹配
        awk '$1 ~ "root"{print $0}' passwd      //模糊匹配


    最后一列是NF, 只打印最后一行呢? 变量会保留直到下一行触发变量改变为止，所以最后一行是:

        awk 'END{print NR}'

BEGIN ... END ...


1. 命令执行

    1. 命令执行方式1

        '地址定位{awk语句;awk语句}'

    1. 命令执行方式2

        'BEGIN{awk语句};{处理中};END{awk语句}'

        'BEGIN{awk语句}{处理中}END{awk语句}'

        'BEGIN{awk语句}NR==1,NR==4{处理中}END{awk语句}'

        上边三种写法都正确

    1. 脚本方式

    ```
    #!/usr/bin/awk -f
    BEGIN{FS=':'}                         同sed， 命令不需要使用引号，同一行多个命令用分号隔开
    NR==1,NR==4{print $1"\t"$NF}

    ./awk awk脚本 文件
    ```

1. 相关变量


```
FIELDWIDTHS: 列宽
    
    'BEGIN{FIELDWIDTHS="4 5 6"}NR==1{print $1,$2,$3}'

    查看man手册，没有这个

$0: 当前行

$1, $2, $3 ... $n: 以间隔符分隔的列字段(同sed都是从1开始)

    $1, $2...$n **不能写在双引号中**, 会原样输出为"$1"

$ksldfja 等不存在的变量视为 $0

NF: 列的总数

$NF: 最后一列

    awk -F':' '{print $NF, $(NF-1)}' 文件

NR/FNR: 行号

    当文件有多个的时候有区别
    
    awk '{print NR,$0}' /etc/passwd /etc/services

    NR
        一个总的行号,total number

    FNR
        每一个文件一个行号, current input file

    ???
        awk '{print $NR,$0}' 123.txt

        ```输出结果,为什么是这个样子呢???
        1 1
         2
         3
         4
         5
        ```


FS: 定义分隔符，同选项-F
    
    awk 'BEGIN{FS=":";OFS="\t"}{print $1,$2}' 文件   

    awk 'BEGIN{FS=":";OFS="\t"}{print $0}' 文件     // 这个不是以OFS来分隔的

    awk 'BEGIN{FS=":"}{print $1"-------""$2}' 文件  //手写分隔符 

    printf("%-10s%-10s",$1,$2)  //这样更方便处理


OFS: 输出字段分隔符，默认空格

    ',' 会被映射为OFS

        awk 'BEGIN{OFS="--->"}{print $1,$2}'

    不能使用$0, 这样是没有效果的, 要$1,$2,...一个个输出 

    awk 'BEGIN{FS=":";OFS="#"}{print $1,$2,$3}' /etc/passwd


RS: 输入记录分隔符，默认换行

    awk -F: 'BEGIN{RS="\t"}{print $1}' 文件         //为什么有的系统换行不是\t, 但是分行了呢???

    文件:
    1
    2
    3
    4
    5

    awk 'BEGIN{RS=""}{print $1,$2,$3,$4,$5}'
        
        RS="" 使源文件的多行变成了1行

    输出结果是： 1 2 3 4 5                          //为什么呢???

    变成空格分隔的了, 因为OFS是空格


ORS: 输出记录分隔符，默认换行


    将文件的每一行合并为1行

    awk 'BEGIN{ORS=" "}{print $0}'      //RS 换成 ORS

    输出结果是： 1 2 3 4 5 #        //但是最后会多一个hash,,,
    



```




cal 和 ncal 的区别

``` 
这是cal的命令输出，当前日子被特殊标注了，虽然awk得出的看上去是11，但是值确是 _^H1_^H1, 不能用于数字比较

     July 2020        
Su Mo Tu We Th Fr Sa  
          1  2  3  4  
 5  6  7  8  9 10 _1_1  
12 13 14 15 16 17 18  
19 20 21 22 23 24 25  
26 27 28 29 30 31     


下边这个是ncal的输出结果，当前日期并没有特殊标记，是真实的数字

    July 2020         
Su     5 12 19 26   
Mo     6 13 20 27   
Tu     7 14 21 28   
We  1  8 15 22 29   
Th  2  9 16 23 30   
Fr  3 10 17 24 31   
Sa  4 11 18 25      


每月的第一个周六进行某些动作的基础框架

if [ $(date +"%d") -eq awk 'NR==8{print $2}' ];then
    echo "do something"
else
    echo "you can sleep"
fi

```




{} 之间加不加分号都可以

awk '条件1 {动作1} 条件2 {动作2} ...' 文件
    如果条件1符合，执行动作1
    如果条件2符合，执行动作2
    如果条件3符合，执行动作3

    可以没有条件，只有动作，对全体文件内容执行动作
    必须使用单引号，双引号报错

    awk '{printf $2"\t"$3"\n" }' students

    **制表符、要添加的字符 都要用双引号括起来**

    $0: 表示这一行的内容

    awk '{ print $X   }' 文件

        这里X 只要不为除了零以外的数字，都会全部打印出来,why???因为没有定位

输出结果有时对不齐，此时要借用column命令

    例如:

    df -h | awk '{printf $1 "\t" $2 "\t" $3 "\t" $4 "\n"}' | column -t

    df -h | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 }' | column -t

    print  会自动换行 相当于 echo

    printf 不会自动换行 相当于 echo -n

        **是格式化输出，同C语言, 这样的对齐更有效**

        '{printf "%-20s%-20s",$1,$2}'

        -n     do not output the trailing newline


硬盘数据报警案例

    df -h | grep '/dev/sda1' | awk '{print $5}' | cut -d '%' -f 1


BEGIN
    awk 'BEGIN {print "this is bill coming, u son of bitch..."} {print $1 "\t" $2 "\t" $3 }' students

    this is bill coming, u son of bitch...
    ID      NAME    GENDER
    1       A       BOY
    2       B       Girl


### 变量

$0          当前行的所有列

    最后一行的内容

        awk 'END{print $0}'
        
$1,$2,$3    当前行以间隔符分割的不同列，默认空格


FS          The input field separator, a space by default.  See Fields, above.

OFS         “输出字段分隔符OFS”，OFS默认为空格

    awk -F: '{print $1,$2,$3}' passwd   默认空格分割

    awk -F: '{print $1$2$3}' passwd     没有分割，连在一起,即使定义了OFS, 所以一定要写逗号

    awk -F: 'BEGIN{OFS="\t"}{print $1,$2,$3}' passwd   \t分割

    awk  'BEGIN{FS=':';OFS="\t"}{print $1,$2,$3}' passwd   \t分割

    awk -F: 'BEGIN{OFS="\t"}{print $1$2$3}' passwd     没有分割，连在一起, 因为没有写逗号

    awk -F: 'BEGIN{OFS="\t"}{print $1"\t"$2"\t"$3}' passwd     \t分割, 相当于连接?


RS          输入记录分隔符，默认换行

    awk 'BEGIN{RS="\n"};{print $0}' 文件


ORS         输出记录分隔符，默认换行

NR 或者 FNR     行号

    record number

    打印文件有多少行

        awk 'END{print NR}'
        sed -n '$='

NF 当前记录的字段数（列数）

    NF          The number of fields in the current input record.

    $NF 最后一列

    $(NF-1) 倒数第二列


    awk 'BEGIN { FS=":" } { print $1 "\t" $2 "\t" $3 "\t" $4  }' /etc/passwd | column -t

    awk -F: '{print $1,$3}' 文件


    awk '{ FS=":" } { print $1 "\t" $2 "\t" $3 "\t" $4  }' /etc/passwd | column -t

        **没有BEGIN第一条数据的分隔符还是空格**

        {}中逗号分割

        BEGIN可以省略


    输出结果:
    root               x  0      0
    daemon             x  1      1
    bin                x  2      2
    sys                x  3      3
    sync               x  4      65534
    g

    查看有几列

        awk -F: 'NR==1{print NF}' 文件


END
    awk 'BEGIN { FS=":" } { print $1 "\t" $2 "\t" $3 "\t" $4  } END{print "It is over..."}' /etc/passwd | column -t

    **print 语句中也不能有单引号**

    END 也可以放到前边的位置

        awk 'END{print "\nIt is over"} {print $1 "\t" $2} BEGIN{FS=":"}' passwd | column -t



### printf 格式化输出，
%s

%d

-   左对齐, 不写的话是右对齐

awk 'BEGIN{FS=":"} {printf "%-15s %-15s %-15s\n",$1,$2,$3}' passwd

awk 'BEGIN{FS=":"} {printf "|%-20s |%-15s |%-15s\n",$1,$2,$3}' passwd

awk 'BEGIN{FS=":"} {printf "|%-20s| %-15s| %-15s|\n",$1,$2,$3}' passwd

awk '{printf "\033[31mGOOD MORNING!!!\n\033[0m"}' 

如果是print，不会格式化，不认 %s %d等，会原样输出


## 运算

赋值运算
    
    =  +=  -=  *=  /=  %=  ^=


比较运算

    > >= < <= == !=

    对于字符串，返回1为真，0为假(我的debian bash/zsh 测试，为假则不返回)

    awk 'BEGIN{print "a"<"b"}'

数学运算

    +  -  *  /  ^(幂) %  ++  --

    awk 'BEGIN{print 1+1}'
    awk 'BEGIN{print 4**4}'

    我的环境测试没有 乘方 运算

逻辑运算

    && || !

    awk 'BEGIN{ print 100>2 && 2<11 }'      //返回1, 我的测试环境没有输出

    awk '!($3>100){print $0}'

匹配运算

    ~ !~

    awk '$0~/root/' --> awk '/root/'

    awk '$0!~/root/' --> awk '!/root/'      sed -n '1!p'



### 定义变量, 赋值运算

-v var=val

    --assign var=val

    Assign the value val to the variable var, before execution of the program begins.  Such variable values
    are available to the BEGIN rule of an AWK program.


    awk -v NUM=3 -F: '{print $NUM}' /etc/passwd   输出第三列, $NUM 不要加双引号，否则输出 "$NUM"

    awk -v NUM=3 -F: '{print NUM}' 不写文件,enter 一次输出一次 3

    **在awk中调用变量不需要加$**, 不能加双引号

        awk -v NUM=3 'BEGIN{print NUM}'     可以不写文件, 也不用写变量引用符号

        awk -v NUM='hello'     '{print NUM"\n"}' passwd

        **也可以加$变量引用，但是当变量是数字时才有意义，输出第N列**
            
            当不是数字时，是错误的，会认为是条件错误，全部输出, 即**$后边必须是数字**

BEGIN
    awk -F: -v num=3 'BEGIN{num="hello"}{printf num"\n"}' passwd

        后面的覆盖前面的


    awk -F: 'BEGIN{printf "%-20s%20s\n**********************************\n","Login_shell","Login_home"};{printf "%20s%20s\n",$NF,$(NF-1)};END{printf "*********************************\n"}'


    awk -F: -v name="LOGIN_NAME" -v value="LOGIN_SHELL" 'BEGIN{printf "%-20s%-20s\n",name,value}{}END{}' 文件




### 比较运算

==
!=
>
>=
<
<=
~       **匹配**

        awk -F: 'NR>=2 && NR<=5 && $0 ~ /zsh$/ {print $0}' passwd

        awk -F: '$1~/root/{print $0}' passwd

        awk '$0 ~ /bash$/' passwd       -->  awk '/bash$/' passwd

        awk 'NR>=30 && NR<=40 && /bash$/' /etc/passwd
        awk 'NR>=30 && NR<=40 && $0 ~ /bash$/' /etc/passwd    这两个是等价的，~ 这个没什么用啊... 可能 $1,$2 这样的需要~吧


!~      不匹配
            awk -F: '$0 !~ /zsh$/ {print $0}' passwd
!       逻辑非
&&      逻辑与
||      逻辑或, 和分号";" 是不一样的

    awk '$4 > 70 { print $2 "\t" $3 "\t" $4  } BEGIN{print "Grade sheet\n"} END{print "\nIt is over"}' students
    Grade sheet

    NAME    GENDER  GRADE
    A       BOY     99
    B       Girl    85
    C       BOY     79

    It is over

    举例：

    从第一行开始匹配到以lp开头行

        ```
        awk -F: '1,/^root/{print $0}' 文件
        ```


    第二行到第五行，以zsh结尾的行

        ```
        awk -F: 'NR>=2 && NR<=5 && /zsh$/ {print $0}' passwd
        awk -F: 'NR>=2 && NR<=5 && $0 ~ /zsh$/ {print $0}' passwd
        ```

    以root开头或以lp开头的行

    ```
    awk -F: '/^root/ || /^lp/{print $0}' 文件


    awk -F: '/root/;/^lp/{print $0}' 文件
        ; 用来分割命令，没有动作命令，会打印一行，所以，这条命令等价于
        awk -F: '/root/{print $0};/^root/{print $0}' 文件
    ```


### 定位，正则 

'/root/{awk语句}'           sed中: '/root/p'

'NR==1,NR==2{awk语句}'      sed中: '/1,5p'

'NR==4{awk语句}'            sed中: '4p'
    awk -F: 'NR==4{print $0}' names     //仅显示第四行

    或第几行
    awk -F: 'NR==4 || NR==10{print $0}' names     //仅显示第四行

    awk -F: 'NR>=4 && NR<=10{print $0}' names     

    **这个是个错误的用法，NR>=4 会进行匹配，第二个不会进行匹配**
        awk -F: 'NR>=4,NR<=10{print $0}' names     
    

'/^root/,/^ftp/{awk语句}'   sed中：‘/^root/,/^ftp/p'


{awk语句1;awk语句2;...}

    awk -F: 'NR==4{print $0;print $1}' names     //仅显示第四行


#### 当有多个定位时的情况

awk -F: 'NR==1,NR==4;/^root/{print $0}' passwd
    第一行匹配 NR==1,NR==4 执行一次命令
    第一行匹配 /^root/ 执行一次命令
    所以有些行会被执行两次





### 脚本模式

1. 脚本编写

    ```
    #!/bin/awk -f
    BEGIN{FS=":"}
    NR==1,NR==3{print $1}
    ```
    脚本中不要写命令行模式下的单引号
    

1. 脚本执行
    1. awk -f awk.sh 文件
    2. ./awk.sh 文件

### 练习

ifconifg 的ip地址

ifconfig wlan0 | awk '/inet/{print $2}' | awk 'NR==1'

ifconfig wlan0 | sed -n '2p' | awk '{print $2}'

ifconfig wlan0 | awk 'NR==2' | awk '{print $2}'

1. 多个分隔符的情况

    awk -F'[: ]' '/inet/'

    一般像下面这样写，多一个加号表明将连续出现的记录分隔符当做一个来处理
        awk -F'[: ]+' '/inet/'
    
1. 分隔符

```
###3#inet#172.20.10.5  netmask:255.255.255.240   broadcast 172.20.10.15
1234

sed -n 'p' ifc | awk -F# '{print $1}'       输出空
sed -n 'p' ifc | awk -F# '{print $2}'       输出空
sed -n 'p' ifc | awk -F# '{print $3}'       输出空
sed -n 'p' ifc | awk -F# '{print $4}'       输出3
```



## 流程控制

### if 

if(){} else {}

    awk -F" " 'NR==2{ if($1>100) {print"大于100"} }' 文件

    awk 'NR==2{if($1>100){print "大于100"} else {print "小于等于100分"}}' 文件

    awk -F: '{if($3==0){print "You r root"} else { print "You r not root" }}' /etc/passwd

    awk -F: '{if($3==0 && $4 > 0) {print "You r root"} else { print "You r not root" }}' /etc/passwd


if(){} else if() {} else {}

    变量可以直接使用, 不用声明

    BEGIN{FS=":"}{if($3==0){i++} else if($3>=1000){j++} else {k++}}END{printf "admin:%-20s\n普通用户:%-20s\n系统用户:%-20s\n",i,j,k}


    awk -F: 'BEGIN{if($(id -u)==0){print "u are admin"} }' /etc/passwd        ??? 为什么是!=0

        不能使用shell语句???

        要使用 -eq, 但是在内存检测时候不能用 -gt, 到底要用什么???

        awk 'BEGIN{if( 1 -gt 11 ){print "ok"}}'
        ok

        awk 'BEGIN{if( 1 -eq 0 ){print "ok"}}'
        ok



        可以用 && || 

        还可以用 -a?


### for 循环

1. {for (i=0;i<10;i++){print i}}

    1. 简单for

    `NR==1{for(i=0;i<10;i++){print i}}


    'BEGIN{sum=0;for(i=0;i<10;i++){sum=sum+i}{print sum}}'

    for ((i=0;i<11;i++));do echo $i;done | awk 'BEGIN{sum=0} {sum=sum+$1} END{print sum}'


    ```
    1 2 3
    4 5 6
    7 8 9
    10 11 12
    13 14 15

    取每一行的和

    awk '{sum=0;sum=$1+$2+$3;print sum}'

    awk '{sum=0;for(i=1;i<4;i++){sum+=$i};print sum}'
    awk '{sum=0;for(i=1;i<4;i++){sum+=$i}print sum}'
    awk '{sum=0;for(i=1;i<4;i++){sum+=$i}{print sum}'


    awk '{sum=0;i=1;while(i<4){sum+=$i;i++}{print sum}}' 


    break

    awk '{sum=0;i=1;while(i<4){sum+=$i;if(sum>10){break}i++}print sum}'

    awk '{sum=0;i=1;while(i<4){sum+=$i;if($i>10){continue}i++}print sum}'
    ```




    1. 嵌套循环

    `BEGIN{for(i=1;i<6;i++){for(j=1;j<=i;j++){printf "%s",j} print ""} }



1. for(i in xxx)


### while 循环

NR==1{i=0;while(i<10){print i"h";i++}}

'BEGIN{i=0;while(i<10){print i;i++}}'

awk 可以进行小数运算
    awk 'NR==1{print 1/3}' 文件

i=0;
while [ $i -lt 10 ];do
    echo $i
    i=$[ $i + 1 ]
done

## 案例

统计/etc/passwd 文件中的shell类型数量

    BEGIN{FS=":"}{shells[$NF]++} END{for( i in shells  ){printf "%-20s%-20s\n",i,shells[i]}}

    这个会比较常用, 如各种状态信息的统计


统计网络链接状态

    脚本: {stat[$2]++}END{for(i in stat){printf "%-20s%-10s\n",i,stat[i]}}
    ss -an | awk -f 脚本文件

    ss -an | awk -f 脚本文件 | sort -k2 -rn


统计网站日志中 PV 量
    
    名词解释：
        网站访问量(PV): Page View, 每打开一个页面变记录为1次PV
        访问次数(VV): Visit View, 



    统计Apache/Nginx 日志中某一天的PV量

    ```
    grep '27/Aug/2017' mysqladmin.cc-access_log | wc -l
    ```


    统计Apache/Nginx 日志中某一天不同IP的访问量

    ```
    grep '27/Aug/2017' mysqladmin.cc-access_log | awk '{ips[$1]++}; END{for(i in ip){print i,ip[i]}}' | sort -k2 -rn



    grep '27/Aug/2017' mysqladmin.cc-access_log | awk '{ips[$1]++}; END{for(i in ip){print i,ip[i]}}' | awk '$2>200' | sort -k2 -rn
    ```




## 实例

### 检测内存

free -m

              total        used        free      shared  buff/cache   available
Mem:           7642        2325        3875         213        1441        4843
Swap:          7849           0        7849


使用量大于多少时报警

free -m | awk '/^Mem/{if($3 > 3000){print "mem overloaded, now is "$3}}'




### 检测进程的内存用量

cat /proc/333/smaps | grep Rss | awk 'BEGIN{sum=0}{sum+=$2}END{print sum}'


