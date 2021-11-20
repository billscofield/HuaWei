
## Enable SSH shell access but disable SFTP access

[链接](https://serverfault.com/questions/653812/enable-ssh-shell-access-but-disable-sftp-access)



I've searched for a viable answer to this question, and most of the answers
include advice on why to not do it. However, here's the scenario, and what
makes it necessary:

I have a console app, and in each user's profile, there is a startup command
for the app, and directly after the command that starts it up, there's an
"exit" command, which logs them out of the system. I only want them to be able
to access this console app through the interface provided by it. Upon startup,
the app presents the user with a list of clients that can be accessed through
the app, with each client having their own data directory. Users are granted
access to only the clients that they will need access to.

Now here's the problem: If I give the users SSH access, they will also be able
to log in using an SFTP client, which will give them direct access to the data
directories for the app, which is VERY undesirable, since that will also give
them access to the data directories to which they should not have access.

This was such a simple thing to do when using a telnet/FTP combination, but now
that I want to give the users access from anywhere on the internet, I haven't
been able to find a way to shut them out of SFTP, while still allowing them
access to the shell where they can run the app.


## internal-sftp 和 sftp-server 之间的区别和联系

Both sftp-server and internal-sftp are part of OpenSSH. The sftp-server is a
standalone binary. 

The internal-sftp is just a configuration keyword that tells sshd to use the
SFTP server code built-into the sshd, instead of running another process (what
would typically be the sftp-server).

The internal-sftp was added much later (OpenSSH 4.9p1 in 2008?) than the
standalone sftp-server binary. 

But it is the default by now. The sftp-server is
now redundant and is kept probably for a backward compatibility.

From a functional point of view, the sftp-server and internal-sftp are almost
identical. They are built from the same source code.

The main advantage of the internal-sftp is, that it requires no support files
when used with ChrootDirectory directive.

Quotes from the sshd_config(5) man page:

    1. For Subsystem directive:
        
        The command sftp-server implements the SFTP file transfer subsystem.
        
        Alternately the name internal-sftp implements an in-process SFTP
        server. This may simplify configurations using ChrootDirectory to force
        a different filesystem root on clients.

    2. For ForceCommand directive:
        
        Specifying a command of internal-sftp will force the use of an
        in-process SFTP server that requires no support files when used with
        ChrootDirectory.

    3. For ChrootDirectory directive:
        
        The ChrootDirectory must contain the necessary files and directories to
        support the user's session. For an interactive session this requires at
        least a shell, typically sh, and basic /dev nodes such as null, zero,
        stdin, stdout, stderr, and tty devices. For file transfer sessions
        using SFTP no additional configuration of the environment is necessary
        if the in-process sftp-server is used, though sessions which use
        logging may require /dev/log inside the chroot directory on some
        operating systems (see sftp-server for details).

Another advantage of the internal-sftp is a performance, as it's not necessary
to run a new sub-process for it.


Match
    The arguments to Match are one or more criteria-pattern pairs or the single
    token All which matches all criteria.  The available criteria are User,
    Group, Host, LocalAddress, LocalPort, RDomain, and Address (with RDomain
    representing the rdomain(4) on which the connection was received).

ChrootDirectory
    Specifies the pathname of a directory to chroot(2) to after authentication.
    At session startup sshd(8) checks that all components of the pathname are
    root-owned directories which are not writable by any other user or group.
    After the chroot, sshd(8) changes the working directory to the user's home
    directory.  Ar‐guments to ChrootDirectory accept the tokens described in
    the TOKENS section.

TOKENS
    Arguments to some keywords can make use of tokens, which are expanded at runtime:
        
        %h    The home directory of the user.
        %U    The numeric user ID of the target user.
        %u    The username.
        
        %%    A literal ‘%’.
        %D    The routing domain in which the incoming connection was received.
        %F    The fingerprint of the CA key.
        %f    The fingerprint of the key or certificate.
        %i    The key ID in the certificate.
        %K    The base64-encoded CA key.
        %k    The base64-encoded key or certificate for authentication.
        %s    The serial number of the certificate.
        %T    The type of the CA key.
        %t    The key or certificate type.


ForceCommand
    Forces the execution of the command specified by ForceCommand, ignoring any
    command supplied by the client and ~/.ssh/rc if present.

    The command is invoked by using the user's login shell with the -c option.
    This applies to shell, command, or subsystem execution.

    It is most useful inside a Match block.  The command originally supplied by
    the client is available in the SSH_ORIGINAL_COMMAND environment variable.

    Specifying a command of internal-sftp will force the use of an in-process
    SFTP server that requires no support files when used with ChrootDirectory.
    The default is none.


一个例子:
    不允许使用 ssh 登录, chroot 家目录

    ```
    Subsystem sftp internal-sftp
        Match All
        ForceCommand internal-sftp
        ChrootDirectory %h
    ```
