


### xmodmap 

    1. -pke    This  option  indicates that the current **keymap table** should be printed on the standard output in the form of expressions that can
be fed back to xmodmap.

    1. 不加参数，显示 8 个 modifier 类

    1. -grammar

        Keysyms on the left hand side of the = sign are looked up before any changes are made; 
        keysyms on the right are looked up after all of those on the left have been resolved.  
        This makes it possible to swap modifier keys.

  
### xev - print contents of X events

### showkey

xev 和 showkey 中的 keycode 不一样是什么情况???

```
➜  keymap git:(master) showkey
kb mode was UNICODE
[ if you are trying this under X, it might not work
since the X server is also reading /dev/console ]

press any key (program terminates 10s after last keypress)...

```

showkey 应该是用在 console 环境下的



### setxkbmap - set the keyboard using the X Keyboard Extension

执行这条命令 xmodmap 中的配置会被冲掉


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

vi ~/.Xmodmap

```
!以下配置的目的是为了更好地使用i3wm, i3wm 默认是 win 键 或者 alt 键，但是在 ~/.config/i3/config 中配置了 Mod = lock 后提示错误，只好如此先用着，待以后找原因

clear lock
clear mod4
keycode 133 = Caps_Lock
keycode 66 = Super_L
add lock = Caps_Lock
add mod4 = Super_L
```
