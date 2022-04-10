# const and pointer

一共有六种，如下：

```
1. const int p;
2. const int* p;
3. int const* p;
4. int * const p;
5. const int * const p;
6. int const * const p;

第一种是常量整数，没什么好说的。后面五种是指针，有一个简便的办法记忆。

从右往左读，遇到 p 就替换成 "p is a", 遇到 * 就替换成 "point to"。

```

比如说
2读作：p is a point to int const.p是一个指向整型常量的指针。

3读作：p is a point to const int.意思跟②相同。
4读作：p is a const point to int.p是一个常量指针，指向整型。

5读作：p is a const point to int const.
6读作：p is a const point to const int.

5和6的意思相同，p都是常量指针，指向整型常量。

这种方法来源于《c primer plus》，这里也向c初学者推荐此书。
