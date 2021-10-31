at and batch read commands from standard input or a specified file which are to be executed at a later time, using
    /bin/sh.

---

1. at      executes commands at a specified time.

1. atq     lists the user's pending jobs, unless the user is the  superuser;  in  that  case,  everybody's  jobs  are
        listed.   The  format  of the output lines (one for each job) is: Job number, date, hour, queue, and user‐
        name.

1. atrm    deletes jobs, identified by their job number.

1. batch   executes commands when system load levels permit; in other words, when the load average drops  below  1.5,
        or the value specified in the invocation of atd.

---

-m      Send mail to the user when the job has completed even if there was no output.
-M      Never send mail to the user.

-f file Reads the job from file rather than standard input.

-t time run the job at time, given in the format [[CC]YY]MMDDhhmm[.ss]


-l      Is an alias for atq.
-r      Is an alias for atrm.
-d      Is an alias for atrm.
-b      is an alias for batch.


-v      Shows the time the job will be executed before reading the job. 
        Times displayed will be in the format "Thu Feb 20 14:50:00 1997".

-c     cats the jobs listed on the command line to standard output.


```
service atd status


HH:MM[am|pm] + number [minutes|hours|days|weeks]


at now + 1 minutes
echo "hello world, i am coming!!!">/dev/pts/1


at 19:00 2019-07-24
bash /root/shellpractice/show.sh>>/dev/pts/2


at now + 2 days
at 23:00 + 3 days

<C-d>

at 17:00 tomorrow
```


