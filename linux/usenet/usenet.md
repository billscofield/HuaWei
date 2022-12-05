

[link](https://www.ruanyifeng.com/blog/2007/11/usenet.html)

1. 起源

简单地说，USENET是一个巨大无比的网上讨论组，一般也称为"新闻组"（newsgroups）。
你可以将它想象成一个包罗万象、无所不有的网上论坛，但是它又不同于我们通常看到的
普通论坛。这要从它的起源说起。

上个世纪70年代末，当时还没有互联网和浏览器，它们都要在十多年后才会出现。那时所
谓"上网"，就是用modem（调制解调器），拨一个电话号码，将自己的电脑连到另一台电脑
（也称"主机"），收收邮件，看看上面系统管理员发的通告。如果想换一台主机看看，那
就必须先挂断，再拨另外一个电话号码。

这样的上网方式，很不利于开展多人的讨论。由于是拨号上网，只有地理位置相近的用户，
才会登录同一台主机。很难想象，同一台机器的登录用户，既有东岸的纽约人，也有西岸
的洛杉矶人。即使长途电话费不是问题，当时的主机也没有能力同时负担太多的远程终端。
因此，迫切需要一种大规模的、分布式的、多中心的远程信息交换手段。

1979年，Duke大学的两个研究生Tom Truscott和Jim Ellis，提出一种分布式的网上讨论组
的构想。这种讨论组创建之初，主要是供UNIX爱好者协会（USENIX）的成员使用，因此就
被定名为USENET。当然，后来全世界的用户都在使用它。

2. 运行机制

USENET的运行机制其实非常简单。对于用户来说，只有三步。

　　1）网络服务提供商（ISP）在一个网络中，设定一台服务器作为USENET专用服务器，
再将它的网址告诉用户。

　　2）用户想要发言的时候，就向这个网址发送帖子（post），这与发送Email很相似，
但是两者格式不一样，在USENET上发言必须使用专用的客户端。不过，现在大多数的Email
客户端都带有新闻组功能，最常见的Outlook Express的设置可以参考网上的说明。

　　3）查看其他人的发言时，就必须从服务器上下载其他人的帖子。下载完成后，如果想
回复某人的帖子，就再重复第二步。

可以看到，这个过程同邮件列表的运行几乎一模一样，不同之处在于，USENET服务器每天
会同其他USENET服务器交换帖子。这就是说，全世界所有的USENET服务器最终都可以互相
交换帖子，保持内容的同步。所以理论上，不管你的帖子是发到哪一台服务器上，最终全
世界的人们都会看到，并且会从世界各地给你回复。

因此，USENET就有一个其他交流机制所没有的优点，即这是一个真正的全世界参与的讨论
组。

3. 内容结构

由于USENET中的讨论内容无所不包，所以必须根据主题分类。每一个主题就是一个"频道"，
对这个主题感兴趣的用户就订阅这个频道。

USENET中的主题分类采用等级制（hierarchies），在形式上同域名很相似，即"一级主题.
二级主题.三级主题...."，中间以小数点分隔。

一级主题有9个。

```
* comp.*: 与计算机相关的讨论。（computer-related discussions，比如comp.software, comp.sys.amiga）

* misc.*: 各种不属于其他分类的主题。（Miscellaneous topics，比如misc.education, misc.forsale, misc.kids）

* news.*: 对USENET本身的讨论（比如news.groups, news.admin）

* rec.*: 休闲和娱乐（Recreation and entertainment，比如rec.music, rec.arts.movies）

* sci.*: 与科学相关的讨论。（Science related discussions，比如sci.psychology, sci.research）

* soc.*: 与社会相关的讨论。（Social discussions，比如soc.college.org, soc.culture.african）

* talk.*: 各种争议性话题的讨论。（Talk about various controversial topics，比如talk.religion, talk.politics, talk.origins）

* humanities.*: 艺术、文学、哲学方面的讨论。（Fine arts, literature, and philosophy，比如humanities.classics, humanities.design.misc）

* alt.*: 自由讨论区。（alternative）
```

这9个一级主题中，除了alt.*以外，都不能自行设立讨论区。只有在alt主题区中，可以自己发起主题"频道"。


4. 二进制内容

USENET最初设计的时候，只打算用来传递文本信息，没有考虑传递二进制数据（也就是"文
件"）。但是，随着互联网的发展，不传递二进制数据看上去是不可能的。

于是，专门的编码方式被设计了出来，使得二进制文件可以转换成文本文件，在USENET上
传递，用户下载以后再传换成原来的格式。这时，USENET就不仅是一个讨论组了，而成了
传递文件的一种手段，图片、音频和视频都可以通过USENET传播。

事实上，如今USENET上的流量，99%都已经是二进制文件了。它们大部分都在alt.binaries
这个主题中传播。由于不受监管，所以各种各样的文件都有。

5. 收费服务

根据一项统计，2007年4月USENET上一天的流量为3.12TB，且还在快速增加中。这么大的流
量，使得世界上提供USENET的服务商肯定不会很多。大家可以查看这个网页，上面有
USENET提供商的不完全列表。

这些服务商，又分为免费和收费两种。免费的USENET绝大多数都不提供二进制文件下载，
查看alt.free.newsservers主题可以获得最新的免费USENET服务器的信息。

在收费服务商中，名气比较大的是GIGANEWS，它提供多种收费账户供用户选择。其中白金
用户每月费用为19.99美元，可以无限量下载，14天内不满意可以退款。如果你是一个狂热
的下载爱好者，我强烈推荐去购买一个账户。

6. Google Groups

Google Groups也提供免费USENET服务。（当然，没有二进制文件下载。）我会另写文章专
门介绍，这里就省略了。

---


To many people, Usenet IS the Net. In fact, it is often confused with Internet.
But it is a totally separate system.

这句话出自1994年的 Everybody's Guide to the Internet 中关于 Usenet 的一章，
Usenet 诞生于1980年， Tim Berners-Lee 发明万维网和 HTTP 是在1989年。在今天，也
许可以把第一句话中的 Usenet 换成万维网。

从形式上看，Usenet 比较像一个多对多的 email 系统[1]，大家都可以发送“文章”到
usenet，也可以查看（可能是完全不认识的）他人发送的“文章”。从作用上看又让人想起
bbs 或者网络论坛 (web forum). 甚至有人会把 Usenet 归属为 bbs 系统，比如下面一句
话出自1999年出版的 Philosophy and Computing 一书。

Usenet is the greatest BBS on the network, consisting of thousands of areas of
interest, known as newsgroups.

Usenet 分发“文章”的方式是去中心化的，usenet 由一系列服务器组成，服务器之间通过
特定的方式[2]相互同步。但并不是所有服务器都保持内容的一致，一方面服务器的管理者
会决定同步哪些新闻组，另一方面，“文章”在每台服务器上保留的时间是有限的 (这个保
留时间通常称为 retention)，而这个时间也是由服务器的管理者决定的，因为永久保存所
有内容是不现实的。在以前，很多 ISP 都提供 usenet 服务器。


1987年，alt.* 出现了，除了不适合放入 Big Eight 的内容，这个分支下有各色各样的非
常细分主题的新闻组，让人想起 reddit

alt.* 不仅仅是收留被八大主题遗弃的分类，而且在管理上也更加自由，内容上受到的限
制很少，其中 alt.binaries.* 便是专为二进制“文章”内容而出现。所谓二进制“文章”，
包括了程序、视频、图片、音频等各种合法的和非法的内容。

Napster 诞生于 1999 年，ed2k 诞生于新世纪，BitTorrent 协议则是 2001 年才有。在
现代的 p2p 文件共享以前，usenet 也成了非法内容传播的温床。

在新世纪，随着各种新技术的出现，usenet 逐渐淡出了人们的视线，毕竟从一开始就接触
如今的社交网络和在线论坛的人，一般不会闲得慌去考古。

As long as there are folks who think a command line is better than a mouse, the
original text-only social network will live on. --- John Biggs

上面这句话摘自维基百科。然而现代化的社交网络完全可以兼具 CLI 和 GUI 的客户端，
而不必局限于 text-only.

以至于在今天，usenet 中正常话题的讨论越来越少而非法内容（主要是盗版和色情）泛滥。
现代化的 usenet 中的内容可以在多个服务期间快速传播，比 bt 更加去中心化的传播导
致版权所有者难以阻止

2008年美国多家运营商为了抑制儿童色情传播（对运营商来说同时也减轻了很大的流量压
力），或完全停止提供 usenet 接入服务，或限制访问8大主题下的新闻组，并在之后几年
内逐渐完全停止了 usenet 服务

Usenet 可以说是今天很多互联网产品的前辈，从世界上大部分人还不知道互联网为何物的
时代一直到上世纪末，都扮演了很重要的角色，只是随着技术发展注定要变得极其小众乃
至完全消失。

如今要想使用 usenet 需要寻求付费的服务提供者，如 giganews, astraweb. 他们通常提
供两类账户，包月的 unlimited account 和 按流量计算的 block account
