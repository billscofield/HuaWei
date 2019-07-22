tty
tty指的是七个alt+crtl+F1~F7。
tty1-tty6表示文字界面，可以用Ctrl+Alt+F1-F6切换，+F7就是切换回图形界面。

pts(pseudo ['sjuːdəʊ]']假的 pseudo-terminal slave)
但是如果我们远程telnet到主机或使用xterm时不也需要一个终端交互么？是的，这就是虚拟终端pty(pseudo-tty)

pty - pseudoterminal interfaces

pts/ptmx(pts/ptmx结合使用，进而实现pty): 在Xwindows模式下的伪终端.
pts(pseudo-terminal slave)是pty的实现方法，与ptmx(pseudo-terminal master)配合使用实现pty。
man里面是这样说的：ptmx and pts - pseudo-terminal master and slave，pts是所谓的伪终端或虚拟终端，具体表现就是你打开一
个终端，这个终端就叫pts/0，如果你再打开一个终端，这个新的终端就叫pts /1。


