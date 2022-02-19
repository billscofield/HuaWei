# [9.2. Simple, classless Queueing Disciplines](https://www.lartc.org/howto/lartc.qdisc.classless.html)

As said, with queueing disciplines, we change the way data is sent. Classless
queueing disciplines are those that, by and large accept data and only              //(by and large: 大体上,总的来说)
reschedule, delay or drop it.

These can be used to shape traffic for an entire interface, without any
subdivisions. It is vital(/ˈvaɪtl/至关重要的) that you understand this part of
queueing before we go on the classful qdisc-containing-qdiscs!

By far the most widely used discipline is the pfifo_fast qdisc - this is the
default. This also explains why these advanced features are so robust. They are
nothing more than 'just another queue'.

Each of these queues has specific strengths and weaknesses. Not all of them may
be as well tested.
并不是所有的方法都经过了很好的测试。(as well 也；同样地；)


