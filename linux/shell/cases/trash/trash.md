links:

    https://www.jb51.net/article/192418.htm

```
mkdir -p ~/.Trash
cat >>~/.bashrc<<EOF
## add by caimengzhi at $(date +%F) for Linux trash start
alias rm=trash
alias rl='ls ~/.Trash'
alias ur=undelfile
undelfile()
{
 mv -i ~/.Trash/\$@ ./
}
trash()
{
 mv \$@ ~/.Trash/
}
cleartrash()
{
  read -p "Clear trash?[n]" confirm
[ \$confirm == 'y' ] || [ \$confirm == 'Y' ] && /usr/bin/rm -rf ~/.Trash/*
}
## add by caimengzhi at $(date +%F) for Linux trash end
EOF
source ~/.bashrc
```

说明：

1. ~/.Trash就是以后被删除的文件和文件夹移动到的地方，也就是回收站

2. \$confirm 是实现验证的意思，也就是最后在文件中就是$confirm。其中\$@一样

3. 上面的作用，说白了就是命令rm 的重命名。

使用语法：

rm（删除）,ur（撤销），rl（列出回收站），cleartrash（清空回收站）命令了。

## 删除一个文件夹和文件都会被移动到回收站中。

$rm filedirctory

## 删除一个文件

$rm file.txt

## 撤销对file.txt的删除

$ur file.txt

## 撤销filedirctory文件夹

$ur filedirctory

## 列出回收站

$rl

## 清空回收站

cleartrash

　　ok，基本的内容就是这些，本质上来说，只是替换了root用户的rm命令为mv命令，如果系统建立了别的用户，那么也需要使用该用户重新执行上面的命令，看情况吧，如果失去了root权限，那么rm -rf的威力也就不足为惧了，当然，我们也需要执行正规的rm命令，怎么做呢，这样就ok了：

/usr/bin/rm -rf
