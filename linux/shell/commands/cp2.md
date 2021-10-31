
## The **--preserve=links** option does not refer to symbolic links, but to hard links. It asks cp to preserve any existing hard link between two or more files that are being copied.

    ```
    $ date > file1
    $ ln file1 file2
    $ ls -1i file1 file2
    6034008 file1
    6034008 file2
    ```

You can see that the two original files are hard-linked and their inode number is 6034008.

    ```
    $ mkdir dir1
    $ cp file1 file2 dir1
    $ ls -1i dir1
    total 8
    6035093 file1
    6038175 file2
    ```

You can see now that without --preserve=links their copies have two different inode numbers: there is no longer a hard link between the two.

    ```
    $ mkdir dir2
    $ cp --preserve=links file1 file2 dir2
    $ ls -1i dir2
    total 8
    6089617 file1
    6089617 file2
    ```

**You can see now that with --preserve=links, the two copies are still hard-linked, but their inode number is 6089617, which is not the same as the inode number of the original files (contrary to what cp --link would have done).**

https://unix.stackexchange.com/questions/386979/info-on-cp-preserve-links




## --no-deference
Copy symbolic links as symbolic links rather than copying the files that they point to;

https://www.unix.com/unix-for-dummies-questions-and-answers/212973-solved-copy-question.html


## --preserve=mode
mode 权限，chmod
