



The spool folder is a software folder or computer that holds files waiting to
be printed until the printer is ready.


## /var/

https://www.pathname.com/fhs/pub/fhs-2.3.html#PURPOSE31

Chapter 5. The /var Hierarchy

Purpose

/var contains variable data files. This includes 
    1. spool directories and files,
    2. administrative and logging data, 
    3. and transient([ˈtrænziənt] 转瞬即逝的，短暂的) and temporary files.


Some portions of /var are not shareable between different systems. 

    For instance, /var/log, /var/lock, and /var/run. 

    Other portions may be shared, notably /var/mail, /var/cache/man,
    /var/cache/fonts, and /var/spool/news.


/var is specified here in order to make it possible to mount /usr read-only.
Everything that once went into /usr that is written to during system operation
(as opposed to installation and software maintenance) must be in /var.

    That's the key thing about /var: the data in it changes, unlike /usr (which
    only changes when you add/remove/update software).


If /var cannot be made a separate partition, it is often preferable to move
/var out of the root partition and into the /usr partition. (This is sometimes
done to reduce the size of the root partition or when space runs low in the
root partition.) However, /var must not be linked to /usr because this makes
separation of /usr and /var more difficult and is likely to create a naming
conflict. Instead, link /var to /usr/var.

Applications must generally not add directories to the top level of /var. Such
directories should only be added if they have some system-wide implication, and
in consultation with the FHS mailing list.

