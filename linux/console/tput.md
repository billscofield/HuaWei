## tput (1)

initialize a terminal or query terminfo database

The  tput utility uses the terminfo database to make the values of
**terminal-dependent capabilities** and information available to the shell (see
sh(1)), to initialize or reset the terminal, or re‐turn the long name of the
requested terminal type.



现在的终端模拟器早就支持256色了，不过默认可能还是8色的。

1. 查看xterm终端支持的颜色

    tput colors
        256
        我在tmux中运行时是 256, 而直接ssh过去是8

2. 查看终端类型

    echo $TERM

        screen-256color
        xterm-256color

将终端类型更改为xterm-256colo

    1. ~/.bashrc文件添加
        if [ "$TERM" == "xterm"  ]; then
            export TERM=xterm-256color
        fi

    2. 修改.Xresourcesw文件

        ~/.Xresources文件添加
        xterm*termName: xterm-256color

    3.  vim开启256色支持

        编辑~/.vimrc文件，添加
        set t_Co=256
        
        t_Co即terminal Color之意

---

https://linuxcommand.org/lc3_adv_tput.php

Long ago, when computers were centralized, interactive computer users
communicated with remote systems by using a physical terminal or a terminal
emulator program running on some other system. In their heyday, there were many
kinds of terminals and **they all used different sequences of control characters**
to manage their screens and keyboards.

When we start a terminal session on our Linux system, the terminal emulator
sets the TERM environment variable with the name of a terminal type. If we
examine TERM


## grub-terminfo

Generate a terminfo command from a terminfo name

    grub-terminfo tmux





## What is the difference between screen-256 color and xterm-256color

https://superuser.com/questions/424086/what-is-the-difference-between-screen-256-color-and-xterm-256color

```

I've just started using tmux and I'm having trouble with my colorscheme in vim.
I've using the zenburn color scheme and it works fine with the default terminal
settings in Ubuntu 10.04.

However, when I run vim in a tmux session the colors don't look good at all.
I've done some searches to try to figure out what the problem is and one thing
I found is this question where the solution involved allowing tmux to using
screen-256color and removing the setting in .bashrc which was setting it to
xterm-256color.

So I am curious what the difference is between xterm-256color and
screen-256color but I haven't found a good explanation yet.

---

tmux is a terminal emulator, since each pane must behave as a separate
terminal; its emulation is not exactly the same as that of xterm or
gnome-terminal, for historical reasons (it instead matches screen, which
predates most of the GUI terminal emulators). It therefore requires a different
terminal description to behave properly.

Setting $TERM manually is usually a bad idea specifically for this reason; it
will usually be set correctly by itself, with some exceptions usually related
to compatibility (older Solaris doesn't understand xterm-256color, for
example).

```


## 命令行使用说明

1. 光标属性
    tput clear #清除屏幕
    tput sc #记录当前光标位置
    tput rc #恢复光标到最后保存位置
    tput civis #光标不可见
    tput cnorm #光标可见
    tput cup x y #光标按设定坐标点移动

2. 文本属性
    tput blink #文本闪烁
    tput bold #文本加粗
    tput el #清除到行尾
    tput smso #启动突出模式
    tput rmso #停止突出模式
    tput smul #下划线模式
    tput rmul #取消下划线模式
    tput sgr0 #恢复默认终端
    tput rev #反相终端

3. 颜色
    1. 文本颜色
        ```
        tput setb 颜色代号
        tput setf 颜色代号
        颜色代号
        0：黑色
        1：蓝色
        2：绿色
        3：青色
        4：红色
        5：洋红色
        6：黄色
        7：白色
        ```

    2. 背景颜色
        ```
        1. 前景色：
        数字颜色数字颜色
        0 黑色 4 蓝色
        1 红色 5 紫色
        2 绿色 6 青色
        3 黄（或棕）色 7 白（或灰）色
        
        2. 背景色：
        数字颜色数字颜色
        0 黑色 4 青色
        1 红色 5 蓝色
        2 绿色 6 青色
        3 黄（或棕）色 7 白（或灰）色
        
        例子：黑底绿字echo "33[40;32m"
        ```

例子:
        1. 利用上面参数编写一个终端时钟
        ```
        #!/bin/bash
            
        for ((i=0;i<10;i++))
        do
            tput sc; tput civis                     #记录光标位置,及隐藏光标
            echo -ne $(date +'%Y-%m-%d %H:%M:%S')   #显示时间
            sleep 1
            tput rc                                 #恢复光标到记录位置
        done
        
        tput el; tput cnorm                             #退出时清理终端,恢复光标显示
        
        ```

        2. 现在为"终端时钟"添加，变换颜色和闪烁功能
        ```
        #!/bin/bash
        
        for ((i=0;i&lt;8;i++))
        do
            tput sc; tput civis                     #记录光标位置,及隐藏光标
            tput blink; tput setf $i                #文本闪烁,更改文本颜色
            echo -ne $(date +'%Y-%m-%d %H:%M:%S')   #显示时间
            sleep 1
            tput rc                                 #恢复光标到记录位置
        done
        
        tput el; tput cnorm                             #退出时清理终端,恢复光标显示
        ```

        3. 使输出的字符串有颜色，底色，加粗
        ```
        #!/bin/bash
        
        printf $(tput setaf 2; tput bold)'color show\n\n'$(tput sgr0)
        
        for((i=0; i&lt;=7; i++)); do
            echo $(tput setaf $i)"show me the money"$(tput sgr0)
        done
        
        printf '\n'$(tput setaf 2; tput setab 0; tput bold)'background color show'$(tput sgr0)'\n\n'
        
        for((i=0,j=7; i&lt;=7; i++,j--)); do
            echo $(tput setaf $i; tput setab $j; tput bold)"show me the money"$(tput sgr0)
        done
        
        exit 0
        ```

        4. 输出格式控制函数
        ```
        #!/bin/bash
        
        # $1 str       print string
        # $2 color     0-7 设置颜色
        # $3 bgcolor   0-7 设置背景颜色
        # $4 bold      0-1 设置粗体
        # $5 underline 0-1 设置下划线
        
        function format_output(){
            str=$1
            color=$2
            bgcolor=$3
            bold=$4
            underline=$5
            normal=$(tput sgr0)
             
            case "$color" in
                0|1|2|3|4|5|6|7)
                    setcolor=$(tput setaf $color;) ;;
                *)
                    setcolor="" ;;
            esac
             
            case "$bgcolor" in
                0|1|2|3|4|5|6|7)
                    setbgcolor=$(tput setab $bgcolor;) ;;
                *)
                    setbgcolor="" ;;
            esac
             
            if [ "$bold" = "1" ]; then
                setbold=$(tput bold;)
            else
                setbold=""
            fi
             
            if [ "$underline" = "1" ]; then
                setunderline=$(tput smul;)
            else
                setunderline=""
            fi
             
            printf "$setcolor$setbgcolor$setbold$setunderline$str$normal\n"
        }
        
        format_output "Yesterday Once More" 2 5 1 1
        
        exit 0
        ```

