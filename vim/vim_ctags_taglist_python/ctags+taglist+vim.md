
taglist依赖于ctags，所以要先装ctags

## [ctags](ctags.sourceforge.net)

apt install ctags
    最初只支持 C 语言

或者 

apt install exuberant-ctags [ɪg'z(j)uːb(ə)r(ə)nt; eg-],繁茂的
    支持多种语言的程序


man ctags
    

## taglist 安装

aria2c http://vim.sourceforge.net/scripts/download_script.php?src_id=6416
unzip [文件]
which vim
which ctags

cp doc/taglist.txt /usr/share/vim/vim74/doc/
cp plugin/taglist.vim /usr/share/vim/vim74/plugin/

    ```
    用vim打开任何文件开始报错
    line   89: E488: Trailing characters

    发现是写错了
    let Tlist_Ctags Cmd = 'exctags'     // 少写了一个 underline

    应该该写成下面这样
    let Tlist_Ctags_Cmd = 'exctags'

    ```


改动vim配置文件

sudo vim /etc/vim/vimrc
在最后加入例如以下内容

```
let Tlist_Auto_Open = 1                     //默认打开taglist
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
```

```
set tags=tags;
set autochdir;
这个命令让vim首先在当前目录里寻找tags文件，如果没有找到tags文件，或者没有找到对应的目标，就到父目 录中查找，一直向上递归。因为tags文件中记录的路径总是相对于tags文件所在的路径，所以要使用第二个设置项来改变vim的当前目录。

这个对不对啊？？？
```

https://blog.easwy.com/archives/exuberant-ctags-chinese-manual/


:TlistToggle    来打开和关闭taglist窗口。
:help taglist   来获得更多帮助信


taglist 也好久没有更新了，现在新出现了个 tagbar 也比较好用,也是基于 ctags
```
" tagbar begin
Bundle 'majutsushi/tagbar'
"nmap <Leader>tb :TagbarToggle<CR> 不管用啊
nmap <F8> :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1
"开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
"let g:tagbar_autopreview = 1
"关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_sort = 0
" 能够和NERDTree在同一个列中
let g:tagbar_vertical = 25
" tagbar ends
```



## 珠联璧合

此时ctags和taglist还没有联系起来。为此，我们需要修改/usr/share/vim/vim74/plugin/taglist.vim文件，找到if !exitsts(loaded_taglist)这一行，并在其前面添加let Tlist_Ctags_Cmd="/usr/bin/ctags"


## vim+taglist+ctags阅读代码

ctags -R *      //生成了tags文件
vim 输入:TlistToggle 或 :Tlist  或 :TlistOpen 打开侧面窗口

ctrl w w 在侧窗口和主窗口之间切换


### ptags.py

因为ctags 是C专用,所以我们用ptags 



```
python的发行包下Tool/scripts的文件夹。里面的ptags.py可以用来生成vim需要的tags(eptags.py for emacs)

脚本的目录是python源码下的Tool/script／ptags.py。 如果不想去找，可以直接copy一份，http://svn.python.org/projects/python/trunk/Tools/scripts/ptags.py，放在你方便的位置，然后使用ptags.py生成tag。

为当前目录生成tag文件 :  ptags.py *.py
为整个项目生成tag文件：find . -name \*.py -print | xargs ptags.py

然后就有tag了。在vim的配置文件中导入tag文件的目录就可以了。
比如在.vimrc 中添加：
set tags+=tags
```


#### 为 python 生成全局 tags

下载ptags.py

    1. 直接从网址下载
        aria2c http://svn.python.org/projects/python/trunk/Tools/scripts/ptags.py

    1. 从源码包中查找
        aria2c https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz
        tar -zxf Python-3.7.3.tgz
        ptags.py的地址为: Python-3.7.3/Tools/scripts/ptags.py

    上面两个ptags.py 中，第一个是 #!/usr/bin/env python, 第二个是#!/usr/bin/env python3
    用python3的那个会报错,这两个文件用vimdiff 看，没有差别

    ```
    Traceback (most recent call last):
        File "/usr/bin/ptags.py", line 53, in <module>
            main()
        File "/usr/bin/ptags.py", line 20, in main
            treat_file(filename)
        File "/usr/bin/ptags.py", line 42, in treat_file
            line = fp.readline()
        File "/usr/lib/python3.7/codecs.py", line 322, in decode
            (result, consumed) = self._buffer_decode(data, self.errors, final)
    UnicodeDecodeError: 'utf-8' codec can't decode byte 0xe4 in position 132: invalid continuation byte
        ```

chmod +x ptags.py
cp ptags.py /usr/bin/

我使用的是 virtualenv 生成的虚拟环境, 寻找 python 源码库, 
    /root/flask_demo/lib/
生成 tags 文件
    find  ./python3.5/ -name \*.py -print | xargs ptags.py
    ls 看到当前目录下已经生成 tags 文件
在vim配置文件中建立到tags的引用
    vi ~/.vimrc
    set tags+=/root/flask_demo/lib/tags

愉快的使用 tags 进行 python 开发吧


### ctags 使用

ctags识别很多语言，可以用如下命令来查看：
    ctags --list-languages

ctags是可以根据文件的扩展名以及文件名的形式来确定该文件中是何种语言，从而使用正确的分析器。可以使用如下命令来查看默认哪些扩展名对应哪些语言：
    ctags --list-maps

还可以指定ctags用特定语言的分析器来分析某种扩展名的文件或者名字符合特定模式的文件。例如如下命令告知ctags，以inl为扩展名的文件是c++文件。
    ctags --langmap=c++:+.inl –R

ctags可以识别和记录哪些语法元素
    可以用如下命令查看ctags可以识别的语法元素：
    ctags --list-kinds

    或者单独查看可以识别的c++的语法元素
    ctags --list-kinds=c++

    ctags识别很多元素，但未必全都记录，例如“函数声明”这一语法元素默认是不记录的，可以控制ctags记录的语法元素的种类。如下命令要求ctags记录c++文件中的函数声明和各种外部和前向声明：
    ctags -R --c++-kinds=+px

熟练的使用ctags仅需记住下面七条命令：

1. :$ ctags -R *    
2. :$ vi -t tag     请把tag替换为您欲查找的变量或函数名
3. :ts              ts 助记字：tags list, “:”开头的命令为VI中命令行模式命令
4. :tp              tp 助记字：tags preview
                        E425: Cannot go before first matching tag
5. :tn              tn 助记字：tags next
                        E427: There is only one matching tag
                        
6. Ctrl + ]         to jump to function defination
7. Ctrl + T         to jump back


Install ctags
    e.g. aptitude install exuberant-ctags

Configure ctags.
    Add to ~/.ctags the following, one option per line:
    –python-kinds=-i
    optional: –exclude=<partial names of bad files/directories>. e.g. –exclude=*/build/*to exclude all files inside ‘build/’ directories

Add a cron to rebuild tags, for instance:
    1 * * * * ctags -R -o ~/mytags ~/src

Configure vim:
    add to ~/.vimrc: :set tags=~/mytags

Use Vim:
    vim -t <tag name> to open vim straight on the tag
    Ctrl+] to jump to tag when over a word
    Ctrl+T to pop back
    :tselect or :stselect to open
    :tnext, :tprev to go to next/prev tag finding
    :help tags for more

    https://weicode.wordpress.com/2018/05/01/configuring-ctags-for-python-and-vim/comment-page-1/



### vim自动更新ctags与taglist

vim的ctags和taglist在默认情况下是不进行自动更新的，这对于编写代码是非常不方便的，好在vim的脚本还是很强大的，于是在vimrc中添加如下函数：

```
function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !ctags -R --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q
        TlistUpdate
    endif
    execute ":cd " . curdir
endfunction


接下来，可以使用键盘映射的方式调用这个更新函数：

nmap <F10> :call UpdateCtags()<CR>
 
也可以在vim保存文件时自动更新：
autocmd BufWritePost *.c,*.h,*.cpp,*.py call UpdateCtags()
```

### 火狐浏览器输入非80端口禁止访问的解决方案

https://jingyan.baidu.com/article/a24b33cddf9b3419fe002b98.html

浏览器地址栏输入 about:config
新建 string 
    名称: network.security.ports.banned.override
    值  : 0-65535

### Python 代码折叠插件

目录: ~/.vim/bundle/

Bundle 'tmhedberg/SimpylFold'
"to enable docstring preview in fold text
let g:SimpylFold_docstring_preview = 1  

zo 展开
zc 收起
zn 全部展开
zN 全部折叠

:help fold-commands



### autopep8

pip install autopep8

Bundle 'tell-k/autopep8'


### winmanager

这个有bug，并且8年没有更新了，先不要用了
进入vim自动打开winmanager
这个功能作为可选功能，我们可以在vimrc中设置：
"在进入vim时自动打开winmanager
let g:AutoOpenWinManager = 1

"设置winmanager的宽度，默认为25
let g:winManagerWidth = 40


在winmanager.vim中修改：
"set auto open Winmanager 
if g:AutoOpenWinManager 
    autocmd VimEnter * nested call s:StartWindowsManager()|3wincmd w  
endif

就可以让winmanager自动打开。

## 关于buffer
http://ju.outofmemory.cn/entry/13522

## 链接
https://blog.csdn.net/daniel_ustc/article/details/8299096

https://www.cnblogs.com/zl-graduate/p/5777711.html

https://blog.csdn.net/junmuzi/article/details/79712972

https://blog.csdn.net/ZCF1002797280/article/details/49486905
    exuberant ctags、ctags、ptags等标签工具介绍

https://blog.csdn.net/changfengxiongfei/article/details/6315045

https://blog.csdn.net/biqioso/article/details/81062954
    vim自动更新ctags与taglist

