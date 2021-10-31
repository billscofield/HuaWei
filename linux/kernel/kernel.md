##

modinfo



## kernel-source tree

links:
    
    https://unix.stackexchange.com/questions/267835/what-is-a-kernel-source-tree

The source-tree is a directory which contains all of the kernel source. You
could build a new kernel, install that, and reboot your machine to use the
rebuilt kernel. Other than for learning, people rebuild the kernel to select
less-used options, or to add device drivers which are normally not bundled with
Linux.

You may not find it in Ubuntu, but would have to download the source tar-file,
e.g., from kernel.org. Ubuntu uses Debian packages for many things, and the
latter's website makes it easier to find the packages.

http://packages.ubuntu.com/ https://www.debian.org/distrib/packages Those
consist (in either case) of a "pristine" tar-file (from "upstream") and a
"debian" add-on (scripts and packages). You can download both of those from
Debian. If you are looking for the source for the kernel package which you have
installed, you would download both parts.

You can also install the "linux-source" package: Debian and Ubuntu provide a
few source-packages, this is one of the few (a quick check finds only a couple
of dozen packages with "-source" in their names, compared to tens of thousands
of other packages). The source-package is preferred, since there are many fixes
(and customizations) needed, and the source-package has those patches
incorporated into the tree.

I used to routinely build kernels until about ten years ago, since the drivers
for sound, video and network were lacking.

## Active Kernel Releases

There are several main categories into which kernel releases may fall:

Prepatch 

    Prepatch or "RC" kernels are mainline kernel pre-releases that are mostly
    aimed at other kernel developers and Linux enthusiasts. They must be
    compiled from source and usually contain new features that must be tested
    before they can be put into a stable release. Prepatch kernels are
    maintained and released by Linus Torvalds.

Mainline 

    Mainline tree is maintained by Linus Torvalds. It's the tree where all new
    features are introduced and where all the exciting new development happens.
    New mainline kernels are released every 2-3 months.

Stable 

    After each mainline kernel is released, it is considered "stable." Any bug
    fixes for a stable kernel are backported from the mainline tree and applied
    by a designated stable kernel maintainer. There are usually only a few
    bugfix kernel releases until next mainline kernel becomes available --
    unless it is designated a "longterm maintenance kernel." Stable kernel
    updates are released on as-needed basis, usually once a week.

Longterm 
    
    There are usually several "longterm maintenance" kernel releases provided
    for the purposes of backporting bugfixes for older kernel trees. Only
    important bugfixes are applied to such kernels and they don't usually see
    very frequent releases, especially for older trees.


## Distribution kernels

Many Linux distributions provide their own "longterm maintenance" kernels that
may or may not be based on those maintained by kernel developers. These kernel
releases are not hosted at kernel.org and kernel developers can provide no
support for them.

It is easy to tell if you are running a distribution kernel. Unless you
downloaded, compiled and installed your own version of kernel from kernel.org,
you are running a distribution kernel. To find out the version of your kernel,
run uname -r:


> uname -r

5.6.19-300.fc32.x86_64


If you see anything at all after the dash, you are running a distribution
kernel. Please use the support channels offered by your distribution vendor to
obtain kernel support.


https://www.kernel.org/category/releases.html


---

mainline 、longterm、stable、linux-next、snapshot这些名词，都是linux kernel
source的标记名称，可以理解为代号。

mainline 

    mainline指由Linus Torvalds亲自制作的内核发布版，是官方当前最新版本的kernel
    source。在Torvalds对所有其他程序员所做出的重大变化进行整合，并且对先前版本
    的bug进行几轮修复之后，大约每十周正式发布一个新版本。mainline事实上代表着一
    个linux kernel分支，这个分支有另一个名称，叫做vanilla。

longterm 

    longterm，是Long Term Support的缩写，长期维护的意思。


stable 

    stable顾名思义 稳定版

linux-next、snapshot 

    linux-next和snapshot，都是代码提交周期结束之前生成的快照用于给Linux代码贡献
    者们做测试。


Development model开发模式

    The current development model of the Linux kernel is such that Linus
    Torvalds makes the releases of new versions, also called the "vanilla" or
    "mainline" kernels, meaning that they contain the main, generic branch of
    development.  This branch is officially released as a new version
    approximately every ten weeks, after Torvalds does an initial round of
    integrating major changes made by all other programmers, and several rounds
    of bug-fix pre-releases.

    Linux内核目前的发展模式是这样的： Linus Torvalds制作新版本内核（也称为“
    "vanilla" 或者"mainline" 内核）的发布，这意味着它们含有development（开发）
    的主要的、通用的分支。这个分支，在Torvalds对所有其他程序员所做出的重大变化
    进行整合，并且对先前版本的bug进行几轮修复之后，大约每十周正式发布一个新版本
    。

Relation with Linux distributions 

    Most Linux users run a kernel supplied by their Linux distribution. Some
    distributions ship the "vanilla" or "stable" kernels. However, several
    Linux distribution vendors (such as Red Hat and Debian) maintain another
    set of Linux kernel branches which are integrated into their products.
    These are by and large updated at a slower pace compared to the "vanilla"
    branch, and they usually include all fixes from the relevant "stable"
    branch, but at the same time they can also add support for drivers or
    features which had not been released in the "vanilla" version the
    distribution vendor started basing their branch from.

    大多数Linux用户运行的是由某个Linux发行版提供的内核。一些发行版采用"vanilla"
    或者 "stable" 内核。然而，一些Linux发行商（如Red Hat和Debian Linux）坚持使
    用另一组内核分支集成到他们的产品中。与”vanilla”分支相比，总的来说这些内核的
    更新速度较慢，并且他们通常包含了来自于相关“stable”分支的所有修复，不过他们
    同时还可以添加驱动程序支持或某些"vanilla"内核中没有发布的功能。

https://www.cnblogs.com/linuxbo/p/4304935.html
