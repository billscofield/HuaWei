# /etc/hosts

in `/etc/hosts` of centos, there are so many names , such localhost, localhost.localdomain , localhost4 , what is the purpose?

The /etc/hosts file is a simple text file that maps hostnames to IP addresses.
It is used to resolve hostnames to IP addresses locally, without the need for a
DNS server.

The names `localhost`, `localhost.localdomain`, and `localhost4` are all aliases for
the loopback interface (IP address `127.0.0.1`). The loopback interface is a
special network interface that allows a machine to communicate with itself.

`localhost` is the most common hostname used to refer to the local machine, while
`localhost.localdomain` is a fully qualified domain name (FQDN) for the loopback
interface. **`localhost4` is a similar alias that is used specifically for IPv4
loopback traffic**.

These aliases are included in the `/etc/hosts` file by default in many Linux
distributions, including CentOS, as a convenience for users and applications
that need to refer to the loopback interface.
