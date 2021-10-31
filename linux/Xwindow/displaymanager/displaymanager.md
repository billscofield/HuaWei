
# Display Manager (DM)

使用 i3 窗口管理器会降低你操作系统的内存占用；然而，Debian 依然会使用 GDM 作为登录屏。GDM 会载入几个与 GNOME 相关的库从而占用内存。


## 16 Best Linux Display Manager

https://www.slant.co/topics/2053/~best-linux-display-manager


## relation with Window Manager

The display manager is a bit of code that provides the GUI login screen for your Linux desktop. 
After you log in to a GUI desktop, the display manager turns control over to the window manager. 
When you log out of the desktop, the display manager is given control again to display the login 
screen and wait for another login.

##

There are several display managers—some are provided with their respective desktops. Note that some display managers are not directly associated with a specific desktop. Any of the display managers can be used for your login screen regardless of which desktop you are using. And not all desktops have their own display managers. Such is the flexibility of Linux and well-written, modular code.

The typical desktops and display managers are shown in the table below:

| Desktop | Display manager | Comments |
| :------ | :-------------- | :------- | 
| GNOME   | GDM             | GNOME Display Manager |
| KDE     | KDM             | KDE Display Manager (up through Fedora 20) |
|         | LightDM         | Lightweight Display Manager |
| LXDE    | LXDM            | LXDE Display Manager |
| KDE     | SDDM            | Simple Desktop Display Manager (Fedora 21 and above) |
|         | XDM             | Default X Window System Display Manager |



## Examples

### CDM (The Console Display Manager)

https://github.com/evertiro/cdm
https://gitee.com/billscofield/cdm.git

Very simple and minimalistic graphical interface.

There is no CDM in distros repositories (only in AUR on arch) However you always can compile it from source.

Standalone, no dependecies, lightweight support any DE/WM available on market

### tbsm (Terminal Based Session Manager)

tbsm is an application or session launcher, written in pure bash with no ncurses or dialog dependencies. It is inspired by cdm, tdm, in some way by krunner and related.

It was attempted to design the behavior of tbsm to be as less pesky as possible, and to start daily tasks with as less key strokes.

Furthermore is there the possibility to customize his look by themes.


http://loh-tar.github.io/tbsm/
