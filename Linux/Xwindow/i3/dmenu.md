
dmenu 是一个X下的快速、轻量级的软件启动器，它从 stdin 读取任意文本，并创建一个菜单，每一行都有一个菜单项。
然后，用户可以通过方向键或键入名称的一部分来选择一个项目，该行就会被输出到 stdout。
dmenu_run是 dmenu 发行版附带的包装器，可将其用作应用程序启动器。


现在你可以将此命令关联到一个快捷键，很多窗口管理器和桌面环境都有设置工具可以做到，用
xbindkeys 也可以做到，想得到更详细的信息参见 Hotkeys 条目。

dmenu 会在你的 $PATH 路径下的目录里查找可执行文件并生成菜单项. 好像不全面

dmenu 4.6 起 XFT 字体渲染默认启用。fontconfig的font.conf 语法 会被使用。

dmenu 不支持 shell 别名. 为了让 dmenu 能够识别别名， 安装
dmenu-recent-aliases（已从AUR移除） 包然后运行 dmenu_run_aliases。 别名必须要在
~/.bash_aliases 或者 ~/.zsh_aliases 文件里面来让 dmenu_run_aliases 识别出来。


```
$rpm -ql dmenu
/usr/bin/dmenu
/usr/bin/dmenu_path
/usr/bin/dmenu_run

/usr/bin/stest
/usr/share/doc/dmenu-4.7
/usr/share/doc/dmenu-4.7/LICENSE
/usr/share/doc/dmenu-4.7/README
/usr/share/man/man1/dmenu.1.gz
/usr/share/man/man1/stest.1.gz
```

man stest
    stest - filter a list of files by properties

dmenu_path和dmenu_run是两个shell脚本，真正的执行/显示部分都由dmenu完成，其中dmenu_path用于列出$PATH里的可执行文件，每个文件名一行，然后通过“|”传递给dmenu，具体语法可从dmenu_run里找到。 你也可以在终端里执行：

    ` $ echo | dmenu

然后输入任意字串，这个字串就会被显示在终端里，这其实才是dmenu的核心功能。

由此配合其他工具可以完成其他任务，比如运行：

    ` $ notify-send "`exec $(echo | dmenu)`"
你可以试着在运行后输入date，之后系统就会借助notify-send弹出日期提示。



1. /usr/bin/dmenu_run

    ```
    #!/bin/sh
    dmenu_path | dmenu "$@" | ${SHELL:-"/bin/sh"} &
    ```

2. /usr/bin/dmenu_path
    ```
    #!/bin/sh
    cachedir=${XDG_CACHE_HOME:-"$HOME/.cache"}
    if [ -d "$cachedir" ]; then
        cache=$cachedir/dmenu_run
    else
        cache=$HOME/.dmenu_cache # if no xdg dir, fall back to dotfile in ~
    fi
    IFS=:
    if stest -dqr -n "$cache" $PATH; then
        stest -flx $PATH | sort -u | tee "$cache"
    else
        cat "$cache"
    fi
    ```


