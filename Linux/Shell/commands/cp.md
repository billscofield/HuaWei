## --preserve=links

--preserve=links选项不是指符号链接，而是指硬链接。它要求cp保留正在复制的两个或多个文件之间的任何现有硬链接。

$ date > file1
$ ln file1 file2
$ ls -1i file1 file2
6034008 file1
6034008 file2
您可以看到两个原始文件是硬链接的，其inode编号是6034008.

$ mkdir dir1
$ cp file1 file2 dir1
$ ls -1i dir1
total 8
6035093 file1
6038175 file2
您现在可以看到，如果没有--preserve=links，他们的副本会有两个不同的inode编号：两者之间不再存在硬链接。

$ mkdir dir2
$ cp --preserve=links file1 file2 dir2
$ ls -1i dir2
total 8
6089617 file1
6089617 file2
现在可以看到，使用--preserve=links，两个副本仍然是硬链接的，但它们的inode编号是6089617，这与原始的inode编号不同文件（与cp --link所做的相反）。
