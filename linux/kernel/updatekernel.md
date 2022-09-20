Prepatch：Prepatch 或 “RC” 内核是主要的内核预发行版本，主要针对内核开发人员和 Linux 爱好者。必须从源代码进行编译，并且通常包含必须在可以放入稳定版本之前进行测试的新功能。Prepatch 内核由 Linus Torvalds 维护和发布。

    rc are Kernel release candidates (for testing and analysis) and an approaching official release.

Mainline：Mainline 主线树由 Linus Torvalds 维护。这个版本的内核会引入所有新功能。新的 Mainline 内核每 2-3 个月发布一次。

Stable：每个主线内核被发布后，即被认为是“stable”。任何对 stable 内核的 BUG 修复都会从 Mainline 主线树中回溯并由指定的 stable 内核维护人员使用。 在下一个主线内核可用之前，通常只有几个 BUG 修复内核版本 - 除非它被指定为“longterm maintenance kernel（长期维护内核）”。stable 内核更新按需发布，通常每月 2-3 次。

Longterm：通常会提供几个“longterm maintenance”内核版本，用于修复旧版内核的 BUG。这些内核只会修复重大 BUG，并且不会频繁发布版本。



## centos7

The elrepo-kernel channel provides both the long-term support kernels (which
have been configured for RHEL-7 ) and the latest stable mainline kernels (which
have been configured for RHEL-8 and RHEL-7) using sources available from the
Linux Kernel Archives. Please see the kernel-lt or kernel-ml pages for further
details. This channel may be enabled in the /etc/yum.repos.d/elrepo.repo file
or used with 'yum --enablerepo=elrepo-kernel'.

1. 导入 elrepo 仓库的公共密钥

    rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

2. 安装 elrepo 仓库的 yum 源
    
    rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm

3. 查询可用内核版本

    yum --disablerepo="*" --enablerepo="elrepo-kernel" repolist


    lt表示long-term，即主线版本，该版本建议慎重选择。
    mt表示latest mainline，即长期稳定版本，稳定可靠，建议安装该版本

    The kernel-lt packages are built from the sources available from The Linux
    Kernel Archives, just like the kernel-ml packages.

    The difference is that kernel-lt is based on a "long term support" branch
    and kernel-ml is based on the "mainline stable" branch.

4. 安装最新的稳定版本内核

    yum -y --enablerepo=elrepo-kernel install kernel-lt

5. 设置 GRUB 默认的内核版本

    打开并编辑 /etc/default/grub 并设置 GRUB_DEFAULT=0。意思是 GRUB 初始化页面的第一个内核将作为默认内核。

    执行命令：grub2-mkconfig -o /boot/grub2/grub.cfg
