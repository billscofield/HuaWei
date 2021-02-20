-P prefix
       --directory-prefix=prefix
           Set directory prefix to prefix.  The directory prefix is the directory where all other files and subdirectories will be saved to, i.e. the top of the retrieval tree.  The default is . (the
           current directory).
    
            ```
            wget http://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -P ~/.pyenv/cache/
            ```
