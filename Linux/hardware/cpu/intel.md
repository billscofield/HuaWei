http://server.zol.com.cn/175/1751807_all.html#p1751807

## 回首英特尔至强处理器十二年发展历程

P6微架构时代

　　说起X86服务器，相信你一定会想到英特尔及其针对服务器、工作站的处理器平台：至强(Xeon)，毕竟X86服务器芯片这块市场十之八九的份额都在英特尔的手中。而且，更重要的是，在一定程度上，至强代表了X86服务器的技术核心。

　　众所周知，英特尔的CPU先后经历了8086、80286、80386、80486以及此后的奔腾系列、赛扬系列和至强系列，奔腾系列又包括奔腾1、2、3、4，其中，具有里程碑性质的是8086、80486和奔腾。1993年，英特尔公司推出“奔腾”Pentium芯片，被称为586或P5，含有310万个晶体管，速度达60 MHz。1995年11月，英特尔推出“新奔腾”Pentium PRO，这是自从1979年以来的芯片家族的第六代，代号为P6，有550万个晶体管，第一批芯片运行速度为150-200 MHz。这种“新奔腾”就是至强的前身，目标直接定位于商业用高性能计算机、服务器等企业级计算领域。

　　翻开至强处理器12年的发展历史，我们看到，这款处理器已经发生了巨大的变化：经过了P6(奔腾III)、Netburst(奔腾4)、酷睿、Nehalem等几代微架构的变迁，制造工艺从最早的250纳米提升了现在的45纳米，CPU内核数量从单核发展到了6核，主频从400MHz提升到3.8GHz，前端总线带宽从100MHz发展到了1.6GHz，并最终转换到了全新的QPI直联架构，指令集和诸如超线程、智能节能、虚拟化等功能不断推陈出新……

　　至强的商标虽然经历了几代x86和x86-64处理器，但仍然保留了下来，旧型号是将至强放到对应的处理器名字的末尾，如奔腾II至强，奔腾III至强，但2001转换到奔腾4架构上之后，新型号则一率直接叫至强，这似乎也意味着基于至强的PC服务器正一步步脱离PC的色彩，更加强大，也更加独立。比较而言，至强 CPU除了多重处理能力、在同一主板上支持多颗处理器外，比对应的桌面级CPU拥有更多的缓存。

　　笔者按照处理器微架构的不同，将至强这12年的历史分成了四个阶段，分别加以阐述。

　　1998-2000年 P6微架构时代

　　包括250纳米的奔腾II至强Drake、奔腾III至强Tanner以及180纳米工艺的奔腾III至强Cascades，共20多款处理器，插座接口是Slot 2，指令集只有MMX和SSE。

　　P6时代，CPU主频几乎完全代表了产品高低档的不同——型号中的数字与主频是一致的，不过，主频都很低，直到2000年的8月22日才出现了1GHz的“奔腾III至强1000”；前端总线带宽也很低，只有100MT/s或133MT/s。

　　也许最让今天人们感慨的是，P6处理器的功耗低得惊人，最高也不过46.7瓦特，最低的一款只有23瓦特。比较来看，从250纳米到180纳米制造工艺的进步对于P6主频提升和功耗降低都是非常明显的：250纳米时代，主频在400-550MHz之间徘徊，而到了180纳米的奔腾III至强Cascades，主频已经跃升至1GHz，功耗则下降了10瓦特左右，跟今天八九十瓦、甚至100多瓦的CPU相比，只有20-30瓦特的Cascades真的是相当“凉快”！

回到顶部阅读NetBusrt微架构时代
　　2001-2006年 NetBusrt微架构时代

　　这是至强历史上持续时间跨度最长的一代架构了，甚至到2007年一季度还发布了一款基于Netburst架构的产品，包括的处理器型号非常多：180纳米的至强Foster，130纳米的至强Prestonia和Gallatin，90纳米的至强Nocona、Irwindale、Paxville、Cranford、Potomac，以及65纳米的Dempsey和Tulsa，一共有70多款处理器，CPU插座有LGA 771、Socket 603。

　　这时至强已经开始逐渐摆脱PC的影响，型号前面也不在加上“奔腾III”、“奔腾4”的标称，正在朝面向企业计算的独立平台转化，至强出现了按UP(单路系统)、DP(双路系统)和MP(多路系统)的划分方式。可以说，在NetBurst时代，至强发生了脱胎换骨式的蜕变，企业计算的特征越来越明显，同时在2003年也直接受到了AMD皓龙处理器的强有力挑战。

　　在这六年当中，至强的主要特性变化特点有：

　　1)能效计算：制造工艺从180纳米提升到了65纳米；伴随着制造工艺的进步，主频和功耗之间的关系变得微妙起来，“要获得高主频往往得付出高功耗的代价”——180纳米(1.4-2GHz，48-77W)、130纳米(1.5-3.2GHz，30-90W)、90纳米(2.6-3.8GHz，55-165W)、65纳米(2.5-3.7GHz，95-150W)，比如主频3GHz的双核至强7040(Paxville MP)的TDP功耗就高达165W，“每瓦特性能”的概念开始出现并广泛流行，同时，英特尔也开始通过一系列技术创新如制造工艺改进、低功耗版处理器、EIST等，来保证平台更新时“在功耗不变的条件下提升性能”。英特尔甚至在2006年还尝试动用了用于笔记本电脑的处理器微架构，推出基于Pentium M (Yonah)架构的双核至强DP处理器(Sossaman)，TDP功耗为31W，使用Socket M插座，不过，主频最大仅2.166GHz。

　　2)唯主频论过时：由于唯主频论开始过时，至强的命名型号也发生了大的变化，从2006年开始，英特尔不再用“至强UP/DP/MP+主频”来的方式来命名、区别不同型号，而是分为针对双路平台的至强5000系列和针对多路平台的至强7000系列，如至强50XX(Dempsey)、至强70XX(Paxville MP)、至强71XX(Tulsa)，后面两位数用来标识CPU的不同，一般数字越大，表示性能越高；而且，由于这一阶段还开始出现核心数量、功耗的区别，所以有些产品前面也开始加上Dual Core(双核)、后面加上Low-voltage(低功耗)等字样。

　　3)64位计算：2004年6月，在AMD64位皓龙的竞争推动下，英特尔放弃过去单纯依靠安腾主打64位计算市场的策略，推出EMT64的Nocano，走上32位/64位兼容型计算道路；

　　4)多核计算：2005年开始出现双核芯，多核计算开始走上快车道；

　　5)多功能：指令集和CPU的功能得到了频繁更新，跟P6架构相比，新增了SSE2、SSE3指令集，以及许多过去闻所未闻的新技术，如超线程、EIST(Enhanced Intel SpeedStep Technology)智能降频节电技术、EMT64兼容32位和64位计算、XD bit(No eXecute)防病毒防恶意攻击技术、intel-vt硬件辅助虚拟化技术等。

　　6)均衡计算：随着处理器的性能越来越强，但前端总线的带宽提升幅度却不大，从400、533、667、800提升到1066MT/s，I/O瓶颈也越来越突出，尤其是对于四路以上的系统。在这一阶段，虽然AMD已经在2003年推出了“直连架构，集成内存控制器”的皓龙，但英特尔仍然坚持FSB架构。于是，我们看到，为了缓解CPU“吃不饱”的状况，这一时期英特尔主要是不断进行大容量L2缓存设计，甚至开始引入大容量L3缓存，如针对多路系统、FSB带宽仅有667 MT/s的双核至强7150N(Tulsa)就拥有2x1MB二级缓存和高达16MB的三级缓存。

　　7)虚拟化：随着X86服务器虚拟化的流行，英特尔在2006年5月份发布的Dempsey处理器中开始引入其硬件辅助虚拟化技术intel-vt，以缓解VMware等虚拟化软件的性能损耗，提高虚拟化的效率，此后，英特尔VT得到了长足的发展，直至今天。

　　总之，这是新旧交替的六年，也是英特尔历尽蜕变的六年，不仅要面对功耗攀升的棘手问题，还要面对来自AMD的挑战，期间双方在64位、双核、功耗等方面多次交手，虽然各有胜负，但总体来说，英特尔在这一时期失误颇多，最终让AMD皓龙在市场中占稳了脚跟。

回到顶部阅读酷睿(Core)微架构时代
　　2006-2008年 酷睿(Core)微架构时代

　　2006年其实是Netburst和酷睿两种架构并存的一年。差不多也是从这一年开始，英特尔引入了其新的产品更新策略：Tick-Tock，这其实也是英特尔对市场的一种承诺，即当年更新微架构，下一年更新制造工艺，依次类推，不断推动处理器技术的发展。于是我们看到2006年是酷睿微架构年，2007是45纳米工艺Penryn，2008是Nehalem微架构，2009是32纳米工艺的Westmere，2010年是Sandy Bridge全新架构......

　　Core架构尽管历时才3年左右，但英特尔一共推出了近90款CPU，包括：65纳米针对单路平台的的双核Allendale(至强3000系列)、双核Conroe(至强3000系列)、四核Kentsfield(至强3200系列)，针对双路平台的双核Woodcrest(至强5100系列)和四核Clovertown(至强5300系列)，针对四路以上平台的Tigerton(双核至强7200系列、四核至强7300系列)，以及45纳米针对单路平台的双核Wolfdale(至强3100系列)和四核Yorkfield(至强3300系列)，针对双路平台的双核Wolfdale-DP(至强5200系列)、四核Harpertown(至强5400系列)，还有针对四路平台的四核/六核Dunnington(至强7400系列)等十来个类别。

　　和Netburst微架构相比，Core时代至强处理器的变化主要有：

　　1) 制造工艺从65纳米升级到了45纳米(统称为Penryn)，使用了高K材料，这一工艺的进步为英特尔在CPU中集成更多的晶体管、提高主频、降低功耗、进行下一代微架构创新等提供了基础；

　　2) 多核计算得到进一步发展，出出四核(最早出现在Clovertown至强5300系列中)与六核(最出现在Dunnington至强7400系列中)产品；

　　3) 指令集得到进一步发展，新增SSE4.1，在虚拟化、智能节能等方面也得到了进一步增强；

　　4) 针对单路服务器的处理器统一到至强3000系列名下；

　　5) 为了将CPU功耗控制在可接受的范围以内，英特尔一方面通过多核设计来提升性能，另一方面通过工艺进步来实现主频与功耗的平衡，跟Netburst相比来看，主频甚至有所降低，但功耗基本得到了有效控制，65纳米(1.6-3GHz，35-150瓦特)45纳米(1.866-3.5GHz，20-150瓦特)；

　　6) 由于Core时代仍然采用前端总线结构，为了提升I/O带宽，降低I/O延迟，英特尔一方面提升总线带宽(1066、1333、1600 MT/s)，另一方面继续采用大容量L2和L3缓存设计，如六核心的至强7460主频为2.667GHz，FSB为1066MT/s，L2缓存为3x3MB，L3缓存为16MB。

　　7) 这一时期的CPU插座也发生了变化，主要有LGA 771、LGA 775和Socket 604。

回到顶部阅读Nehalem微架构时代
　　2009年 Nehalem微架构时代

　　虽然Nehalem微架构在2008年就已经在个人电脑的i7处理器上得到采用，但在服务器上的应用却是今年3月30日Nehalem-EP至强处理器的发布——包括45纳米的针对单路系统的双核/四核Bloomfield(至强3500系列)以及针对双路系统的双核/四核Gainestown(至强5500系列)。

　　对英特尔而言，基于45纳米的Nehalem代表了一个全新时代的到来：放弃传统前端总线架构，转向QPI直连架构，打破传统I/O瓶颈的束缚，QPI带宽高达4.8-6.4 GT/s，远远高于FSB时代的1.6 GT/s！

　　如果说当年的奔腾Pro开创了X86工业标准服务器大批量生产和普及的时代，那么，至强5500则是15年来性能提升幅度最显著的一代，其性能是2005年单核至强的9倍，是上一代至强5400的2.5倍，同时空闲状态下的平台功耗降低了50%，其背后采用了一系列技术包括45纳米工艺、全新内存子系统、快速通道互联技术(QPI)、智能节能技术、全新I/O子系统。在性能方面，智能加速技术可以满足对CPU主频比较敏感的应用需求，超线程技术则可以满足高度并行的应用需求，针对能耗方面，则有集成功率门限、自动低功耗、节点管理器等等。这些创新的技术使得今天的用户“可以在需要的时候提高性能，也可以在不需要性能的时候自动降低功耗。”

　　针对四路以上的系统，英特尔刚刚发布的八核心Nehalem-EX(命名为至强7500，代号Beckton)。Nehalem-EX将拥有23亿晶体管，拥有4个QPI链接，可以让服务器从双路一直轻轻松松地扩展到8路，且无须第三方芯片组技术支持，从而最高可以支持到64核、128个线程，拥有24MB共享L3缓存，每个处理器支持16个内存插槽，引入了原来只在安腾上采用的RAS特性：MCA(机器检验体系结构)功能。根据英特尔的测试，Nehalem-EX与上一代的至强7400相比，在性能和带宽两方面都实现了“前所未有”的飞跃：内存带宽高达9倍，数据库性能超过2.5倍，整数吞吐量超过1.7倍，浮点吞吐量超过2.2倍！