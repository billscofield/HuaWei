## awk gawk

awk 是一门语言

Alfred Aho
Brian Kernighan
Peter Weinberger

统计处理数据，支持判断，支持for和while循环

;  用来分割命令

不加动作命令，默认是打印
    awk 'NR==1,NR==4' 文件
    awk '/root/' 文件


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
        这里X 只要不为除了零以外的数字，都会全部打印出来,why???

输出结果有时对不齐，此时要借用column命令
    例如:
    df -h | awk '{printf $1 "\t" $2 "\t" $3 "\t" $4 "\n"}' | column -t

    df -h | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 }' | column -t

    print  会自动换行 相当于 echo
    printf 不会自动换行 相当于 echo -n
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

如果是print，不会格式化，不认 %s %d等，会原样输出

### 定义变量
-v var=val
    --assign var=val
    Assign the value val to the variable var, before execution of the program begins.  Such variable values
    are available to the BEGIN rule of an AWK program.


    awk -v NUM=3 -F: '{print $NUM}' /etc/passwd   输出第三列

    awk -v NUM=3 -F: '{print NUM}' 不写文件,enter 一次输出一次

    **在awk中调用变量不需要加$**
        awk -v NUM=3 'BEGIN{print NUM}'     可以不写文件, 也不用写变量引用符号
        awk -v NUM='hello'     '{print NUM"\n"}' passwd
        也可以加$变量引用，但是当变量是数字时才有意义，输出第N列

BEGIN
    awk -F: -v num=3 'BEGIN{num="hello"}{printf num"\n"}' passwd


    awk -F: 'BEGIN{printf "%-20s%20s\n**********************************\n","Login_shell","Login_home"};{printf "%20s%20s\n",$NF,$(NF-1)};END{printf "*********************************\n"}'






### 比较运算

==
!=
>
>=
<
<=
~       匹配
        awk -F: 'NR>=2 && NR<=5 && $0 ~ /zsh$/ {print $0}' passwd

        不匹配的行(匹配也就这个用处多吧)
            awk -F: '$0 !~ /zsh$/ {print $0}' passwd

!~      不匹配
!       逻辑非
&&      逻辑与
||      逻辑或

    awk '$4 > 70 { print $2 "\t" $3 "\t" $4  } BEGIN{print "Grade sheet\n"} END{print "\nIt is over"}' students
    Grade sheet

    NAME    GENDER  GRADE
    A       BOY     99
    B       Girl    85
    C       BOY     79

    It is over


    awk -F: '/root/;/^lp/{print $0}' 文件
        ; 用来分割命令，没有动作命令，会打印一行，所以，这条命令等价于
        awk -F: '/root/{print $0};/^root/{print $0}' 文件


    第二行到第五行，以zsh结尾的行
        awk -F: 'NR>=2 && NR<=5 && /zsh$/ {print $0}' passwd
        awk -F: 'NR>=2 && NR<=5 && $0 ~ /zsh$/ {print $0}' passwd


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

