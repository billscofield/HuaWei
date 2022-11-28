
## 

RSA(Rivest-Shamir-Adleman)

DSA(Digital Signature Algorithm)

Both of these were considered state-of-the-art(最先进的；已经发展的) algorithms
when SSH was invented, but DSA has come to be seen as less secure in recent
years. RSA is the only recommended choice for new keys, so this guide uses "RSA
key" and "SSH key" interchangeably(可交换地).



ssh-keygen -t rsa -b 4096
    -b bits

自定义 authorized_keys 文件位置(sshd_config)
    AuthorizedKeysFile    /etc/ssh/%u/authorized_keys


## 学英语

The first step involves(涉及,卷入) creating a set of RSA keys for use in
authentication.

You need to change all your locks if your RSA key is stolen. Otherwise the
thief could impersonate(/ ɪmˈpɜːrsəneɪt /模仿，扮演) you wherever you
authenticate with that key.
