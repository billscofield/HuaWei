Trash-cli替换rm命令

使用这个程序最大的动力来源于rm命令的误操作, 所以, 把这个替换掉系统的rm命令

ubuntu 桌面版的 Trash 也是基于这个的，用拖拽的方法将文件拖到垃圾箱后，这trash-list 可以看到这个路径还是和之前一样，但是 ll -a 也看不到这个文件了

拖拽也是调用了 trash-put 类似的机制，但是内置的机制是用哪个工具实现的呢??? gvfs (Gnome VFS)参见付1

trash --help

## 删除文件 trash-put 或 trash 
trash-put [File1] [File2] ...
trash [File1] [File2] ...


## 查看回收站文件 trash-list

## 恢复文件 trash-restore
旧版本中恢复命令是”restore-trash”, 会列出回收站中所有的文件及序号, 输入对应序号并回车即可从垃圾桶中恢复文件.

restore-trash
按照提示输入编号

## 删除文件 trash-rm
删除回收站中的某个文件，不用谢 raw 路径，直接写文件名
touch zhang wang li zhao
trash-list
trash-rm zhang
trash-list


## 清空回收站 trash-empty

清空超过30天的文件
To remove files that have been in the trash more than a given number of days, use 'trash-empty x', 'x' representing the number of days.

    ```
    $ trash-list
    2008-02-19 20:11:34 /home/einar/today
    2008-02-18 20:11:34 /home/einar/yesterday
    2008-02-10 20:11:34 /home/einar/last_week

    $ trash-empty 7

    $ trash-list
    2008-02-19 20:11:34 /home/einar/today
    2008-02-18 20:11:34 /home/einar/yesterday

    $ trash-empty 1

    $ trash-list
    2008-02-19 20:11:34 /home/einar/today
    $ trash-empty

    $ trash-list
    <none>
    `````


## 附
GVFS是GNOME桌面系统的虚拟文件系统，通过GVFS，用户可以很容易的通过SFTP、FTP、WebDAV、SMB等访问远程数据，通过HAL integration、OBEX等访问本地数据。
GVFS附加资源通过URI语法进行解析，如：smb://server01/gamedata或者ftp://username:password@ftp.example.net/public_html，同时，也可以采用传统方式进行挂载，通常挂载到~/.gvfs/，通过mount来使得旧的应用程序使用标准POSIX命令和I/O。

Your trash directory is most likely at:
    /home/$USER/.local/share/Trash

the "home trash" directory is at $XDG_DATA_HOME/Trash, and $XDG_DATA_HOME in turn defaults to $HOME/.local/share.

The Trash directory is first created when a user deletes a file. 
Within Trash there are three subdirectories:
    files, where the deleted files are stored until the trash is emptied
    info, which stores information on where the files once were and when they were deleted
    expunged, to which files are briefly moved when the trash is emptied (but may contain some owned by other users from directories you deleted).

Note that using the rm command in a terminal or the Shift+Delete key combination in the file manager will permanently delete your file instead of moving it to the trash.


If you want to move file to Trash from command line, run: gvfs-trash filepath
An alternative to gvfs-trash is the trash command from the trash-cli package
If using command line to mv something to the Trash, you may need to put it in 'Trash/files/' rather than just 'Trash/'

链接
https://askubuntu.com/questions/102099/where-is-the-trash-folder
````
