
经常看手册吧, 手册写的非常好

https://www.php.net/manual/zh/function.empty.php

## 

empty — 检查一个变量是否为空

判断一个变量是否被认为是空的。当一个变量并不存在，或者它的值等同于false，那么它会被认为不存在。


在 PHP 5.5 之前，empty()
仅支持变量；任何其他东西将会导致一个解析错误。换言之，下列代码不会生效：
empty(trim($name))。 作为替代，应该使用trim($name) == false.

没有警告会产生，哪怕变量并不存在。 这意味着 empty() 本质上与 !isset($var) ||
$var == false 等价。

当var存在，并且是一个非空非零的值时返回 false 否则返回 true.

以下的东西被认为是空的：

"" (空字符串)
0 (作为整数的0)
0.0 (作为浮点数的0)
"0" (作为字符串的0)
null
false
array() (一个空数组)
$var; (一个声明了，但是没有值的变量)
