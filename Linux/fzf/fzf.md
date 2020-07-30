## fzf

general-purpose command-line fuzzy finder.

It's an interactive Unix filter for command-line that can be used with any list; files, command history, processes, hostnames, bookmarks, git commits, etc.

Fzf是用Golang语言开发的shell系统工具，源代码托管再Github上


## 用法

命令行下执行 fzf 即可展示当前目录下所有文件列表，可以用键盘上下键或者鼠标点出来选择

通常我们需要组合使用才会有很好的效果


编辑文件

    vim $(fzf)


切换目录

    cd $(find * -type d | fzf)


切换 git 分支

    git checkout $(git branch -r | fzf)

不过这样组合使用命令的实在太长了，如果你不使用自动补全的话巧起来很累的。建议把常用的 alias 放在 .zshrc 中管理嘛
