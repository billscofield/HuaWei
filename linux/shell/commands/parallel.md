
# parallel

确保使用gnu-parallel，而不是更多限制的moreutils包中的相同名称的实用程序

[History of GNU Parallel](https://www.gnu.org/software/parallel/history.html)

man parallel
man parallel_tutorial

    find . -type f | parallel 'mkdir -p /hadoop/{//}; rsync -a {} /hadoop/{}'

    $ find s -type f                // find 目录，会把目录参数也显示在结果里边，所以最好进入到该目录，用 find .
    s/one/one.txt
    s/one/two/two.txt
    s/one/two/three/model.sh
    s/one/two/three/three.txt
    s/2del.output.step01.list.sh

    - {} 是 parallel 里的占位符
    - {//} 代表目录结构，不包括文件


The command you've provided is a combination of the `find` and `parallel`
commands to parallelize the process of copying files from the current directory
to another directory while preserving their directory structure. Additionally,
it creates corresponding directories in the destination directory using the
`mkdir -p` command.

Here's a breakdown of the command:

1. `find . -type f`: This part of the command uses `find` to search for all
   files (`-type f`) in the current directory and its subdirectories (`.`).

2. `parallel 'mkdir -p /hadoop/{//}; rsync -a {} /hadoop/{}'`: This part uses
   the `parallel` command to execute the specified command for each file found
   by the `find` command.

    - `mkdir -p /hadoop/{//}`: This creates the necessary directory structure
      in the destination directory (`/hadoop/`) based on the original directory
      structure of the files being copied.

      **The `//` within the curly braces is replaced with the directory structure
      of the source file.**

    - `rsync -a {} /hadoop/{}'`: This uses `rsync` to copy the found file (`{}`)
      to the corresponding directory in the destination (`/hadoop/`). The `-a`
      flag indicates archive mode, which preserves file attributes and
      recursively copies directories.

    Overall, this command efficiently copies files while maintaining their
    directory structure in the destination directory.

    Keep in mind that this command assumes you have the `parallel` utility and
    the necessary permissions to create directories and copy files to the
    destination directory. Also, ensure that you understand the implications of
    the command and test it on a smaller scale before using it for large-scale
    operations.`'`

## 运行脚本

方式一:
    
    parallel a.sh       // 需要 Ctrl + d 确认不输入参数

方式二:

    cat a.sh | parallel

## parallel 参数

- --jobs N

    -j N
    --max-procs N
    -P N
       Number of jobslots on each machine.

       Run up to N jobs in parallel.  0 means as many as possible (this can take a while to determine). Default is
       100% which will run one job per CPU thread on each machine.

       Due to a bug -j 0 will also evaluate replacement strings twice up to the number of joblots:

         # This will not count from 1 but from number-of-jobslots
         seq 10000 | parallel -j0   echo '{= $_ = $foo++; =}' | head
         # This will count from 1
         seq 10000 | parallel -j100 echo '{= $_ = $foo++; =}' | head

       If --semaphore is set, the default is 1 thus making a mutex.

       See also: --use-cores-instead-of-threads --use-sockets-instead-of-threads

- --jobs +N

    -j +N
    --max-procs +N
    -P +N
       Add N to the number of CPU threads.

       Run this many jobs in parallel.

       See also: --number-of-threads --number-of-cores --number-of-sockets

    --jobs -N
    -j -N
    --max-procs -N
    -P -N
       Subtract N from the number of CPU threads.

       Run this many jobs in parallel.  If the evaluated number is less than 1 then 1 will be used.

       See also: --number-of-threads --number-of-cores --number-of-sockets

- --jobs N%

    -j N%
    --max-procs N%
    -P N%
       Multiply N% with the number of CPU threads.

       Run this many jobs in parallel.

       See also: --number-of-threads --number-of-cores --number-of-sockets

    --jobs procfile
    -j procfile
    --max-procs procfile
    -P procfile
       Read parameter from file.

       Use the content of procfile as parameter for -j. E.g. procfile could
       contain the string 100% or +2 or 10. If procfile is changed when a job
       completes, procfile is read again and the new number of jobs is
       computed. If the number is lower than before, running jobs will be
       allowed to finish but new jobs will not be started until the wanted
       number of jobs has been reached.  This makes it possible to change the
       number of simultaneous running jobs while GNU parallel is running.

