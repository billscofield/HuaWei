
```/etc/shadow
root:$6$HtNZ6/jWDQWvsrPE$lCbtR6CjS7tg4dInDFUAyJlg4CiZkMEOxTky67hIyU/Y/.kBSLlH/yYsag9x8GsXiaoiiiYMZ58dLePavcsJq.:18653:0:99999:7:::
man:*:18601:0:99999:7:::
mail:*:18601:0:99999:7:::
www-data:*:18601:0:99999:7:::
backup:*:18601:0:99999:7:::
list:*:18601:0:99999:7:::
irc:*:18601:0:99999:7:::
nobody:*:18601:0:99999:7:::
_apt:*:18601:0:99999:7:::
messagebus:*:18601:0:99999:7:::
sshd:*:18653:0:99999:7:::
telnetd:*:18839:0:99999:7:::

```

### man crypt

The glibc version of this function supports additional encryption algorithms.

    If salt is a character string starting with the characters "$id$" followed
    by a string optionally terminated by "$", then the result has the form:

    $id$salt$encrypted

    id identifies the encryption method used instead of DES and this then
    determines how the rest of the password string is interpreted.  The
    following values of id are supported:

|   ID  | Method
|   ─────────────────────────────────────────────────────────
|   1   | MD5
|   2a  | Blowfish (not in mainline glibc; added in some
|       | Linux distributions)
|   5   | SHA-256 (since glibc 2.7)
|   6   | SHA-512 (since glibc 2.7)

    Thus, $5$salt$encrypted and $6$salt$encrypted contain the password
    encrypted with, respectively, functions based on SHA-256 and SHA-512.

    "salt" stands for the up to 16 characters following "$id$" in the salt.
    The "encrypted" part of the password string is the actual computed
    password.  The size of this string is fixed:

    MD5     | 22 characters
    SHA-256 | 43 characters
    SHA-512 | 86 characters

    The characters in "salt" and "encrypted" are drawn from the set
    [a-zA-Z0-9./].  In the MD5 and SHA implementations the entire key is
    significant (instead of only the first 8 bytes in DES).


grub-crypt

grub-mkpasswd-pbkdf2
    centos7 中已经没有了 grub-crypt
