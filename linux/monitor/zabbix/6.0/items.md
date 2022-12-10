添加监控项/items


agent.hostmetadata                      Agent host metadata. Returns string
agent.hostname                          Agent host name. Returns string
agent.ping                              Agent availability check. Returns nothing - unavailable; 1 - available
agent.variant                           Agent variant check. Returns 1 - for Zabbix agent; 2 - for Zabbix agent 2
agent.version                           Version of Zabbix agent. Returns string
kernel.maxfiles                         Maximum number of opened files supported by OS. Returns integer
kernel.maxproc                          Maximum number of processes supported by OS. Returns integer
kernel.openfiles                        Number of currently open file descriptors. Returns integer
modbus.get[endpoint,<slaveid>,<function>,<address>,<count>,<type>,<endianness>,<offset>]                    Reads modbus data. Returns various types
net.dns.record[<ip>,name,<type>,<timeout>,<count>,<protocol>]                                               Performs a DNS query. Returns character string with the required type of information
net.dns[<ip>,name,<type>,<timeout>,<count>,<protocol>]                                                      Checks if DNS service is up. Returns 0 - DNS is down (server did not respond or DNS resolution failed); 1 - DNS is up
net.if.collisions[if]                   Number of out-of-window collisions. Returns integer
net.if.discovery                        List of network interfaces. Returns JSON

net.if.in[if,<mode>]                    Incoming traffic statistics on network interface. Returns integer
    net.if.in[eth0,]                    // comma 可以省略
net.if.out[if,<mode>]                   Outgoing traffic statistics on network interface. Returns integer
net.if.total[if,<mode>]                 Sum of incoming and outgoing traffic statistics on network interface. Returns integer

net.if.list                             Network interface list (includes interface type, status, IPv4 address, description). Returns text

net.tcp.listen[port]                    Checks if this TCP port is in LISTEN state. Returns 0 - it is not in LISTEN state; 1 - it is in LISTEN state

net.tcp.port[<ip>,port]                 Checks if it is possible to make TCP connection to specified port. Returns 0 - cannot connect; 1 - can connect


net.tcp.service.perf[service,<ip>,<port>]                       Checks performance of TCP service. Returns 0 - service is down; seconds - the number of seconds spent while connecting to the service
net.tcp.service[service,<ip>,<port>]                            Checks if service is running and accepting TCP connections. Returns 0 - service is down; 1 - service is running
net.tcp.socket.count[<laddr>,<lport>,<raddr>,<rport>,<state>]                    Returns number of TCP sockets that match parameters. Returns integer
net.udp.listen[port]                    Checks if this UDP port is in LISTEN state. Returns 0 - it is not in LISTEN state; 1 - it is in LISTEN state
net.udp.service.perf[service,<ip>,<port>]                       Checks performance of UDP service. Returns 0 - service is down; seconds - the number of seconds spent waiting for response from the service
net.udp.service[service,<ip>,<port>]                            Checks if service is running and responding to UDP requests. Returns 0 - service is down; 1 - service is running
net.udp.socket.count[<laddr>,<lport>,<raddr>,<rport>,<state>]                    Returns number of UDP sockets that match parameters. Returns integer
perf_counter[counter,<interval>]                                Value of any Windows performance counter. Returns integer, float, string or text (depending on the request)
perf_counter_en[counter,<interval>]                             Value of any Windows performance counter in English. Returns integer, float, string or text (depending on the request)
perf_instance.discovery[object]                                 List of object instances of Windows performance counters. Returns JSON
perf_instance_en.discovery[object]                              List of object instances of Windows performance counters, discovered using object names in English. Returns JSON
proc.cpu.util[<name>,<user>,<type>,<cmdline>,<mode>,<zone>]     Process CPU utilization percentage. Returns float

proc.mem[<name>,<user>,<mode>,<cmdline>,<memtype>]              Memory used by process in bytes. Returns integer
proc.num[<name>,<user>,<state>,<cmdline>,<zone>]                The number of processes. Returns integer
    proc.num[nginx,root,]

proc_info[process,<attribute>,<type>]                           Various information about specific process(es). Returns float
sensor[device,sensor,<mode>]                                    Hardware sensor reading. Returns float

service.info[service,<param>]                                   
    Information about a service. Returns integer with param as state, startup;
    string - with param as displayname, path, user; text - with param as
    description; Specifically for state: 0 - running, 1 - paused, 2 - start
    pending, 3 - pause pending, 4 - continue pending, 5 - stop pending, 6 -
    stopped, 7 - unknown, 255 - no such service; Specifically for startup: 0 -
    automatic, 1 - automatic delayed, 2 - manual, 3 - disabled, 4 - unknown


services[<type>,<state>,<exclude>]                    Listing of services. Returns 0 - if empty; text - list of services separated by a newline
system.boottime                    System boot time. Returns integer (Unix timestamp)
system.cpu.discovery                    List of detected CPUs/CPU cores. Returns JSON
system.cpu.intr                    Device interrupts. Returns integer
system.cpu.load[<cpu>,<mode>]                    CPU load. Returns float
system.cpu.num[<type>]                    Number of CPUs. Returns integer
system.cpu.switches                    Count of context switches. Returns integer
system.cpu.util[<cpu>,<type>,<mode>,<logical_or_physical>]                    CPU utilization percentage. Returns float
system.hostname[<type>,<transform>]                    System host name. Returns string
system.hw.chassis[<info>]                    Chassis information. Returns string
system.hw.cpu[<cpu>,<info>]                    CPU information. Returns string or integer
system.hw.devices[<type>]                    Listing of PCI or USB devices. Returns text
system.hw.macaddr[<interface>,<format>]                    Listing of MAC addresses. Returns string
system.localtime[<type>]                    System time. Returns integer with type as UTC; string - with type as local
system.run[command,<mode>]                    Run specified command on the host. Returns text result of the command; 1 - with mode as nowait (regardless of command result)
system.stat[resource,<type>]                    System statistics. Returns integer or float
system.sw.arch                    Software architecture information. Returns string
system.sw.os[<info>]                    Operating system information. Returns string
system.sw.packages[<package>,<manager>,<format>]                    Listing of installed packages. Returns text
system.swap.in[<device>,<type>]                    Swap in (from device into memory) statistics. Returns integer
system.swap.out[<device>,<type>]                    Swap out (from memory onto device) statistics. Returns integer
system.swap.size[<device>,<type>]                    Swap space size in bytes or in percentage from total. Returns integer for bytes; float for percentage
system.uname                    Identification of the system. Returns string
system.uptime                    System uptime in seconds. Returns integer
system.users.num                    Number of users logged in. Returns integer
vfs.dev.discovery                    List of block devices and their type. Returns JSON
vfs.dev.read[<device>,<type>,<mode>]                    Disk read statistics. Returns integer with type in sectors, operations, bytes; float with type in sps, ops, bps
vfs.dev.write[<device>,<type>,<mode>]                    Disk write statistics. Returns integer with type in sectors, operations, bytes; float with type in sps, ops, bps
vfs.dir.count[dir,<regex_incl>,<regex_excl>,<types_incl>,<types_excl>,<max_depth>,<min_size>,<max_size>,<min_age>,<max_age>,<regex_excl_dir>]                    Count of directory entries, recursively. Returns integer
vfs.dir.get[dir,<regex_incl>,<regex_excl>,<types_incl>,<types_excl>,<max_depth>,<min_size>,<max_size>,<min_age>,<max_age>,<regex_excl_dir>]                    List of directory entries, recursively. Returns JSON
vfs.dir.size[dir,<regex_incl>,<regex_excl>,<mode>,<max_depth>,<regex_excl_dir>]                    Directory size (in bytes). Returns integer
vfs.file.cksum[file,<mode>]                    File checksum, calculated by the UNIX cksum algorithm. Returns integer for crc32 (default) and string for md5, sha256
vfs.file.contents[file,<encoding>]                    Retrieving contents of a file. Returns text
vfs.file.exists[file,<types_incl>,<types_excl>]                    Checks if file exists. Returns 0 - not found; 1 - file of the specified type exists
vfs.file.get[file]                    Information about a file. Returns JSON
vfs.file.md5sum[file]                    MD5 checksum of file. Returns character string (MD5 hash of the file)
vfs.file.owner[file,<ownertype>,<resulttype>]                    File owner information. Returns string
vfs.file.permissions[file]                    Returns 4-digit string containing octal number with Unix permissions
vfs.file.regexp[file,regexp,<encoding>,<start line>,<end line>,<output>]                    Find string in a file. Returns the line containing the matched string, or as specified by the optional output parameter
vfs.file.regmatch[file,regexp,<encoding>,<start line>,<end line>]                    Find string in a file. Returns 0 - match not found; 1 - found
vfs.file.size[file,<mode>]                    File size in bytes (default) or in newlines. Returns integer
vfs.file.time[file,<mode>]                    File time information. Returns integer (Unix timestamp)
vfs.fs.discovery                    List of mounted filesystems and their types. Returns JSON
vfs.fs.get                    List of mounted filesystems, their types, disk space and inode statistics. Returns JSON
vfs.fs.inode[fs,<mode>]                    Number or percentage of inodes. Returns integer for number; float for percentage
vfs.fs.size[fs,<mode>]                    Disk space in bytes or in percentage from total. Returns integer for bytes; float for percentage
vm.memory.size[<mode>]                    Memory size in bytes or in percentage from total. Returns integer for bytes; float for percentage
vm.vmemory.size[<type>]                    Virtual space size in bytes or in percentage from total. Returns integer for bytes; float for percentage
web.page.get[host,<path>,<port>]                    Get content of web page. Returns web page source as text
web.page.perf[host,<path>,<port>]                    Loading time of full web page (in seconds). Returns float
web.page.regexp[host,<path>,<port>,regexp,<length>,<output>]                    Find string on a web page. Returns the matched string, or as specified by the optional output parameter
wmi.get[<namespace>,<query>]                    Execute WMI query and return the first selected object. Returns integer, float, string or text (depending on the request)
wmi.getall[<namespace>,<query>]                    Execute WMI query and return the JSON document with all selected objects
zabbix.stats[<ip>,<port>,queue,<from>,<to>]                    Number of items in the queue which are delayed in Zabbix server or proxy by "from" till "to" seconds, inclusive.
zabbix.stats[<ip>,<port>]                    Returns a JSON object containing Zabbix server or proxy internal metrics.
