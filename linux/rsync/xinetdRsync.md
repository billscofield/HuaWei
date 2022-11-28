# Run rsync Service Only When Needed By Using xinetd

## Why Not Use Rsyncd Service Directly

We do not need rsyncd keep running and cost our precious memory, in fact most
of us only use it once in a while for backup.

So we need a way to keep our sync service on without the rsyncd process.

## What Is Xinetd

xinetd is a service that can open network based services only when they are
connected.

When xinetd listens to a port, while the traffic comes in, xinetd could launch
the real service program and transfer traffic to it.

## How to Config xinetd Work With rsync

We can create a file /etc/xinetd.d/rsync filled with codes below.

service rsync
{
        disable         = no
        socket_type     = stream
        wait            = no
        user            = rsync
        server          = /usr/bin/rsync
        server_args     = --daemon
        log_on_failure  += USERID
}

Tips:

Other configs in
    /etc/rsyncd.conf
    /etc/rsyncd.pass            // --password-file=

are just like what they were when you are using rsyncd service.
