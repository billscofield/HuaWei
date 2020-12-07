
echo username:newoasswd | chpasswd

By default the passwords must be supplied in clear-text, and are encrypted by chpasswd. Also the password
age will be updated, if present.

By default, passwords are encrypted by PAM, but (even if not recommended) you can select a different
encryption method with the -e, -m, or -c options.


-c, --crypt-method METHOD
    Use the specified method to encrypt the passwords.

    The available methods are DES, MD5, NONE, and SHA256 or SHA512 if your libc support these methods.

    By default, PAM is used to encrypt the passwords.

-e, --encrypted
    Supplied passwords are in encrypted form.

-h, --help
    Display help message and exit.

-m, --md5
    Use MD5 encryption instead of DES when the supplied passwords are not encrypted.

-R, --root CHROOT_DIR
    Apply changes in the CHROOT_DIR directory and use the configuration files from the CHROOT_DIR directory.

-s, --sha-rounds ROUNDS
    Use the specified number of rounds to encrypt the passwords.

    The value 0 means that the system will choose the default number of rounds for the crypt method (5000).

    A minimal value of 1000 and a maximal value of 999,999,999 will be enforced.

    You can only use this option with the SHA256 or SHA512 crypt method.

    By default, the number of rounds is defined by the SHA_CRYPT_MIN_ROUNDS and SHA_CRYPT_MAX_ROUNDS
    variables in /etc/login.defs.


FILES
    /etc/passwd
        User account information.

    /etc/shadow
        Secure user account information.

    /etc/login.defs
        Shadow password suite configuration.

    /etc/pam.d/chpasswd
        PAM configuration for chpasswd.

SEE ALSO
   passwd(1), newusers(8), login.defs(5), useradd(8).




