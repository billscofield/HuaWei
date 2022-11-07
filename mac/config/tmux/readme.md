
## 将 mac 上的 prefix 改为 cmd + s

使用 item

[键盘常用ASCII码 & Ctrl组合键](http://blog.chinaunix.net/uid-25063573-id-2420369.html)

Ctrl组合键ASCII码
ASCII值 控制字符  ASCII值 控制字符  ASCII值 控制字符  ASCII值 控制字符 
0(00)    NULL     8(08)     ^H      16(10)    ^P      24(18)    ^X
1(01)    ^A       9(09)     ^I      17(11)    ^Q      25(19)    ^Y
2(02)    ^B       10(0A)    ^J      18(12)    ^R      26(1A)    ^Z
3(03)    ^C       11(0B)    ^K      19(13)    ^S      27(1B)    ^[
4(04)    ^D       12(0C)    ^L      20(14)    ^T      28(1C)    ^\
5(05)    ^E       13(0D)    ^M      21(15)    ^U      29(1D)    ^]
6(06)    ^F       14(0E)    ^N      22(16)    ^V      30(1E)    ^^
7(07)    ^G       15(0F)    ^O      23(17)    ^W      31(1F)    ^_


In iTerm2, you can map shortcuts to hex codes that get sent into the terminal.
Goto
    iTerm2 Preferences -> Keys.

    In Global Shortcut Keys, click the + and add type your desired shortcut
    like the cmd+s, which will be captured.

    Then select "Send Hex Code".

    In the box that appears, type the hex codes that you want sent to tmux
    separated by spaces. Ctrl-B is 0x02, so for "Ctrl-B 1", type "0x02 0x31".
    See here for more hex codes: http://www.nthelp.com/ascii.htm





    ctrl s -> 0x13
    ctrl w -> 0x17
    ctrl u -> 0x15
    ctrl l -> 0x0c



