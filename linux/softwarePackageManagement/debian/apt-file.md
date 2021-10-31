apt-file 是一个命令行界面的 APT 包搜索工具。当我们在编译源代码时，时有缺少文件的情况发生。此时，通过 apt-file 就可以找出该缺失文件所在的包，然后将缺失的包安装后即可让编译顺利进行了。

apt-file search libgthread-2.0.so.0
