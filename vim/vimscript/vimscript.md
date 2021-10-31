
## 注释

单个双引号开始的行是注释行，这个注释方法并不<总是有效>


## 打印输出

:echo 

:echom

:messages


## 设置选项

主要有两种选项：布尔选项（值为"on"或"off"）和键值选项。

### 布尔选项

:set <name>打开选项

:set no<name>关闭选项。

切换布尔选项

:set <name>!

查看选项当前值

:set <name> ?

### 键值选项

有些选项并不只有off或on两种状态，它们需要一个值。

:set numberwidth=10

:set numberwidth=4

### 一次性设置多个选项

set number numberwidth=4


help 'number'
help wrap                   //自动换行
help textwidth(tw)          //默认78
help relativenumber(rnu)    //
help 'shiftround'(sr,nosr;default off)
help 'matchtime'('mat')
help 'showmatch'('sm')      
    when a bracket is inserted, briefly jump to the matching one.
    the jump is only done if the match can e seen on the screen.
    the time to show the match can be set with 'matchtime'

#### shiftround

在使用 Vim 中一直遇到一个很二逼的问题，比如如下情况：

foo:
    foobar: foobar
 bar: baz
^
大家可以看到在 bar 之前，箭头指向的地方有一个可能因为 copy 过来的时候带着的不知道哪里冒出来的空格，然后我想让bar: baz跟foobar: foobar是同一级的，我一般都习惯性将光标移到bar: baz这一行，再习惯性的 >> 两下，可惜并不如我所愿，操作之后的结果为：

foo:
    foobar: foobar
     bar: baz
    ^
尼玛为什么要保留那个空格啊……

不过这个问题，原来 Vim 有解决办法，就是设置 shiftround 选项：

set shiftround
" 或者
set sr


### 基本映射

map - x


#### 特殊按键

<space> 
<c-d>
<esc>
<cr>
<nop>
    :inoremap <esc> <nop>

键盘映射就无法使用注释。尝试如下命令：

:map <space> viw " Select word


### 模式映射

你可以使用nmap、vmap和imap命令分别指定映射仅在normal、visual、insert模式有效。

:imap <c-d> dd
:imap <c-d> <esc>dd
:imap <c-d> <esc>ddi


### 精确映射

基本映射和模式映射有这样的缺点:
:nmap - dd
:nmap \ -

**你使用那些命令创建的映射可能会被Vim解释成 其它 的映射。**

用如下命令删除那些映射：
nunmap -
nunmap \


递归
运行命令：

:nmap dd O<esc>jddk

当你按下dd后，Vim就不动了。按下<c-c>才可以继续，但是你的文件中会多出许多 空行！想想发生了什么？

这个映射实际上是 递归 的！当你按下dd后，Vim解释为：

dd存在映射，执行映射的内容。
新建一行。
退出insert模式。
向下移动一行。
dd存在映射，执行映射的内容。
新建一行。
退出insert模式。
向下移动一行。
dd存在映射，执行映射的内容。然后一直这样。
这个映射永远不会结束！删除这个可怕的映射再继续：

:nunmap dd

非递归映射
Vim提供另一组映射命令，这些命令创建的映射在运行时 不会 进行递归。
每一个*map系列的命令都有个对应的*noremap命令，包括：noremap/nnoremap、 vnoremap和inoremap。



### leader

每次我们像:nnoremap <space> dd这样映射一个按键都会覆盖掉<space>的原有功能。 如果哪天我们想用<space>了，怎么办？

有些按键你平常使用并不需要用到。用一个前缀成倍增加

映射按键序列
不像Emacs，Vim可以映射多个按键。运行下面命令：

:nnoremap -d dd
:nnoremap -c ddO
norma模式下快读敲入 -d或-c查看效果。第一个映射作用是删除一行，第二个是 删除一行并进入insert模式。

这就意味着你可以用一个你不常用的按键（如-）作为“前缀”，后接其它字符作为一个整体 进行映射。你需要多敲一个按键以执行这些映射，多一个按键而已，很容易就记住了。


我们称这个“前缀”为“leader”。你可以按你的喜好设置你的leader键。运行命令：

:let mapleader = ";"

:nnoremap <leader>d dd


Local Leader
Vim有另外一个“leader”成为“local leader“。这个leader用于那些只对某类文件 （如Python文件、HTML文件）而设置的映射。

本书将在后续章节讲述如何为特定类型的文件创建映射，但你可以现在创建一个“localleader”：

:let maplocalleader = "\\"
注意我们使用\\而不是\，因为\在Vimscript中是转义字符。我们将在后续章节 讲到这个。

现在你就可以在映射中使用<localleader>了，使用方法和<leader>一样



### 配置文件

:help myvimrc

编辑配置文件

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

从新加载配置文件
    ~/.vimrc文件只在你启动Vim的时候才会读取。

:nnoremap <leader>sv :source $MYVIMRC<cr>



### 缩写

abbreviations和mappings很像，但是他们的定位不同。看个例子：

运行命令：

:inoremap ssig -- <cr>Steve Losh<cr>steve@stevelosh.com
这个 mapping 用于快速插入你的签名。进入insert模式并输入ssig试试看。

看起来一切正常，但是还有个问题。进入insert模式并输入如下文字：

Larry Lessig wrote the book "Remix".
注意到Vim将Larry名字中的ssig也替换了！mappings不管被映射字符串的前后字符是什么-- 它只在文本中查找指定的字符串并替换他们。

运行下面的命令删除上面的mappings并用一个abbreviation替换它：

:iunmap ssig
:iabbrev ssig -- <cr>Steve Losh<cr>steve@stevelosh.com
再次试试这个abbreviation。

这次Vim会注意ssig的前后字符，只会在需要的时候替换它。

:help keyword


**输入非字母、数字、下划线的字符就会引发abbreviations替换(大概是)。**

**map 的话你需要快速输入组合键，不存在 keyword**

作用:

Abbreviations 纠错笔误。
    :iabbrev thsi this
加几个日常编辑中常用的abbreviations。



一个更为复杂的Mapping

:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

退出visual模式，此时光标会在单词的最后一个字符上





