
# 优先级
字符串  算术运算    逻辑运算

## 字符串


## 算数运算
舍弃小数
expr 9 / 2  结果为4
expr -9 / 2 结果为-4

## 逻辑运算
两个参数都为空，则返回 & 或 |

### 与 \& 或者 '&'

如果任意一个参数为空，则报错

如果两个参数都非0，则返回第一个参数，否则返回0

"" 等价于 0
"$不存在的变量" 等价于 ""(零)



### 或
如果任意一个参数为空，则报错

如果第一个参数非0，则返回第一个参数的值，否则返回第二个参数

"" 等价于零
"$不存在的变量" 等价于 ""零


\<
\<=

\>
\>=

转换数值失败，则按照字符集的排序规则进行字符大小比较






## 
\& \| \> \< \<= \>= = 用在 expr 语句中

& 用在后台执行当中

&& || 用在 执行中

-gt -lt -ge -le -eq 用在 条件判断中



