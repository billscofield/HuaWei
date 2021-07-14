
## 开机后没有输入法

运行 ibus-setup


## 没有声音

```
pcm.!default {
    type hw
    card 2
}

ctl.!default {
    type hw
    card 0
}

```
