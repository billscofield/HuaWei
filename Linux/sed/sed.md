## sed (Stream Editor流编辑器)

filtering and transforming text

一行一行读取文件内容(到缓冲区，应该是cache)，按照要求进行处理，输出到屏幕

**默认是在缓冲区进行操作, 默认不会修改源文件**


文件 -> 缓冲区cache(在sed中又叫做"模式空间") -> 屏幕


**处理时，把当前处理的行存储在临时缓冲区中，称为”模式空间”（ oattern space），接看用sed命令处理缓冲区中的内容，处理成后，把缓冲区的内容送往屏幕显示。**


sed [OPTION]... {script-only-if-no-other-script} [input-file]...


两种使用方式
    1. 命令行模式
    2. 写成脚本

## 命令行模式

sed [options] '处理动作(一定要加单引号)' 文件名

options
    -e  : 进行多项（多次）编辑? 貌似没有什么用, 对第一行编辑，对第二行编辑，..
        sed -ne '/root/p' -ne '/root/=' passwd

        ```
        ➜  Music sed -ne '/root/p' -ne '/root/=' passwd
        root:x:0:0:root:/root:/usr/bin/zsh
        1
        root:liujiao
        12

        ➜  Music sed -ne 's/root/root/p' -ne '/10/=' passwd
        root:x:0:0:root:/root:/usr/bin/zsh
        7
        9
        10
        root:liujiao
        
        为什么会这样输出呢? 因为是执行一次扫描，每次扫描按顺序执行多个命令
        ```

        或者  sed -n '/root/p;/root/=' 文件
              sed -n '1,${/root/p;/root/=}' 文件
            用分号分割多个命令，遮掩更可以不用加 -e 选项


        看文件有多少行
            sed  -n '$=' 文件
                要加上-n, 否则内容也打印了
            sed '=' dog
                相当于-i, 在内容上一行打印行号
    -e script, --expression=script

        add the script to the commands to be executed

    -n, --quiet, --slient   : 取消默认输出(未经修改的); sed会在输出修改后的内容后，再将缓冲区中的原内容(未经修改的)输出
    -E, -r : 使用扩展的正则表达式

    -i[SUFFIX], --in-place[=SUFFIX]
        edit files in place (makes backup if SUFFIX supplied)
        不要配合 -n 选项，输出的内容回写进文件
        和动作p的作用一样，加了动作p, 会再写一遍,
        即，怎么输出，就怎么回写

        -i.备份文件   suffix后缀 生成原文件名.后缀
        
        sed -i.bak 's/dog/cat/1;s/dog/T-rex/1' dog
            会先备份dog文件为dog.bak 然后再做修改

    -f script-file, --file=script-file
        dd the contents of script-file to the commands to be executed



常见处理动作
    'p' 打印
    'i' vim插入,同vim中的大写字母O
    'a' vim插入,同vim中的小写字母o
        sed 'a' 文件    a和i 后边必须有内容
    'c' 整行替换
    'd' 删除指定行
        任何时候 d 命令都会结束当前模式空间的处理，读取文本的下一行(针对多命令)

    'r' 从另一个文件读入内容加入到当前文件
        sed '3r /etc/passwd' 文件
    'w' 另存为
        sed '1,5w FILE2.txt' 文件
    's' 搜索替换
        sed '1,5s/root/ROOT/gp' 文件
            g 是全文替换
        sed '1,5s/root/ROOT/2p' 文件
            2 是替换一行当中第2个匹配的, 同理 Num

    '&' 前面的搜索项
        sed -n 's/root/#&/p' 文件
        sed -n 's/^root/#&/p' 文件  仅仅注释这一行

        sed -n 's/\(^root\)/#\1/p' 文件  仅仅注释这一行
        sed -n 's/\(^root\)/#&/p' 文件  仅仅注释这一行

    '!'
        sed -n '1,5!p' 文件
        sed -n '/root/!p' 文件

    '=' 打印行号
        sed '5=' 文件
    
    'q' 退出
        sed '/liujiao/q' 文件
            匹配到之后退出, 匹配行会显示出来
        

'范围+命令'

    /key/               包含关键字的行
    /key/!              不包含关键字的行

    /key1/,/key2/       匹配包含两个关键字之间的行 [,]
    /key1/,/key2/!      匹配包含两个关键字之间的行 (,)
        非贪婪模式
        key1是开始行，在一行中找到就从下一行开始找 key2, 而不在本行找key2

    /key/,x             关键字到x行     []
    /key/,x!            关键字到x行     [] /key/和x 都不会显示出来

    x,/key/             从第x行到匹配关键字行
    x,/key/!            从第x行到匹配关键字行
        非贪婪模式

    x,y!                不包含x到y行




sed '' 文件             什么都不做，打印文件,默认会打印缓冲区文件中中的每一行
sed 'p' 文件            每一行都输出两次
sed -n 'p' 文件         打印处理后的每一行
sed -n '2p' 文件        打印指定行
sed -n '1,5p' 文件      打印指定行
sed -n '$p' 文件        打印最后行




关于打印：
    对于缓冲区，执行动作，然后sed默认输出,所以，第一次输出是打印动作，第二次输出是sed的默认输出
    都是输出修改过后的文件内容

### 正则表达式

基本元字符：

'''
^ $ . * [] [^] \< \> \(\) \{\}

'''

扩展元字符：

'''
? + {} | ()
'''

使用扩展元字符的方式
    1. 转义
    1. -r 


### 插入
sed '2ihello' 文件      也会将整个打印
sed 'ihello' 文件       每一行都会执行ihello

sed '2ihello\nworld' 文件      也会将整个打印

交互式插入多行
sed '3i\
hello\
world\
888' 文件


### 替换整行内容
sed '5chelloworld' 文件

sed '/^root/chelloworld' 文件
    sed '/正则/xxx'

注意
    sed '1,5cHelloWorld' 文件  是将多行整个替换，而不是范围内的每一行



### 删除

sed '5d' 文件

sed '1,5d' 文件

sed '/^root/d' 文件

sed '/[0-9]/d' 文件

sed -r '/([0-9]{1,3}\.){3}[0-9]{1,3}/d' 文件

sed 'd' 文件    
    全部删除
    注意，没有输出


### 搜索替换

sed 's/搜索的内容/新内容/动作'  文件
    动作p 打印
    动作g 全局替换
    不写g 只会替换每行的第一个

sed 's/root/XIAN/p'     会每行打印，匹配的行会打印两次, 已替换每行的第一个
sed 's/root/XIAN/pg'    会每行打印，匹配的行会打印两次
sed -n 's/root/XIAN/p' 只会打印匹配行1次
sed -n 's/root/XIAN/2p' 一行中，第二个匹配项，只会打印匹配行1次

搜索显示符合条件的行
sed -n 's/^#/#/p' 文件
sed -n 's/^#//p' 文件   


sed -n 's/\bin/\WORLD/gp' 文件
sed -n '1,10s/\bin/\WORLD/gp' 文件

自定义分隔符
    sed -n 's@\bin@\WORLD@gp' 文件
    可以是任意字符


每行开头添加字符
    sed 's/^/#/p' 文件

    sed -n 's/^root/#&/p' 文件  仅仅注释这一行

显示除了空行的行
    sed -n '/^$/!p'
    sed -n '/^$/d'

显示除了注释的行
    sed -n '/^#/!p'
    sed -n '/^#/d'

显示除了注释和空行的行
    sed -n '/^#/!p;/^$/!p' 文件
    sed -nr '/^#|^$/!p'

sed -r '/^(#|$|;|\t$)/d' 文件
    

IP替换
    sed -n 's/\(10.1.1.)1/\1254/gp' 文件
        将10.1.1.1 替换为 10.1.1.254

    sed -n 's@\(10.1.1.\)1@\1254@gp' passwd
    sed -n 's@\(10\.1\.1\.\)1@\1254@gp' passwd


sed -nr '/^lp|^#/p' a.txt


练习题

the quick brown fox jumps over the lazy dog.dog
the quick brown fox jumps over the lazy dog.dog
the quick brown fox jumps over the lazy dog.dog

第一个dog 换成 cat， 第二个dog 换成T-rex
    sed -n 's/dog/cat/1;s/dog/T-rex/1p' 文件    替换过后就只有一个dog了，从1开始


多条命令的话，只在最后一个命令后边加p(打印) 即可，否则，第一条命令后打印，第二条命令后又打印



## 文件形式

### 第一种方式

    ```script
    s/dog/cat/1
    s/dog/T-rex/1p
    ```
    sed -n -f script 文件
    sed -n -i -f script 文件

    或者
    ```script
    s/dog/cat/1
    s/dog/T-rex/1
    ```
    会当做一行来处理

    sed -f script 文件
    sed -i -f script 文件

### 第二种方式

    ```sed.sh
    #!/bin/sed -f       不要有空格
    s/dog/cat/1         不要有空格,并且不要有空行
    1,5d                不要有空格
    3i777               不要有空格
    a888                不要有空格
    ```
    chmod +x  sed.h
    ./sed.sh 文件

echo 'tom is handsome' | sed 's/tom/bill/1'




## 使用shell变量

sed -i "/$LUCK_LINE/d" names
    发现不使用变量的时候，使用双引号也没有问题
    而awk 使用双引号不行



模式空间

暂存空间







{}  命令集合
'3h;d'    h作用于第3行, d组用于所有行
'3{h;d}'  都是作用于第3行 等价于 '3h; 3d'
