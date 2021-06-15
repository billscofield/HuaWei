# sed (Stream Editor)

## 原理

功能性上类似于 Vim, 主要是为了编辑配置文件，但是 Vim 主要是在交互条件下应用的,
当我们执行脚本文件修改配置文件时，是不可能去做交互的，一般都是预先设定好key-value,
执行脚本时进行设置, 自动执行即可。

这就是 sed 出现的原因.


### 两块内存

模式空间

    对于大部分命令而言，sed 会将文件的每一行读入到模式空间，然后进行命令操作，最后输出到屏幕.

暂存空间

    h、H、g、G 、x 这五个命令，主要用来对模式空间和暂存空间进行操作
    


                +--------+ 
                |暂存空间|
                +--------+ 
                  /|\ |
                 h |  |g
                   | \|/
    +----+      +---------+       +----------+
    |文件| ---->| 模式空间|  ---->|输出到屏幕|
    +----+      +---------+       +----------+


    小覆盖，大追加

    h: 模式空间  -->  暂存空间, 将模式空间内容复制给暂存区, 模式空间内容不变
    H: 模式空间  -->  暂存空间, 将模式空间内容append给暂存空间, 模式空间内容不变

    g: 暂存空间  -->  模式空间, 将暂存空间内容复制给模式空间，暂存区内容不变
    G: 暂存空间  -->  模式空间, 将暂存空间内容append给模式空间，暂存区内容不变

    x: 交换模式空间和保持空间中的内容

## 语法格式

sed [options] '[定位][命令]' 文件


## options

常用的有 -enrif

1. -e: 使用多个命令, 亦是多个条件

    sed -e 's/root/ROOT/' -e 's/zsh/ZSH/' passwd

    多个命令也可以写到一个引号当中，多个命令中间使用分号分隔

    sed 's/root/ROOT/; s/zsh/ZSH/' passwd

    一般来说应该配合 d 动作，比如 [3,5] 行中匹配响应内容对操作:
        
        sed -e '3,5!d' -e 's/old/new/' <filename>

        sed -n 's/old/new/p' <filename>     如果没有p,也不会打印


1. -n: 取消默认的打印行为

    sed '' 文件     // 默认情况下会打印模式空间缓冲区中的每一行

    sed -n '' 文件  // 输出为空, 因为取消了默认的打印行为

    但是某些动作会带有打印功能，如 c
    

1. -r: 使用扩展的正则表达式

    基本正则元字符：

    ^ $ . * [  ] [^] \< \> \(\) \{\

    扩展的正则元字符

    ? + {} | ()

1. -i: 原地修改文件, -i 后边还可以加 suffix，表示先做备份，文件名为原文件名+suffix
    
    例如:
        sed -i.bak '/root/d' passwd

1. -f: 使用 sed 脚本文件, 当使用脚本文件时，-f 必须离脚本文件最近
    

why:
    脚本文件中为什么要加 -f 呢?试过去掉 -f 后在command上写-f会报错：

    是 -f 被操作的文件 之意?

    看了《Effective awk Programming》 #!/usr/bin/sed -f   => ./awkshell  => /usr/bin/sed -f ./awkshell

    ```
    #!/usr/bin/sed -n

    ./a.sed -f 文件

    /usr/bin/sed: -e expression #1, char 1: unknown command: `.''

    ```
    
    看来这个-f 只能写到脚本文件里边


## command

常用的命令有:

    !: 定位取反

    ---

    p: 打印

    i: 在当前行插入,原有行顺延到下一行, 同 vim 中的O
        
        sed '5iHello\nWorld' passwd

    a: 在当前行下一行插入，同 vim 中的o
        
        sed '5aHello\nWorld' passwd
        
        ```
        [root@localhost ~]# sed '3i\
        > This is an inserted line.' data6.txt
        
        This is line number 1.
        This is line number 2.
        This is an inserted line.
        This is line number 3.
        This is line number 4.
        
        
        如果你想将一个多行数据添加到数据流中，只需对要插入或附加的文本中的每一行末尾（除最后一行）添加反斜线即可，例如：
        [root@localhost ~]# sed '1i\
        > This is one line of new text.\
        > This is another line of new text.' data6.txt
        ```


    c: 替换当前行
        
        sed '5cHello\nWorld' passwd

    d: 删除当前行
        
        sed '4d' passwd
        
        sed '/root/d' passwd
        
        也可以使用两个文本模式来删除某个区间内的行，但这么做时要小心，你指定的第一个模式会“打开”行删除功能，第二个模式会“关闭”行删除功能，因此，sed
        会删除两个指定行之间的所有行（包括指定的行）


    n: 当前行的下一行, 一般是因为要操作的行没有什么特色，需要用上一行进行定位

        sed '/root/{n;d}'

        ❓为什么下边这条语句不行？
            
            sed '/root/{n;aROOT}' <file>

    r: 读取其他文件内容到当前行的下方, 好像不能读取 shell 命令
        
        sed '5r /etc/hosts' passwd

        通常和匹配配合进行文本替换

        ```cat notice.std
        Would th following people:
        LIST
        Please report to the ship's captain.


        sed '/LIST/{
        r list.txt
        d
        }' notice.std

        r和其他命令不能写在一行，需要像上边那样写，脚本中这样写:

        /list/r helloworld.txt
        /list/d
        ```

    w: 将匹配行另存为

        sed '/root/,/nginx/w anotherFile.txt' passwd

    q: 退出，匹配到的时候就退出，如果打印，当前行会被打印出来

        sed '/root/q' passwd

    s: s/old/new/gi , 替换命令, 将old 替换为 new
        
        g: 全局替换，默认替换第一个匹配
        
        i: 不区分大小写
        
        N: 动作于第N个匹配项目(当一行中有多个匹配项目时，默认是第一个)
        
        如果你想将一个多行数据添加到数据流中，只需对要插入或附加的文本中的每一行末尾（除最后一行）添加反斜线即可，例如：
        [root@localhost ~]# sed '1i\
        > This is one line of new text.\
        > This is another line of new text.' data6.txt
    
    y: 字符转换命令, 类似table转换表，一一对应，否则会报错
        
        '[address]y/123/abc/'     //会将1替换为a, 2替换为b, 3替换为c,
        注意最后的那个/，一定要有

    l: List out the current line in a 'visually unambiguous' form.

        显示不可见字符

        sed -n 'l' 12345.txt

    l width
        List out the current line in a ``visually unambiguous'' form, breaking it at width characters.  This is a GNU extension.

    N: 会将下一文本行添加到模式空间中已有的文本后，文本行仍用换行符分隔

    sed '/admin/{N;s/\n/ /}'

    ```
    ➜  t cat admin.txt
    hello administrator
    liu
    hahahah
    liu
    whoami
    liu

    ➜  t sed  '{N; s/\n/ /}' admin.txt
    hello administrator liu
    hahahah liu
    whoami liu

    不加匹配，会将偶数行添加到上一行当中，原文本中的偶数行消失了
    ```

---

    b用于无条件的转移（即一碰到b立刻转移）；
    
        语法: [address]b [label]
        
        address 定义了哪些行的数据会触发分支命令
        label参数定义了要跳转到的位置
        如果没有label参数，跳转命令会跳转到脚本的结尾


        ```b命令
        以AA开头的行行末加YES, 其他的加NO
        #!/usr/bin/sed -f
        /^AA/b yes
        s/$/\tNO/
        b           //这个必须有,用于结束不匹配模式的更改!!!
        :yes
        s/$/\tYES/
        
        写成一行
        sed '/^AA/b yes;s/$/ NO/;b;:yes;s/$/ YES/' demo.md
        ```

        如果分支命令的模式没有匹配，sed编辑器会继续执行脚本中的命令，包括分支标签后的命令(因此，所有的替换命令都会在不匹配分支模式的行上执行)

        ```b命令
        以AA开头的行行末加YES, 其他的加NO
        #!/usr/bin/sed -f
        /^AA/b yes
        s/$/\tNO/       和上边相比少了b ， 结束不匹配模式的更改!!!
        :yes
        s/$/\tYES/
        ```


    t用于有条件转移，只有当替换命令改变当前行时才会执行。 

        语法: [address]t [label]


    冒号和标签之间不允许有空格，lable后面如果有空格将被认为是lable的一部分（不建议在lable后面带空格）

    ```t命令
    #!/usr/bin/sed -f
    :start
    s/,/ /p
    t start

    #!/usr/bin/sed -f
    s/^aa/MATCHED /
    t
    s/^/NO MATCHED /


    ```

### 定位命令

我们可以使用数字对行进行定位，或者使用正则表达式对行进行定位

定位命令是闭区间

1. 数字
    1. 单行
        
        sed -n '2p' passwd

    1. 连续多行

        sed -n '2,5p' passwd

    1. 不连续的多行，这个只能使用多个命令来处理
        
        sed -n '3p; 5p' passwd 或者
        sed -ne '3p' -ne '5p' passwd

        有一个 -n 即可

    1. 取反

        sed -n '2,5!p' passwd       // 除了[2,5] 的行


1. 正则表达式

    sed -n '/root/p' passwd         //匹配到root的行

1. 数字和正则表达式混用

    sed -n '/root/,5p' passwd

    sed -n '2,/root/p' passwd


注意:
    
    d(删除命令): 你指定的第一个模式会打开行删除功能，第二个模式会关闭行删除功能；

    在数据流中匹配到了开始模式，删除功能就会打开，如果没有第二个模式，就会一直删除下去



### 语句块 {}

sed -n '4{h;x;p}' passwd


### 外部变量

1. 各用各的
    
    sed '$a'"$PWD" 文件

    sed '$a'$PWD 文件

1. 双引号

    sed "\$a$PWD" 文件



## 常见的命令

1. 删除空行

    sed -r '/^[ \t]*$/d' 文件

1. 删除hash注释行

    sed -r '/^[ \t]*#/d'

1. 删除//注释行

    sed -r '\@^[ \t]*//@d'

    **正则表达式使用其他非默认字符的话需要讲第一个字符转义, 而替换命令不需要进行转义**

1. hash 和 空行

    sed -r '/(^[ \t]*)(#|$)/d' 

1. 倒序

    sed '1!G; $!h; $!d'

    说明：

    第一行  替换暂存区内容    删除

    第二行  模式空间追加    替换暂存区    删除

    第三行  模式空间追加    替换暂存区    删除

    ...


1. 每一行打印行号

    sed '=' hellworld.txt | sed '{N;s/\n/ /}'

1. 加倍行间距

    sed 'G' 文件

1. 已有的空行不再增加

    sed -e '^$d' -e '$!G' 文件



