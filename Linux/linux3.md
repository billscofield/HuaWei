
/proc/cpuinfo
/proc/interrupts
/proc/dma
/proc/ioports
/proc/sys/net/ipv4/ip_forward



## 关于更改 pts 或 tty 下光标的形状和闪烁

下面的命令在 debian 上OK

1. 禁止光标闪烁
    
    echo 0 > /sys/class/graphics/fbcon/cursor_blink


2. 光标形状

    不知道设置的是哪个参数了，设置完之后不会立即生效，还需要执行一条命令

    /sys/module/vt/parameters/    

    setterm --cursor off  &&  setterm --cursor on

https://unix.stackexchange.com/questions/55423/how-to-change-cursor-shape-color-and-blinkrate-of-linux-console#:~:text=Assuming%20you%20use%20GNU%2FLinux%20and%20have%20root%20access%2C,%2Fsys%2Fmodule%2Fvt%2Fparameters%2Fcur_default%20file.%20By%20doing%20will%20set%20%22block%20cursor%22.

