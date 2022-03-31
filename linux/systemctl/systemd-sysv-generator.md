# systemd-sysv-generator — SysV init 脚本单元生成器

man systemd-sysv-generator

## 大纲

/usr/lib/systemd/system-generators/systemd-sysv-generator

## 描述

systemd-sysv-generator 生成器 用于在系统启动过程中以及在 systemd 重新加载其配置
时， 将 /etc/init.d/ 目录中的 SysV init 脚本 包装为 .service 单元。 这样就可以
让 systemd(1) 兼容传统的 SysV init 脚本。

SysV init 脚本中的 LSB headers 可以被正确解释，其中定义的启动顺序 将被转化为单
元之间的依赖关系。 LSB设施(facility) "$remote_fs", "$network", "$named",
"$portmap", "$time" 将会被转化为 对特定 .target 单元的依赖从而得到支持。参见
systemd.special(5) 以了解详情。

SysV 运行级将会被转化为对应的 .target 单元(runlevelX.target)， 并在其中包含 从
该运行级所启用的脚本生成的 包装单元。

systemd 不支持将 SysV 脚本加入到 系统启动的早期阶段，所以所有包装单元都排在
basic.target 之后。

systemd-sysv-generator 遵守 systemd.generator(7) 规范。

/run/systemd/generator
/run/systemd/generator.late


man systemd.generator
