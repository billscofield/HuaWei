
Linux mingetty命令是精简版的getty。

mingetty适用于本机上的登入程序。


The mingetty program is a lightweight, minimalist getty program for use only on
virtual consoles.  Mingetty is not suitable for serial lines (you should use
the mgetty program in that case).


igetty is a type of tty and a tty is your text input/output environment


## What is the exact difference between a 'terminal', a 'shell', a 'tty' and a 'console'?


In unix terminology, the short answer is that: 

    terminal = tty = text input/output environment

    console = physical terminal

    shell = command line interpreter


teleprinter         [ˈteliprɪntə(r)]        电传打字机

typewriter          [ˈtaɪpraɪtə(r)]         打字机

tele typewriter      [ˌteliˈtaɪpraɪtə(r)]    电传打字机


--- 

https://www.britannica.com/technology/teleprinter

Teleprinter, also called Teletypewriter, any of various telegraphic instruments
that transmit and receive printed messages and data via telephone cables or
radio relay systems. Teleprinters became the most common telegraphic
instruments shortly after entering commercial use in the 1920s. They were used
by operators in local telegraph offices and switching centres, by press
associations and other private networks, and by subscribers to international
telegraphic message services such as telex (q.v.) Since the advent of low-cost,
high-speed data transmission in the 1980s, teleprinters have steadily given way
to computer terminals and facsimile (fax) machines.


https://unix.stackexchange.com/questions/4126/what-is-the-exact-difference-between-a-terminal-a-shell-a-tty-and-a-con

Console, terminal and tty are closely related. Originally, they meant a piece
of equipment through which you could interact with a computer: in the early
days of unix, that meant a teleprinter-style device resembling a typewriter,
sometimes called a teletypewriter, or “tty” in shorthand. 

The name “terminal” came from the electronic point of view, 
and the name “console” from the furniture point of view. 

Very early in unix history, electronic keyboards and displays became the norm(
标准，规范) for terminals.



Other ttys, sometimes called pseudo-ttys, are provided (through a thin kernel
layer) by programs called terminal emulators, such as Xterm (running in the X
Window System), Screen (which provides a layer of isolation between a program
and another terminal), Ssh (which connects a terminal on one machine with
programs on another machine), Expect (for scripting terminal interactions),
etc.


https://askubuntu.com/questions/14284/why-is-a-virtual-terminal-virtual-and-what-why-where-is-the-real-terminal

Virtual Terminals are merely programs that send keystrokes and receive output
(this is called Standard In, Standard Out[ and Standard Error ]) to a process
in the background. This is a basic input → processing → output system, and is
at the heart of your operating system.


https://unix.stackexchange.com/questions/72177/what-is-pts-0-and-0-0-in-linux-when-typing-who-am-i#:~:text=pts%20stands%20for%20pseudo%20terminal%20slave.%20A%20terminal,just%20the%20same%20facility%20only%20without%20the%20hardware.

pts stands for pseudo terminal slave. A terminal (or console) is traditionally
a keyboard/screen combination you sit and type at. Old UNIX boxes would have
dozens of them hanging off the back, all connected with miles of cable. A
pseudo terminal provides just the same facility only without the hardware. In
other words, it's an xterm window or a konsole window, or whatever utility you
use. They pop into life as you ask for them and get given sequential numbers:
pts/0, then pts/1 and so on. The physical console is the hardware which is
actually attached to your box - you probably only have one. That's labelled
":0" and is refered to as the actual "console".

you will find pts/0 listed in who output if there is a remote connection to ssh:

