## 7za - A file archiver with highest compression ratio

apt-cache search 7za

p7zip - 7zr file archiver with high compression ratio
p7zip-full - 7z and 7za file archivers with high compression ratio
zipper.app - Archive manager for GNUstep

apt install p7zip-full



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





