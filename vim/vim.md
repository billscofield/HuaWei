## [History of Emacs and vi Keys](http://xahlee.info/kbd/keyboard_hardware_and_key_choices.html)

### 1. 为什么 Vim 使用 hjkl 移动光标

[link](http://xahlee.info/kbd/ADM-3A_terminal.html)

ADM-3A Terminal, first shipped in 1976.
This is the machine that begot the vi editor.


ADM-3A设备使用HJKL键在vi编辑器及其后代中移动光标。它在这四个键上印有光标移动箭
头。Vim是源自Vi也是使用相同的HJKL键作为方向键。

ADM-3A是一个早期视频显示终端在1976年引入的,这是由利尔西格勒(Lear-Siegler)制造,
具有12英寸的屏幕显示的80个字符12个或24行。它创下了995美元的新行业低单价。由于计
算机通信速度的快速提高，以及由于需要廉价的操作员控制台而向市场推出的新型小型计
算机系统，它很快在商业上取得了成功。

### 2. 为什么要用字符 ~ 来表示home目录

同样是 ADM-3A, 这种机器上波浪号和“home”键（用于把光标移动到最左端）正好在同一个
键上。


[link](https://www.sohu.com/a/271050442_156793)

Ken Thompson        重写 QED

    1966 年，贝尔实验室聘用了 Ken Thompson 。Thompson 刚刚在加州大学伯克利分校
    完成了电气工程和计算机科学的硕士学位。在伯克利他使用一个名为 QED 的文本编辑
    器，该编辑器在 1965 到 1966 年间被开发用于伯克利分时系统。Thompson 到达贝尔
    实验室后做的第一件事就是为麻省理工学院兼容分时系统重写 QED。他后来又为
    Multics 项目写了另一个版本的QED。

UNIX                ed

    1969 年 8 月，在妻子和幼子外出去加州度假时，Thompson “给操作系统、shell、编
    辑器和汇编程序分别分配了一个星期”，将新系统的基本组件组合在一起。

    这个编辑器被称为 ed 。它是基于 QED 的，但并不完全是 QED 的复现。 Thompson
    决定放弃某些 QED 的功能，弱化了对常规的表达式的支持，因此 ed 只能理解相对简
    单的正则表达式。QED 允许用户打开多个缓冲区同时编辑多个文件，但是 ed 一次只
    使用一个缓冲区。QED 可以执行包含命令的缓冲区，而 ed 则不能。这些简化可能是
    必要的。

    ed 现在是 POSIX 规范的一部分，所以如果你有一个符合 POSIX 的系统，你的电脑上
    就安装了 ed 。

    ed 是一个真正的行编辑。它被广泛应用于电传打字机时代。

George Coulsuris    em

    在 1975 年，一个名叫 George Coulouris 的人在伦敦玛丽皇后学院的 Unix 系统上
    开发了一个改进版 ed 。Coulouris 利用他在玛丽女王学院的视频显示器开发他的编
    辑器。与 ed 不同的是，Coulouris 的程序允许用户编辑在屏幕中的一行代码，通过
    一次次击键的方式来操作行（想象一下在 Vim 中每次编辑一行）。 Thompson 拜访玛
    丽女王学院时，看到 Coulouris 已经写好的程序，驳斥道他不需要在编辑文件的时候
    看到它的状态。受此启发，Coulouris 将他的程序命名为 em(editor for mortals
    [ˈmɔːrtl])，"为凡人而生的编辑器"。

Bill Joy            ex/vi

    在伯克利，Coulouris 遇到了 Bill Joy，一名伯克利软件发行公司（BSD）的研究生。
    Coulouris 斯向Joy 展示了 em， Joy 以 Coulouris 的源代码为基础，为扩展 ed 建
    立了一个名为 ex 的改进版 ed。1978年，1.1 版本的 ex 与第 1 个版本的 BSD Unix
    捆绑在一起。ex 在很大程度上与 ed兼容，但它增加了两种模式：一种“开放”模式，
    这种模式可以使 em 单行编辑成为可能，还有一种“可见”模式，这种模式会占据整个
    屏幕，并且可以像我们今天所习惯的那样，对整个文件进行实时编辑。

    1979 年的第 2 版 BSD 引入了一个名为 vi 的可执行文件，它只在可视模式下打开 ex 。

    ex/vi （后来称为 vi）建立了我们现在使用的 Vim 中大多数的约定，但这些约定当
    时并不是 ed 的一部分。Bill Joy 使用的视频终端是 Lear Siegler ADM-3A

    1976年，那时，一个叫作 Bill Joy 的美国兄弟编写了一款行编辑器工具，叫 ex，在
    当时非常的出名。但是，经过对用户行为的观察，Joy 发现人们更愿意使用 ex 的可
    视化模式，而非行编辑模式。因此，Joy 决定在 1979 年发布 Vi 这款编辑器，直接
    把可视化模式（Visual Mode）呈现给用户。正是这个决定造就了今天家喻户晓的Vi
    编辑器。

Bram Moolenaar      vim

    荷兰人,他对 Vim 的定位并不高，从他给这款产品命名 Vi IMitation 就能看得出来。
    而后来由于加入的特性越来越多，也越来越受到人们的喜爱和欢迎，因此他也顺势将
    Vim 的名字全称改为了 Vi IMproved，意为 Vi 的增强版本

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

:set list   显示不可见字符
    制表符被显示为“^I”，而行尾则标识为“$”

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


## expandtab

In Insert mode: Use the appropriate number of spaces to insert a <Tab>. 

在 :help tabstop 命令的说明中，只有设置了 expandtab 选项，把 tab 字符替换为空格
的情况下，才建议修改 tabstop 选项为其他值

## shiftwidth

'shiftwidth' 'sw'       number  (default 8)

    local to buffer
    Number of spaces to use for each step of (auto)indent.  Used for
    |'cindent'|, |>>|, |<<|, etc.

    When zero the 'ts' value will be used.  Use the |shiftwidth()|
    function to get the effective shiftwidth value.

    行选择后，使用 < 或者 > 做缩进时，缩进的列数


## tabstop softtabstop

tabstop 选项只修改 tab 字符在 vim 中的显示宽度，不修改插入模式下按 Tab 键，vim
插入的是 tab 字符




一旦设置了softtabstop的值时，你按下tab键，插入的是空格和tab制表符的混合，具体如
何混合取决于你设定的softtabstop

举个例子，
    如果 softtabstop=8, 那么按下tab键，插入的就是正常的一个制表符;
    如果 softtabstop=16,那么插入的就是两个制表符；
    如果 softtabstop=12,那么插入的就是一个制表符加上4个空格；
    如果 softtabstop=4呢？那么一开始，插入的就是4个空格，此时一旦你再按下一次tab，这次的四个空格就会和上次的四个空格组合起来变成一个制表符。
    换句话说，softtabstop是“逢8空格进1制表符”,前提是你tabstop=8。


softtabstop 选项(可以简写为 sts)会影响 vim 在插入模式下按 Tab 键所实际得到的字
符，可能是插入特定数目的空格，也可能是插入一个 tab 字符。

    具体使用时，会受到 tabstop 选项和 expandtab 选项的影响。

---

    set tabstop=8
    set softtabstop=4

    当 softtabstop 选项值小于 0 时，其真实值会被设置成 shiftwidth 选项的值。这个特
    性有助于保持和自动缩进的排版一致。后面会具体说明。

    注意：softtabstop 选项影响 vim 在插入模式下按 Tab 键所实际得到的字符，不改变
    vim 中 tab 字符的显示宽度，tab 字符始终显示为 tabstop 指定的宽度。

    当 softtabstop 选项值小于 tabstop 选项值时，第一次按 Tab 键，会插入 softtabstop
    选项值对应的多个空格，当插入的空格个数到达 tabstop 指定的宽度时，会删除插入的空
    格，替换成一个 tab 字符。

---

    set tabstop=8
    set softtabstop=4
    set expandtab

    对于 softtabstop 选项值为 4，tabstop 选项值为 8，且没有设置 expandtab 选项
    的场景来说，第一次按 Tab 键，插入的是 4 个空格，并没有插入 tab 字符，没有发
    生替换 tab 字符为空格的情况，并不是说设置 softtabstop 选项值为 4，expandtab
    选项会基于 softtabstop 选项值来把 tab 字符替换成 4 个空格。

    **当按两次 Tab 键，插入一个 tab 字符后，expandtab 选项还是基于 tabstop 选项值
    把 tab 字符替换成 8 个空格。**


注意：设置 expandtab 选项只能把新插入的 tab 字符替换成特定数目的空格，不影响文
件中已有的 tab 字符。即，文件已有的 tab 字符会保持不变。



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

    Please do not bother to calculate how many Tab and Sapce is needed. Simply
    insert Space.

***softtabstop 是按下 Tab 键时移动多少个字符宽度, 不足一个 softtabstop 时以空格
补齐, 建议 采用 et, 并且设置 tabstop == softtabstop***


## set let

:set is for setting options, :let for assigning a value to a variable. 

It happens that the value for an option is linked to the name of the option
prepended by a & (the &option-name construct then behaves very similar to
“ordinary” variables). So, the following are equivalent: 

    :set tw=40 
    :let &tw=40 

But, for example, assigning 50 to the global variable foo (:let g:foo=50)
cannot be achieved with a :set command (because g:foo is a variable and not an
option). 

Some options are boolean like. When setting these, no value is needed (as in :
set noic and the opposite :set ic).


---

:set only works with options, and sehe's answer showcases some good usage
examples.

:let on the other hand can do almost everything that :set can do, plus more. It
can assign a value to

    a variable, e.g. let vi = 'vim'
    an option, e.g. let &tw = 40
    a register, e.g. let @a = $HOME . '/vimfiles'
    an environment variable, e.g. let $NOTHING = 'NOTHING'

Another major difference is that the right hand side of :let is an expression,
meaning you can do things like string concatenation (as seen in my register
example above) and arithmetic operations (e.g. let &tw = 40 + 60). This also
means that you have to quote the value if it's a string. :set on the other hand
reads the value verbatim.

It's easier to use :set with options even though :let can also do most of it,
Here are some comparison using sehe's examples ("n/a" means no way to do it
with :let)

:verbose set vs n/a (don't think there's another way to list all options)
:set tw=40 vs :let &tw = 40 (yes, you can use the same shorthand in let too)
:set wrap& vs n/a
:set nowrap vs :let &wrap = 0 (for boolean options, 0 is false and 1 is true)
:set wrap! vs :let &wrap = !&wrap
A few more examples

print the value of an option: :set formatoptions? vs :echo &formatoptions (let
doesn't print values, unlike set) assigning to multiple options at the same
time:

:set et sw=4 sts=4 
vs

:let [&et, &sw, &sts] = [0, 4, 4]
set global option: setglobal et vs let &g:et = 1

set local option: setlocal et vs let &l:et = 1
See :h :set and :h :let for more details

https://stackoverflow.com/questions/9990219/vim-whats-the-difference-between-let-and-set

---





## 常用选项

1. 'nrformats' 'nf'

    string  (default "bin,octal,hex", set to "bin,hex" in defaults.vim) local to
    buffer

    This defines what bases Vim will consider for numbers when using the
    CTRL-A and CTRL-X commands for adding to and subtracting from a number
    respectively; see CTRL-A for more info on these commands.


    1. alpha
    2. octal
    3. hex
    4. bin
    5. unsigned

    另外还可以赋空值, 即 set nf=

    Numbers which simply begin with a digit in the range 1-9 are always
    considered decimal.  This also happens for numbers that are not recognized
    as octal or hex.


## 不常用的模式

[link](https://www.jianshu.com/p/ce4b763e5e4b)

1. 操作符待决模式

    1. 你也许知道vim中有四种模式：普通模式，插入模式，可视模式，命令行模式，但
       还有操作符待决模式

    1. vim中有一条额外的规则，当一个操作符命令被连续调用两次时，它会作用于当前
       行

    1. 什么是操作符待决模式，d是删除的操作符，< 是减少缩进的操作符，可是我们按
       dd才是删除一行，<<才是减少缩进一行，其实我们在按下第一个d的时候进入了一
       个操作符待决模式，只是这个模式是个短暂的存在，直到接收到我们下一个动作命
       令，才完成整个操作，比如dd，第一个d是是操作符，第二个d时说要删除整行，所
       以同理cc就是删除整行并插入，yy就是复制整行，dap，就是删除整个段落，gUap
       就是将整个段落大写

    1. 可以将操作符和查找动作结合起来使用d/staff<cr>可以删除从当前光标到staff前
       面的内容

    1. 可以将操作符待决模式和文本对象结合起来，在操作符待决模式中，i 不再是切换
       到插入模式并将光标置于字符前，a也不是将光标置于字符后，而是当作文本对象
       的组成部分。因为aw会删除当前单词加一个空格，iw只删除当前单词的特性，c命
       令适合和iw等配合，d命令则适合和aw等配合

    1. 很多命令都是两个或更多按键，比如<C-w> s 会水平切分此窗口，但是<C-w>只是
       第二个按键的前缀，可以当作命名空间，但是他们并不会激活操作符待决模式，因
       为只有操作符才会激活操作符待决模式


2. 插入-普通模式

    1.有时候会在插入模式的情况下想使用普通模式的命令，可以不需要按<Esc>, <C-o>
    切换到插入-普通模式，当在插入模式时，想要运行一个普通模式命令，然后马上继续
    输入的时候可以用这个命令。比如想滚动一下屏幕，让当前行显示在窗口正中，以更
    好地阅读，然后继续插入，可以按<C-o>zz。再比如在当前行操作完毕，想到下方10行
    的地方进行操作，可以按<C-o>10j

3. 选择模式

    1.可视模式下，当选中一段文本后，再按<C-g>可以切换到选择模式，再输入任意可见
    字符，如p，这个选中的文本将会被删除，并显示你输入的字符p，并切换到插入模式，
    但是在可视模式下，会将这些字符当作命令，p会被认为是粘贴




## 缓冲区

By allowing hidden buffers with set hidden, you’re telling Vim that you can
have unsaved worked that’s not displayed on your screen.



## filetype 文件类型检测

vim中执行

    :filetype

查看Vim的文件类型检测功能是否已打开；

:set filetype查看当前文件是什么类型；
:set filetype=HTML设置文件类型为HTML；


filetype的默认属性：detection:ON plugin:OFF indent:OFF


1. detection：

    默认情况vim会对文件自动检测文件类型，也就是你看到的'detection:ON'，如需关闭:
    filetype off。

    还有一种方式就是在文件内容中指定，Vim会从文件的头几行自动扫描文件是否有声明
    文件类型的代码，如在文件的首行加入 //vim: filetype=HTML，当作注释写入，以致
    于不影响文件的编译，这样Vim不通过文件名也能检测出文件是什么类型

2. plugin：
    
    当plugin状态为"ON"时，那么就会在Vim的运行时环境目录下加载该类型相关的插件。
    比如为了让Vim更好的支持Html编程，就需要下载一些Html相关的插件。vim中执行 :
    filetype plugin on

3. indent：

    不同类型文件有不同的方式，比如Python要求使用4个空格作为缩进，而Html使用2个
    空格作为缩进，那么indent就可以为不同文件类型选择合适的缩进方式。你可以在Vim
    的安装目录的indent目录下看到定义了很多缩进相关的脚本。vim中执行 :filetype
    indent on。 

以上三个参数，可以写成一行filetype plugin indent on在 vimrc 文件中写入。


## word

:help word


Special case: "cw" and "cW" are treated like "ce" and "cE" if the cursor is on
a non-blank.  This is because "cw" is interpreted as change-word, and a word
does not include the following white space.


Another special case: When using the "w" motion in combination with an operator
and the last word moved over is at the end of a line, the end of that word
becomes the end of the operated text, not the first word in the next line.

e.g.

```
value1              在单词 value1 上执行 w/W , 都会到 value2 上
    value2          但是 dw 却只能删除 value1, value1 这一行还在
```



:scr[iptnames]          List all sourced script names, in the order they were
                        first sourced.  The number is used for the script ID
                        <SID>.
                        {not available when compiled without the +eval
                            feature}

:smile                  彩蛋, :smi[le]        make the user happy

:windo 对于所有的 window 执行一个操作

:Ex 打开内置的文件或目录浏览器.

:only 关闭所有其他窗口而仅保留当前窗口.

如果你的光标处是一个 url, 那么 gx 将会在默认浏览器中打开该 url.
