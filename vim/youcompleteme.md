编译安装vim 支持python3

./configure ./configure --with-features=huge --enable-multibyte --enable-rubyinterp  --enable-python3interp --enable-luainterp --enable-cscope  --enable-perlinterp  --with-python3-config-dir=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu --prefix=/usr/local/vim

make && make install

# llvm 下载地址
# https://github.com/llvm/llvm-project/releases?after=llvmorg-11.0.0-rc5


打开vim时提示: ERROR: Python headers are missing in /usr/include/python3.6m.

```
cd /root/.vim/bundle/YouCompleteMe/

git submodule update --init --recursive

apt install python3-dev build-essential cmake

# 不建议使用 --clang-completer, 而是使用 --clangd-completer, 使用 clang 总是不成功, clangd 可以
# https://clangd.llvm.org/

./install.py --clang-completer --go-completer
make && make install

python install.py --gocode-completer

```



