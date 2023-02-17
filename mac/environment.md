Mac系统的环境变量，加载顺序为：

    1. /etc/profile
    2. /etc/paths
    3. /etc/paths.d/

    4. ~/.bash_profile  // 用户每次登陆计算机时执行

        If .bash_profile is present the succeeding files will be ignored.
        (though you can source them in your .bash_profile)

    5. ~/.bash_login
    6. ~/.profile

    8. ~/.bashrc


如果/.bash_profile文件存在，则后面的几个文件就会被忽略不读了
如果/.bash_profile文件不存在，才会以此类推读取后面的文件。

~/.bashrc没有上述规则，它是 bash shell 打开的时候载入的。


~/.zshrc

.bash_profile，source ~/.bash_profile，只在当前窗口生效
.zshrc ，source ~/.zshrc，永久生效；计算机每次启动自动执行source ~/.zshrc

一般会在~/.zshrc中添加source ~/.bash_profile，以确保.bash_profile中的修改永久生效。
