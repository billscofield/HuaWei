
```
https://www.youtube.com/watch?v=_Unn7fysiE0


https://www.youtube.com/watch?v=2U3vRbF7v5A

https://www.youtube.com/watch?v=ubRVpwZXz_s

http://www.mutt.org/doc/manual/

```


source ~/.config/mutt/luxmyth.info
source ~/.config/mutt/amuttcol
source ~/.config/mutt/aliases


set sort = 'reverse-date'
set mail_check = "10"
set editor = vim

bind 




mutt -F ~/.mutt/.muttrc

### 如果没有 ~/.muttrc 不会自动引用 ~/.mutt/.muttrc 配置文件，奇怪了，man 手册里 默认的是两个啊

解决方法1
    1. 做一个软连接

解决方法2
    1. /etc/Muttrc
        source $HOME/.mutt/.muttrc





邮件阅读后会退出mutt会被delete, 注意，只是移动到了 seen 邮件箱

    配置项
        set move=ask-yes    会进行询问
        set move=yes        直接移动

    c: open mail box [?]
    tab


apt install 的版本有点老啊，才1.几的版本，最新的都2.0了，考虑编译安装吧, 
mutt -v 会显示出默认的 configure 选项，这个比较好, 可以参照进行编译




