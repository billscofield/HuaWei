## --preserve=links

https://unix.stackexchange.com/questions/386979/info-on-cp-preserve-links


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

现在可以看到，使用--preserve=links，两个副本仍然是硬链接的，但它们的inode编号是
6089617，这与原始的inode编号不同文件（与cp --link所做的相反）。

You can see now that with --preserve=links, the two copies are still
hard-linked, but their inode number is 6089617, which is not the same as the
inode number of the original files (contrary to what cp --link would have
done).


## -l, --link

hard link files instead of copying

cp --link a.py a.py.bak


## -P   --no-dereference

never follow symbolic links                     // tab 键的结果

这个写的有点不太好理解啊


man 手册中的写的还是差不多

-P, --no-dereference

    never follow symbolic links in SOURCE

    reference 是引用的意思，--no-de 双重否定，就是还是引用关系, 不打破引用关系


## -L, --dereference

always follow symbolic links in SOURCE

```

➜  temp ll
total 8.0K
-rw-r--r-- 2 root root 12 May 20 20:44 a
-rw-r--r-- 2 root root 12 May 20 20:44 a1
lrwxrwxrwx 1 root root  1 May 20 21:02 as -> a

➜  temp cp -L as as2
➜  temp ll
total 12K
-rw-r--r-- 2 root root 12 May 20 20:44 a
-rw-r--r-- 2 root root 12 May 20 20:44 a1
lrwxrwxrwx 1 root root  1 May 20 21:02 as -> a
-rw-r--r-- 1 root root 12 May 20 21:02 as2              // 打破了引用关系

```

## -p     same as --preserve=mode,ownership,timestamps



在进行文件复制时，诸如“能力”等文件的扩展属性可以通过 cp -a 自动复制, 但是其他的
命令可能需要一个特别的参数,例如：rsync -X。

getcap /usr/bin/ping

chattr 的那些  +i +a 却是不可以复制过去
