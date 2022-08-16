## backup and copy is different

[link](https://www.linuxquestions.org/questions/linux-software-2/rsync-or-dump-405888/)

"dump" is like the "dd" command. It works with raw binary. Creates an "image"
so to speak. Roughly analagous to what Ghost, DriveImage or TrueImage do for
Windows. You cannot pick out and restore individual files from a dump. It's all
or nothing. The whole image or none of it. I believe the Windows equivalents I
mentioned probably DO allow you to pick out individual files under some
circumstances, but "dump/restore" and "dd" will not.

rsync, on the other hand, copies individual files (and directories). It does
not produce an "image". So if you accidently deleted one file you could restore
just that one file from a rsync backup. Think of rsync as just a fancy copy
command.

You might want to "dump" filesystems that rarely change and you would want to
quickly restore after a catastrophic event. Possibly / and /boot. But you might
desire the rsync individual file flexibility for a backup or /home however.
That way when a user calls and says they accidently deleted an important file
you can leave /home untouched except for that one file. You'll probably want
overlap from both backup strategies. Quickly restore a working-but-not-perfect
system from the latest dump, and then catch up on the latest changes you've
made to config files from the latest rsync backup.

---

[link](https://askubuntu.com/questions/17697/when-is-it-appropriate-to-use-dump-vs-rsync#:~:text=Strictly%20speaking%2C%20rsync%20is%20not%20a%20backup%20tool,backup%20disks%20and%20put%20on%20write%20once%20media.)

dump is traditionally used in cases where you need to image an entire device
once, and not keep backing it up incrementally. Since it was created in a time
where magnetic tapes were popular, random disk writes were not all that
possible, making incremental backups nearly impossible.

rsync is a more robust tool that doesn't try to account for those obsolete
technologies. This allows it to have random access to the backup destination
and lets it take true incremental backups.

dump functions at a lower level than rsync, so you can actually ask it to dump
unmounted filesystems, which AFAIK isn't a possibility with rsync. Other than
that, rsync is a superior tool in almost every way, and allows you to minimize
transfer, which is especially useful over network backups.


Strictly speaking, rsync is not a backup tool -- it is a copy tool. If you want
to use a simple copy as a backup method, then rsync is a good tool to
accomplish that. dump gets you an archive file that can be compressed, so it
takes up less space than a simple copy, and can be split across multiple backup
disks and put on write once media. It also can do incremental backups both for
speed of daily backups, and so you have multiple snapshots in time you can go
back through looking for a specific version of a file. You can get something
similar with rsnapshot which uses rsync and hard links, but it requires the
backup medium to be a single hard disk that is large enough.
