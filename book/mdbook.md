# [mdbook](https://rust-lang.github.io/mdBook/index.html)

由 rust 开发

缺点:
    无法导出为 PDF
    搜索只支持英文

文件夹中执行 mdbook init
    - .gitignore?
    - title?

    ```
    .
    ├── book
    ├── book.toml           // 图书元信息
    └── src                 // markdown 就放在这个目录
        ├── chapter_1.md
            └── SUMMARY.md  // 目录, 侧边栏

    ```

    mdbook build

        将 markdown 生成到 book 文件夹

    mdbook serve

        修改后会自动 mdbook build && mdbook serve

        -p, --port

## SUMMARY.md
