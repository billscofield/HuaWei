可以通过配置hosts.allow和hosts.deny来控制访问权限。

他们两个的关系为：/etc/hosts.allow 的设定优先于 /etc/hosts.deny

    1. 当档案 /etc/hosts.allow 存在时，则先以此档案内之设定为准
    2. 而在 /etc/hosts.allow 没有规定到的事项，将在 /etc/hosts.deny 当中继续设定

    Work Precedence

    While using rules in files host.allow and hosts.deny there are some
    precedence. The following flow is executed.

        1. Look hosts.allow
        1. If match allow and exit
        1. Look hosts.deny
        1. If match deny if not allow




    服务进程名:主机列表:当规则匹配时可选的命令操作

    daemon_list : client_list [ : shell_command  ]
    <daemon list>: <client list> [: <option>: <option>: ...]


    List elements should be separated by blanks and/or commas.


生效是立即发生的，但是对已经打开的shell无效，所以一边留着shell设置，一边再开shell

deny is optional if you are including this rule in the hosts.deny file.


**这里注意有个诡异的情况！-如果省略最后的部分的话，必须完全避开空格！空格也会作为正则匹配的一部分**


/etc/hosts.deny
    vsftpd : 192.168.1. , .abc.co.in : spawn /bin/echo  `/bin/date` access denied >> /var/log/vsftpd.log : deny

    ```
    vsftpd:172.16. :spawn /bin/echo '/bin/date' access denied >> /var/log/vsftpd:deny
    ```


## log

[link](https://www.poftut.com/linux-hosts-allow-hosts-deny-control-network-access/)

While using rules about Allow and Deny these actions may need to logged. Logs
will be generated with spawn mechanism. Spawn is use to create new process if
specified rule matched. In the example we will generate a log which contain
current date if a host from 172.16.0.0/24 tries to access vsftpd service.

## Except Definition

We can define NOT logic in rules. Generally IP address or network ranges are
used with this logic. We put ALL EXCEPT as a prefix to the related IP address
or network range to exclude. In this example we will define all hosts except
10.0.0.0/24

    > ALL: ALL EXCEPT 10.


## syntax

[link](https://web.mit.edu/rhel-doc/4/RH-DOCS/rhel-rg-en-4/s1-tcpwrappers-access.html#S2-TCPWRAPPERS-ACCESS-RULES-OPTIONS)

The format for both /etc/hosts.allow and /etc/hosts.deny are identical. Any
blank lines or lines that start with a hash mark (#) are ignored, and each rule
must be on its own line.

Each rule uses the following basic format to control access to network services:

    <daemon list>: <client list> [: <option>: <option>: ...]

    1. <daemon list> — A comma separated list of process names (not service
       names) or the ALL wildcard (refer to Section 17.2.1.1 Wildcards). The
       daemon list also accepts operators (refer to Section 17.2.1.4 Operators)
       to allow greater flexibility.

    2. <client list> — A comma separated list of hostnames, host IP addresses,
       special patterns (refer to Section 17.2.1.2 Patterns), or special
       wildcards (refer to Section 17.2.1.1 Wildcards) which identify the hosts
       effected by the rule. The client list also accepts operators listed in
       Section 17.2.1.4 Operators to allow greater flexibility.

    3. <option> — An optional action or colon separated list of actions
       performed when the rule is triggered. Option fields support expansions
       (refer to Section 17.2.2.4 Expansions), launch shell commands, allow or
       deny access, and alter logging behavior (refer to Section 17.2.2 Option
       Fields).



1. Wildcards

    Wildcards allow TCP wrappers to more easily match groups of daemons or
    hosts. They are used most frequently in the client list field of access
    rules.

    The following wildcards may be used:

        1. ALL — Matches everything. It can be used for both the daemon list
           and the client list.
        
        2. LOCAL — Matches any host that does not contain a period (.), such as
           localhost.
        
        3. KNOWN — Matches any host where the hostname and host address are
           known or where the user is known.
        
        4. UNKNOWN — Matches any host where the hostname or host address are
           unknown or where the user is unknown.
        
        5. PARANOID — Matches any host where the hostname does not match the
           host address.


2. Shell Commands

    Option fields allow access rules to launch shell commands through the
    following two directives:

    1.  spawn — Launches a shell command as a child process. This option
        directive can perform tasks like using /usr/sbin/safe_finger to get
        more information about the requesting client or create special log
        files using the echo command.
        
        In the following example, clients attempting to access Telnet services
        from the example.com domain are quietly logged to a special file:
        
        ```
        in.telnetd : .example.com  : spawn /bin/echo `/bin/date` from %h>> /var/log/telnet.log  : allow
        ```


    2.  twist — Replaces the requested service with the specified command. This
        directive is often used to set up traps for intruders (also called
        "honey pots").
        
        It can also be used to send messages to connecting clients. The twist
        directive must occur at the end of the rule line.
        
        In the following example, clients attempting to access FTP services
        from the example.com domain are sent a message via the echo command:
        
        ```
        vsftpd : .example.com : twist /bin/echo "421 Bad hacker, go away!" 
        ```
        
        For more information about shell command options, refer to the
        hosts_options man page.

3. Expansions

    Expansions, when used in conjunction with the spawn and twist directives,
    provide information about the client, server, and processes involved.

    Below is a list of supported expansions:

        %a — Supplies the client's IP address.
        
        %A — Supplies the server's IP address.
        
        %c — Supplies a variety of client information, such as the username and hostname, or the username and IP address.
        
        %d — Supplies the daemon process name.
        
        %h — Supplies the client's hostname (or IP address, if the hostname is unavailable).
        
        %H — Supplies the server's hostname (or IP address, if the hostname is unavailable).
        
        %n — Supplies the client's hostname. If unavailable, unknown is printed. If the client's hostname and host address do not match, paranoid is printed.
        
        %N — Supplies the server's hostname. If unavailable, unknown is printed. If the server's hostname and host address do not match, paranoid is printed.
        
        %p — Supplies the daemon process ID.
        
        %s —Supplies various types of server information, such as the daemon process and the host or IP address of the server.
        
        %u — Supplies the client's username. If unavailable, unknown is printed.
