## 关于xrdp远程桌面 tab 键被占用的问题

/etc/bash.bashrc

    ```
    #enable bash completion in interactive shells
    #if ! shopt -oq posix; then
    #      if [-f  /usr/share/bash-completion/bash_completion ]; then
    #          . /usr/share/bash-completion/bash_completion
    #      elif [ -f /etc/bash_completion ]; then
    #           . /etc/bash_completion
    #      fi
    #fi

    去掉注释
    ```

source /etc/bash.bashrc

打开远程桌面 的 windows manager
    xfwm4-settings 将tab键占用的快捷方式更换

https://blog.csdn.net/u014447845/article/details/80291678

