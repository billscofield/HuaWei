:help wrap
:help shiftround
:help matchtime


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
