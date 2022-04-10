
udevadm monitor --udev

modprobe usb-storage

depmod -a

modprobe usb-storage

insmod ./usb-storage.ko

reboot
