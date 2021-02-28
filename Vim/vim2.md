## 无法使用系统剪贴板

当打开一个文件后，:reg 没有 :+ 
vim --version | egrep clipboard 返回的结果中，clipboard 和 xterm_clipboard 是 - 

则可以这么操作
    sudo apt install vim-gui-common

但是在win10 中的ubuntu中这么做却不可以将win10中内容复制到ubuntu



## 安装 vundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim



## coc.nvim

1. 安装 nodejs
    curl -sL install-node.now.sh/lts | bash

1. cd ~/.vim/bundle/coc.nvim
    ./install.sh

1. vi ~/.vimrc
    Plugin 'neoclide/coc.nvim'

1. :PluginInstall


验证是否安装成功
    :CocInfo

配置
    :CocConfig      //~/.vim/coc-settings.json

安装
    :CocInstall coc-python
    :CocInstall coc-css
    :CocInstall coc-bash

## 一行80个字符

set textwidth=80 and gqq would do it


links:

    https://stackoverflow.com/questions/24460647/how-do-you-insert-a-newline-after-every-80-characters-in-vim

```
方法1

:%s/.\{80}/&\r/g
%: process the entire file
s: substitute
.: matches any character
{80}: matches every 80 occurrences of previous character (in this case, any character)
&: the match result
\r: newline character
g: perform the replacement globally


方法2

One caveat: if your goal is to wrap lines that are too long, the above command will add the new line character even if the line is exactly 80 character. 
To avoid this behavior, you need to exclude this case: :%s/.\{80}\($\)\@!/&\r/g


方法3

Using recursive Vim macro:

qqqqq79la<Enter><esc>@qq@q


qqq  Clear contents in register q.
qq   start marco in register q
79la<Enter> Carriage return after 80 characters.
<esc> go back to normal mode
@q   run macro q which we are about to create now.
q   complete recording macro
@q run macro
```
