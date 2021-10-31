1. :help wrap

    on(default):
        
        lines longer than the width of the window will wrap and displaying
        continues on the next line.  

    off: 
        
        lines will not wrap and only part of long lines will be displayed.
        
        scroll horizontally

1. :help shiftround     'sr'

    off(default)
    
    Applies to > and < commands, 当不足一个tab 时, 补足一个tab

    round the indent to a multiple of 'shiftwidth'

    ```
    https://www.chrisyue.com/vim-shiftround.html
    在使用 Vim 中一直遇到一个很二逼的问题，比如如下情况：

    foo:
        foobar: foobar
     bar: baz
    ^

    大家可以看到在 bar 之前，箭头指向的地方有一个可能因为 copy 过来的时候带着的
    不知道哪里冒出来的空格，然后我想让bar: baz跟foobar: foobar是同一级的，我一
    般都习惯性将光标移到bar: baz这一行，再习惯性的 >> 两下，可惜并不如我所愿，
    操作之后的结果为：

    foo:
        foobar: foobar
         bar: baz
        ^
    尼玛为什么要保留那个空格啊……

    不过这个问题，原来 Vim 有解决办法，就是设置 shiftround 选项：

    set shiftround
    " 或者
    set sr
    ```

1. :help shiftwidth     'sw'

    default 8

    Used for 'cindent', >>, <<, etc

    shiftwidth() to get the shiftwidth value


1. :help showmatch

    https://vim.fandom.com/wiki/Moving_to_matching_braces

    The showmatch option is also useful: it can reduce the need for %, the
    cursor will briefly jump to the matching brace when you insert one.

    To speed things up, you can set the 'matchtime' option. In vimrc:
        
        :set showmatch
        :set matchtime=3

1. :help matchtime

    需要开启 set showmatch

    例如输入(, 输入内容, 然后输入), 光标会跳到与之配对的(,并在此停留 matchtime 时间

    其单位为0.1秒，默认值为5，即0.5秒。

1. :help map-local

    If the first argument to one of these commands is "<buffer>" the mapping will
    be effective in the current buffer only.  Example:
        
        :map <buffer>  ,w  /[.,;]<CR>
        
    Then you can map ",w" to something else in another buffer:
        
        :map <buffer>  ,w  /[#&!]<CR>
        
    The local buffer mappings are used before the global one


1. autocmd, augroup

    A common pattern is to use the au! as the first part of a group. This
    removes all existing autocommands in the group, and allows one to start
    afresh. If you did not use a group, then au! would remove all/many
    autocommands that you did not want to remove.



## 状态栏

1. 'laststatus' 'ls'       number  (default 1)
            global
            {not in Vi}
        The value of this option influences when the last window will have a
        status line:
            0: never
            1: only if there are at least two windows
            2: always(要选择这个)
        The screen looks nicer with a status line if you have several
        windows, but it takes another screen line. status-line

2. 'statusline' 'stl'      string  (default empty)

    | field       meaning
    | -           Left justify the item.  The default is right justified
    |             when minwid is larger than the length of the item.
    | 0           Leading zeroes in numeric items.  Overridden by '-'.
    | minwid      Minimum width of the item, padding as set by '-' & '0'.
    |             Value must be 50 or less.
    | maxwid      Maximum width of the item.  Truncation occurs with a '<'
    |             on the left for text items.  Numeric items will be
    |             shifted down to maxwid-2 digits followed by '>'number
    |             where number is the amount of missing digits, much like
    |             an exponential notation.
    | item        A one letter code as described below.



## 折叠

1. 'foldenable' 'fen'      boolean (default on)
    |                   local to window
    |                   {not in Vi}
    |                   {not available when compiled without the +folding
    |                   feature}
    |   When off, all folds are open.  This option can be used to quickly
    |   switch between showing all text unfolded and viewing the text with
    |   folds (including manually opened or closed folds).  It can be toggled
    |   with the zi command.  The 'foldcolumn' will remain blank when
    |   'foldenable' is off.
    |   This option is set by commands that create a new fold or close a fold.
    |   See folding.


2. 'foldmethod' 'fdm'      string (default: "manual")
    |                   local to window
    |                   {not in Vi}
    |                   {not available when compiled without the +folding
    |                   feature}
    |   The kind of folding used for the current window.  Possible values:
    |   fold-manual     manual      Folds are created manually.
    |   fold-indent     indent      Lines with equal indent form a fold.
    |   fold-expr       expr        'foldexpr' gives the fold level of a line.
    |   fold-marker     marker      Markers are used to specify folds.
    |   fold-syntax     syntax      Syntax highlighting items specify folds.
    |   fold-diff       diff        Fold text that is not changed.

## 特殊字符

<space>
<c-d>       ctrl + d
<Esc>


## Leader

我们称这个“前缀”为“leader”。你可以按你的喜好设置你的leader键。运行命令：
let g:mapleader=";"

:nnoremap <leader>d dd

## Local Leader

Vim有另外一个“leader”成为“local leader“。这个leader用于那些只对某类文件 （如Python文件、HTML文件）而设置的映射。

let maplocalleader="\\"
