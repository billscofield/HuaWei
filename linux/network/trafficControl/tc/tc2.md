
[link](https://www.lartc.org/howto/lartc.qdisc.html)

It is important to realise that we can only shape data that we transmit.

With the way the Internet works, we have no direct control of what people send
us. It's a bit like your (physical!) mailbox at home. There is no way you can
influence the world to modify the amount of mail they send you, short of
contacting everybody.

TCP/IP has no way of knowing the capacity of the network between two hosts, so
it just starts sending data faster and faster ('slow start') and when packets
start getting lost, because there is no room to send them, it will slow down.
In fact it is a bit smarter than this, but more about that later.


