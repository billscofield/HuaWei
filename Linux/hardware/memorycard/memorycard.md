
CPU数据总线的位宽,现在一般是64bit, 这个位宽就称之为物理Bank。

那么memory 1RX4则表示1个64bit，X4则表示memory每颗内存颗粒的位数。从这里我们就可
以很容易知道memory内存颗粒的个数为：64/4=16颗

如果是2RX8的话内存颗粒就是:64*2/8=16颗。2RX4就是64*2/4=8颗。

所以无论是1RX4 ，2Rx4或者 1RX8,2Rx8，代表的含义可以理解为memory的内存颗粒的个数
。而不是单面或者是双面内存。


R=Rank,指的是CPU一个时钟周期内能存取的内存数据的位数，目前等于64bit（位），而2R
指的是该内存条的数据总位宽是2x64=128bit（位）。而x8和x16,代表的是内存条上每个内
存颗粒（芯片）的输出数据位宽，x8就是8bit（位），x16就是16bit（位）。可见2Rx8的
内存条上的颗粒个数=2x64/8=16颗粒；2Rx16的内存条上的颗粒个数=2x64/16=8颗粒。



https://www.dell.com/community/PowerEdge-Hardware-General/What-is-the-difference-between-2Rx4-vs-2Rx8/td-p/4670646

In the notation 2Rx4 & 2Rx8, 2R represents a Dual Rank. A  Rank is a data block
which is 64 bits wide without Error Correction Code (ECC). With ECC it is 72
bits wide. The x4 & x8 refers to the number of banks on the memory component or
chip. The higher the number of banks, the fewer the chips in the memory module,
the better the reliability and power consumption. 

Our servers support mixing memory modules of different Ranks and number of
banks.(Dell)


## PC3L vs PC3

https://superuser.com/questions/989572/what-does-the-1rx8-mean-vs-2rx8-for-ram-and-are-they-compatible

PC3L can generally replace PC3, but not vice-versa. PC3L is DDR3 RAM spec'd to
run at 1.35v, but is generally also fine at 1.5v. PC3 is spec'd to run at 1.5v;
it might not work at 1.35v.

So, if your system came with PC3L then it probably requires it, so don't try to
replace it with PC3. But if your system came with PC3 then you can probably
replace it with either PC3 or PC3L.

Generally you can mix 1Rx8 and 2Rx8, as well, though mixing different kinds of
RAM sometimes prevents interleaving (i.e., it might be a tad slower).

I do recommend running a memory test after RAM upgrades, though. Windows Memory
Diagnostic is probably sufficient, though MemTest86 or MemTest86+ is better.
