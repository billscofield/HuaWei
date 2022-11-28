1. 创建索引（数据库）

    首先需要创建文件系统的索引文件（数据库），要创建索引文件，请使用duc index命令。

    例如，要创建/home目录的索引，只需运行：

    $ duc index /home

    上面的命令将创建/home/目录的索引并将其保存在$HOME/.duc.db文件中，如果将来在
    /home目录中添加了新文件/目录，请稍后重新运行上述命令以重建索引。


2. 查询索引

    Duc有各种子命令来查询和探索索引。

    1. 要查看可用索引列表，请运行：

        $ duc info

        Date       Time       Files    Dirs    Size Path
        2022-11-27 22:47:58  300.3K   33.8K  229.4G /root

    2. 要列出当前工作目录中的所有文件和目录，可以执行以下操作：

        $ duc ls
        $ duc ls /home/sk/Downloads

    3. 帮助

        要了解有关子命令用法的更多信息，请参阅帮助信息：

        $ duc help ls

    4. 可视化磁盘使用情况

        duc ls -Fg /home/sk

            -g,  --graph               draw graph with relative size for each entry
            -F   文件夹后边添加/, 同ls

    5. 打开基于ncurses的控制台用户界面以探索给定路径的磁盘使用情况

        duc ui .

    6. 我们使用gui子命令来查询duc数据库并启动图形（X11）接口来探索给定路径的磁盘使用情况：

        duc gui .
