
## rpm2cpio - Extract cpio archive from RPM Package Manager (RPM) package.

SYNOPSIS

    rpm2cpio [filename]

DESCRIPTION

    rpm2cpio converts the .rpm file specified as a single argument to a cpio
    archive on standard out. If a '-' argument is given, an rpm stream is read
    from standard in.


    rpm2cpio rpm-1.1-1.i386.rpm

    rpm2cpio - < glint-1.0-1.i386.rpm

    rpm2cpio glint-1.0-1.i386.rpm | cpio -dium


## cpio

cpio是一个非常古老的归档工具。已逐渐被tar替代，但是有些功能是tar不存在的


cpio是一个非常古老的归档工具。已逐渐被tar替代，但是有些功能是tar不存在的，所以
还是分享下它的用法。

cpio - copy files to and from archives

cpio用于创建、解压归档文件，也可以对归档文件执行拷入拷出的动作，即向归档文件中
追加文件，或从归档文件中提取文件。它也支持tar格式的归档文件，但是对压缩后的tar(
如.tar.gz格式)就没法支持了，cpio毕竟不会调用对应的(解)压缩工具。

cpio一般从标准输入获取数据，写入到标准输出，所以一般会结合管道、输入重定向、输
出重定向使用。


## cpio有三种运行模式：

Copy-out模式：此模式下，cpio将向归档文件中拷入文件，即进行归档操作，所以成为归
档模式。它会从标准输入中读取待归档的文件，将它们归档到目标目标中，若未指定归档
的目标，将归档到标准输出中。在copy-out模式下，最典型的是使用find来指定待归档文
件，在使用find时，最好加上"-depth"以尽可能减少可能出现的问题，例如目录的权限问
题

In  copy-out  mode, cpio copies files into an archive.  It reads a list of
filenames, one per line, on the standard input, and writes the archive onto the
standard output. 


Copy-in模式：此模式下，cpio将从归档文件中提取文件，或者列出归档文件中的文件列表
。它将从标准输入中读取归档文件。任意cpio的非选项参数都将认为是shell的glob通配
pattern，只有文件名匹配了指定模式时才会从中提取出来或list出来。在cpio中，通配符
不能匹配到"."或"/"，所以如有需要，必须显式指定"."或"/"。如果没有指定匹配模式，
则解压或列出所有文件。

In copy-in mode, cpio copies files out of an archive or lists the archive
contents.  It reads the archive from the standard input.


Copy-pass模式：此模式下，cpio拷贝一个目录树(即目录中所有文件)到另一个目录下，并
在目标目录下以同名的子目录存在。copy-pass模式是copy-in模式再copy-out模式的结合
，它中途没有涉及到任何归档行为。这是cpio的一个特殊用法。它从标准输入中读取待拷
贝内容，然后将它们复制到目标路径下。

cpio 不会主动的去找文件来备份, 一般来说， cpio 得要配合类似 find 等可以找到档名
的命令来告知 cpio 该被备份的数据在哪里



1. -i  --extract

    Run in copy-in mode.     执行copy-in模式，还原备份档。

2. -o, --create'

    Run in copy-out mode.  see “Copy-out mode”. 执行copy-out模式，建立备份档。

3. -p, --pass-through

    Pass-through.  Read a list of file names from the standard input and copy
    them to the specified directory.(debian)

    Run in copy-pass mode.  see “Copy-pass mode”.(centos)

cpio -ovcB  > [file|device] 　　　　　　　　　　<==备份
cpio -ivcdu < [file|device]　　　　　　　　　　 <==还原
cpio -ivct  < [file|device]　　　　　　　　　　 <==察看





#### 备份 Operation modifiers valid only in copy-out mode

-o, --create

    Copy-out.  Read a list of file names from the standard input and
    create on the standard output  (unless  overridden by the --file
    option) an archive containing these files.


-A, --append

    Append to an existing archive.

-O  archive

    Archive  filename  to  use instead of standard output. 

    使用指定的归档文件名替代标准输出


    -O [[USER@]HOST:]ARCHIVE-NAME Use ARCHIVE-NAME instead of standard output.
    Optional USER and HOST specify the user and host names in  case  of  a
    remote archive.

    The output archive name can be specified wither using this option, or using
    -F (--file), but not both.


-B  Set the I/O block size to 5120 bytes. 让默认的 Blocks 可以添加至 5120 bytes
    ，默认是 512 bytes, 这样的好处是可以让大文件的储存速度加快

-0, --null

    Filenames in the list are delimited by null characters instead of newlines.

#### 还原 Operation modifiers valid only in copy-in mode

-i, --extract

  Copy-in.  Read the archive from standard input (or from the file supplied
  with the --file option) and extract files from it, or (if the -t option is
  given) list its contents to the standard output.  If one or more patterns are
  sup‐plied, read or list only files matching these patterns.  The -t option
  alone implies -i.


-d, --make-directories

    Create leading directories where needed.

    自动创建目录！使用 cpio 所备份的数据内容不见得会在同一层目录中，因此我们
    必须要让 cpio 在还原时可以创建新目录，此时就得要 -d 选项的帮助！

-u, --unconditional

    Replace all files unconditionally.

-t, --list

    Print a table of contents of the input.

    需配合 -i 选项，可用在"察看"以 cpio 创建的文件或装置的内容


-I archive
    
    使用指定的归档文件名替代标准输入


#### Operation modifiers valid in copy-in and copy-out modes

-F archive：(--file=archive)

    使用指定的归档文件名替代标准输入或输出。所以无论是copy-in还是copy-out模式都可以使用-F指定归档文件

-M, --message=STRING

    Print STRING when the end of a volume of the backup media is reached.


#### 通用 Operation modifiers valid in any mode

-c  Use the old portable (ASCII) archive format.  This is the same as -H odc.(Debian)

    Identical to “-H newc”, use the new (SVR4) portable format.  If you wish
    the old portable (ASCII) archive format, use “-H odc” instead.(centos)

    Portable Operating System of Unix

-v  --verbose

    List the files processed, or with -t, give an 'ls -l' style table of
    contents listing.  In a verbose table of contents of a ustar archive, user
    and group names in the archive that do not exist on the local system are
    replaced by the names that cor‐

    respond locally to the numeric UID and GID stored in the archive.

-D, --directory=DIR

    Change to directory DIR.

--quiet

    Do not print the number of blocks copied at the end of the run.

    不输出拷贝时的block数量信息


## 实例

将/etc下的所有普通文件都备份到/opt/etc.cpio，使用以下命令：

将系统上所有资料备份到磁带机内，使用以下命令：

    find /etc –type f | cpio –ocvB >/opt/etc.cpio


这里的/dev/st0是磁带的设备名，代表SCSI磁带机。

    find / -print | cpio -covB > /dev/st0


查看上例磁带机上备份的文件，使用以下命令：

    有时可能因为备份的文件过多，一个屏幕无法显示完毕，此时我们利用下面命令，让
    磁带机的文件信息输出到文件。

    cpio  -icdvt < /dev/st0 > /tmp/st_content


将示例1中的备份包还原到相应的位置，如果有相同文件进行覆盖，使用以下命令：

    cpio –icduv < /opt/etc.cpio

注意，cpio恢复的路径，如果cpio在打包备份的时候用的是绝对路径，那么在恢复的时候
会自动恢复到这些绝对路径下，本例就会将备份文件全部还原到/etc路径下对应的目录中
。同理，如果在打包备份用的是相对路径，还原时也将恢复到相对路径下。

通过上面的示例，可以看出，cpio无法直接读取文件，它需要每个文件或者目录的完整路
径名才能识别读取，而find命令的输出刚好做到了这点，因此，cpio命令一般和find命令
配合使用。其实，上面的示例我们已经看到了它们的组合用法。
