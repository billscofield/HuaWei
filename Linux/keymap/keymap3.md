
图形化界面和纯字符界面修改的方法不同，而且对相同按键的keycode定义不同


## 图形化界面

图形化界面的定义由xmodmap进行管理，通过xev命令在按下按键时会显示keycode定义如下：

KeyPress event, serial 37, synthetic NO, window 0x5a00001,
    root 0xd9, subw 0x0, time 414023, (-69,99), root:(516,406),
->  state 0x0, keycode 94 (keysym 0xffe1, Shift_L), same_screen YES,
    XKeysymToKeycode returns keycode: 50
    XLookupString gives 0 bytes:
    XmbLookupString gives 0 bytes:
    XFilterEvent returns: False

通过下面的命令进行重新映射，此处是将<按键映射为左shift

    xmodmap -e 'keycode 94 = Shift_L'

## 字符界面

字符界面通过 /etc/console-setup/cached.kmap.gz 进行管理，需要修改时要先将此文件解压，为避免出错最好备份一下：

cp cached.kmap.gz cached.kmap.gz.bak

gzip -d cached.kmap.gz

解压后vi cached.kmap，修改结束后要用gzip重新压缩gzip cached.kmap

需要注意的是字符界面下 keycode 的定义要通过 showkey 命令得到，而不是 xev, 字符界面下的定义与内核中的定义一致

同样示例将<按键映射为左shift，通过showkey得知<的keycode为86，删除原有86定义，复制42即shift的定义再修改keycode=86.

另附 linux key code Table:





## 

https://wiki.archlinux.org/index.php/Keyboard_input

https://wiki.archlinux.org/index.php/Map_scancodes_to_keycodes


### scancode

A scancode (or scan code) is the data that most computer keyboards send to a computer to report which keys have been pressed. A number, or sequence of numbers, is assigned to each key on the keyboard.


### modifier key 修饰键

In computing, a modifier key is a special key (or combination) on a computer keyboard that temporarily modifies the normal action of another key when pressed together. By themselves, modifier keys usually do nothing; that is, pressing any of the ⇧ Shift, Alt, or Ctrl keys alone does not (generally) trigger any action from the computer.


Keyboard mappings (keymaps)




