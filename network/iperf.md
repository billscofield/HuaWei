
## 

C/S 架构

iperf -s -p 端口    //默认TCP 5001 端口, window size:128KByte

-i, --interval n
    pause n seconds between periodic bandwidth reports

-M, --mss n
    set TCP maximum segment size (MTU - 40 bytes)

-c, --client host
    run in client mode, connecting to host

-s, --server
    run in server mode

-D, --daemon
              run the server as a daemon.  On Windows this will also install the IPerfService.

-p, --port n
              set server port to listen on/connect to to n (default 5001)

-t, --time n
    time in seconds to listen for new traffic connections, receive traffic or transmit traffic (Defaults: transmit is 10 secs while listen and receive are indefinite)

    --tx-sync n
        set the tx-sync interval to n (units of seconds) for synchronized packet writes


-w, --window n[kmKM]
              TCP window size (socket buffer size)

-u, --udp
    use UDP rather than TCP

    --udp-counters-64bit
        use 64 bit UDP sequence numbers

-P, --parallel n    (多线程)
    number of parallel client threads to run


-b, --bandwidth
    set the target bandwidth (and optional standard devation where supported)

-f, --format
    [abkmgBKMG]   format to report: adaptive, bits, Bytes, Kbits, Mbits, Gbits, KBytes, MBytes, GBytes (see NOTES for more)
    默认以Mbits为单位





In TCP mode iperf returns the maximum bandwidth available between two hosts, while in UDP mode iperf returns the jitter, packet loss, and bandwidth.

Jitter为抖动，lost/total为丢包数量，Datagrams为包数量



## 版本的区别

Iperf3 is a rewrite of iperf from scratch to create a smaller, simpler code base. It also includes a library version which enables other programs to use the provided functionality. Another change is that iperf3 is single threaded while iperf2 is multi-threaded[3]. Iperf3 was started in 2009, with the first release in January 2014. Iperf3 is not backwards compatible with iperf2.


## 典型用法
### 服务器端

iperf -s -i 1 

### 客户端

iperf -c -p 5001 -t 10 -w 1m




-w 应该是 服务器端 或 客户端设置一个就好
