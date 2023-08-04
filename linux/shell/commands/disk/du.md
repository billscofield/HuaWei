# du

To only show folders over 1GB in size:

du -h --threshold=1G

You may also want to order by size, to easily find the biggest ones.
du -h --threshold=1G | sort -h
