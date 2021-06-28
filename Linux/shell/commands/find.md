

find . -perm /040
    权限有一个符合的即可, / 代表或

find . -perm 040
    精确

find .. -print0

    -print0   以空(NULL)分开所有结果

    -print0

        True; print the full file name on the standard output,
        followed by a null character (instead of the newline
        character that -print uses).  This allows file names that
        contain newlines or other types of white space to be
        correctly inter‐preted by programs that process the find
        output.  This option corresponds to the -0 option of xargs.


    默认的是空格分隔

    'a b.log'
    find . -iname *.log | xargs rm -f    

    find . *.log -print0 | xargs -0 rm -f    


    xargs -0

        -0, --null Input items are terminated by a null character instead of by
        whitespace, and the quotes and backslash are not special (every character
        is taken literally).  Disables the end of file string, which is treated
        like  any  other  argument.  Useful when input items might contain white
        space, quote marks, or backslashes.  The GNU find -print0 option produces
        input suitable for this mode.


-type

-exec

-ok


-exec rm -f {} \;
    \   转义符， \rm , rm 本身的含义



## depth

https://www.howtouselinux.com/post/linux-find-depth-maxdepth-mindepth


### -maxdepth levels  

Descend at most levels (a non-negative integer) levels of directories below the
command line arguments.  -maxdepth 0 means only apply the tests and actions to
the command line arguments.


### -mindepth levels 

Do not apply  any tests or actions at levels less than levels (a non-negative
integer). -mindepth 1 means process all files except the command line
arguments.


Examples of Depth in Find Command

We can use the following examples to limit the depth level in Linux find command.

    ```

    # find /etc -maxdepth 2 -name passwd
    /etc/passwd
    /etc/pam.d/passwd
    # find /etc -mindepth 1 -name passwd
    /etc/passwd
    /etc/pam.d/passwd
    # find /etc -mindepth 1 -maxdepth 1 -name passwd        // /etc 下面的文件为1级目录，下面的文件夹为2级目录
    /etc/passwd
    # find /etc -mindepth 1 -maxdepth 2 -name passwd
    /etc/passwd
    /etc/pam.d/passwd

    ```


### -depth

It means that find should use a depth first method for walking the directory tree.

it does not accept any argument. It is intended to process the content of a
directory before the directory itself, for example:

```

➜  Music find .
.                       // 首先处理文件夹
./a                     // 首先处理文件夹
./a/alogfile2.log
./a/alogfile3.log
./a/alogfile9.log
./a/alogfile8.log
./a/alogfile5.log
./a/alogfile10.log
./a/alogfile4.log
./a/alogfile7.log
./a/alogfile1.log
./a/alogfile6.log
./downloads.cpio


➜  Music find . -depth
./a/alogfile2.log
./a/alogfile3.log
./a/alogfile9.log
./a/alogfile8.log
./a/alogfile5.log
./a/alogfile10.log
./a/alogfile4.log
./a/alogfile7.log
./a/alogfile1.log
./a/alogfile6.log
./a                     // 最后处理文件夹
./downloads.cpio
.                       // 最后处理文件夹
➜  Music

```

this is useful when using find in conjunction with some archiving applications, like cpio or tar. ???



### Why do we use `find -depth` with `cpio`

https://unix.stackexchange.com/questions/453127/why-do-we-use-find-depth-with-cpio


Most cpio implementations are dumb and do not manage directory permissions
while unpacking archives.

If a directory has no write access and the cpio archive is in the usual order
from find, the directory would be first in the cpio archive and unpacked first
from the cpio archive. When such a "readonly" directory has been unpacked and
given it's permissions, it has no permissions to put files into when later the
directory content is seen in the archive and going to be unpacked.

one solution for this cpio problem is to create archives where the content of a
directory comes first and the related directory comes after the content. This
causes cpio to create the missing directory (if called with -d to create
missing directories) with default permissions, extract the files inside from
the archive and later, when the directory is seen in the archive, set the
permissions to "readonly".

another solution is to extract the archive with a dumb cpio implementation as
root, since root is permitted to create files even inside a readonly directory.

the third solution is to use a modern cpio implementation like the cpio
emulation inside star. star remembers the directory permissions from the
archive, but creates the directory with intermediate write permissions first.
The remembered real directory permissions are set delayed by star, after the
files in the archive have been extracted into the directory with intermediate
write permission.


就是说如果归档里，如果首先解压文件夹如果这个文件夹还是只读的，那还怎么往里边写
文件，而如果先处理最底层的文件，上一层是目录就创建目录，最后统一权限即可。

所以 find 要加 -depth 选项



