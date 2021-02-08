./configure --with-features=huge \
	--enable-rubyinterp \
	--enable-pythoninterp \
	--with-python-config-dir=/usr/lib/python2.7/config-aarch64-linux-gnu/ \
	--enable-python3interp \
	--with-python3-config-dir=/usr/lib/python3.7/config-aarch64-linu-gun/ \
	--enable-perlinterp \
	--enable-gui=gtk2 \
	--enable-cscope \
	--enable-luainterp \
	--enable-perlinterp \
	--enable-multibyte \
	--prefix=/usr/local/vim82


option explains

    -with-features=huge：支持最大特性
    --enable-rubyinterp：启用Vim对ruby编写的插件的支持
    --enable-pythoninterp：启用Vim对python编写的插件的支持
    --enable-luainterp：启用Vim对lua编写的插件的支持
    --enable-perlinterp：启用Vim对perl编写的插件的支持
    --enable-multibyte：多字节支持 可以在Vim中输入中文
    --enable-cscope：Vim对cscope支持
    --enable-gui=gtk2：gtk2支持,也可以使用gnome，表示生成gvim
    --with-python-config-dir=/usr/lib/python2.7/config-i386-linux-gnu/ 指定 python 路径
    --prefix=/usr：编译安装路径



## python3: to only support python3

/configure --with-features=huge \
   --enable-rubyinterp \
   --enable-python3interp \
   --with-python3-config-dir=/usr/lib/python3.7/config-aarch64-linu-gun/ \
   --enable-perlinterp \
   --enable-gui=gtk2 \
   --enable-cscope \
   --enable-luainterp \
   --enable-perlinterp \
   --enable-multibyte \
   --prefix=/usr/local/vim82python3

### The reason why you cannot suppport python2 and python3 at the same time

links:

    github.com/chxuan/vimplus/issues/106

Note for Ubuntu users: You can only use Python 2 or Python 3. If you try to compile vim with both python-config-dir and python3-config-dir, YouCompleteMe will give you an error YouCompleteMe unavailable: requires Vim compiled with Python (2.6+ or 3.3+) support, when you start VIM.



### compile and install YouCompleteMe

links:

    https://vimjc.com/vim-youcompleteme-install.html


YouCompleteMe 简称 YCM，是一款 Vim 下非常流行的自动代码补齐神器。

虽然 Vim自带自动补齐功能，但是这种自带的补齐功能其本质就是 猜：通过对文本进行正则表达式匹配，再根据字典文件和生成的tags文件实现自动补全的效果， 因此其功能相对也较为简单。YouCompleteMe 插件是一种基于语义分析的补齐：通过分析源文件，经过语法分析以后进行智能补全。

YouCompleteMe 基于 clang/llvm 等开源语法分析库进行构建，并整合了多种自动补齐引擎：an identifier-based engine that works with every programming language、a Clang-based engine that provides native semantic code completion for C/C++/Objective-C/Objective-C++/CUDA、a clangd-based experimental completion engine for the C-family languages、a Jedi-based completion engine for Python 2 and 3、an OmniSharp-based completion engine for C#、a combination of Gocode and Godef semantic engines for Go、an omnifunc-based completer that uses data from Vim’s omnicomplete system to provide semantic completions for many other languages (Ruby, PHP etc.)。由此可见，YouCompleteMe 几乎对现在所有流行的编程语言都提供了非常强大的补齐功能。

YouCompleteMe 插件无需通过按键来获取补齐列表，它会随着你的键盘输入自动列出当前可用的补齐候选项，其功能完全可以媲美 Visual Studio 提供的小番茄插件：Visual Assist。

youcompleteme-install

由于 YouCompleteMe 插件依赖的库和引擎较多，所以很多 Vim 的入门级新手常常会遇到各种安装困难。本文整理了安装 Vim 自动补齐插件 YouCompleteMe 的完整流程及每个步骤的作用。

### 一、Vim版本支持

最新 YouCompleteMe 插件需要 Vim 的版本至少是7.4.1578，并且需要支持 python2 或 python3 (Make sure you have Vim 7.4.1578 with Python 2 or Python 3 support)。

在 Linux 终端输入 vim --version 可查看当前 Vim 的版本和编译信息。如下图可知，当前 Vim 并不支持 python2或python3，因此需要重新编译和安装。

vim-version

源码编译安装 Vim 的方法可参考vim8源码编译安装教程。

### 二、安装依赖软件和库

编译 YouCompleteMe 插件时需要依赖 cmake 构建 Makefile，且依赖 Python 源码头文件，Ubuntu 系统可以使用以下命令安装相关依赖。

1
sudo apt-get install build-essential cmake python-dev python3-dev
clang 是一个面向 C 族语言(C-family languages)的轻量级编译器，YouCompleteMe 插件依赖 clang 实现对 C 族语言的语义补全，可以通过 sudo apt-get install clang 安装，也可以在后续编译 YouCompleteMe 时通过编译选项来自动安装。

### 三、下载 YouCompleteMe 源码

可以使用 Vundle 或 vim-plug 等 Vim 插件管理器从 github 获取 YouCompleteMe 最新的源码，官方推荐使用 Vundle。

当然，也可以直接使用 git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/plugged/ 下载 YouCompleteMe 源码到指定目录，使用 Vim 插件管理器下载的主要目的在于方便管理多个插件。

不管使用何种方式，在下载完源码后，建议在源码目录运行 git submodule update --init --recursive 来获取 YouCompleteMe 的相关依赖 (虽然使用 vundle 或 vim-plug 安装时都会下载所有的依赖)。

下载 YoucompleteMe 插件及其依赖所需要的时间比较长，耐心等待吧~
vundle-youcompleteme

### 四、编译 YouCompleteMe

经历过上述3个步骤后，YouCompleteMe 插件还没法使用，此时打开 Vim 时会看到如下的报错：

The ycmd server SHUT DOWN (restart with ‘:YcmRestartServer’). YCM core library not detected; you need to compile YCM before using it. Follow the instructions in the documentation.

这是因为，YouCompleteMe 需要手工编译出库文件 ycm_core.so (以及依赖的libclang.so) 才可使用。

假设使用 vim-plug 下载的 YouCompleteMe 源码保存在目录 ~/.vim/plugged/YouCompleteMe，在该目录下执行 ./install.py --clang-completer 即可编译具有C族语言的语义补全功能的 YouCompleteMe 插件。

youcompleteme-install

至此，YouCompleteMe 插件已经安装完成并可以正常使用了。

youcompleteme-demo

### 五、个性化配置 YouCompleteMe

YouCompleteMe 是基于 Vim 的 omnifunc 机制来实现自动补全功能，所以需要为你想要支持的语言安装一个提供 omnifunc 接口的Vim插件。可以根据自己的需要，对 YouCompleteMe 插件进行个性化配置，包括针对特定编程语言类型进行配置。具体细节本文不做介绍，如有需要，将另开文章进行整理。

