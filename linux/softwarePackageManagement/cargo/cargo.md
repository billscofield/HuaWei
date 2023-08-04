# cargo

In Linux, Cargo is the package manager and build system for Rust programming
language

yum -y install cargo
apt install -y cargo

此时还没有 ~/.cargo 目录, 运行 cargo install dutree, 不必等待结束，Ctrl c 即可，
此时进入 ~/.cargo 目录, `touch config`

```
[source.crates-io]
#registry = "https://github.com/rust-lang/crates.io-index"
replace-with = 'tuna'

# 替换成速度比较快的镜像源，这里使用上海交大的。
replace-with = 'sjtu'

# 清华大学[source.tuna]
registry = "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git"

# 上海交通大学[source.sjtu]
registry = "https://mirrors.sjtug.sjtu.edu.cn/git/crates.io-index"

# rustcc社区[source.rustcc]
registry = "git://crates.rustcc.cn/crates.io-index"
```
