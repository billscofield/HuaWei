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
