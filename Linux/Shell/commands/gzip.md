
## -c --stdout --to-stdout

Write output on standard output; keep original files unchanged.
If there are several input files,  the  output  consists  of  a
sequence of independently compressed members. To obtain better
compression, concatenate all input files before compressing them.


用来压缩单个文本文件的吧

gzip -c file1  > foo.gz
gzip -c file2 >> foo.gz


zcat 


## -t --test

Test. Check the compressed file integrity.



gzip, bzip2 本意是用来压缩单个文件的, 所以有 zcat 

---


bzip2  用法完全相同
