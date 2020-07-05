# sed (Stream Editor)

## 原理

功能性上类似于 Vim, 主要是为了编辑配置文件，但是 Vim 主要是在交互条件下应用的, 当我们执行脚本文件修改配置文件时，
时不可能去做交互的，一般都是预先设定好key-value, 执行脚本时进行设置, 自动执行即可。

这就是 sed 出现的原因.


### 两块内存

模式空间
    对于大部分命令而言，sed 会将文件的每一行读入到模式空间，然后进行命令操作，最后输出到屏幕.

暂存空间
    h、H、g、G 、x 这五个命令，主要用来对模式空间和暂存空间进行操作
    


                ---------- 
                |暂存空间|
                ---------- 
                   |  |
                   |  |
    ------      -----------       ------------
    |文件| ---->| 模式空间|  ---->|输出到屏幕|
    ------      -----------       ------------


    小覆盖，大追加

    h: 模式空间  -->  暂存空间
    H: 模式空间  -->  暂存空间

    g: 暂存空间  -->  模式空间
    G: 暂存空间  -->  模式空间


## 语法格式

sed [options] '[定位][命令]' 文件


## options

常用的有 -enrif

1. -e: 使用多个命令

    sed -e 's/root/ROOT/' -e 's/zsh/ZSH/' passwd

    多个命令也可以写到一个引号当中，多个命令中间使用分号分隔

    sed 's/root/ROOT/; s/zsh/ZSH/' passwd


1. -n: 取消默认的打印行为

    sed '' 文件     // 默认情况下会打印每一行
    sed -n '' 文件  // 输出为空, 因为取消了默认的打印行为
    

1. -r: 使用扩展的正则表达式

    基本正则元字符：

    ^ $ . * [] [^] \< \> \(\) \{\}


    扩展的正则元字符

    ? + {} | ()

1. -i: 原地修改文件, -i 后边还可以加 suffix，表示先做备份，文件名为原文件名+suffix
    
    例如:
        sed -i.bak '/root/d' passwd

1. -f: 使用 sed 脚本文件, 当使用脚本文件时，-f 必须离脚本文件最近


## command

常用的命令有:

    !: 定位取反

    ---

    p: 打印

    i: 在当前行插入,原有行顺延到下一行, 同 vim 中的O
        
        sed '5iHello\nWorld' passwd

    a: 在当前行下一行插入，同 vim 中的o

        sed '5aHello\nWorld' passwd

    c: 替换当前行

        sed '5cHello\nWorld' passwd

    d: 删除当前行

        sed '4d' passwd

        sed '/root/d' passwd

    n: 当前行的下一行, 一般是因为要操作的行没有什么特色，需要用上一行进行定位

        sed '/root/{n;d}'

    r: 读取其他文件内容到当前行的下方
        
        sed '5r /etc/hosts' passwd

    w: 将匹配行另存为

        sed '/root/,/nginx/w anotherFile.txt' passwd

    q: 退出，匹配到的时候就退出，如果打印，当前行会被打印出来

        sed '/root/q' passwd

    s: s/old/new/gi , 替换命令, 将old 替换为 new

        g: 全局替换，默认替换第一个匹配

        i: 不区分大小写


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

    1. 取反

        sed -n '2,5!p' passwd       // 除了[2,5] 的行


1. 正则表达式

    sed -n '/root/p' passwd         //匹配到root的行

1. 数字和正则表达式混用

    sed -n '/root/,5p' passwd

    sed -n '2,/root/p' passwd


### 语句块 {}

sed '4{h;d}' passwd


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

    sed -r '@^[ \t]*//@d'

1. hash 和 空行

    sed -r '/(^[ \t]*)(#|$)/d' 

1. 倒序

    sed '1!G; $!h; $!d'

    说明：
    第一行  加入到暂存区    删除
    第二行  模式空间追加    放入暂存区    删除
    第三行  模式空间追加    放入暂存区    删除
    ...
