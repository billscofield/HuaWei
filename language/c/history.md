[link](https://blog.csdn.net/u012075739/article/details/26516007)

最初的 ANSI C 标准 (X3.159-1989) 在 1989 年被批准，并于 1990 年发布。稍后这个标
准被接受为 ISO 标准 (ISO/IEC 9899:1990) 。虽然 ISO 标准将 ANSI 标准的某些章节重
新编号并变为条款，但是两者实际上并无区别。不论是 ANSI 标准还是 ISO 标准，通常都
称之为 C89 ，偶尔也因为发布日期而被叫做 C90 。 ANSI 标准 ( 非 ISO 标准  ) 同时
附带了 rationale 文档。可以使用 -ansi , -std=c89 或 -std=iso9899:1990 选项指定
GCC 使用 C89 标准；可以使用 -pedantic 选项来得到所有的诊断信息( 或者使用
-pedantic-errors 选项以使 wangning 变为 error ) 。PS：pedantic adj. 1. 卖弄学问
的 2. 学究式的,迂腐的

新的 ISO C 标准是 1999 年发布的 ISO/IEC 9899:1999 ，通常称之为 C99 。 GCC 目前
不完整的支持这个版本。详情请参考 http://gcc.gnu.org/gcc-4.4/c99status.html 。为
了指定 GCC 使用这个版本的 C 标准，需要 -std=c99 或 -std=iso9899:1999 选项。

默认情况下， GCC 提供了一些 C 语言的扩展，极少的几处会与 C 标准冲突。关于这些冲
突请参考 “ C 语言家族的扩展 ” 一节。使用上述的 -std 选项将会关闭这些有冲突的扩
展。你也可以显式的使用选项 -std=gnu89 ( 对应 C89 的 GNU 扩展  ) 或 -std=gnu99 (
对应 C99 的 GNU 扩展  ) 来选择对应版本的扩展功能。如果没有给出 C 语言 “ 方言 ”
选项，将默认的使用 -std=gnu89 ；若要使用C99的特性要设置-std=gnu9x。



[link](https://gaomf.cn/2017/10/07/C_typeof/#:~:text=typeof%20%E4%B8%8D%E6%98%AFC%E8%AF%AD%E8%A8%80%E6%9C%AC%E8%BA%AB%E7%9A%84%E5%85%B3%E9%94%AE%E8%AF%8D%E6%88%96%E8%BF%90%E7%AE%97%E7%AC%A6%EF%BC%88%20sizeof,%E6%98%AFC%E6%A0%87%E5%87%86%E5%AE%9A%E4%B9%89%E7%9A%84%E8%BF%90%E7%AE%97%E7%AC%A6%EF%BC%89%EF%BC%8C%E5%AE%83%E6%98%AFGCC%E7%9A%84%E4%B8%80%E4%B8%AA%E6%89%A9%E5%B1%95%EF%BC%8C%E4%BD%9C%E7%94%A8%E6%AD%A3%E5%A6%82%E5%85%B6%E5%AD%97%E9%9D%A2%E6%84%8F%E6%80%9D%EF%BC%8C%20%E7%94%A8%E6%9F%90%E7%A7%8D%E5%B7%B2%E6%9C%89%E4%B8%9C%E8%A5%BF%EF%BC%88%E5%8F%98%E9%87%8F%E3%80%81%E5%87%BD%E6%95%B0%E7%AD%89%EF%BC%89%E7%9A%84%E7%B1%BB%E5%9E%8B%E5%8E%BB%E5%AE%9A%E4%B9%89%E6%96%B0%E7%9A%84%E5%8F%98%E9%87%8F%E7%B1%BB%E5%9E%8B%20%E3%80%82)

最后指出一些需要注意的问题。typeof()是在编译时处理的，故其中的表达式在运行时是
不会被执行的，比如typeof(fun())，fun()函数是不会被执行的，typeof只是在编译时分
析得到了fun()的返回值而已。typeof还有一些局限性，其中的变量是不能包含存储类说明
符的，如static、extern这类都是不行的。



一般是用来定义

```
int a = 1;

typeof(a) b = 2;

printf("%d\n",b);
```
