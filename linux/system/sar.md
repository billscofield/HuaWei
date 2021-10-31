

## sar

-r [ ALL  ] Report memory utilization statistics. The ALL keyword indicates
that all the memory fields should be displayed.  The following values may be
displayed:


sar -r [interval [count] ]

``` 
09:16:57 PM kbmemfree   kbavail kbmemused  %memused kbbuffers   kbcached kbcommit   %commit  kbactive   kbinact   kbdirty 
09:16:58 PM   6180456   7352036    422656      5.17    640800    730908   1425120     15.54   1280364    468644       100 
09:16:59 PM   6180480   7352060    422632      5.17    640800    730908   1425120     15.54   1280372    468644       100

```

kbcommit Amount of memory in kilobytes needed for current workload. This is an
estimate of how much RAM/swap is needed to guarantee that there never is out of
memory.  kbactive Amount of active memory in kilobytes (memory that has been
used more recently and usually not reclaimed unless absolutely necessary).
kbinact Amount of inactive memory in kilobytes (memory which has been less
recently used. It is more eligible to be reclaimed for other purposes).
kbdirty Amount of memory in kilobytes waiting to get written back to the disk.


### -S     Report swap space utilization statistics.  The following values are displayed:

kbswpfree Amount of free swap space in kilobytes.

kbswpused Amount of used swap space in kilobytes.

%swpused Percentage of used swap space.

kbswpcad Amount  of cached swap memory in kilobytes.  This is memory that once
was swapped out, is swapped back in but still also is in the swap area (if
memory is needed it doesn't need to be swapped out again because it is already
in the swap area. This saves I/O).

%swpcad Percentage of cached swap memory in relation to the amount of used swap
space.

