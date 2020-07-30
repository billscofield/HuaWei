
## compton - a compositor for X11

compositing window manager, or compositor, is a window manager that provides applications with an off-screen buffer for each window.
The window manager composites the window buffers into an image reprenting the screen and writes the result into teh display memory.


composit    混合的，合成的，复合的

compositor [印刷]排字工人

compton is a compositor based on Dana Jansens' version of xcompmgr (which itself was written by Keith Packard). It includes some
improvements over the original xcompmgr, like window frame opacity and inactive window transparency.


Compositing window managers may perform additional processing on buffered windows, applying 2D and 3D animated effects such as blending, fading, scaling, rotation, duplication, bending and contortion, shuffling, blurring, redirecting applications, and translating windows into one of a number of displays and virtual desktops. Computer graphics technology allows for visual effects to be rendered in real time such as drop shadows, live previews, and complex animation.[3][4] Since the screen is double buffered, it does not flicker during updates.

The most commonly used compositing window managers include:

Linux, BSD, Hurd and OpenSolaris—Compiz, KWin, Xfwm, Enlightenment, xcompmgr, picom and Mutter.
Windows—the Desktop Window Manager
macOS—the Quartz Compositor

https://en.wikipedia.org/wiki/Compositing_window_manager

---

Picom is a standalone compositor for Xorg, suitable for use with window managers that do not provide compositing. 

Picom is a fork of compton, which is a fork of xcompmgr-dana, which in turn is a fork of xcompmgr.

    https://wiki.archlinux.org/index.php/Picom




### backend

backend = 'xrender'
        = 'glx'

GLX backend is typically much faster but depends on a sane driver


$mod + shift + space : to float a window

### ~/.config/compton

坐标系：左上角为零，向右，向下为正方向

```
# Shadow  是否显示阴影
shadow = true;


# shadow 颜色
shadow-red = 0.0;
shadow-green = 0.0;
shadow-blue = 0.0;
shadow-opacity = 0.5;   shadow 不透明度


# shadow 位置
shadow-offset-x = -7;   shadow 向左 方向偏移，就好像太阳在往右边越来越远
shadow-offset-x = 7;    shadow 向右 方向偏移，就好像太阳在往左边越来越远
shadow-offset-y = 

# shadow-radius = 2;    shadow边缘柔和度，零为坚硬

# clear-shadow = true;  window 内部是否被shadow颜色覆盖, 好像阴影是在window上边而不是下边


shadow-exclude = [
    "!I3_FLOATING_WINDOW@:c",    // exclude  i3wm 的非 floating , 即只有浮动 window 才有 shadow
]


i3wm启动窗口指定浮动窗口的大小和位置

    for_window [class="窗口"] floating enable resize set 640 480,move right 330px,move down 70px



---



opacity

$mod + s  stacking(堆栈式)   
$mod + w  tabbed(table标签式)
$mod + e  toggle split(平铺式)





```
