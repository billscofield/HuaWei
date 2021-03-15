前端总线，系统总线，内部总线，外部总线 

链接：https://www.zhihu.com/question/20584517/answer/15567015

首先把这个问题仅限于x86平台。其他cpu架构不见得是这么分。并且仅限于2000-2010年范围。
这些概念也许只有DIYer圈知道。好容易遇到个专业相关的，让我发挥下吧。我不是DIYer，说错勿笑。
近两年intel的动作频频，把南北桥都要合并了。你的这个问题，再过几年也许就没意义了。

## 先挑软柿子捏系统总线特指PCI/PCIe总线。

这是Intel主导发展的总线标准。什么？还有EISA、VESA总线？请把他们遗忘在20世纪吧。胜者为王。
人的大脑和其他的器官、四肢，大部分靠脊髓相连。

PCI/PCIe总线，就相当于x86架构机器的脊髓。其他内部总线、外部总线，都是挂在系统总线上的。
USB、SATA、1394，统统是 PCI/PCIe 总线的下级。主要因为PCI/PCIe 总线带宽高; 拥有硬件探测能力;
改进的标准能热插拔。

顺带提一下，因为PCI/PCIe总线的硬件探测能力，加上微软定义的几套PC制造标准，我们才能一张xp盘装无数的x86机器。

## 外部总线

诸如USBSATA IDE 1394 串口 以太网，这些暴露给普通用户插的，就是外部总线。前面提到过，他们都是PCI/PCIe 总线
的下级。

例如在PCI/PCIe总线上，USB控制器是pci设备。在USB总线上，USB控制器又是头头，U盘是设备。
U盘里的数据想去cpu，得经由 usb总线 -->pci总线-->前端总线-->CPU

## 内部总线

外部总线上，还有一些零碎的低速小芯片。这个一般用户接触不到，是给制造商的开发人员用的。例如网卡需要一片
eeprom来存唯一的MAC地址。很多pci卡上都能找到这些小flash。某些pci卡还有温度传感器。
网卡的MAC和PHY之间也要有总线来读取链接速度、是否link等信息。控制这些小芯片使用诸如I2C
SPI总线，即所谓的内部总线。


内部总线：维基百科的解释是——南桥芯片与北桥芯片之间的连线；而国内网上的不少资料则是将CPU内部各部分之间的连线称为内部总线。


## 前端总线

就是CPU和北桥、内存的连接总线了。北桥是PCI/PCIe总线的发源地。但是由于技术的进步，FSB已经被取代（或逐步取代），
AMD很早就开始采用自己的HyperTransport（后续版本更改为HyperTransport Link简称HT link）代替了FSB来提高cpu与内存
等芯片的数据传输速度，而intel亦采用QuickPathInterconnect（QPI）技术。但是总体上讲，这两种技术都是FSB的进化。


## 外频

看名字就知道，这是频率。频率是看不见的，前端总线是看得见的。其实外频，不就是给cpu的输入时钟嘛。

比如给cpu一个66Mhz的时钟输入，cpu通过把这个输入通过PLL翻倍，成为我们熟悉的几个GHz的频率。
早期外频和前端总线的频率一致，相当于外频x1，但是后来前端总线的频率也会在外频上翻倍，但应该低于cpu频率