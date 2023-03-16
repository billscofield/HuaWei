# the port number 0

The port numbers in Linux range from 0 to 65535, with port numbers below 1024
reserved for well-known services and applications. Port 0 is not a valid port
number and is not used by any service or application. When a program specifies
a port of 0, the kernel dynamically assigns a port number from the ephemeral
port range (usually between 49152 and 65535) for the program to use.
