
## What does the “rc” stand for in /etc/rc.d?

https://unix.stackexchange.com/questions/111611/what-does-the-rc-stand-for-in-etc-rc-d


This goes pretty far back in the Unix history. rc stands for "run commands", and makes sense actually:

runcom (as in .cshrc or /etc/rc) The rc command derives from the runcom
facility from the MIT CTSS system, ca. 1965. From Brian Kernighan and Dennis
Ritchie, as told to Vicki Brown:

    "There was a facility that would execute a bunch of commands stored in a file;
    it was called runcom for "run commands", and the file began to be called "a
    runcom". rc in Unix is a fossil from that usage."


