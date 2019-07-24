## yes
output a string repeatedly until killed

感觉很没用？其实它是很有用的,安装程序的时候，有的程序需要你不断地按y和回车，安装进程才能继续工作。yes命令可以解救你！它帮你输入y和回车

```
yes | sh boring_installation.sh

```

如今，这个命令被放在GNU coreutils中，当前这个版本用了整整128行代码来完成这个功能，你可以在github上找到它的源码：https://github.com/coreutils/coreutils/blame/master/src/yes.c。已经过了25年，这个命令居然仍然在更新中！最近一次更新大概在一年前。它的效率非常高

http://www.sohu.com/a/199363999_470018
