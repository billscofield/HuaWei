Unlike the system log files and the authentication log files, all of these
files are binary files.

We’ll use some special tools that can read these binary files.

    1. utmp will give you complete picture of users logins at which terminals,
       logouts, system events and current status of the system, system boot time
       (used by uptime) etc.

    2. wtmp gives historical data of utmp.

    3. btmp records only failed login attempts.

    The u in utmp likely comes from user.
    The b in btmp (on systems that has it) likely comes from bad (bad logins).

    The w in wtmp may come from who (as in "who was logged in?"), but not from who
    or w (the utilities) as they use utmp and not wtmp.


we can also use the last command to read the content of the files wtmp, utmp
and btmp as well. For example:

    ```
    # last -f /var/log/wtmp    ### To open wtmp file and view its content use blow command.
    # last -f /var/run/utmp    ### To see still logged in users view utmp file use last command.
    # last -f /var/log/btmp    ### To view btmp file use same command.
    ```

Now, given that binary files cannot be viewed using basic reading commands such
as cat, less, and more, rather than simply relying on basic commands such as
last, who, lastb, and others, a different approach is to use the utmpdump
command like this:

    > # utmpdump /path/to/binary

So if you want to read the contents of the binary files wtmp, utmp or btmp, use
the command as:

    ```
    # utmpdump /var/run/utmp
    # utmpdump /var/log/wtmp
    # utmpdump /var/log/btmp
    ```

utmpdump - dump UTMP and WTMP files in raw format



