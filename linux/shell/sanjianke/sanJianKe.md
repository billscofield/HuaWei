# Linux 三剑客

## awk

awk 的多种实现
    1. awk
    2. mawk
    3. nawk
    4. gawk
        apt install gawk

    ```
    ➜  Documents update-alternatives --config awk
    There are 2 choices for the alternative awk (providing /usr/bin/awk).

    Selection    Path            Priority   Status
    ------------------------------------------------------------
    * 0            /usr/bin/gawk    10        auto mode
      1            /usr/bin/gawk    10        manual mode
      2            /usr/bin/mawk    5         manual mode

    Press <enter> to keep the current choice[*], or type selection number: 1

    ```

what is auto mode and manual mode of update-alternatives?

    [link](https://newbedev.com/difference-between-auto-mode-and-manual-mode-in-update-alternatives#:~:text=In%20a%20nutshell%2C%20update-alternatives%3A%201%20in%20Auto%20Mode%2C,value%20of%20the%20alternatives%2C%20hence%20the%20name%20%22manual%22.)



awk '{pattern + action}' {filename}

awk '{print}' a.txt 全部输出 同 cat a.txt

行从1开始，列从1开始

匹配 filename 的每一行执行 action

---

awk '{print $1,$2,$3}' a.txt
    1个逗号就是空格，两个逗号就是错误
    手动写的空格是无用的，和html类似，html好歹还有一个有用，awk一个都没用
    ,: 输出分隔符，默认是空格
    "\t" 
    外部必须用单引号

awk '{print $1"\t"$2}' a.txt

输入分隔符
    -F " "
        -F fs --field-separator=fs
输出分隔符
    默认是",",可以换成自己想要的任意的字符
    awk '{print $1"-"$2}' 

---

分隔符，默认空格,格式化输出
    -F  //输入分隔符
        1. -F:
        1. -F"add"

    {print $1,$NF} 第一列和最后一列
        -F. {print $1":"$NF}  //格式化输出，.作为输入分隔符

    egrep --color "([0-9]{1,3}\.){3}[0-9]" b.txt | awk -F. '{print "Hello-"$1"-"$2"-"$3"-"$4"-keep-smile"}'

    egrep --color "([0-9]{1,3}\.){3}[0-9]"  a.txt | head -2

    egrep --color "([0-9]\.){1,3}[0-9]{1,3}" a.txt | tail -2 | awk -F. '{print $1"-"$2"-"$3"-"$4}'

---

    awk '{print $1,$2}'     //不写文件名，则是从标准输入读取

### 内部变量

    NR number of record,行
        变量，当前行的行号
        awk '{pritn NR "\t" $1 "\t" $2}' b.txt

    $0 一整行,全部行

    FNR file NR
        the input record number in the current input file.
        两个文件显示的时候，每个文件的行号都是独立的，不再是拼接在一起的

        1               1
        2               2
        3               1
        4               2
        5               3

    NF number of field,列
        这一行有几列，也就是最后一列
        awk '{print NF "\t" $0}' b.txt

        awk '{print $1}' 文件           打印文件的第一列 只能用单引号
        awk '{print $NF}' 文件          打印文件的倒数第一列的值,最大数
        awk '{print $(NF-1)}' 文件      打印文件的倒数第二列


    awk 'BEGIN{FS=","}{print NR "\t" $1,$2}' b.txt //定义全局变量FS(输入时的分隔符)为",",BEGIN必须为大写
        {print $1,$2} 中","为默认输出时的分隔符:空格

    FS  field separator
        the input field separator,a space by default.

    OFS(output field seperate)

        awk 'BEGIN{OFS=","}{print $1,$2}'    //","代表输出分隔符，分隔符的内容为",",而不是默认的空格
    
        写多个变量 ;
            awk 'BEGIN{FS="," ; OFS=","}{print $1,$2}'    //","代表输出分隔符，分隔符的内容为",",而不是默认的空格

    FILENAME
        awk '{print NR "\t" $0}' a.txt b.txt    //这两个文件的行 拼接起来
        awk '{print NR "\t" FILENAME "\t" $0}' a.txt b.txt  

    隐藏某一列的内容

        awk '{$3="XXX";print NR "\t" $0}' a.txt
            如何替换指定行呢???
    
        上边的 awk 'BEGIN{OFS=","}{print $1,$2}' b.txt 也可以写成
               awk '{OFS=",";print $1,$2}' b.txt

        BEGIN中的内容也可以写到主{}中
        脚本中的每个语句的末尾尽量写上";"

### 自定义变量

    awk '{a=1;b=2;print a+b}'
    awk '{a="hello";b="world";print a b}'  //a b 字符串拼接,不能用+,得到零; 类似JavaScript，调用Number(),
        awk '{a="4";b="hello";print a+b}' 的结果为 4
        awk '{a="4";b="4hello";print a+b}' 的结果为 8, + 都会转为数字

    awk '{a=1;b=2;c=3;print (a b)+3}'   //结果为15
        支持

        ```
        +
        -
        *
        /
        %
        ```

### 正则

建议 gawk

awk '/abc/{print $0}' b.txt
! 表示不匹配
awk '!/abc/{print $0}' b.txt


我的建议是条件写在括号中，脚本也是
    awk '(/^[a-z]{4}$/){print NR,$0}' a.txt

    脚本
        (/^[a-z]{4}$/){print NR,$0}



### 一般用法

awk [-F | -f | -v ] 'BEGIN {} //{command1;command2} END {}' file

    -F  指定输入分隔符
    -f  调用脚本
    -v  定义变量
        awk -v a=3 -v b=2 '{print (a * b)}'


pattern空模式

awk '(NR>=3&&NR<=6){print NR,$0}' b.txt
awk '(NR!=6){print NR,$0}' b.txt
awk 'NR!=6{print NR,$0}' b.txt

条件
    awk '{$3<10 ? USER="AAA":USER="BBB";print $1,USER}' /etc/passwd
    awk '{$3<10 ? USER="AAA":USER="BBB";}{print $1,USER}' /etc/passwd

    awk '{if($1>10){USER="OK"}else{USER="NO"}}{print $1,USER}' a.txt
        这个地方什么时候用{},什么时候用()  ???

            if语句不是全局的条件，而是主体代码，所以应该放在{}中
            awk '{if($1==1){USER="OK"}else{USER="NO"}  print NR,USER}' c.txt
    

    awk '$2==29{print $0}' b.txt            //单元格的内容是数字的话，该单元格内容不用加双引号
    awk '$1=="xian"{print $0}' b.txt        //单元格的内容是非数字的话，该单元格内容须要加双引号，否则被认为是变量

    awk 'NR==3{print $0}' b.txt             //只输出第三行

    awk 'NF==5{print $0}' b.txt             //这一行的列数==5才打印出来

#### BEGIN 和 END 的用法

用于多行书写,或脚本
awk 'BEGIN{}'
awk ...
awk ...
...
awk 'END{}' file

#### 引用变量

name=xian
awk '{print "'$name'"}' 同 shell中echo $name

    脚本中如何引用shell变量呢?

#### 格式化输出

awk '{printf "%s\n",$1}' a.txt

%20s    右对齐，20个字符
%-20s   左对齐
    (字段超过20个字符也不会截断的)


#### awk脚本

test.awk
BEGIN{
    print "---------"
    FS=":"
}
$3==100 && $NF=="/sbin/nologin"{
    print NR"\t"$1"\t"$NF
}
END{
    print "---------"
}

awk -f test.awk a.txt

===>>>

awk -F":" 'BEGIN{print "-----"}($3=100 && $NF=="/sbin/nologin"){print NR"\t"$1"\t"$NF}END{print "----------"}'



## sed (Stream Editor) 行编辑器

脚本中修改一般用sed,平常用vim

    sed 's/old/new/g' a.txt 
        -i 修改到文件,貌似默认是修改到内存

-n  不输出模式空间内容到屏幕，即不自动打印
    sed '1p' a.txt
        第一行打印了两次，
        每一行都会被sed处理，
        sed 把第一行放入模式空间???
    sed -n '1p' a.txt

-i  不再预览，操作硬盘文件
    -i.bak  对文件进行备份,-i后面的就是备份的文件的文件名后缀

-e  多点编辑

-r 正则
    -E, -r, --regexp-extended

    sed -r 's/\<root\>/rooter/gi' a.txt
        \< 和 \> 正则表达式的边界,类似//

dpaics

d   delete
    删除行
p
    print
a
    增加行,在指定行下一行
i
    增加行,在指定行上一行
c
    替换指定行
    sed '2chello' a.txt
    sed '2c\hello' a.txt

s   替换
    sed '2,3s/root/roat/i'
    sed 's/root/roat/g'
~   步进
    sed '1~2p' a.txt //输出1，3，5...



模式空间（Pattern space）

保留空间















1. grep
    grep --color -n 'root' /etc/passwd 
        -n //行号
        --color //匹配的内容着色
        -v "#"  //反向查找,取反
        -v "^$" //匹配非空行

    -E = egrep //扩展的grep
        ip匹配用例
        egrep --color "([0-9]\.){1,3}[0-9]{1,3}" a.txt
        

## 常用命令

1. find
    -type
        f file
        d directory
    -ctime
    -atime
    -mtime  文件修改时间
        +  范围之外
        -  范围之内  

    -size
        +10k(小写)
        +10M(大写)

    -perm 755
        

    find  | xargs rm -rf {} \;
            --exec rm -rf {} \;

    find ... | --exec cp {} /tmp/ \;
        xargs 不是万能的

    find ./ -type f --exec chmod -R 644 {} \;
    find ./ -type d --exec chmod -R 755 {} \;

    find ./ -type f -name *.log -mtime +30 --exec shred -uz {} \;


1. dd
    
1. cron




1. 管道
    1. stdint 0
    1. stdout 1
    1. stderr 2
    只保存报错信息
    2>&1 

    find ./ -user root | grep xian 2>/dev/null

    grep linuxcast < /etc/passwd

    ls a.txt no.txt >result 2>&1
                    >/dev/null 2>&1

    1. 对于& 1 更准确的说应该是**文件描述符 1**,而1标识标准输出，stdout。
    1. 对于2 ，表示标准错误，stderr。
    1. 2>&1 的意思就是将标准错误重定向到标准输出。这里标准输出已经重定向到了 /dev/null。那么标准错误也会输出到/dev/null
    http://www.cnblogs.com/zhenghongxin/p/7029173.html

    tar 的管道用法怎么这么特别呢?xargs
    find ./ -user root | grep a.txt | xargs tar -zcvf a.tar.gz




echo 'main' | cat test.cpp
这种情况下cat会输出test.cpp的内容，而不是'main'字符串，如果test.cpp不存在则cat命令报告该文件不存在，并不会尝试从标准输入中读取。echo 'main' | 会通过管道将 echo 的标准输出(也就是字符串'main')导入到 cat 的标准输入，也就是说此时cat的标准输入中是有内容的，其内容就是字符串'main'但是上面的内容中cat不会从它的标准输入中读入要处理的内容。

**其实基本上linux的命令中很多的命令的设计是先从命令行参数中获取参数，然后从标准输入中读取**

反映在程序上，命令行参数是通过main函数 `int main(int argc,char*argv[])` 的函数参数获得的，而标准输入则是通过标准输入函数例如C语言中的scanf读取到的。他们获取的地方是不一样的。

(注:标准输入是有一个缓冲区的，就像我们在程序中使用scanf函数从标准输入中读取一样，实际上是从标准输入的缓冲区中读取的)

大多数命令有一个参数  -  如果直接在命令的最后指定 -  则表示从标准输入中读取


a.txt 
    i love you
echo "love" | grep "love"  a.txt -
echo "love" | grep "love" - a.txt

输出
a.txt:love
(standard input):love

(standard input):love
a.txt:love

此时grep会同时处理标准输入和文件test.cpp中的内容，也就是说会在标准输入中搜索 'main' 也会在文件 test.cpp (该文件名从grep命令行参数中获得)中搜索 'main'。
也就是说当命令行中 test.cpp 和 - 两个参数同时存在的时候，不同的程序处理不同。
我们看到了cat与grep处理就不同。
但是有一点是一样的，
首先在命令行中查找要处理的内容的来源(是从文件还是从标准输入，还是都有)，**如果在命令行中找不到与要处理的内容的来源相关的参数** 则默认从标准输入中读取要处理的内容了

另外很多程序是 **不处理标准输入** 的，例如 kill , rm 这些程序如果**命令行参数中没有指定要处理的内容则不会默认从标准输入中读取**。所以：
echo '516' | kill
这种命里是不能执行的。

echo 'test' | rm -f
这种也是没有效果的。

这两个命令只接受命令行参数中指定的处理内容，不从标准输入中获取处理内容。


xargs

可以看到 echo '--help' | cat   该命令输出的是echo的内容，也就是说将echo的内容当作cat处理的文件内容了，实际上就是echo命令的输出通过管道定向到cat的输入了。然后cat从其标准输入中读取待处理的文本内容。这等价于在test.txt文件中有一行字符 '--help' 然后运行  cat test.txt 的效果。

而 echo '--help' | xargs cat 等价于 cat --help 什么意思呢，就是xargs将其接受的字符串 --help 做成cat的一个命令参数来运行cat命令，同样  echo 'test.c test.cpp' | xargs cat 等价于 cat test.c test.cpp 此时会将test.c和test.cpp的内容都显示出来。

**xargs 可以将管道或标准输入（stdin）数据转换成命令行参数**



