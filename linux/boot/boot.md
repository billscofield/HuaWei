# linux boot sequence

## centos6.x

1. 开机上电 BIOS 自检

    BIOS 其实是一个软件, 固化在计算机主板上的一个 ROM 芯片上的程序.

    When you press the power button, the Basic Input/Output System (BIOS) or
    Unified Extensible Firmware Interface (UEFI) firmware is the first thing
    that initializes. It performs hardware checks, initializes devices like the
    CPU, RAM, and storage, and determines the boot device.

    When you press the power button, the Basic Input/Output System (BIOS) or
    Unified Extensible Firmware Interface (UEFI) firmware is the first thing
    that initializes. It performs hardware checks, initializes devices like the
    CPU, RAM, and storage, and determines the boot device.

    the CPU receives electricity from the power supply unit (PSU) and starts
    executing instructions from a predefined memory location known as the
    **reset vector**

    reset vector 就是 BIOS 的内容所在地

    A reset vector is a specific memory location in a microprocessor or
    microcontroller that serves as the starting point for the execution of
    instructions after the system is reset or powered on. It plays a crucial
    role in the initialization and boot-up process of a computer or embedded
    system.

    Here's how the reset vector works:

    1. **System Reset or Power-On:** When you power on a computer or reset it,
       the CPU (Central Processing Unit) starts executing instructions from a
       predefined memory location. This location is known as the reset vector.

    2. **Initialization:** The instructions stored at the reset vector address
       are responsible for initializing the CPU, setting up essential hardware
       components, and preparing the system for further operation.

    3. **Control Transfer:** After initialization, control is typically
       transferred to other parts of the firmware or bootloader responsible for
       loading the operating system or managing the boot process. This transfer
       may involve a jump or branch instruction to a different memory location.

       搜索可引导设备，标准就是 55AA, 有就是可以引导, 没有就继续检查下一个磁盘

       BIOS 将 bootloader 读入内存，并将执行流交给 bootloader

    4. **Boot Process:** In the context of a computer's boot process, the reset
       vector is often part of the BIOS (Basic Input/Output System) firmware,
       UEFI (Unified Extensible Firmware Interface), or a similar firmware
       component. The firmware performs hardware checks, identifies boot
       devices, loads boot loaders, and ultimately starts the operating system.

    The reset vector's location in memory and the specific instructions it
    contains can vary depending on the CPU architecture and system design. It
    is typically a fixed memory address that is hardwired or configured in
    hardware.

    In summary, the reset vector is a fundamental concept in computing and
    embedded systems. It marks the point in memory where the execution after a
    reset, ensuring a well-defined and controlled start to the system's
    operation.


2. MBR引导(BootLoader)

    Main Boot Record

    0柱面0磁头1扇区

    - 446 字节的引导
    - 64 字节的分区表
    - 55AA 结束标志

    bootloader 系统的loader

    在每个分区中的第一个扇区中是操作系统的 loader

    所以一般每个分区只能安装一个操作系统

        提供选单
        加载系统loader
        执行系统loader

    安装 windows系统的时候， windows 会主动复制一份自己的 loader 到 MBR 中的 bootloader 中

    linux的loader 是 grub

    cd /boot/grub
        stage1    这个就是 linux 的 loader, linux 所在分区的 boot sector(512Byte) 就是存放着 stage1 的内容. 该文件太小，功能有限

        stage1_5 

        stage2    

3. 启动内核

4. 启动第一个进程 init

## centos7

