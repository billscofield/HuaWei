tty

    tty指的是七个alt+crtl+F1~F7。
    tty1-tty6表示文字界面，可以用Ctrl+Alt+F1-F6切换，+F7就是切换回图形界面。

pts(pseudo ['sjuːdəʊ]']假的 pseudo-terminal slave)

    但是如果我们远程telnet到主机或使用xterm时不也需要一个终端交互么？是的，这就
    是虚拟终端pty(pseudo-tty)

pty - pseudoterminal interfaces

pts/ptmx(pts/ptmx结合使用，进而实现pty): 在Xwindows模式下的伪终端.
pts(pseudo-terminal slave)是pty的实现方法，与ptmx(pseudo-terminal master)配合使用实现pty。
man里面是这样说的：ptmx and pts - pseudo-terminal master and slave，pts是所谓的伪终端或虚拟终端，具体表现就是你打开一
个终端，这个终端就叫pts/0，如果你再打开一个终端，这个新的终端就叫pts /1。



当使用 tmux 时, 调用 who 命令，我们会看到 tmux 的虚拟 tty
shell git:(master) ✗ who
root     pts/0        2019-07-15 06:49 (10.0.0.10)
root     pts/1        2019-07-15 06:58 (tmux(29091).%0)
root     pts/2        2019-07-17 08:39 (tmux(29091).%5)
root     pts/3        2019-07-15 06:58 (tmux(29091).%2)
root     pts/4        2019-07-18 11:12 (tmux(29091).%6)
root     pts/5        2019-07-19 13:29 (tmux(29091).%9)

目前我不太清除是如何分配的，但可以通过实验确定tmux的那些个窗口分别是pts/几
    echo "hello world">/dev/pts/0
