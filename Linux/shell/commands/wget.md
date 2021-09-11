-P prefix
       --directory-prefix=prefix
           Set directory prefix to prefix.  The directory prefix is the
           directory where all other files and subdirectories will be saved to,
           i.e. the top of the retrieval tree.  The default is . (the current
           directory).
    
            ```
            wget http://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -P ~/.pyenv/cache/
            ```

使用代理

    -e command
    --execute command
        Execute command as if it were a part of .wgetrc.  A command thus
        invoked will be executed after the commands in .wgetrc, thus taking
        precedence over them.  If you need to specify more than one wgetrc
        command, use multiple instances of -e.
        
        wget http:.....  -e use_proxy=yes -e http_proxy=x.x.x.x:x -e https_proxy=x.x.x.x:x
