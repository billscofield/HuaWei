
## matplotlib

最流行的 Python 底层绘图库

from matplotlib import pyplot as plt    // 专门画图模块

%matplotlib inline                      // jupyter notebook 使用，不需调用 plt.show() 即显示图像，但好像不需要了



plt.xlabel("X 标题", fontsize=16)
plt.ylabel("Y 标题")


1. 不同的线条
    plt.plot([1,2,3,4,5],[1,4,9,16,25],'-')         // 实线
    plt.plot([1,2,3,4,5],[1,4,9,16,25],'--')        // dash虚线
    plt.plot([1,2,3,4,5],[1,4,9,16,25],':')         // 点线
    plt.plot([1,2,3,4,5],[1,4,9,16,25],'-.')        // dash虚点线
    plt.plot([1,2,3,4,5],[1,4,9,16,25],',')         // 像素点
    plt.plot([1,2,3,4,5],[1,4,9,16,25],'o')         // 圆点
    plt.plot([1,2,3,4,5],[1,4,9,16,25],'s')         // 正方点

1. 线条颜色
    plt.plot([1,2,3,4,5],[1,4,9,16,25],'s',color='red')         // 红色
    [r]ed
    [g]reen
    [b]lue
    [c]yan 青色
    [m]agenta 品红
    [y]ellow 黄色
    blac[k]
    [w]hite

    线条和颜色也可以写在一块

        plt.plot([1,2,3,4,5],[1,4,9,16,25],'ro')         // 圆点

风格
    plt.style.availabel

    x=np.linspace(-10,10)
    y=np.sin(x)
    plt.plot(x,y)
    plt.style.use('fast')

    plt.xkcd()              // 手绘风格


---
### 条形图

import numpy as np
import matplotlib.pypolit as plt
imprt matplotlib
matplotlib.use('nbagg')

np.random.seed(0)
x = np.arange(5)
y = np.random.randn(5)

fig,axes = plt.subplots(ncols = 2)
v_bars = axes[0]



x = range(2,26,2)
y = [1,2,1,2,3,1,2,3,1,1,2,3]

plt.plot(x,y)                           // param1 横坐标
plt.show()

---

import matplotlib.pyplot as plt
fig = plt.figure(figsize=(20,8),dpi=80)
x = range(2,26,2)
y = [1,2,1,2,3,1,2,3,1,1,2,3]
plt.plot(x,y)
plt.savefig("./a.png")                  // 在画完后保存
plt.savefig("./a.svg")
plt.show()

---

xtick_labels = [ i/2 for i in range(2,26,2) ]
plt.xticks=(xtick_labels)                           // x 轴刻度, 显示哪些刻度
plt.yticks=(range(min(y),max(y)+1)

---



