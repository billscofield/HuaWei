什么是 AUR？
AUR 表示 Arch 用户仓库(Arch User Repository)。它是针对基于 Arch 的 Linux 发行版用户的社区驱动的仓库。它包含名为 PKGBUILD 的包描述，它可让你使用 makepkg 从源代码编译软件包，然后通过 pacman（Arch Linux 中的软件包管理器）安装。

创建 AUR 的目的是组织和共享社区中的新软件包，并帮助加速将流行的软件包纳入社区仓库。

进入官方仓库的大量新软件包都从 AUR 开始。在 AUR 中，用户可以贡献自己的软件包构建（PKGBUILD 和相关文件）。

AUR 社区可以对 AUR 中的软件包进行投票。如果一个软件包变得足够流行（假设它具有兼容的许可证和良好的打包技术），那么可以将其加入 pacman 直接访问的社区仓库中。

简而言之，AUR 是开发人员在 Arch 仓库中正式包含新软件之前向 Arch Linux 用户提供新软件的一种方式。
你应该使用 AUR 吗？有什么风险？
使用 AUR 就像过马路一样。如果你谨慎操作，应该就没问题。

如果你刚接触 Linux，建议你在建立有关 Arch/Manjaro 和 Linux 的基础知识之前不要使用 AUR。

的确，任何人都可以将软件包上传到 AUR，但受信任用户（TU）负责监视上传的内容。尽管 TU 对上传的软件包执行质量控制，但不能保证 AUR 中的软件包格式正确或没有恶意。

在实践中，AUR 似乎很安全，但理论上讲它可以造成一定程度的损害，但前提是你不小心。从 AUR 构建软件包时，聪明的 Arch 用户总是检查 PKGBUILD 和 *.install 文件。

此外，TU（受信任用户）还会删除 AUR 中包含在 core/extra/community 中的软件包，因此它们之间不应存在命名冲突。AUR 通常会包含软件包的开发版本（cvs/svn/git 等），但它们的名称会被修改，例如 foo-git。

对于 AUR 软件包，pacman 会处理依赖关系并检测文件冲突，因此，除非你默认使用 –force 选项，否则你不必担心用另一个包中的文件会覆盖另一个包的文件。如果这么做了，你可能会遇到比文件冲突更严重的问题。

如何使用 AUR？
使用 AUR 的最简单方法是通过 AUR 助手。 AUR 助手 是一个命令行工具（有些还有 GUI），可让你搜索在 AUR 上发布的软件包并安装。

在 Arch Linux 上安装 AUR 助手

假设你要使用 Yay AUR 助手。确保在 Linux 上安装了 git。然后克隆仓库，进入目录并构建软件包。

依次使用以下命令：

sudo pacman -S git
sudo git clone https://aur.archlinux.org/yay-git.git
cd yay
makepkg -si
安装后，你可以使用 yay 命令来安装软件包：

yay -S package_name
并非必须使用 AUR 助手来从 AUR 安装软件包。从以下文章解如何在没有 AUR 助手的情况下使用 AUR。

不使用 AUR 助手安装 AUR 软件包

如果你不想使用 AUR 助手，那么也可以自行从 AUR 安装软件包。

在 AUR 页面上找到要安装的软件包后，建议确认“许可证”、“流行程度”、“最新更新”、“依赖项”等，作为额外的质量控制步骤。

git clone [package URL]
cd [package name]
makepkg -si
例如。假设你要安装 telegram 桌面包：

git clone https://aur.archlinux.org/telegram-desktop-git.git
cd telegram-desktop-git
makepkg -si



---

Yaourt 已死！在 Arch 上使用这些替代品


前略：Yaourt 曾是最流行的 AUR 助手，但现已停止开发。在这篇文章中，我们会为 Arch 衍生发行版们列出 Yaourt 最佳的替代品。

Arch User Repository[1] （常被称作 AUR），是一个为 Arch 用户而生的社区驱动软件仓库。Debian/Ubuntu 用户的对应类比是 PPA。

AUR 包含了不直接被 Arch Linux[2] 官方所背书的软件。如果有人想在 Arch 上发布软件或者包，它可以通过这个社区仓库提供。这让最终用户们可以使用到比默认仓库里更多的软件。

所以你该如何使用 AUR 呢？简单来说，你需要另外的工具以从 AUR 中安装软件。Arch 的包管理器 pacman[3] 不直接支持 AUR。那些支持 AUR 的“特殊工具”我们称之为 AUR 助手[4]。

Yaourt （Yet AnOther User Repository Tool）（曾经）是 pacman 的一个封装，便于用户在 Arch Linux 上安装 AUR 软件。它基本上采用和 pacman 一样的语法。Yaourt 对于 AUR 的搜索、安装，乃至冲突解决和包依赖关系维护都有着良好的支持。

然而，Yaourt 的开发进度近来十分缓慢，甚至在 Arch Wiki 上已经被列为[5]“停止或有问题”。许多 Arch 用户认为它不安全[6] 进而开始寻找其它的 AUR 助手。

Yaourt 以外的 AUR Helpers

Yaourt 以外的 AUR Helpers

在这篇文章中，我们会介绍 Yaourt 最佳的替代品以便于你从 AUR 安装软件。

最好的 AUR 助手
我刻意忽略掉了例如 Trizen 和 Packer 这样的流行的选择，因为它们也被列为“停止或有问题”的了。

1、 aurman
aurman[7] 是最好的 AUR 助手之一，也能胜任 Yaourt 替代品的地位。它有非常类似于 pacman 的语法，可以支持所有的 pacman 操作。你可以搜索 AUR、解决包依赖，在构建 AUR 包前检查 PKGBUILD 的内容等等。

aurman 的特性：

aurman 支持所有 pacman 操作，并且引入了可靠的包依赖解决方案、冲突判定和分包split package支持
线程化的 sudo 循环会在后台运行，所以你每次安装只需要输入一次管理员密码
提供开发包支持，并且可以区分显性安装和隐性安装的包
支持搜索 AUR 包和仓库
在构建 AUR 包之前，你可以检视并编辑 PKGBUILD 的内容
可以用作单独的 包依赖解决工具[8]
安装 aurman：

git clone https://aur.archlinux.org/aurman.git
cd aurman
makepkg -si
使用 aurman：

用名字搜索：

aurman -Ss <package-name>
安装：

aurman -S &lt;package-name>
2、 yay
yay[9] 是下一个最好的 AUR 助手。它使用 Go 语言写成，宗旨是提供最少化用户输入的 pacman 界面、yaourt 式的搜索，而几乎没有任何依赖软件。

yay 的特性：

yay 提供 AUR 表格补全，并且从 ABS 或 AUR 下载 PKGBUILD
支持收窄搜索，并且不需要引用 PKGBUILD 源
yay 的二进制文件除了 pacman 以外别无依赖
提供先进的包依赖解决方案，以及在编译安装之后移除编译时的依赖
当在 /etc/pacman.conf 文件配置中启用了色彩时支持色彩输出
yay 可被配置成只支持 AUR 或者 repo 里的软件包
安装 yay：

你可以从 git 克隆并编译安装。

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
使用 yay：

搜索：

yay -Ss <package-name>
安装：

yay -S <package-name>
3、 pakku
Pakku[10] 是另一个还处于开发早期的 pacman 封装，虽然它还处于开放早期，但这不说明它逊于其它任何 AUR 助手。Pakku 能很好地支持从 AUR 搜索和安装，并且也可以在安装后移除不必要的编译依赖。

pakku 的特性：

从 AUR 搜索和安装软件
检视不同构建之间的文件和变化
从官方仓库编译，并事后移除编译依赖
获取 PKGBUILD 以及 pacman 整合
类 pacman 的用户界面和选项支持
支持pacman 配置文件以及无需 PKGBUILD 源
安装 pakku：

git clone https://aur.archlinux.org/pakku.git
cd pakku
makepkg -si
使用 pakku：

搜索：

pakku -Ss spotify
安装：

pakku -S spotify
4、 aurutils
aurutils[11] 本质上是一堆使用 AUR 的自动化脚本的集合。它可以搜索 AUR、检查更新，并且解决包依赖。

aurutils 的特性：

aurutils 使用本地仓库以支持 pacman 文件，所有的包都支持 –asdeps
不同的任务可以有多个仓库
aursync -u 一键同步本地代码库
aursearch 搜索提供 pkgbase、长格式和 raw 支持
能忽略指定包
安装 aurutils：

git clone https://aur.archlinux.org/aurutils.git
cd aurutils
makepkg -si
使用 aurutils：

搜索：

aurutils -Ss <package-name>
安装：

aurutils -S <package-name>
所有这些包，在有 Yaourt 或者其它 AUR 助手的情况下都可以直接安装。
