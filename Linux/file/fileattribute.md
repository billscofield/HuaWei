

mode
ownership
timestamps
context
links
xattr
all


## xattr(Extended attributes)

https://wiki.archlinux.org/title/File_permissions_and_attributes


From xattr(7): "Extended attributes are name:value pairs associated permanently
with files and directories". There are four extended attribute classes:
security, system, trusted and user.

Warning: By default, extended attributes are not preserved by cp, rsync, and
other similar programs, see #Preserving extended attributes.


### Preserving extended attributes

Command     Required flag
cp          --preserve=mode,ownership,timestamps,xattr
mv          preserves by default1
tar         --xattrs for creation and extraction
bsdtar      -p for extraction
rsync       --xattrs



