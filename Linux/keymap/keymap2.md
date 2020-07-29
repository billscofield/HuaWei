


### xmodmap 

    1. -pke    This  option  indicates that the current **keymap table** should be printed on the standard output in the form of expressions that can
be fed back to xmodmap.

    1. 不加参数，显示 8 个 modifier 类

    1. -grammar

        Keysyms on the left hand side of the = sign are looked up before any changes are made; 
        keysyms on the right are looked up after all of those on the left have been resolved.  
        This makes it possible to swap modifier keys.

  
### xev - print contents of X events

### setxkbmap - set the keyboard using the X Keyboard Extension


### 查看

xmodmap -pke | less

keycode  66 = Caps_Lock NoSymbol Caps_Lock
keycode 133 = Super_L   NoSymbol Super_L



xmodmap -e 'clear lock'
xmodmap -e 'clear mod4'
xmodmap -e 'keycode 133 = Caps_Lock'
xmodmap -e 'keycode 66 = Super_L'
xmodmap -e 'add lock = Super_L'
xmodmap -e 'add mod4 = Caps_Lock'



### 交换 win 和 Caps_Lock

!一下配置的目的是为了更好地使用i3wm, i3wm 默认是 win 键 或者 alt 键，但是在 ~/.config/i3/config 中配置了 Mod = lock 后提示错误，只好如此先用着，待以>后找原因
clear lock
clear mod4
keycode 133 = Caps_Lock
keycode 66 = Super_L
add lock = Caps_Lock
add mod4 = Super_L
