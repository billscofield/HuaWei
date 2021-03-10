## 7za - A file archiver with highest compression ratio



7za <command> [<switches>... ] <archive_name> [<file_names>... ] [<@listfiles>... ]


apt-cache search 7za

p7zip - 7zr file archiver with high compression ratio
p7zip-full - 7z and 7za file archivers with high compression ratio
zipper.app - Archive manager for GNUstep

apt install p7zip-full

---

COMMANDS
|   a      Add files to archive
|   d      Delete files from archive
|   e      Extract files from archive (without using directory names)
|   x      eXtract files with full paths

|   b      Benchmark 基准，标准检查程序; 测试 CPU 运行速度及检查内存错误
|           7za b

|   h      Calculate hash values for files
|   i      Show information about supported formats
|   l      List contents of archive
|   rn     Rename files in archive
|   t      Test integrity of archive
|   u      Update files to archive




-t{Type}
    Set type of archive 
    (7z, zip, gzip, bzip2 or tar. 7z format is default)     // debian 的帮助页里没有这个

i      Show information about supported formats

x      eXtract files with full paths
a      Add files to archive
d      Delete files from archive
l      List contents of archive

b      Benchmark
e      Extract files from archive (without using directory names)
h      Calculate hash values for files
rn     Rename files in archive
t      Test integrity of archive
u      Update files to archive



-r[-|0]
    Recurse subdirectories (CAUTION: this flag does not do what you think, avoid using it)
 







## 创建

7za a -r targetfile   sourcefile
    默认是 "7-zip archive data, version 0.4" 格式


解压缩文件

    7za x -r bashrc_bk -o/root/test

    -i[r[-|0]]{@listfile|!wildcard}
        Include filenames
        
        -i 指定压缩时附加文件或一类文件。此选项可附件添加多个类型。
        
        i[] 其中为可以为r[- | 0]（具体的-r选项见后面-r），可以为@{listfile} | !{wildcard}。
        7z a -tzip src.zip *.txt -ir!DIR1\*.cpp ：从当前目录中添加 *.txt 文件，和 DIR1 目录及其子目录中的 *.cpp 文件到 src.zip 压缩档案。

    -x[r[-|0]]]{@listfile|!wildcard}
        Exclude filenames
        
        -x 指定某一文件或某一类文件从操作中排除。此选项可同时排除多个类型。
        x[] 其中为可以为r[- | 0]（具体的-r选项见后面-r），可以为@{listfile} | !{wildcard}。
        7z a -tzip archive.zip *.txt -x!temp.* ：添加除 temp.* 文件之外的所有 *.txt 文件到压缩档案 archive.zip

    貌似只有  -ai,   -ax

    -o 指定释放文件的输出文件夹。此选项只能和释放命令配合使用。

    -r 开启递归子目录。对于 e (释放)、l (列表)、t (测试)、x (完整路径释放) 这些在压缩档案中操作的命令， 会默认使用此选项。





```
➜  ~ tree 7zatest
7zatest                     <------文件夹1
├── a.log                                       <---文件1
├── a.py                                        <---文件2
└── Mail                    <------文件夹2
    ├── draft                                   <---文件3
    ├── inbox                                   <---文件4
    ├── Mail                                    <---文件5
    ├── seen                                    <---文件6
    ├── sent                                    <---文件7
    └── sub                 <------文件夹3
        └── services                            <---文件8





7za a -t7z -r Mytest.7z /opt/test/
7za a -t7z -r Mytest.7z /opt/test
    Date      Time    Attr         Size   Compressed  Name
    ------------------- ----- ------------ ------------  ------------------------
    2021-03-05 19:29:14 D....            0            0  7zatest
    2021-03-05 19:29:51 D....            0            0  7zatest/Mail
    2021-03-05 19:29:55 D....            0            0  7zatest/Mail/sub
    2021-03-05 19:29:14 ....A            0            0  7zatest/Mail/inbox
    2021-03-05 19:29:14 ....A            0            0  7zatest/Mail/seen
    2021-03-05 19:29:14 ....A            6         8241  7zatest/Mail/Mail
    2021-03-05 19:29:14 ....A          453               7zatest/Mail/draft
    2021-03-05 19:29:14 ....A          472               7zatest/Mail/sent
    2021-03-05 19:29:55 ....A        18774               7zatest/Mail/sub/services
    2021-03-05 19:29:14 ....A         2150               7zatest/a.log
    2021-03-05 19:29:14 ....A          235               7zatest/a.py
    ------------------- ----- ------------ ------------  ------------------------
    2021-03-05 19:29:55              22090         8241  8 files, 3 folders



7za a -t7z -r Mytest.7z /opt/test/*

   Date      Time    Attr         Size   Compressed  Name
   ------------------- ----- ------------ ------------  ------------------------
   2021-03-05 19:29:51 D....            0            0  Mail
   2021-03-05 19:29:55 D....            0            0  Mail/sub
   2021-03-05 19:29:14 ....A            0            0  Mail/inbox
   2021-03-05 19:29:14 ....A            0            0  Mail/seen
   2021-03-05 19:29:14 ....A            6         8241  Mail/Mail
   2021-03-05 19:29:14 ....A          453               Mail/draft
   2021-03-05 19:29:14 ....A          472               Mail/sent
   2021-03-05 19:29:55 ....A        18774               Mail/sub/services
   2021-03-05 19:29:14 ....A         2150               a.log
   2021-03-05 19:29:14 ....A          235               a.py
   ------------------- ----- ------------ ------------  ------------------------
   2021-03-05 19:29:55              22090         8241  8 files, 2 folders
   ➜

7za a -t7z -r Mytest.7z /opt/test               // 文件名包含 test 前缀
7za a -t7z -r Mytest.7z /opt/test/*             // 文件名不包含 test 前缀



t

7za t 7zatest.7z

7-Zip (a) [64] 16.02 : Copyright (c) 1999-2016 Igor Pavlov : 2016-05-21
p7zip Version 16.02 (locale=en_US.UTF-8,Utf16=on,HugeFiles=on,64 bits,1 CPU Intel(R) Xeon(R) CPU E3-1240 v3 @ 3.40GHz (306C3),ASM,AES-NI)

Scanning the drive for archives:
1 file, 8538 bytes (9 KiB)

Testing archive: 7zatest.7z
--
Path = 7zatest.7z
Type = 7z
Physical Size = 8538
Headers Size = 297
Method = LZMA2:24k
Solid = +
Blocks = 1

Everything is Ok

Folders: 3                  <----3个文件夹
Files: 8                    <----8个文件
Size:       22090
Compressed: 8538









7z x archive.zip ：从压缩档案 archive.zip 中释放所有文件到当前文件夹。
7z x archive.zip -oc:\soft *.cpp ：从压缩档案 archive.zip 中释放 *.cpp 文件到 c:\soft 文件夹。
```





u 在压缩档案文件中使用较新的文件替换掉较旧的文件。???

    7z u archive.zip *.doc ：在压缩档案 archive.zip 中更新 *.doc 文件。




7za x '-i!*/a.py' -o'./111/' 7zatest.7z'                // 只解压a.py 这个文件, 很奇怪，必须有/才行
7za x '-x!7zatest/a.log' -o'111'  7zatest.7z            // 解压所有文件，除了 7zatest/a.log 文件
7za x '-x!*a.py' -o'111'  7zatest.7z                    // 奇怪了，wildcard 不管用，必须是全名 或者 带上slash 才可以
7za x '-x!/a.py' -o'111'  7zatest.7z                    // 奇怪了，wildcard 不管用，必须是全名 或者 带上slash 才可以




SWITCHES
--     Stop switches parsing
-ai[r[-|0]]{@listfile|!wildcard}
    Include archives

-ax[r[-|0]]{@listfile|!wildcard}
    Exclude archives

-ao{a|s|t|u}
    Set Overwrite mode

-an    Disable archive_name field

-bb[0-3]
    Set output log level

-bd    Disable progress indicator

-bs{o|e|p}{0|1|2}
    Set output stream for output/error/progress line

-bt    Show execution time statistics

-i[r[-|0]]{@listfile|!wildcard}
    Include filenames

-m{Parameters}
    Set Compression Method (see /usr/share/doc/p7zip/DOC/MANUAL/cmdline/switches/method.htm from the p7zip-full package for a list of methods)

-o{Directory}
    Set Output directory

-p{Password}
    Set Password (NOTE: this flag does not work with 7zr)

-r[-|0]
    Recurse subdirectories (CAUTION: this flag does not do what you think, avoid using it)

-sa{a|e|s}
    Set archive name mode

-scc{UTF-8|WIN|DOS}
        Set charset for for console input/output

-scs{UTF-8|UTF-16LE|UTF-16BE|WIN|DOS|{id}}
    Set charset for list files

-scrc[CRC32|CRC64|SHA1|SHA256|*]
    Set hash function for x, e, h commands

-sdel  Delete files after compression

-seml[.]
    Send archive by email

-sfx[{name}]
    Create SFX archive

-si[{name}]
    Read data from stdin (e.g. tar cf - directory | 7za a -si directory.tar.7z)

-slp   Set Large Pages mode

-slt   Show technical information for l (List) command

-snh   Store hard links as links

-snl   Store symbolic links as links

-sni   Store NT security information

-sns[-]
    Store NTFS alternate streams

-sfx[{name}]
    Create SFX archive

-so    Write data to stdout (e.g. 7za x -so directory.tar.7z | tar xf -)

-spd   Disable wildcard matching for file names

-spe   Eliminate duplication of root folder for extract command

-spf   Use fully qualified file paths

-ssc[-]
    Set sensitive case mode

-ssw   Compress shared files

-stl   Set archive timestamp from the most recently modified file

-stm{HexMask}
    Set CPU thread affinity mask (hexadecimal number)

-stx{Type}
    Exclude archive type

-t{Type}
    Set type of archive

-u[-][p#][q#][r#][x#][y#][z#][!newArchiveName]
    Update options

-v{Size}[b|k|m|g]
    Create volumes

-w[path]
    Set working directory. Empty path means a temporary directory

-x[r[-|0]]]{@listfile|!wildcard}
    Exclude filenames

-y     Assume Yes on all queries



---


Backup and limitations
DO NOT USE the 7-zip format for backup purpose on Linux/Unix because :
    - 7-zip does not store the owner/group of the file.

On Linux/Unix, in order to backup directories you must use tar :
    - to backup a directory  : tar cf - directory | 7za a -si directory.tar.7z
    - to restore your backup : 7za x -so directory.tar.7z | tar xf -

If you want to send files and directories (not the owner of file) to others Unix/MacOS/Windows users, you can use the 7-zip format.

example : 7za a directory.7z  directory

Do not use "-r" because this flag does not do what you think.


```
Do not use directory/* because of ".*" files (example : "directory/*" does not match "directory/.profile")

7-Zip 支持和 Windows 相类似的通配符：
“*”可以使用星号代替零个或多个字符。 
“?”可以用问号代替名称中的单个字符。
如果只用*，7-Zip 会将其视为任何扩展名的全部文件
```





LZMA，（Lempel-Ziv-Markov chain-Algorithm的缩写），是一个Deflate和LZ77算法改良和优化后的压缩算法








hash 有很多算法, 如:
    CRC32, CRC64, MD5, SHA1, SHA256




    
