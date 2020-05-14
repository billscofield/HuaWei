##

下载3020的linux驱动程序

tar -zxvf 文件

进入目录  执行sh文件

apt install -f

重新执行sh文件


## 配置

cd /etc/cups/

vi cupsd.conf


修改

```
Listen 0.0.0.0:631

# Restrict access to the server...
<Location />
  Order allow,deny
  Allow all
</Location>

# Restrict access to the admin pages...
<Location /admin>
  Order allow,deny
  Allow all
</Location>

```


## 设置打印颜色
https://unix.stackexchange.com/questions/385997/cups-how-to-enforce-bw-printing-for-a-queue

You should have a file /etc/cups/ppd/xxxx.ppd, where xxxx is the name you have configured your printer with. Please post (an URL to) this PPD.

For example:

```
*OpenUI *ColorModel/Output Mode: PickOne
*OrderDependency: 10 AnySetup *ColorModel
*DefaultColorModel: CMYK
*ColorModel CMYK/Color: "<</cupsColorOrder 1/cupsColorSpace 
8/cupsCompression 1>>setpagedevice"
*ColorModel Gray/Grayscale: "<</cupsColorOrder 0/cupsColorSpace 
3/cupsCompression 1>>setpagedevice"
*CloseUI: *ColorModel
Thus, if your printer is configured properly, you simply could (either by using the lpadmin command or the "configure printer" from the web admin) set the default color model to Grayscale. You could even edit your printer's PPD "by hand" by replacing

*DefaultColorModel: CMYK

by

*DefaultColorModel: Gray

And you may easily set up two print queues - one configured for color printing and the other for b/w printing as indicated above - pointing to the same physical printer.

```




## 中文乱码

lp一族的命令是继承自unix的古老的命令，那个时代比UTF-8的诞生早很多，所以导致直接用lp命令打印多字节的UTF-8编码的字符如中文一定是有问题的。这是lp一开始设计时根本没去考虑的因素，不可能“无缝”地支持。之所以UTF-8下英文文本文件可以通过lp正常打印，是因为UTF-8的000000h - 00007Fh部分其实就是ASCII，是在1个字节内的，这是英文ASCII字符比其他UTF-8多字节的文字具有的“先天优势”。

想在它buntu命令行下直接用命令打印包含类似中文的UTF-8纯文本文件，目前最方便的手段是通过paps先将UTF-8的文本文件转换为PostScript的格式，这个格式是可以用lp命令在CUPS下正常打印的。


sudo apt-get install paps
cat UTF8_txt_file | paps | lp
装好了paps，以后只要在命令行用第二条命令就能直接打印UTF8的文本文件了（不止中文，包括一切UTF-8编码的语言）。

至于linux打印的原理，不是一两句话可以说清楚的。楼主如有兴趣请自学：字符编码，文件格式，linux驱动模块，linux打印系统的设计原理等专题--其中任何一个专题，真要详细研究下去，都够你读个硕士、博士了。。。但如果楼主对linux/unix有这样一个基本概念，这个问题其实也很好理解：linux中一切皆文件，打印的过程其实就是读一个文件（如要打印的文档），然后将其按照一定的文件格式写入另一个文件（打印输出文件）；之所以出现乱码，就是写文件的时候文件格式错了，因为每条命令都有自己认识的格式和不认识的格式。。。


https://forum.ubuntu.com.cn/viewtopic.php?f=8&t=465073





### 打印成pdf文件

是安装了一个虚拟打印机

apt install printer-driver-cups-pdf

CUPS-PDF确实好用，现在我打印文件基本都会先打印成PDF文件，看看效果，然后再打印
到真实的计算机上面。
但一直都有个问题： 打印出来的PDF文件名老是乱码。

编辑 /etc/cups/cups-pdf.conf ，把代码:
DecodeHexStrings 0
改成代码:
DecodeHexStrings 1
就可以了。

但改动以后还是现实的乱码，实际上看配置文件里面还有一个选项 TitlePref .
这里设置成 1，乱码立刻就好了

https://www.9wy.net/?p=875




### 在Window下使用CUPS共享的打印机

在Windows下，安装CUPS共享的打印机。网上有很多解决方案，很多方案提到用samba来共享打印机，那种方法可行，但配置samba也是一项比较复杂的工作。我们完全可以使用CUPS的网络打印功能，来完成这一任务，
添加一台网络打印机并输入URL:http://192.168.1.2:631/printers/HP_LaserJet_1020_USB_1，就可以完成打印机添加了，之后的步骤和安装普通的本地打印机一样。
其中“192.168.1.2:631/printers”是CUPS打印服务所在地址和端口，“HP_Laser_1020_USB_1”是你的打印机名。



### 取消自动安装打印机

ubuntu 20 打印机做的很好，但是要取消自动发现打印机

systemctl disable cups-browsed


https://www.kutu66.com//ubuntu/article_156889
