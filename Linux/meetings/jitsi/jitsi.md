
# Jitsi

github: https://github.com/jitsi/jitsi-meet


## Debian 10 安装

https://www.digitalocean.com/community/tutorials/how-to-install-jitsi-meet-on-debian-10


1. First, install the gnupg package that enables the system to manage GPG cryptographic keys:

> sudo apt install gnupg

1. Next, download the Jitsi GPG key with the wget downloading utility:

> wget https://download.jitsi.org/jitsi-key.gpg.key

The apt package manager will use this GPG key to validate the packages that you will download from the Jitsi repository.

1. Now, add the GPG key you downloaded to apt’s keyring using the apt-key utility:

> sudo apt-key add jitsi-key.gpg.key

You can now delete the GPG key file as it is no longer needed:

rm jitsi-key.gpg.key

1. Now, you will add the Jitsi repository to your server by creating a new source file that contains the Jitsi repository. Open and create the new file with your editor:

> sudo nano /etc/apt/sources.list.d/jitsi-stable.list
