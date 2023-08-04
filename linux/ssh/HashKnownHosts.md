
https://linux-audit.com/audit-ssh-configurations-hashknownhosts-option/

# Audit SSH configurations: HashKnownHosts option

## How it works

Each time the SSH client connects with a server, it will store a related
signature (a key) of the server. This information is stored in a file names
named known_hosts. The known_hosts file itself is available in the .ssh
subdirectory of the related user (on the client). In the case the signature of
the server changes, SSH will protect the user by notifying about this chance.

## Risk involved

This configuration option is very useful, but also introduces a new risk.
Previously it was common to store the hostname related with the key. The result
is a “picture” of the network, revealing which systems are connected. This made
it easy for worms and other malicious scripts to use this information and
spread to other systems, once they had a single system compromised.

## Improve security

To reduce the risk of storing a clear picture of the network, the solution
introduced was hashing the hostname. To enable this functionality, the
HashKnownHosts option can be set to yes. This option can be found in the
system-wide SSH client configuration file, which is usually
/etc/ssh/ssh_config.

The final result of hashing entries will look something like this:


```
|1|XV5CFMH8LLIQPq7PxdBhGX7I9PA=|VKNLdODsQlJ/j4cvTZncqs9vgh0= ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFKuhGhv+2AUY2IapdqToiZgCDOnBNT3dbnFL79FQ0JofFmxE9b/jqlwN+a7ZPKsmf+UdJ/RzzZLH8Hs0UgroC0=
```


The hostname (hashed with ecdsa-sha2-nistp256) is unreadable for the human eye
or malicious scripts. For each new connection to the related host, the hashing
algorithm will result in the same string. This way the client knows it already
has a stored key and compare it during the handshaking process with the server.


HashKnownHosts no



ssh-keygen

    -F hostname | [hostname]:port

        Search for the specified hostname (with optional port number) in a
        known_hosts file, listing any occurrences found.

        This option is useful to **find** hashed host names or addresses and
        may also be used in conjunction with the -H option to print found keys
        in a hashed format.

        ssh-keygen -F 10.0.0.1

    -H

        Hash a known_hosts file.  This replaces all hostnames and addresses
        with hashed representations within the specified file; the original
        content is moved to a file with a .old suffix. 


    -f filename
        Specifies the filename of the key file.


    -R hostname | [hostname]:port

        Removes all keys belonging to the specified hostname (with optional
        port number) from a known_hosts file.

        This option is useful to delete hashed hosts (see the -H option above).



如果 known_hosts 文件是明文的，想要进行加密:

    ssh-keygen -H
        会将旧的没有加密的复制一份, 后缀为 .old
        新的 /root/.ssh/known_hosts 会是被机密的文件

从 /root/.ssh/known_hosts 中删除加密的计算机
    ssh-keygen -R 10.0.0.1 -f known_hosts

ssh-keyscan -F 10.0.0.1
    debian 11 默认用的 ecdsa 算法


known_hosts 是未加密的
    ssh-keygen -F <ip> -H
    返回的是加密的 key

## ssh-keyscan - gather ssh public keys

-t type

    Specify the type of the key to fetch from the scanned hosts.  The possible
    values are

        "dsa", "ecdsa","ed25519", or "rsa".

    Multiple values may be specified by separating them with commas.
    The default is to fetch “rsa”,“ecdsa”, and “ed25519” keys.


-f file

    Read hosts or “addrlist namelist” pairs from file, one per line.
    If ‘-’ is supplied instead of a filename

    要写在 -H 前边

ssh-keyscan -t ecdsa -H 10.0.0.1
