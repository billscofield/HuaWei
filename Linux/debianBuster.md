## how to switch keymaps in X-window system

/etc/console-setup/

ll | grep kmap

showkey

keycode 56 = Alt
keycode 29 = Ctrl

重新压缩放到目录

这个只影响终端


---
X-Window


showkey
if you are trying this under X, it might not work
since the X server is alos reading /dev/console


图形界面下
/usr/share/X11/xkb/keycodes/evdev

    <LALT> = 64
    <LCTL> = 37

注销重新登录

## how to switch keymap in tty

tty and X-window are different from each other

## add a shortcut 


## go to tty

/etc/init.d/gdm3 stop

ctrl alt F3

## permit root to login

/etc/gdm3/daemon.conf
    [security]
    AllowRoot = true

/etc/pam.d/gdm-autologin
/etc/pam.d/gdm-password
    comment line that match '!=root quiet'



## iwlwifi 内核模块

apt install firmware-iwlwifi

modprobe iwlwifi




## vim python 模块

apt install python-dev
apt install python3-dev



/liujiao/huawei/Linux


:YcmRestartServer

    重新编译YCM

apt install ctags
