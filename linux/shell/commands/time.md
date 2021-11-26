许多 shell 会自带一个 time 命令, 输出方式不太一样，所以我们需要指定使用 /usr/bin/time

    > /usr/bin/time -p

    -p  When in the POSIX locale, use the precise traditional format

        When the -p option is given the (portable) output format
            real %e
            user %U
            sys %S



    -f option or the TIME environment variable.

        The default format string is:
        
        %Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k
        %Iinputs+%Ooutputs (%Fmajor+%Rminor)pagefaults %Wswaps

    -f FORMAT, --format=FORMAT

        Specify output format, possibly overriding the format specified in the
        environment variable TIME.


    是标准错误输出

    因为time是shell的关键字，shell做了特殊处理，它会把time命令后面的命令行作为
    一个整体来进行处理，在重定向时，实际上是针对后面的命令来的，time命令本身的
    输出并不会被重定向的

    第一种解决方法，就是将time命令和将要执行的命令行放到一个shell代码块中，也就
    是一对大括号中
        
        要注意空格和分号的使用。
        
        [root@web186 root]# { time find . -name "mysql.sh"; } 2>2.txt

    第二种方式就是使用子Shell的方式
        
        (time command-line) 2>file
        
        这里time紧贴着小括号(也可以的，命令行结束也不必带分号。当然最好还是用第
        一种方式，毕竟启动一个子shell是要多占些资源的。)
