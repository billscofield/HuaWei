


prototype
    （新型汽车、机器等的）原型，
    雏形；范例；蓝本，最初形态；
    （电子）原型滤波网络；
    （生物、天体等的）原始型；（建筑、汽车等的）全真模型


In reality, the only true difference between prototype and __proto__ is that
the former is a property of a class constructor, while the latter is a property
of a class instance.

In other words, while iPhone.prototype provides a blueprint for building an
iPhone, newPhone.__proto__ affirms that the iPhone has indeed been built
according to that specific blueprint.

But with regards to the properties and methods present in those two objects…
well, they’re exactly the same.


newPhone.__proto__ is actually a JavaScript object, and JavaScript objects are
also built according to a specific “blueprint”.
In this example, newPhone.__proto__.__proto__ refers to Object.prototype, which
is the prototype or blueprint that all JavaScript objects are based on.



The prototype property is special type of enumerable object which cannot be
iterate using for..in or foreach loop.

As mentioned before, object's prototype property is invisible. Use
Object.getPrototypeOf(obj) method instead of __proto__ to access prototype
object.


The prototype object is being used by JavaScript engine in two things, 1) to
find properties and methods of an object 2) to implement inheritance in
JavaScript.
