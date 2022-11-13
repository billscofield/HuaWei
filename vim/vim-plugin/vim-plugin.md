


## [vim-plugin](https://github.com/junegunn/vim-plug)

安装

    方法一,在线安装:

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    wget https://github.com/junegunn/vim-plug/blob/master/plug.vim

    方法二,离线安装:

        mkdir ~/.vim
        cd ~/.vim
        mkdir plugged plugin syntax colors doc autoload
        mv plug.vim  ~/.vim/autoload/plug.vim



## ~/.vim文件夹下目录介绍

~/.vim/autoload/它是一个非常重要的目录，尽管听起来比实际复杂。简而言之，它
里面放置的是当你真正需要的时候才被自动加载运行的文件，而不是在vim启动时就加
载。

~/.vim/colors/是用来存放vim配色方案的。

~/.vim/plugin/存放的是每次启动vim都会被运行一次的插件，也就是说只要你想在
vim启动时就运行的插件就放在这个目录下。我们可以放从vim-plug官方下载下来的插
件.vim

~/.vim/syntax/语法描述脚本。我们放有关文本（比如c语言）语法相关的插件

~/.vim/doc/为插件放置文档的地方。例如:help的时候可以用到。

~/.vim/ftdetect/中的文件同样也会在vim启动时就运行。有些时候可能没有这个目录。
ftdetect代表的是“filetype detection（文件类型检测）”。此目录中的文件应该用
自动命令（autocommands）来检测和设置文件的类型，除此之外并无其他。也就是说，
它们只该有一两行而已。

~/.vim/ftplugin/此目录中的文件有些不同。当vim给缓冲区的filetype设置一个值时，
vim将会在~/.vim/ftplugin/ 目录下来查找和filetype相同名字的文件。例如你运行
set filetype=derp这条命令后，vim将查找~/.vim/ftplugin/derp.vim此文件，如果
存在就运行它。不仅如此，它还会运行ftplugin下相同名字的子目录中的所有文件，
如~/.vim/ftplugin/derp/这个文件夹下的文件都会被运行。每次启用时，应该为不同
的文件类型设置局部缓冲选项，如果设置为全局缓冲选项的话，将会覆盖所有打开的
缓冲区。

~/.vim/indent/这里面的文件和ftplugin中的很像，它们也是根据它们的名字来加载
的。它放置了相关文件类型的缩进。例如python应该怎么缩进，java应该怎么缩进等
等。其实放在ftplugin中也可以，但单独列出来只是为了方便文件管理和理解。

~/.vim/compiler/和indent很像，它放的是相应文件类型应该如何编译的选项。

~/.vim/after/这里面的文件也会在vim每次启动的时候加载，不过是等待
~/.vim/plugin/加载完成之后才加载after里的内容，所以叫做after。

~/.vim/spell/拼写检查脚本。





## Usage

```
call plug#begin()
...
Plug 'itchyny/lightline.vim'
...
call plug#end()


---

call plug#begin('~/.config/nvim/plugged')       // 所有的插件就会下载到~/.config/nvim/plugged文件夹下了

call plug#end()
```

所有的插件就会下载到~/.vim/plugged文件夹下


安装
    :PlugInstall



卸载插件

    如果希望卸载插件，请先在vimrc配置文件中注释或者删除对应插件的配置信息，然后再执行以下命令：

    :PlugClean

更新插件

    使用以下命令，可以更新vim-plug插件自身：
    :PlugUpgrade

    使用以下命令，可以批量更新所有已安装的插件：
    :PlugUpdate


插件状态

    使用以下命令，可以查看当前已安装插件的状态信息：

    :PlugStatus



运行命令重新加载:

    :source ~/.vimrc



## coc

1. 安装node

    node 需要安装 "Development Tools"
        yum groupinstall "Development Tools"
        apt-get install build-essential


    https://github.com/neoclide/coc.nvim

2. 安装 coc.nvim

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    :PlugInstall

    测试是否安装成功
        :CocInfo

3. 安装coc语言扩展

    :CocInstall coc-clangd ##安装 C/C++/Objective-C 扩展

    ```
    这里cocinstall会自动从https://registry.npmjs.org下载对应的语言扩展，但是网站被屏蔽，需要修改到阿里源。

    修改npm方法：

    1.原npm地址

    npm config set registry http://registry.npmjs.org 
    2.设置国内镜像

    a.通过config命令

    npm config set registry https://registry.npm.taobao.org 
    npm info underscore （如果上面配置正确这个命令会有字符串response）
    ```

    上述方法是部队的，Coc 把地址写死在文件 /root/.vim/bundle/coc.nvim/build/index.js 中了, npmjs 改为 npm.taobao


    ~/.config/coc/extensions/node_modules/coc-clangd


:CocInfo
:CocInstall coc-json
:CocUninstall coc-json
:CocList extensions         //列出安装的插件
    coc-tsserver


    通过coc.nvim提供的更方便的方式安装插件(推荐)
    在vim(neovim)配置文件里面设置变量：g:coc_global_extensions。
    比如添加如下设置，再次进入vim时，就会自动安装列表里面的子插件。

    let g:coc_global_extensions = [
        \ 'coc-marketplace',
        \ 'coc-json',
        \ 'coc-vimlsp',
        \ 'coc-markdownlint',
        \ 'coc-sh',
        \ 'coc-pyright',
        \ 'coc-yaml',
        \ 'coc-tabnine',
        \ 'coc-translator',
        \ 'coc-snippets',
        \ 'coc-java',
        \ 'coc-java-intellicode',
        \ 'coc-xml',
        \]
    ]

    coc-marketplace

    :CocList marketplace



    coc-json:       JSON
    coc-tsserver:   Typescript 的相关子插件。


    :CocConfig
        ~/.vim/coc-settings.json





## coc 插件

https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions

javascript
    coc-eslint
    coc-tsserver

    coc-html
    coc-css

python
    coc-python


flutter
    coc-flutter


coc-snippets




npm install -g prettier
Bundle 'prettier/vim-prettier'

<leader>p -> ;p
