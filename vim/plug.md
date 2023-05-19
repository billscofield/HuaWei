## 1. vim-plug

A minimalist Vim plugin manager.

Pros:
    1. Easy to set up: Single file. No boilerplate code required.
    2. Easy to use: Concise, intuitive syntax
    3. Super-fast parallel installation/update (with any of +job, +python, +python3, +ruby, or Neovim)
    3. Creates shallow clones to minimize disk space usage and download time
    4. On-demand loading for faster startup time
    5. Can review and rollback updates
    6. Branch/tag/commit support
    7. Post-update hooks
    8. Support for externally managed plugins

Installation

    Download [plug.vim](https://github.com/junegunn/vim-plug/blob/master/plug.vim) and put it in the
    "autoload" directory.


    [Automatic installation](https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation)

    Place the following code in your .vimrc before plug#begin() call

    ```
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
    ```
    Note that --sync flag is used to block the execution until the installer finishes.


Usage

    Add a vim-plug section to your ~/.vimrc (or stdpath('config') . '/init.vim' for Neovim)

    Begin the section with call plug#begin([PLUGIN_DIR])
        Vim (Linux/macOS): '~/.vim/plugged'
    List the plugins with Plug commands
    call plug#end() to update &runtimepath and initialize plugin system

    Automatically executes
        filetype plugin indent on
        syntax
    enable. You can revert the settings after the call. e.g.
        filetype indent off
        syntax off, etc.



## 2. 


## 3. ALE

ALE (short for Asynchronous Lint Engine) is a plugin for Vim that provides
real-time linting and code analysis for various programming languages. It
allows Vim to asynchronously run linters and other code analysis tools in the
background while you are editing your code, and provides feedback and
suggestions in realtime.

ALE can be configured to use a variety of linters and code analysis tools for
different programming languages, including Python, JavaScript, Ruby, and more.
It supports many popular linters and code analysis tools, such as Pylint,
Flake8, ESLint, and RuboCop, among others.

With ALE installed and configured, Vim will highlight any errors or warnings
detected by the linters in your code, and provide suggestions and possible
fixes in real-time. This can help you catch and fix errors as you are writing
code, rather than having to wait until you run your code to discover issues.

Overall, ALE is a powerful and flexible tool for improving your coding
productivity and catching errors in realtime.


https://gitee.com/billscofield/ale/blob/master/doc/ale.txt

ALE's **primary focus** is on checking for problems with your code with various
programs via some Vim code for integrating with those programs, referred to as
'linters.'

ALE supports a wide array of programs for linting by default, but additional
programs can be added easily by defining files in |runtimepath| with the
filename pattern `ale_linters/<filetype>/<filename>.vim`.
    /Users/liujiao/.vim/plugged/ale/ale_linters

For more information on defining new linters, see the extensive documentation
for |ale#linter#Define()|.


runtimepath(rtp):
    vim's variable
    This is a list of directories which will be searched for runtime files:

    Unix:  "$HOME/.vim,
            $VIM/vimfiles,
            $VIMRUNTIME,
            $VIM/vimfiles/after,
            $HOME/.vim/after"


1. ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax checking and semantic errors)

    ALE offers support for fixing code with command line tools in a non-blocking
    manner with the :ALEFix feature, supporting tools in many languages, like
    prettier, eslint, autopep8, and more.

    this plugin allows you to lint while you type.

    Without any configuration, ALE will attempt to check all of the code for
    every file you open in Vim with all available tools by default.

    To see what ALE is doing, and what options have been set, try using the |:
    ALEInfo| command.

    Most of the linters ALE runs will check the Vim buffer you are editing
    instead of the file on disk.

    This allows you to check your code for errors before you have even saved
    your changes.

    ALE will check your code in the following circumstances, which can be
    configured with the associated options.

        When you modify a buffer.                - |g:ale_lint_on_text_changed|
        On leaving insert mode.                  - |g:ale_lint_on_insert_leave|
        When you open a new or modified buffer.  - |g:ale_lint_on_enter|
        When you save a buffer.                  - |g:ale_lint_on_save|
        When the filetype changes for a buffer.  - |g:ale_lint_on_filetype_changed|
        If ALE is used to check code manually.   - |:ALELint|

2. and acts as a Vim Language Server Protocol client.

    ALE acts as a "language client" to support a variety of Language Server Protocol features, including:

        1. Diagnostics (via Language Server Protocol linters)
        2. Go To Definition (:ALEGoToDefinition)
        3. Completion (Built in completion support, or with Deoplete)
        4. Finding references (:ALEFindReferences)
        5. Hover information (:ALEHover)
        6. Symbol search (:ALESymbolSearch)


Linting

Fixing

Completion

    vim doesn't have auto completion default, they are installed by and have to be triggered
    https://stackoverflow.com/questions/14513218/how-do-i-turn-off-omni-complete-in-vim

    
    当我在查询这个的时候，看到  omnicompletation, 查阅 omni/ˈɑːmnɪ/ ->全方位；泛光灯
    Omni completion is not usually enabled by default.To turn on omni completion, add the following to your vimrc:
        filetype plugin on
        set omnifunc=syntaxcomplete#Complete
        <C-x><C-o>

    Refer links:
        https://vim.fandom.com/wiki/Omni_completion

## NERDTree

:help NERDTree

1. 基础功能

    显示/关闭隐藏文件: I
    o   打开关闭文件或者目录
    go  打开文件，打开后光标留在nerdtree窗口,在本窗口打开书签

    i   在新打开上下排列窗口上方打开文件
    gi  同i,光标留在nerdtree窗口

    s   在新打开水平窗口打开文件
    gs  同s,光标留在nerdtree窗口

    x   收起该节点的父节点
    O   Recursively open the selected directory
    X   Recursively close all children of the current node


    p   到上层目录
    P   到根目录
    K   到第一个节点
    J   到最后一个节点
    A   放大nerdtree窗口

    t   在新的tab中打开选中的节点或书签
    T   同t，光标留在当前的tab

    D   删除当前书签

    P   跳到根节点
    p   跳到父节点
    K   跳到当前目录树的第一个一级节点(同级别缩进)
    J   跳到当前目录树的最后一个一级节点(同级别缩进)
    <C-J>   跳到下一个兄弟节点
    <C-K>   跳到上一个兄弟节点
    C   将根节点变成选中的节点
    u   将根节点变成上一级文件夹, 本节点所有内容会被关闭
    U   同u，但是原来的的根节点保持打开
    r   Recursively refresh the current directory
    R   Recursively refresh the current root

! 执行此文件
? 帮助
q 关闭


m 显示文件系统菜单（添加、删除、移动操作）
    :set ma?
        nomodifiable // buffer cannot be modified
        :set ma      // enable buffer be modified
        :set noma    // disable buffer be modified

    所以
        a: add a child
        m: move the current node
        d: delete the current node
        c: copy the current node

2. 书签功能 Bookmark
    t 在标签页中打开
    T 在后台标签页中打开

    :Bookmark [<name书签名>] 给当前选中的路径创建一个书签，书签名可以随意，不能有空格
    :ClearBookmarks [<bookmarks>] 清除书签
    :ClearAllBookmarks 清除所有书签
    :EditBookmarks 编辑书签
        Opens the bookmarks file for manual editing, e.g. for removing invalid bookmarks

    NERDTreeBookmarksFile
        Default: $HOME/.NERDTreeBookmarks

## tab

:tabc       关闭当前的tab
    Close current tab page
:tabo       关闭所有其他的tab
    tabonly
    close all other tab pages
:tabs       查看所有打开的tab
    List the tab pages and the windows they contain.
    Shows a ">" for the current window.
    Shows a "+" for modified buffers.
    For example:
        Tab page 1
        ¦ + tabpage.txt
        ¦   ex_docmd.c
        Tab page 2
        >   main.c

:tabp      前一个
:tabn      后一个

## 分屏

:vsplit 这个命令太长，没人用的。大家都用 :vsp ，:sp filename来分屏。
分屏的相关动作都是ctrl+w 开始的，然后再跟一个其他字母
ctrl+w = ：让左右上下各个分屏宽度，高度均等。
ctrl+w _(shift + -) :当前屏幕高度扩展到最大
ctrl+w |(shift + \) :当前屏幕宽度扩展到最大
ctrl+w c：关闭当前屏幕
