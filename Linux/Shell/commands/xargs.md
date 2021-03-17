xargs (short for "eXtended ARGuments" [1]) is a command on Unix and most Unix-like operating systems 
used to build and execute commands from standard input. It converts input from standard input into 
arguments to a command.

Some commands such as grep and awk can take input either as command-line arguments or from the 
standard input. However, others such as cp and echo can only take input as arguments, which is 
why xargs is necessary.

xargs后面的命令默认是echo

    seq 10 | xargs

find . -iname ""  | xargs ls -S
find . -iname ""  | xargs ls -S


-n  max-args, --max-args=max-args
    Use at most max-args arguments per command line.  Fewer than max-args arguments will be  used
    if  the  size  (see  the -s option) is exceeded, unless the -x option is given, in which case
    xargs will exit.
    
    ➜  liujiao echo {1..10} | xargs -n 1
    1
    8
    ...
    9
    10
    ➜  liujiao echo {1..10} | xargs -n 2
    1 2
    3 4
    5 6
    7 8
    9 10


    echo user{1..100} | xargs -n 1  useadd 
    echo user{1..100} | xargs -n 1  usedel -r

-I replace-str
    Replace occurrences of replace-str in the initial-arguments with names read from standard in‐
    put.  Also, unquoted blanks do not terminate input items; instead the separator is  the  new‐
    line character.  Implies -x and -L 1.

-i[replace-str], --replace[=replace-str]
    This  option  is a synonym for -Ireplace-str if replace-str is specified.  If the replace-str
    argument is missing, the effect is the same as -I{}.  This option is deprecated; use  -I  in‐
    stead.



    ```
    ➜  liujiao seq 10 | xargs -n1 -i echo "hello{}lca"
    hello1lca
    hello2lca
    hello3lca
    hello4lca
    hello5lca
    hello6lca
    hello7lca
    hello8lca
    hello9lca
    hello10lca
    ```

    只能用seq 而不能用 {..}, 为啥?


-P max-procs, --max-procs=max-procs


    下载工具 pip install you-get

    seq 100 | xargs -n1 -i -P10 you-get www.bilibili.com/jsdalfj={}
    seq {1,100} | xargs -n1 -i -P10 you-get www.bilibili.com/jsdalfj={}


-d 参数与分隔符
    ```
    默认情况下，xargs将换行符和空格作为分隔符，把标准输入分解成一个个命令行参数。

    $ echo "one two three" | xargs mkdir
    上面代码中，mkdir会新建三个子目录，因为xargs将one two three分解成三个命令行参数，执行mkdir one two three。

    -d参数可以更改分隔符。

    $ echo -e "a\tb\tc" | xargs -d "\t" echo
    a b c
    上面的命令指定制表符\t作为分隔符，所以a\tb\tc就转换成了三个命令行参数。echo命令的-e参数表示解释转义字符。


    $ echo -e "a\tb\tc" | xargs -d "\t" mkdir
    a   b  'c'$'\n'         这是什么东西???, 而且不能指定多个 -d 
    
   
    $ echo -e "a\tb\tc" | xargs -d "\t" echo    可以看到有多余的空行，why???

    $ echo -e "a\tb\tc" | xargs -d "\t" | xargs mkdir





    liujiao echo {1..5} | xargs -n1 | xargs -i echo helo{}
    helo1
    helo2
    helo3
    helo4
    helo5

    seq {1,5} | xargs -n1 -i echo helo{}
    {1..5}    | xargs -n1 -i echo helo{}
    为什么同样的形式，  {1..5} 就不行呢???

    ```

-p -t 使用xargs命令以后，由于存在转换参数过程，有时需要确认一下到底执行的是什么命令。

    -p参数打印出要执行的命令，询问用户是否要执行。


    $ echo 'one two three' | xargs -p touch
    touch one two three ?...
    上面的命令执行以后，会打印出最终要执行的命令，让用户确认。用户输入y以后（大小写皆可），才会真正执行。

    -t参数则是打印出最终要执行的命令，然后直接执行，不需要用户确认。


    $ echo 'one two three' | xargs -t rm
    rm one two three



-0 参数与 find 命令
    由于xargs默认将空格作为分隔符，所以不太适合处理文件名，因为文件名可能包含空格。

    find命令有一个特别的参数-print0，指定输出的文件列表以null分隔。然后，xargs命令的-0参数表示用null当作分隔符。


    $ find /path -type f -print0 | xargs -0 rm
    上面命令删除/path路径下的所有文件。由于分隔符是null，所以处理包含空格的文件名，也不会报错。

    还有一个原因，使得xargs特别适合find命令。有些命令（比如rm）一旦参数过多会报错"参数列表过长"，而无法执行，改用xargs就没有这个问题，因为它对每个参数执行一次命令。


    $ find . -name "*.txt" | xargs grep "abc"
    上面命令找出所有 TXT 文件以后，对每个文件搜索一次是否包含字符串abc。










hexdump 
    -c：单字节字符显示
    -C：输出规范的十六进制和ASCII码

➜  liujiao echo {1..3} | hexdump -cC
0000000   1       2       3  \n
00000000  31 20 32 20 33 0a                                 |1 2 3.|
00000006
➜  liujiao echo {1..3} | hexdump -Cc
00000000  31 20 32 20 33 0a                                 |1 2 3.|
0000000   1       2       3  \n
0000006
➜  liujiao echo {1..3} | xargs -n1 |hexdump -Cc
00000000  31 0a 32 0a 33 0a                                 |1.2.3.|
0000000   1  \n   2  \n   3  \n
0000006
➜  liujiao echo {1..3} | xargs -n1 |hexdump -cC
0000000   1  \n   2  \n   3  \n
00000000  31 0a 32 0a 33 0a                                 |1.2.3.|
00000006





cat a.txt  | xargs -n1 -i sh -c 'echo {}; mkdir {}'

