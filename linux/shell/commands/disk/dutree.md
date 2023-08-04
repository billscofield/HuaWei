# dutree

~/.cargo/bin/dutree

    -d, --depth [DEPTH] show directories up to depth N (def 1) 默认应该是2
    -a, --aggr [N[KMG]] aggregate(总计的) smaller than N B/KiB/MiB/GiB (def 1M)
        -d1 -a1M 不满 1MB 的文件会被统一在一个单独的 aggregated 行进行统计
        -d1 -a 会对最小的文件使用最小的 1B 单位，故而不会有 aggregated 行

    -s, --summary       equivalent to -da, or -d1 -a1M

    -u, --usage         report real disk usage instead of file size
    -f, --files-only    skip directories for a fast local overview
    -x, --exclude NAME  exclude matching files or directories
    -H, --no-hidden     exclude hidden files

