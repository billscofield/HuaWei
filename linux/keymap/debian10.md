

##

/usr/share/X11/xkb/keycodes/evdev

    It contains the mappings of key locations to key codes


You can obtain physical location of keys by examining keyboard geometry. Run "setxkbmap -print -verbose 10" 

and you will see a geometry include statement. Examine files in X11/xkb/geometry (most probably one named "pc"). 

You will also see which mapping is in use. I don't know programmatic equivalent to setxkbmap -print but there 

definitely is one. I'm not sure what happens if the user remaps his keyboard with xmodmap, but I'd say let them deal with it. 

(links: https://stackoverflow.com/questions/38552572/get-scancode-rather-than-keycode-on-linux-using-x11)



## setxkbmap

### 安装
    
apt-cache search setxkbmap

apt install x11-xkb-utils

### 说明/使用

setxkbmap - set the keyboard using the X Keyboard Extension


The setxkbmap command maps the keyboard to use the layout determined by the options specified on the command line.

An  XKB  keymap  is constructed from a number of components which are compiled only as needed.  The source for all of
the components can be found in /usr/share/X11/xkb.

In the X Window System, every individual, physical key is associated a number in the range 8–255, called its keycode. 
A keycode only identifies a key, not a particular character or term (e.g., "Page Up") among the ones that may be printed on the key. 
Each one of these characters or terms is instead identified by a keysym. 
While a keycode only depends on the actual key that is pressed, 
**a keysym may depend, for example, on whether the Shift key or another modifier was also pressed.**


When a key is pressed or released, the server sends events of type KeyPress or KeyRelease to the appropriate clients. These events contain:
    1. the keycode of the pressed key
    1. the current state of the modifiers (Shift, Control, etc.) and mouse buttons

The server therefore sends the keycode and the modifier state without attempting to translate them into a specific character. 
It is a responsibility of the client to do this conversion. For example, a client may receive an event stating that a given key has been pressed while the Shift modifier was down. 
If this key would normally generate the character "a", the client (and not the server) associates this event to the character "A".


While the translation from keycodes to keysyms is done by the client, the table that represents this association is maintained by the server. 
Storing this table in a centralized place makes it accessible to all clients. Typical clients only request this mapping and use it for decoding the keycode and modifiers field of a key event into a keysym. 
However, clients can also change this mapping at will.


A modifier is a key that, when pressed, changes the interpretation of other keys. 
A common modifier is the Shift key: when the key that normally produces a lowercase "a" is pressed together with Shift, it produces an uppercase "A". 
Other common modifiers are "Control", "Alt", and "Meta".


The X server works with at most eight modifiers. However, each modifier can be associated with more than one key. 
This is necessary because many keyboards have duplicated keys for some modifiers. 
For example, many keyboards have two "Shift" keys (one on the left and one on the right). 
These two keys produce two different keycodes when pressed, but the X server associates both with the "Shift" modifier.


For each of the eight modifiers, the X server maintains a list of the keycodes that it consider to be that modifier. 
As an example, if the list of the first modifier (the "Shift" modifier) contains the keycode 0x37, then the key that produces the keycode 0x37 is considered a shift key by the X server.


The lists of modifier mappings is maintained by the X server but can be changed by every client. 
For example, a client can request the "F1 key" to be added to the list of "Shift" modifiers. 
From this point on, this key behaves like another shift modifier. 
However, the keycode corresponding to F1 is still generated when this key is pressed. 
As a result, F1 operates as it did before (for example, a help window may be opened when it is pressed), 
but also operates like the shift key (pressing "a" in a text editor while F1 is down adds "A" to the current text).


The X server maintains and uses a modifier mapping for the mouse buttons. 
However, the buttons can only be permuted. 
This is mostly useful for exchanging the leftmost and rightmost button for left-handed users.


The xmodmap program shows and changes the key, modifier, and mouse button mappings.



    +-------------------------------------------------------+           +-------------------------------------------+
    |                                                       |           |                                           |
    |           +----------+                                |           |           client                          |
    |           | modifier |<----------------------------------------------------                                   |
    |           | mapping  |                                |           |                                           |
    |           +----------+                                |           |                                           |
    |                |                                      |           |                                           |
    |                |                                      |           |                                           |
    |               \|/                                     |           |                                           |
    |           +-----------+        +----------------+     |           |                                           |
    |           | modifier? |------->| modifiers      |     |           |                                           |
    |           |           |        | currently down |     |           |                                           |
    |           +-----------+        +----------------+     |           |                                           |
    |               /|\                     |               |           |           +-----------+                   |
    |                |                      --------------------------------------> | converter |------> keysym     |
    |   keycode-------------------------------------------------------------------> |           |                   |
    |                                                       |           |           +-----------+                   |
    |                                                       |           |                /|\                        |
    |                                                       |           |                 |                         |
    |                                                       |           |       +---------------+                   |
    |   X server        +-------------+ <---------------------------------------| key mapping   |                   |
    |                   | key mapping |                     |           |       | (local copy)  |                   |
    |                   +-------------+ ----------------------------------------|               |                   |
    |                                                       |           |       +---------------+                   |
    +-------------------------------------------------------+           +-------------------------------------------+
    https://upload.wikimedia.org/wikipedia/commons/b/b8/Xkeyboard.svg




## 

https://www.bilibili.com/read/cv5156572/

Linux中一个按键从按下到得到最终效果需要三次处理：

KEYBOARD   -->   scancode   -->   keycode   -->   keysymbol

           ①键盘电路       ②内核处理       ③软件设置

1. 键盘硬件把你的按键行为转换成计算机能识别的  scancode

1. 系统内核把scancode转换成TTY或X11需要使用的  keycode

1. TTY或X11的设置把keycode转换成具体的按键目的 keysymbol

厂商制造的键盘，要根据标准设置好每个物理位置的按键发出的scancode。操作系统根据最常见和最通用的功能布局：QWERTY，把scancode和keycode对应起来。（而且由于极其常见且通用，所以US-QWERTY也是通常情况的默认功能布局）

我们要达到自己的需求，交换LeftCtrl和leftAlt、或交换LeftCtrl和CapsLock、或交换Esc和CapsLock等功能，其实只需要把内置的scancode->keycode mapping修改成我们需要的样子就可以了。

并且因为这个修改对内核以上的软件透明，所以不会对上层应用的按键处理逻辑产生任何的额外影响。也就不会产生那些奇奇怪怪的问题，这正是我们所需要的。


    QWERTY布局，System key为Win键，在Linux下常称为“Super”键或“Mod4”键


修改原理简述：默认的scancode->keycode mapping由 hwdb 维护，hwdb 除此之外还包括并维护了其他各类硬件的信息。详见/usr/lib/udev/hwdb.d/目录及man Page  hwdb(7)-ZH  hwdb(7)-EN

所需工具：

    evtest（查看某个按键的具体scancode）

    udevadm（更新自定义配置，查看配置内容，集成在systemd中，但是部分不使用systemd的发行版也会有udevadm的包提供，详见各发行版wiki）

        udevadm trigger

任何文本编辑器（编辑你的自定义配置……）

所需权限：

    root（建议全程在root环境操作，不要使用sudo，可能会一些奇妙的问题）




## 


1.首先获得你需要特定键盘上的某个键的scancode：

见Archwiki - Keyboard input #USE evtest

切换到root身份（非sudo）运行evtest，你可以看到像下图一样的输出

/dev/input/event 就是输入设备，右边会跟着每个输入设备的名字

注意如果是USB键盘，同时会显示有多个输入设备。比如我的Ducky AKKO 3087就显示了多个相关设备（event8、event23～event26），它们是由于USB键盘使用了一个叫HID的规范而产生的。我们只关心第一个，也就是/dev/input/event8，其他的不需要理会。
