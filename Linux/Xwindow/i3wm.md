
xorg-server xorg-xinit  //运行图形界面需要的库(Arch)
lightdm         ??


apt install i3

apt install xcompmgr    //设置半透明

apt install feh         //设置背景


注销后重新进入，选择登陆桌面管理器 i3

进行 mod 键设置

mod + enter 打开terminal

vi ~/.config/i3/config

exec --no-staretup-id xcompmgr &

exec_always --no-startup-id feh --bg-scale "/home/bill/Pictures/super.jpg"


### 窗口透明度

transset工具用来设置单个窗口的透明度，透明特效可能会降低系统性能。

先启动要设置透明度的程序，然后运行：

transset n
.. 此处 n 是0到1之间的数字，0表示完全透明（不可见），1表示不透明。例如：transset .25 代表75%的透明度。

运行后，鼠标会变成十字形。点击要设置的窗口，即可应用透明度设置。


### 快捷键

垂直方向上创建窗口      mod + v         
水平方向上创建窗口      mod + h

激活窗口                mod + 方向键    
创建工作区workspace     mod + 数字键

switch between different layout
    1) default layout(tiling)   mod + e
    2) stack layout             mod + s
    3) tab layout               mod + w

