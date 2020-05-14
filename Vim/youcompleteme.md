
打开vim时提示: ERROR: Python headers are missing in /usr/include/python3.6m.

```
cd /root/.vim/bundle/YouCompleteMe/

git submodule update --init --recursive

apt install python3-dev build-essential cmake

./install.py --clang-completer --go-completer

python install.py --gocode-completer

```
