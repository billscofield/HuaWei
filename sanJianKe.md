## Linux 三剑客
1. awk
    awk '{print $1}' 文件   打印文件的第一列 只能用单引号
    awk '{print $NF}' 文件   打印文件的倒数第一列
    awk '{print $(NF-1)}' 文件   打印文件的倒数第二列
    
    分隔符，默认空格,格式化输出
        -F
            1. -F:
            1. -F"add"
    
        {print $1,$NF} 第一列和最后一列
            -F. {print $1":"$NF}  //格式化输出，.作为分隔符

        egrep --color "([0-9]{1,3}\.){3}[0-9]" b.txt | awk -F. '{print "Hello-"$1"-"$2"-"$3"-"$4"-keep-smile"}'

1. sed
    脚本中修改一般用sed,平常用vim

    sed 's/old/new/g' a.txt
        -i 修改到文件,貌似默认是修改到内存
















1. grep
    grep --color -n 'root' /etc/passwd 
        -n //行号
        --color //匹配的内容着色
        -v "#"  //反向查找,取反
        -v "^$" //匹配非空行

    -E = egrep //扩展的grep
        ip匹配用例

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












