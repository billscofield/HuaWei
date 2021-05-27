

-r  递归压缩目录，及将制定目录下的所有文件以及子目录全部压缩。

-m  将文件压缩之后，删除原始文件，相当于把文件移到压缩文件中。

-v  显示详细的压缩过程信息。

-q  在压缩的时候不显示命令的执行过程。

-压缩级别   压缩级别是从 1~9 的数字，-1 代表压缩速度更快，-9 代表压缩效果更好。

-u  更新压缩文件，即往压缩文件中添加新文件。


可以同时压缩多个文件

    zip a.zip a b c d

    把/home目录下面的abc文件夹和123.txt压缩成为abc123.zip
    zip -r abc123.zip abc 123.txt


-m  --move

    Move  the  specified files into the zip archive;

    向压缩文件中myfile.zip中添加rpm_info.txt文件
    zip -m myfile.zip ./rpm_info.txt


-x files
--exclude files

    Explicitly exclude the specified files, as in:

    zip -r foo foo -x \*.o

    which will include the contents of foo in foo.zip while excluding all the files that end in .o.  The backslash avoids
    the shell filename substitution, so that the name matching is performed by zip at all directory levels.

    Also possible:

    zip -r foo foo -x@exclude.lst

    which will include the contents of foo in foo.zip while excluding all the files that match the patterns in  the  file
    exclude.lst.


---


unzip 

[-d exdir] 

    An optional directory to which to extract files.  By default, all
    files and subdirectories are recreated in the  cur‐rent  directory; 

    把/home目录下面的mydata.zip解压到mydatabak目录里面
    unzip /home/mydata.zip -d mydatabak


-v  查看压缩文件的详细信息，包括压缩文件中包含的文件大小、文件名以及压缩比等，但并不做解压操作。
    查看zip 中的文件列表

    unzip -v zipfile

```
unzip -v liu.zip
Archive:  liu.zip
 Length   Method    Size  Cmpr    Date    Time   CRC-32   Name
--------  ------  ------- ---- ---------- ----- --------  ----
       0  Stored        0   0% 2021-05-21 11:08 00000000  liu/
       0  Stored        0   0% 2021-05-21 11:08 00000000  liu/zhaoyaqun.md
      10  Stored       10   0% 2021-05-21 10:55 86f0e8d3  liu/liuzixian.md
       8  Stored        8   0% 2021-05-21 10:55 533284a9  liu/liuziqi.md
--------          -------  ---                            -------
   18               18   0%                            4 files

```




-l     list archive files (short format)

```

unzip -l liu.zip
Archive:  liu.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  2021-05-21 11:08   liu/
        0  2021-05-21 11:08   liu/zhaoyaqun.md
       10  2021-05-21 10:55   liu/liuzixian.md
        8  2021-05-21 10:55   liu/liuziqi.md
---------                     -------
       18                     4 files

```


-n  解压时并不覆盖已经存在的文件。


-o  解压时覆盖已经存在的文件，并且无需用户确认。


-t  测试压缩文件有无损坏，但并不解压。


从压缩文件中解压出单个目录或文件

    ```

    unzip <Your zip file> "*mobile/要解压的文件" -d <要解压的目录>

    ```

