
rxvt-unicode  即 urxvt

rxvt

By the standards of the time, xterm was a heavyweight program but, as time went
by, some of its features were rarely used such as the Tektronix emulation.
Around 1990, in an attempt to create a simpler, lighter terminal emulator,
Robert Nation wrote rxvt as part of the FVWM window manager, an early desktop
environment for Unix-like systems.

rxvt has a smaller feature set than xterm and emulates the DEC VT 102 terminal
rather than the more advanced VT 220. rxvt sets the TERM variable to “rxvt”,
which is widely supported. Like xterm, rxvt has menus that are displayed by
holding the Ctrl key and pressing different mouse buttons.

rxvt is still under active maintenance, and there is a popular modern
implementation forked from the original called urxvt (rxvt-Unicode) by Mark
Lehmann, which supports Unicode (multi-byte characters used to express a wider
range of written languages than ASCII). One interesting feature in urxvt is a
daemon mode that allows launching multiple terminal windows all sharing the
same instance of the program- a potential memory saver.

Like xterm, rxvt uses Xresources to control its configuration. The default rxvt
configuration is very spare. Adding the following settings to our Xresources
file will make it more palatable (urxvt shown):

    URxvt.geometry: 80x35
    URxvt.saveLines: 10000
    URxvt.scrollBar: false
    URxvt.foreground: white
    URxvt.background: black
    URxvt.secondaryScroll: true
    URxvt.font: xft:liberation mono:size=11
    URxvt.cursorBlink: true
