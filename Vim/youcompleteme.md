编译安装vim 支持python3

./configure ./configure --with-features=huge --enable-multibyte --enable-rubyinterp  --enable-python3interp --enable-luainterp --enable-cscope  --enable-perlinterp  --with-python3-config-dir=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu --prefix=/usr/local/vim

make && make install


打开vim时提示: ERROR: Python headers are missing in /usr/include/python3.6m.

```
cd /root/.vim/bundle/YouCompleteMe/

git submodule update --init --recursive

apt install python3-dev build-essential cmake

./install.py --clang-completer --go-completer
make && make install

python install.py --gocode-completer

```
