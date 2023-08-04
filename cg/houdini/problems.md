# 报错相关问题

## 1. 运行时解算报错 OpenCL Exception: <kernel>:1907:20: error: blocks support disabled - compile with -fblocks or for OpenCL 2.0

houdini 19.0.720

日志路径 /tmp/houdini/crashxxx.log

日志路径没有太多有价值的提示, 上方的 error 信息是运行 houdini 命令的 terminal 中的提示

[网络搜索解答](https://www.reddit.com/r/Houdini/comments/ydzkul/vellum_error_after_new_nvidea_update/)

FYI 40 series users: New driver will crash Houdini when using OpenCL

https://www.sidefx.com/forum/topic/87043/

    it's an issue with the latest NVIDIA driver, which changed some things about the OpenCL compiler. This forum post is from people who ran into it:

    https://www.sidefx.com/forum/topic/86887/

    The 522.25 driver switched to a newer OpenCL compiler, which changed some
    flags in how it compiles OpenCL kernels (correctly by the way; we should
    have been handling these flags better). Tomorrow's builds of 19.5.407,
    19.0.774, and 18.5.1097 should all work with the new driver without compile
    errors.

## 
