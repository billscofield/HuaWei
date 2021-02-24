##

modinfo



## kernel-source tree

links:
    
    https://unix.stackexchange.com/questions/267835/what-is-a-kernel-source-tree

The source-tree is a directory which contains all of the kernel source. You could build a new kernel, install that, and reboot your machine to use the rebuilt kernel. Other than for learning, people rebuild the kernel to select less-used options, or to add device drivers which are normally not bundled with Linux.

You may not find it in Ubuntu, but would have to download the source tar-file, e.g., from kernel.org. Ubuntu uses Debian packages for many things, and the latter's website makes it easier to find the packages.

http://packages.ubuntu.com/
https://www.debian.org/distrib/packages
Those consist (in either case) of a "pristine" tar-file (from "upstream") and a "debian" add-on (scripts and packages). You can download both of those from Debian. If you are looking for the source for the kernel package which you have installed, you would download both parts.

You can also install the "linux-source" package: Debian and Ubuntu provide a few source-packages, this is one of the few (a quick check finds only a couple of dozen packages with "-source" in their names, compared to tens of thousands of other packages). The source-package is preferred, since there are many fixes (and customizations) needed, and the source-package has those patches incorporated into the tree.

I used to routinely build kernels until about ten years ago, since the drivers for sound, video and network were lacking.
