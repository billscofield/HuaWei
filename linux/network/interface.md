https://blog.csdn.net/fansilean/article/details/43069883


## auto-hotplug && auto 

links:

    https://lists.debian.org/debian-user/2017/09/msg00911.html

    https://unix.stackexchange.com/questions/192671/what-is-a-hotplug-event-from-the-interface

### auto

auto:            

    try to ip link set <dev> up  at boot.  Best choice for anything PCIe/SoC.

allow-hotplug:   

    *wait* for kernel+drivers+udev to detect the device, then ip link set <dev> up it.  The only thing that can deal with annoying USB, SDIO, etc.


This can be kinda important when non-auto-loading stuff is involved, or when network file systems are involved.

So, look at what *exact* kind of network device you're dealing with.



---

auto-hotplug

    To start interface <interface_name> upon hotplug event of the system.

---

https://lists.debian.org/debian-boot/2007/07/msg00377.html

The problem of using auto is that the booting gets stuck until
dhclient3 timeouts, if you lack network support while booting the
system. If you use allow-hotplug it doesn't happen.





