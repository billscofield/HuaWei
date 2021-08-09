
## HISTFILESIZE 与 HISTSIZE 的区别

在linux系统中，history命令可以输出历史命令，历史命令默认保存在文件~/.bash_history中。

HISTFILESIZE 与 HISTSIZE都是history命令需要用到的两个shell变量，这两个变量到底有什么区别呢？

HISTFILESIZE 定义了在 .bash_history 中保存命令的记录总数，可以理解为.bash_history文件中最多只有HISTFILESIZE行

HISTSIZE 定义了 history 命令输出的记录数，即输出.bash_history文件中的最后HISTSIZE行



set | grep HIST (我用的是 zsh)

```
HISTCHARS='!^#'
HISTCMD=10420
HISTFILE=/root/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
```


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
