
## 
:h vimtutor
:h user-manual

:!cmd  执行外部shell命令

:read !ip a
:read !ping z.cn <C-c>

:h select-mode

[)
    dw
    db
    de
    dge 
    还有些疑问

nice to meet you

vit : visual select inside the tag

vim -u 配置文件
    vim -u NONE -N
    -N nocompatible 防止进入 vi 兼容模式

cl <=> s
C <=> c$
S <=> 0c$

:%s/old/new/cgi
    c:confirm
    g:global
    i:insensitive

set noformats=  //取消磨人的八进制 007+1

d5w

自动缩进
    =G
    =2<enter>   算上本行，一共三行

插入-普通模式
    <C-o>
    让我们执行一个普通模式命令，然后马上回到插入模式

<C-h> 插入模式下，删除前一个字符（同退格键）
<C-w> 插入模式下，删除前一个单词
<C-u> 插入模式下，删除至行首

<C-r><C-p>{register} 他会按原意插入寄存器内的文本，并修正任何不必要的缩进

表达式寄存器
    <C-r>=

可视模式
    <C-g>  选择模式 --select--
    gv 重选上次的高亮选区
    o  切换高亮选区的活动端

    gUvit 远好于 vitgU
    因为当一条可视命令被重复执行时，他会影响相同数量的文本

vi 奉 ex(行编辑器) 为先祖，出于历史原因，在命令行模式中执行的命令又被称做 Ex 命令
ex 命令影响范围广且距离远

:[range] delete [x寄存器]
:[range] yank [x寄存器]
:[line] put [x寄存器]   在指定行后粘贴x寄存器中的内容

:[range] copy {address}     t/co    复制到目标行的下方
:[range] move {address}     m       移动到目标行的下方
:[range] join   //会以空格隔开

:[range] normal {commands}
:[range] substitute/{pattern}/{string}/flags

:[range] global/{pattern}/[cmd] //对指定范围内匹配{pattern}的所有行，在其上执行 Ex 命令 {cmd}

:[range] print

"." 代表当前行
"%" 代表所有行(本来是文件名，说得过去)

偏移地址
    :.,.+2 p

1   文件的第一行
$   文件的最后一行
0   虚拟行，第一行的上方
.   光标所在行
'm  包含位置标记m的行
'<  高亮选区的起始行
'>  高亮选区的结束行
%   整个文件(:1,$)


重复上次的Ex命令
    @:

<C-r><C-w> 把当前单词插入到命令行中

set history=200 默认20

:!python %

命令行历史窗口
    q/      进入命令历史的命令行窗口
    q:      ex 命令历史的命令行窗口
    <C-f>   从命令行模式切换到命令行窗口

:shell 
    交互式的shell
    但是更方便的是 <C-z> jobs fg


:write !sh
    执行缓冲区中的**每一行内容**

    ```
    :h rename
    Renaming files                                          rename-files

    Say I have a directory with the following files in them (directory picked at
    random :-):

    buffer.c
    charset.c
    digraph.c
    ...

    and I want to rename *.c *.bla.  I'd do it like this:

            $ vim
            :r !ls *.c
            :%s/\(.*\).c/mv & \1.bla
            :w !sh
            :q!
    ```

:[range] write !{cmd}
    
:% !sort -t":" -k3
    是按照 char 来排序的，而不是数字大小

b 和 w 是 [)
e 和 ge 是 []
    yb yw db dw
    ye yge de dge

**cw 不会删掉中间的空格**
**yw dw 会删掉中间的空格**
**cw 和 ce 的效果是一样的**

    hello world nice to meet you

单词：字母、数字、下划线, 其他非空白字符也组成单词, 例如 ",.@!'"
字串：非空白字符序列组成




