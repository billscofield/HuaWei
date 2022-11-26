

:set omnifunc?
    若没有则是没有自动补全, 否则:
        可利用 Ctrl+n 或 Ctrl+p 实现C程序补全，但无法实现C++程序补全
        C++: OmniCppComplete


## 1. default

recent versions of the Vim editor come with a built-in autocomplete feature.
Vim completes words by checking the available terms currently in the buffer.
Importantly, this functionality is case-sensitive.

Ctrl-N to trigger autocompletion


## 2. omni

Ordinarily, Omnicompletion is not available by default. Now, to enable
Omnicompletion features on Vim, let’s add the following to our ~/.vimrc:

```
set omnifunc=syntaxcomplete#Complete
omnifunc=javascriptcomplete#CompleteJS
omnifunc=htmlcomplete#CompleteTags
omnifunc=csscomplete#CompleteCSS
omnifunc=phpcomplete#CompletePHP
```

Finally, we can press Ctrl-X and Ctrl-O to start Omnicompletion.



If Vim finds only one match, it will automatically complete the term. However,
if Vim finds more than one match for the text, a list of words will appear:

There's no auto completion in Vim. If you get autocompletion it means that you
have a plugin or a piece of script somewhere that does the autocompletion.

Vim does not have auto-complete; any completion must be explicitly triggered

:help new-omni-completion
:help compl-omni
    / ˈɑːmnɪ / 全方位；泛光灯



This could also be called "intellisense(智能感知)", but that is a trademark(商
标).  It is a smart kind of completion.  The text in front of the cursor is
inspected to figure out what could be following.  This may suggest struct and
class members, system functions, etc.

Use CTRL-X CTRL-O in Insert mode to start the completion.
    i_CTRL-X_CTRL-O

The 'omnifunc' option is set by filetype plugins to define the function that
figures out the completion.

Currently supported languages:
    C                                       ft-c-omni
    (X)HTML with CSS                        ft-html-omni
    JavaScript                              ft-javascript-omni
    PHP                                     ft-php-omni
    Python
    Ruby                                    ft-ruby-omni
    SQL                                     ft-sql-omni
    XML                                     ft-xml-omni
    any language with syntax highlighting   ft-syntax-omni

Omni completion using a **tags file** will complete the names of defined constants,
functions, classes and other names from included and other external files.

You can add your own omni completion scripts.

When the 'completeopt' option contains "menu" then matches for Insert mode
completion are displayed in a (rather primitive) popup menu



## 3. Plugins

Generally, plugins add extra functionality to any program. Thus, we can add
plugins to Vim to extend its auto-completion features. Notably, we can employ
plugin managers like vim-plug and vundle to ease the plugin installation
process.

Following, let’s look at some autocompletion plugins for vim and their unique
features.


### 3.1

SuperTab is a Vim autocompletion plugin that allows the use of Tab for all
insert completions. The plugin enables us to hit Tab after a partial entry to
get an autocompletion functionality.



### 3.2  Jedi-vim

Jedi-Vim is a Python autocompletion plugin within Vim. Basically, it’s a Vim
binding to the autocompletion library Jedi.

Uniquely, Jedi-Vim stands out with its broad support for most of Python’s core
features.

Ctrl-Space


## 3.3 YouCompleteMe

YouCompleteMe is a fast and intelligent suggest-as-you-type code-completion and refactoring engine for Vim. It has several completion engines built in. Hence, YouCompleteMe can work with almost any language.

Indeed, the YouCompleteMe plugin is unique and has several advantages over other autocompletion plugins:

    works with any programing language
    we don’t have to press any keyboard combination to trigger the autocompletion
    the filtering is not based on the input being a string prefix of the completion (but that works too)

Similar to other plugins, we use Tab to go through any valid suggestions.

The YouCompleteMe installation is outside the scope of this article. However,
an important step is to install CMake and Python. In Debian-based systems, we
can do that via apt:

    $ sudo apt install build-essential cmake python3-dev

Further, we’ll install mono-complete, go, node, java, and npm

    $ sudo apt install mono-complete golang nodejs default-jdk npm

    mono-complete: 这个应该是给 c harp  用的

    How to Compile, Decompile and Run C Sharp Code in Linux?
        https://www.geeksforgeeks.org/how-to-compile-decompile-and-run-c-code-in-linux/

After having the necessary packages, we follow the installation guide to set up
and compile YouCompleteMe.



### [Deoplete](https://github.com/Shougo/deoplete.nvim)

The development of this plugin is finished. ddc.vim is the next generation auto
completion plugin. Consider migrating to it.



### [ddc.vim](https://github.com/Shougo/ddc.vim)

dark deno-powered completion




### Install

apt-get install build-essential cmake

Compiling YCM with semantic support for C-family languages:
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer

Compiling YCM without semantic(/ sɪˈmæntɪk /语义的) support for C-family languages:
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py

The following additional language support options are available:
    1. C Sharp support:
        install Mono and add --omnisharp-completer when calling ./install.py.
    2. Go support:
        install Go and add --gocode-completer when calling ./install.py.
    3. TypeScript support:
        install Node.js and npm then install the TypeScript SDK with npm install -g typescript.
    4. JavaScript support:
        install Node.js and npm and add --tern-completer when calling ./install.py.
    5. Rust support:
        install Rust and add --racer-completer when calling ./install.py.

To simply compile with everything enabled, there's a --all flag.
So, to install with all language features, ensure xbuild, go, tsserver, node,
npm, rustc, and cargo tools are installed and in your PATH, then simply run:

    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --all





### 3.3 ale

This project is no longer maintained. If you need a syntax checking plugin for
Vim you might be interested in Syntastic's spiritual succesor, ALE.

ALE offers some support for completion via hijacking of omnicompletion while
you type.

All of ALE's completion information must come from **Language Server Protocol
linters**, or from **tsserver** for TypeScript.

是一款语法检查的插件，与syntastic类似，但有两个明显的优势，
    一个是语法检查是异步执行的，因此基本上不会出现卡顿的情况，
    另外一个是ale默认会使用所有检查工具并发的进行检查，但它只支持Vim 8.0以上的版本。

Vim左边会显示错误或者警告的提示

大名鼎鼎的 syntastic, 以及最早开始支持异步检测的 neomake, ale 作为一个刚刚完成
不久的后起之秀，又有什么特别的优势呢？

    syntastic已经不在维护，而且推荐ale

    实时检测。为了让代码可以在编辑时进行实时的检测，ale 的运行方式是将代码做为
    stdin 导入检测工具（不支持的话使用临时文件），这样做的好处是我们可以更早的
    发现错误。

    并发运行。ale 默认使用所有可用的检测工具并发执行检测，譬如说我们有时需要同
    时对javascript 运行 eslint 以及 jscs。

    标识栏、状态栏以及命令行消息支持。




## tsserver(Standalone Server)

The TypeScript standalone server (aka tsserver) is a **node executable** that
**encapsulates the TypeScript compiler** and **language services**, and exposes them
through a JSON protocol. tsserver is well suited for editors and IDE support.

https://github.com/microsoft/TypeScript/wiki/Standalone-Server-%28tsserver%29

## refers

default, omni, youcompleteme

    https://www.baeldung.com/linux/vim-autocomplete#:~:text=Vim%20text%20editor%20supports%20autocompletion,in%20the%20languages%20it%20recognizes.






## coc
