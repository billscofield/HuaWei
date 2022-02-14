## 1. 关于 ranger

在终端上，我们可以通过 ls 来查看文件，同过 ls 命令我们只能看到当前目录下的文件。
那么有没有办法可以在终端中清晰的看到目录的层级关系，方便的查看文件呢？

如果你有这样的想法或需求，那么 Ranger 绝对是你想要的。Ranger 是具有VI键绑定的控
制台文件管理器。它提供了一个简约而美观的 curses 界面，并具有目录层次结构的视图。
它附带了rifle（一个文件启动器），该文件启动器擅长自动找出用于哪种文件类型的程序。

1. 什么是 curses

    **curses**是一个在Linux/Unix下广泛应用的图形函数库，作用是可以在终端内绘制简单
    的图形用户界面。

    curses的名字起源于"cursor optimization"，即光标优化。

    它最早由有美国伯克利大学的Bill Joy和Ken Arnold编写的，用来处理一个游戏rogue的屏
    幕显示。

    后来贝尔实验室的Mark Horton在System III Unix中重新编写了curses。现在几乎所有的
    Unix/Linux操作系统都带了curses函数库，curses也加入了对鼠标的支持，一些菜单和面
    板的处理。可以说，curses是Linux终端图形编程的不二选择（比如著名的文字编辑器 vi
    就是基于curses编的）。

2. [rfile](https://github.com/ranger/ranger/blob/master/ranger/ext/rifle.py)

    This file is part of ranger, the console file manager.


ranger is

    1. visual file manager

    2. a console file manager with VI key bindings.

[github](https://ranger.github.io/)

[官方手册](https://github.com/ranger/ranger/wiki/Official-User-Guide)



### 2. 安装

apt install ranger



### 3. 配置

#### 配置文件

配置文件路径:

    /etc/ranger/config/

    执行下列命令将配置文件复制到自己的路径

        > ranger --copy-config=all

        ${HOEM}/.config/ranger/config/

    默认的编辑器是从环境变量中拿到的, 可以设置 Shell 的 EDITOR 环境变量，或者直
    接更改 rifle.conf，将 $EDITOR 更换为 vim

/usr/share/doc/ranger/config/

    Create copies of the default configuration files in your local configuration directory.

    Existing ones will not be overwritten.  Possible values: all, commands, commands_full, rc, rifle, scope.


    会将 /usr/share/doc/ranger/config/ 下的配置文件拷贝到 local configuration directory, 即 ~/.config/ranger/

    一般使用 ranger --copy-config=all


rc.conf     - 选项设置和快捷键
commands.py - 能通过 : 执行的命令

rifle.conf  - 指定不同类型的文件的默认打开程序。
scope.sh    - 用于指定预览程序的文件

#### 配置自己的ranger

~/.config/ranger/scope.sh

~/.config/ranger/rc.conf    //包含快捷键map

### 快捷键

? 帮助
    View [m]an page, [k]ey bindings, [c]ommands or [s]ettings? (press q to abort)    

H   后退    history_go -1
L   前进    history_go 1

### 简单使用

shs@dragonfly /home/shs/bin      <== current selection(path,directory or file)
 bugfarm   backups            0    append
 dory      bin               59    calcPower
 eel       Buttons           15    cap
 nemo      Desktop            0    extract
 shark     Documents          0    finddups
 shs       Downloads          1    fix
   ^         ^                ^      ^
   |         |                |      |
homes     directories    # files    listing
          in selected    in each    of files in
          home           directory  selected directory

1. 移动

    hjkl gg G

    [] 父目录的上下, 同hj类似，只是作用于父目录

    /   搜索, tab 键选择
    f   查找
    <Ctrl-f>    向下翻页
    <Ctrl-b>    向上翻页

    i           : 浏览文件内容, 
    
    复制    yy
    删除    dd
    粘贴    pp
    重命名  
            cw
            a       光标停留在扩展名之前    map a rename_append
            A       光标停留在扩展名后边
            I       光标停留在最前边

            rc.conf   查找 rename

    :bulkrename (批量重命名)

        操作步骤: 先用 <space> 或者 v 选中要改名的文件, 然后 :bulkrename,
        ranger 会打开 vim 对名称进行编辑, 保存退出然后回车即可


    书签
        m<char>     新建书签
        `           打开,跳转到书签
        um<char>    删除书签


2. 排序 o
    c           chain set sort=ctime;     set sort_reverse=False
    a           chain set sort=atime;     set sort_reverse=False
    m           chain set sort=mtime;     set sort_reverse=False

    b           chain set sort=basename;  set sort_reverse=False    名称排序
    n           chain set sort=natural;   set sort_reverse=False    名称排序

    e           chain set sort=extension; set sort_reverse=False    通过后缀按照名称排序, 没有的在第一个
    t           chain set sort=type;      set sort_reverse=False    ???

    s           chain set sort=size;      set sort_reverse=False
    z           set sort=random

3. 复制 y

    y           copy (文件)
    a           copy mode=add
    r           copy mode=remove
    t           copy mode=toggle

    d           yank dir

    n           yank name
    .           yank name_without_extension

    p           yank path

4. 粘贴 p


    shift h: 后退
    shift l: 前进

5. 删除 d

    d           cut
    D           console delete     还是会提示 :delete 或者直接  :delete<CR>
    T           console trash
    a           cut mode=add
    r           cut mode=remove
    t           cut mode=toggle


z
    P           set preview_directories!        这个是默认开启的，就是第三列的内容
    p           set preview_files!              打开/关闭文件预览功能
    i           set preview_images!             i3wm 下好像没用???
    h           set show_hidden!                显示隐藏文件

g
    n/<C-n>             新建书签, 类似于 vim 中的 tab 页
    <TAB>/<Shift><TAB>  正向/反向 切换标签页
    c/<C-w>             关闭标签页


    h           cd ~
    /           cd /
    r           cd /
    d           cd /dev
    e           cd /etc
    m           cd /media
    M           cd /mnt
    o           cd /opt
    s           cd /srv
    p           cd /tmp
    u           cd /usr
    ?           cd /usr/share/doc/ranger
    v           cd /var

    L           cd -r %f
    l           cd -r .

S   在当前目录打开终端



选择
    map <Space>     mark_files toggle=True¬

    map v           mark_files all=True toggle=True¬
    map uv          mark_files all=True val=False¬

    map V           toggle_visual_mode¬
    map uV          toggle_visual_mode reverse=True¬




d
    u           shell -p du --max-depth=1 -h --apparent-size                将文件大小列出
    U           shell -p du --max-depth=1 -h --apparent-size | sort -rh

