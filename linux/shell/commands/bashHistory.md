
## HISTFILESIZE 与 HISTSIZE 的区别

在linux系统中，history命令可以输出历史命令，历史命令默认保存在文件
~/.bash_history中。

HISTFILESIZE 与 HISTSIZE 都是history命令需要用到的两个shell变量，这两个变量到底
有什么区别呢？

HISTFILESIZE 定义了在 .bash_history 中保存命令的记录总数，可以理解为
.bash_history文件中最多只有 HISTFILESIZE 行

HISTSIZE 定义了 history 命令输出的记录数，即输出.bash_history文件中的最后
HISTSIZE 行



set | grep HIST (我用的是 zsh)

```
HISTCHARS='!^#'
HISTCMD=10420
HISTFILE=/root/.zsh_history
HISTSIZE=50000                  -1 -> unlimited
SAVEHIST=10000
```

HISTCONTROL有以下的选项：
    ignoredups         默认，忽略重复命令
    ignorespace        忽略所有一空格开头的命令  lines matching the previous history line are not entered
    ignoreboth         ignoredups 和 ignorespace 的组合
    erasedups          删除历史记录中重复命令，相同的指令仅保留最近的一个

    If unset, or if set to any other value than those previously mentioned, all
    lines read in interactive mode are saved on the history list.

    如果同时设定多个选项，中间使用冒号,如：
        HISTCONTROL=ignorespace:erasedups









## 显示操作时间

bash
    需要配置~/.bashrc

    export HISTTIMEFORMAT='%F %T '

zsh
    history -i



## zsh 的 history

➜  Linux git:(master) ✗ which history
history: aliased to omz_history


zsh 改写了 bash 的 history 


```  /root/.oh-my-zsh/lib/history.zsh

omz_history () {
    local clear list
        zparseopts -E c=clear l=list
        if [[ -n "$clear"  ]]
            then
                echo -n >| "$HISTFILE"
                fc -p "$HISTFILE"
                echo History file deleted. >&2
                elif [[ -n "$list"  ]]
                then
                builtin fc "$@"
        else
            [[ ${@[-1]-} = *[0-9]*  ]] && builtin fc -l "$@" || builtin fc -l "$@" 1
                fi
}


# Timestamp format
case ${HIST_STAMPS-} in
  "mm/dd/yyyy") alias history='omz_history -f' ;;
  "dd.mm.yyyy") alias history='omz_history -E' ;;
  "yyyy-mm-dd") alias history='omz_history -i' ;;       // 用这个吧
  "") alias history='omz_history' ;;
  *) alias history="omz_history -t '$HIST_STAMPS'" ;;
esac


```





## [bash-history-facilities](https://www.gnu.org/software/bash/manual/html_node/Bash-History-Facilities.html)

When the shell starts up, the history is initialized from the file named by the
HISTFILE variable (default ~/.bash_history). 

The file named by the value of HISTFILE is truncated, if necessary, to contain
no more than the number of lines specified by the value of the HISTFILESIZE
variable.

The file named by the value of HISTFILE is truncated, if necessary, to contain
no more than the number of lines specified by the value of the HISTFILESIZE
variable.

If the histappend shell option is set (see Bash Builtins), the lines are
appended to the history file, otherwise the history file is overwritten. 

**If HISTFILE is unset**, or if the history file is unwritable, the history is
not saved.

After saving the history, the history file is truncated to contain no more than
$HISTFILESIZE lines. If HISTFILESIZE is
    unset
    set to null
    a non-numeric value
    a numeric value less than zero,
the history file is not truncated.


history
    -c     Clears the directory stack by deleting all of the entries.




