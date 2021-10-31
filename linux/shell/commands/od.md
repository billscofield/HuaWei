-t 指定数据的显示格式的主要参数有：
    c：ASCII字符或反斜杠序列(如\n)
    d：有符号十进制数
    f：浮点数
    o：八进制（系统默认值）
    u：无符号十进制数
    x：十六进制数

od -t c 文件
od -t dc 文件

od -t dCc a.txt
od -t d1c a.txt
    ```
    0000000   65   10   66   10   67   10   68   10
               A   \n    B   \n    C   \n    D   \n
    0000010
    ```

由下面的说明可知，-d1c 应该是每个字节一编码，-d2c 应该是2个字节一编码


TYPE is made up of one or more of these specifications:
   a      named character, ignoring high-order bit
   c      printable character or backslash escape
   d[SIZE]
          signed decimal, SIZE bytes per integer
   f[SIZE]
          floating point, SIZE bytes per integer
   o[SIZE]
          octal, SIZE bytes per integer
   u[SIZE]
          unsigned decimal, SIZE bytes per integer
   x[SIZE]
          hexadecimal, SIZE bytes per integer
   SIZE  is  a  number.   For  TYPE  in  [doux],  SIZE may also be C for sizeof(char), S for sizeof(short), I for
   sizeof(int) or L for sizeof(long).  If TYPE is f, SIZE may also be F for sizeof(float), D  for  sizeof(double)
   or L for sizeof(long double).

   Adding a z suffix to any type displays printable characters at the end of each output line.


