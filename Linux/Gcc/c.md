
constant
    整型
        char
        short
        int
        long
    实型
        单精度 float
        双精度 double float
        长双精度实型 long double(系统相关)
    字符串

variable
    类型关键字 变量名;

    未初始化的变量为脏值

reserved word

identifier

operator

separator


奇偶校验：
    代码输出过程中是否出现错误。
    奇校验规定，若一个字节编码序列中1的个数是奇数，则校验位置1，否则置0
    偶校验于其正好相反

最初 ASCII 的最高位是奇偶校验，后来不做奇偶校验了

汉字编码，兼容ASCII码，连续的2个字节，仅在其第7位均为1时认为是汉字
