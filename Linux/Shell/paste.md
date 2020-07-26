
## paste

merge lines of files

-d, --delimiters=LIST

    reuse characters from LIST instead of TABs

    ```
    ➜  diff cat a
    hello
    111

    ➜  diff cat b
    world
    111
    222
    333

    ➜  diff paste a b
    hello   world
    111     111
            222
            333

    ➜  diff paste a b -d:
    hello:world
    111:111
    :222
    :333
    ```

-s, --serial

    paste one file at a time instead of in parallel

    ```
    ➜  diff cat a
    hello
    111

    ➜  diff paste -s a
    hello   111

    ➜  diff paste -s b
    world   111     222     333

    ➜  diff paste -s a b
    hello   111
    world   111     222     333
    ```

    一般用于一个文件，有N个文件, 则有N行, 也可以使用-d选项
