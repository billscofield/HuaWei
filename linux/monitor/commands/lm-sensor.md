
sensor

sensor是一个简单的命令行实用程序，它显示包括CPU在内的所有传感器芯片的当前读数。

好像只能检测到 CPU 的温度

apt install lm-sensors

yum install lm_sensors

检测有哪些传感器
    sh -c "yes| sensors-detect"

获得 CPU 温度

sensors
