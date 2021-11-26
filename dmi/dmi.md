在介绍什么是DMI之前，先说说SMBIOS (System Management BIOS，SMBIOS)的概念。

**SMBIOS** 是主板或系统制造者以标准格式显示产品管理信息所需遵循的**统一规范**。

DMI (Desktop Management Interface, DMI) 就是帮助收集电脑系统信息的管理系统，DMI
信息的收集必须在严格遵照SMBIOS规范的前提下进行。

SMBIOS和DMI是由行业指导机构Desktop Management Task Force (DMTF)起草的开放性的技
术标准



## linux dimdecode

-t, --type TYPE
    只显示指定条目的信息

    Only display the entries of type TYPE. 

    TYPE can be either a DMI type number, or a comma separated list of type
    numbers, or a keyword from the following list: 
        bios
        system
        base‐board
        chassis
        processor
        **memory**
        cache
        connector
        slot.

    Refer to the DMI TYPES section below  for  details.

    If this option is used more than once, the set of displayed entries will be
    the union of all the given types.

    If TYPE is not provided or not valid, a list of all valid keywords is
    printed and dmidecode exits with an error.


    Keyword         Types
    bios            0
    system          **1**, 12, 15, 23, 32
    **baseboard**       2, 10, 41
    chassis         3
    processor       4
    memory          5, 6, 16, 17
    cache           7
    connector       8
    slot            9

    Keywords are matched case-insensitively. The following command lines are equivalent:
        dmidecode --type 0 --type 13
        dmidecode --type 0,13
        dmidecode --type bios
        dmidecode --type BIOS


-s, --string KEYWORD
    只显示指定DMI字符串关键字的信息

    Only display the value of the DMI string identified by KEYWORD.

    KEYWORD must be a keyword from the following list:
        bios-vendor
        bios-version
        bios-release-date

        system-manufacturer         生产商
        system-product-name         电脑型号
        system-version
        system-serial-number        dell 塔式电脑和 chassis-serial-number 一致
        system-uuid

        baseboard-manufacturer
        baseboard-product-name
        baseboard-version
        baseboard-serial-number     和 system/chassis -serial-number 不一样
        baseboard-asset-tag

        chassis-manufacturer
        chassis-type
        chassis-version
        chassis-serial-number       dell 塔式电脑和 system-serial-number 一致
        chassis-asset-tag

        processor-family
        processor-manufacturer
        processor-version
        processor-frequency

    



## 内存

1. 查看内存槽数、那个槽位插了内存，大小是多少

    > dmidecode -t memory | grep -A5 'Memory Device' | grep Size

    Size:
    Range Size

    两部分信息:
        1. Memory Device
            Size
        2. Memory Device Mapped Address
            Range Size


2. 查看最大支持内存数

    > dmidecode -t memory | grep "Maximum Capacity"
