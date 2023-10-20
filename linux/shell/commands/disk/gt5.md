# gt5

一个 diff 风格的 du 浏览器，du 是 Linux 下一个查看磁盘空间使用的命令。

https://gt5.sourceforge.net/

- displays the diskspace used by files and directories within a directory
- displays what has happened since gt5 last ran (see screenshot below)
- optionally provides links to the files, so you can also browse them
- displays entries with their size and the percentage of their parent
- omission of small files/directories to keep the results readable
- easy browsing through subdirectories, using the cursor-keys

Esc 调出`菜单栏`

~/.gt5-diffs


在一个路径下运行完毕 gt5 命令或者  gt5 某个路径 后, 会在 ~/.gt5-diffs/ 下创建这
个路径的 du -akx 文件

    以 _,backup_,videoes_,lca_,dcp_,8.can 为例，

    1. _, 作为分隔符
    2. 路径为 /backup/videoes/lca/dcp/8.can
    3. 
