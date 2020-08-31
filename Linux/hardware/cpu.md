
## 频率

主板晶振 : 为了保证所有的设备协调同步

南桥附近

默认输出24MHz，经过 PPL + 差分器 输出 100MHz, 就是主板的基础频率 Base Clock (BCLK)

主板上都统一到 BCLK


### 倍频: 为了让 CPU 和内存的性能更强，让他按基础频率的倍数去运行，不会影响到 CPU 和 其他设备协调，这个倍数的值就被称为倍频

CPU加一个倍频可以42倍速运算(为了提高性能还不能影响其他硬件)

内存

    内存外频异步工作 133.33333
    内存速度转化比率 Ratio, 主板一般是自动识别的，2133=133.33x16, 2666=133.33x20


## 总线


并行：散弹枪, 频率不能做的很高

串行：机枪

PCIE 也是串行总线，但是多个链路是独立的


## PCI-E

ISA 总线，并行

PCI 总线, 即插即用, 并行

PCI-E 

    雷电3 用的是PCI-E

    目前的 M.2 接口所使用的总线版本均为 PCIE3.0x4 即 速度上限是 4GB/s
    也有X2的，


## 南桥

内存直接和 CPU 沟通

PCIE 直接和 CPU 沟通

其他的和南桥沟通

南桥也可以有 PCIE 通道

intel DMI 就是 PCIe3.0x4, 即4GB/s, 非直连 M.2 现阶段是接在南桥上，


非直连 PCIE

直连 PCIE


CPU超频设置，“DOCP”英文原意是 Allows you to select a DRAM O.C.profile，and the related parameters will be adjusted automatically。 

允许你选择一个内存超频档，同时与之相关的参数比如时序、电压什么都会被自动调整。类似智能超频。

