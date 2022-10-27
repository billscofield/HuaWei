
密码相关的安全策略，主要是通过 /etc/login.defs 与 pam_cracklib.so 实现的。

    /etc/login.defs：只控制了账号密码的有效期和最小长度。修改完/etc/login.defs
    文件后，会立即生效，但是它只对修改后创建的用户生效。

    pam_cracklib.so：该模块实现了账户密码的复杂度控制。早期用的是
    pam_cracklib.so模块，后来改成用pam_pwquality.so了，该模块完全兼容旧的
    pam_cracklib.so模块。该模块对应的配置文件路径在/etc/pam.d/目录下。


