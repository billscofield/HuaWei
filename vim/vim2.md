## 无法使用系统剪贴板

当打开一个文件后，:reg 没有 :+ vim --version | egrep clipboard
返回的结果中，clipboard 和 xterm_clipboard 是 - 

则可以这么操作 sudo apt install vim-gui-common

    或者 apt install vim-gtk

但是在win10 中的ubuntu中这么做却不可以将win10中内容复制到ubuntu



## 安装 vundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim



## coc.nvim

https://github.com/neoclide/coc.nvim/wiki

oc.nvim 是一个基于NodeJS 的适用于Vim8, Neovim 的Vim 智能补全插件。
拥有完整的LSP 支持。配置、使用方式及插件系统的整体风格类似 VSCode

因为Coc 本身是Vim 的一个插件而已，但它又有自己的插件系统，所以下面我会将Coc 的
插件叫做子插件以作区分

**Coc 本身并不提供具体语言的补全功能，更多的只是提供了一个补全功能的平台，所以在
安装完成后，我们需要安装具体的语言服务以支持对应的补全功能。**

    :CocInstall coc-json coc-tsserver

要检索都有哪些子插件

    1. 可以直接在[Npm](https://www.npmjs.com/search?q=keywords%3Acoc.nvim)上查找coc.nvim
    
        npm 搜索栏: keywords:coc.nvim

    2. 用coc-marketplace 直接在Vim 里面进行管理

        :CocInstall coc-marketplace

        :CocList marketplace

        // 搜索 python 相关子插件
        :CocList marketplace python


[相对完整的子插件列表](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions)

### coc.nvim 安装 

1. 安装 nodejs curl -sL install-node.now.sh/lts | bash

2. cd ~/.vim/bundle/coc.nvim ./install.sh

3. vi ~/.vimrc Plugin 'neoclide/coc.nvim'

4. :PluginInstall

验证是否安装成功 :CocInfo

配置 :CocConfig      //~/.vim/coc-settings.json

安装 :CocInstall coc-python :CocInstall coc-css :CocInstall coc-bash


### coc-phpls

PHP language server extension for coc.nvim. // 这句话的意思是说 coc-phpls 是
coc.nvim 的扩展，什么玩意儿啊，就是客户端

coc.nvim is LSP-Client.

**PHP language server** extension for coc.nvim.

php
    :CocInstall coc-phpls


coc-phpls, which uses intelephense as a LSP-Server


服务端是 intelephense
    https://intelephense.com/
    https://github.com/bmewburn/intelephense-docs

    Intelephense is a high performance, cross platform PHP language server
    adhering to the Language Server Protocol (LSP).

    npm i intelephense -g



---

    :CocInstall coc-phpls
    npm i intelephense -g

---


### python

#### coc-jedi

:CocInstall coc-jedi
pip install -U jedi-language-server


#### coc-py


## 一行80个字符

set textwidth=80 and gqq would do it


links:

    https://stackoverflow.com/questions/24460647/how-do-you-insert-a-newline-after-every-80-characters-in-vim

``` 方法1

:%s/.\{80}/&\r/g %: process the entire file s: substitute .: matches any
character {80}: matches every 80 occurrences of previous character (in this
case, any character) &: the match result \r: newline character g: perform the
replacement globally


方法2

One caveat: if your goal is to wrap lines that are too long, the above command
will add the new line character even if the line is exactly 80 character.  To
avoid this behavior, you need to exclude this case: :%s/.\{80}\($\)\@!/&\r/g


方法3

Using recursive Vim macro:

qqqqq79la<Enter><esc>@qq@q


qqq  Clear contents in register q.  qq   start marco in register q 79la<Enter>
Carriage return after 80 characters.  <esc> go back to normal mode @q   run
macro q which we are about to create now.  q   complete recording macro @q run
macro ```


方法4

https://stackoverflow.com/questions/3033423/vim-command-to-restructure-force-text-to-80-columns

Set textwidth to 80 (:set textwidth=80), move to the start of the file (can be
done with Ctrl-Home or gg), and type gqG.

gqG formats the text starting from the current position and to the end of the
file. It will automatically join consecutive lines when possible. You can place
a blank line between two lines if you don't want those two to be joined
together.


And it also works with visual selections. Ie something like: V}gq. In this way
you see what you are going to format before actually formatting it.





