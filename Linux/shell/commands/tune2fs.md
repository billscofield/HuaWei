## tune2fs

adjust tunable filesystem parameters on ext2/ext3/ext4 filesystems

tune2fs -U xxx /dev/sda1
    -U UUID

uuidgen | xargs tune2fs /dev/sda1 -U

