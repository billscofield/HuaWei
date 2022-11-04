
apt-get install hfsprogs

mount -t hfsplus -o force,rw /dev/sdx# /media/mntpoint

or

ount -t hfsplus -o remount,force,rw /dev/sdx# /mount/point
