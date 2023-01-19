

ssh rocky linux 时报错:

    ssh_dispatch_run_fatal: Connection to xxx port 29418: error in libcrypto

原因:

    Strong crypto defaults in RHEL 8 and deprecation of weak crypto algorithms

    从 RHEL 8 / Centos Stream 8 开始，加密算法采用强加密为默认值，弱加密算法弃用。

解决方法:

    1. 升级老系统

    2. 老系统不方便升级，只能牺牲点安全，在 Centos Stream 9 上执行下面的命令

        update-crypto-policies --set DEFAULT:SHA1


