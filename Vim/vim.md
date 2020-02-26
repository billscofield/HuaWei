Ken Thompson        重写 QED
UNIX                ed
George Coulsuris    em
Bill Joy            ex/vi
Bram Moolenaar      vim

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


iW
aw  当前单词以及一个空格

iW
aW  当前字串以及一个空格

is
as  当前句子以及一个空格(英文标点)

ip
ap  当前段落以及一个空行



小写位置标记只在每个缓冲区可见
大写位置标记全局可见

`^ 上次插入的地方
    s i

`. 上次修改的地方

## 寄存器
"寄存器 动作
    "adaw
    "ap     粘贴a寄存器中的内容

默认无名寄存器 "
    ""daw
    ""p

黑洞寄存器
    "_daw

ex 命令下的寄存器
    :[range] delete c   
    :[line] put c
    
x、s、d、c、y 都会覆盖寄存器中的内容

复制专用寄存器 "0


## tabstop softtabstop

https://vi.stackexchange.com/questions/4244/what-is-softtabstop-used-for

See the example below,

// Start vim without loading your vimrc. set only tabstop=8 softtabstop=4.
// This makes <Tab> in insert mode equals to 4 <Space> length at max.

// In insert mode, type 12, one <Tab>, 5. We get insertion below,
12··5
// Quit insert mode. Move cursor back, we find 2 <Space> inserted.

// In insert mode, type 12, two <Tab>, 9. We get insertion below,
12······9
// Quit insert mode. Move cursor back, you find a <Tab> inserted.

// In insert mode, type 12, three <Tab>, 3. We get insertion below,
12··········3
// Move the cursor back, you find a <Tab> and 4 <Space> inserted.

// We can even set sotftabstop=12, but this time we only need type one <Tab>, then 3.
12··········3
// Move the cursor back, you find a <Tab> and 4 <Sapce> inserted.

So tabstop is about how wide a Tab is defined, while softtabstop is about how far cursor moves while typing Tab. 
When they are not set to be the same value, it means that if you hit the Tab keystroke, it does not imply trivially a Tabcharacter. 
In whatever cases, It is vim who decide once you quit insert mode. Vim will first try to match the insertion by as many tabstop as it can;
if at last it cannot make a full tabstop, vim simply compensates by Space.

To speak a little bit more, if you set expandtab, it is equal to say to vim:
    Please do not bother to calculate how many Tab and Sapce is needed. Simply insert Space.

***softtabstop 是按下 Tab 键时移动多少个字符宽度, 不足一个 softtabstop 时以空格补齐, 建议 采用 et, 并且设置 tabstop == softtabstop***


## set let
:set is for setting options, :let for assigning a value to a variable. 
It happens that the value for an option is linked to the name of the option prepended by a & (the &option-name construct then behaves very similar to “ordinary” variables). So, the following are equivalent: 
:set tw=40 
:let &tw=40 
But, for example, assigning 50 to the global variable foo (:let g:foo=50) cannot be achieved with a :set command (because g:foo is a variable and not an option). 
Some options are boolean like. When setting these, no value is needed (as in :set noic and the opposite :set ic).


---

:set only works with options, and sehe's answer showcases some good usage examples.

:let on the other hand can do almost everything that :set can do, plus more. It can assign a value to

a variable, e.g. let vi = 'vim'
an option, e.g. let &tw = 40
a register, e.g. let @a = $HOME . '/vimfiles'
an environment variable, e.g. let $NOTHING = 'NOTHING'
Another major difference is that the right hand side of :let is an expression, meaning you can do things like string concatenation (as seen in my register example above) and arithmetic operations (e.g. let &tw = 40 + 60). This also means that you have to quote the value if it's a string. :set on the other hand reads the value verbatim.

It's easier to use :set with options even though :let can also do most of it, Here are some comparison using sehe's examples ("n/a" means no way to do it with :let)

:verbose set vs n/a (don't think there's another way to list all options)
:set tw=40 vs :let &tw = 40 (yes, you can use the same shorthand in let too)
:set wrap& vs n/a
:set nowrap vs :let &wrap = 0 (for boolean options, 0 is false and 1 is true)
:set wrap! vs :let &wrap = !&wrap
A few more examples

print the value of an option: :set formatoptions? vs :echo &formatoptions (let doesn't print values, unlike set)
assigning to multiple options at the same time:

:set et sw=4 sts=4 
vs

:let [&et, &sw, &sts] = [0, 4, 4]
set global option: setglobal et vs let &g:et = 1

set local option: setlocal et vs let &l:et = 1
See :h :set and :h :let for more details

https://stackoverflow.com/questions/9990219/vim-whats-the-difference-between-let-and-set

---
