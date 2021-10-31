
## slabtop

slabtop实时显示内核是如何分配其各种缓存的，以及这些缓存的被占用情况。在内部，
内核有一系列的缓存，他们由一个或者多个分片（salb）构成。

默认情况下slab会每3秒更新一次数据，可以看出多数的分片都是活跃的。

```
Active / Total Objects (% used)    : 752295 / 769350 (97.8%)
Active / Total Slabs (% used)      : 30199 / 30199 (100.0%)
Active / Total Caches (% used)     : 97 / 119 (81.5%)
Active / Total Size (% used)       : 189543.73K / 193692.94K (97.9%)
Minimum / Average / Maximum Object : 0.01K / 0.25K / 8.00K

  OBJS ACTIVE  USE  OBJ SIZE  SLABS  OBJ/SLAB  CACHE SIZE  NAME
244101 241350  98%     0.10K   6259        39      25036K  buffer_head
148386 143209  96%     0.19K   7066        21      28264K  dentry
65244  64198   98%     0.66K   5437        12      43496K  proc_inode_cache

```
