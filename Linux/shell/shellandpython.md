
## shell 只能返回数字, 如何联合 python 调用 shell 输出呢?

https://www.codeleading.com/article/77082261544/

commands 这个是python2的包，python3 好像没有找到

commands.getstatusoutput() 一个方法就可以获得到返回值和输出，非常好用。

(status, output) = commands.getstatusoutput('sh hello.sh')

print status, output
