-r  Recursively copy entire directories.  

    Note that scp follows symbolic links encountered in the tree traversal.
    traversal: 遍历

    like cp
        -P, --no-dereference
        -L, --dereference
        -n, --no-clobber(击倒；痛打)
            do not overwrite an existing file (overrides a previous -i option)
            
        --strip-trailing-slashes
            remove any trailing slashes from each SOURCE argument
            
        -s, --symbolic-link
            make symbolic links instead of copying
            
        -S, --suffix=SUFFIX
            override the usual backup suffix

