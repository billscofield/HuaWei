
## jitsi ubuntu

[link](https://www.digitalocean.com/community/tutorials/how-to-install-jitsi-meet-on-ubuntu-22-04)

## How To Install Jitsi Meet on Ubuntu 22.04

1. Setting the System Hostname

    hostnamectl set-hostname jitsi.abc.com

    echo "公网ip jits.abc.com">> /etc/hosts

2. Configuring the Firewall

    ```
ufw allow OpenSSH
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 3478/udp
ufw allow 5349/tcp
ufw allow 10000/udp
ufw status
ufw enable
    ```

3. Installing Jitsi Meet

    You will now add the Jitsi and the Prosody APT repositories to your server.
    Prosody is an open-source XMPP chat server that Jitsi uses for messaging
    and admin authentication. You will then install the Jitsi Meet package from
    its repository, which will ensure that you are always running the latest
    stable Jitsi Meet package.

    First, download the Jitsi GPG key with the curl downloading utility:

        curl https://download.jitsi.org/jitsi-key.gpg.key -o jitsi-key.gpg.key

    In this command, -o specifies the name of the file where the downloaded key
    data will be saved. The apt package manager will use this GPG key to
    validate the packages you will download from the Jitsi repository.

    Next, add the GPG key to your system’s keyring with the following gpg command:

        sudo gpg --output /usr/share/keyrings/jitsi-key.gpg --dearmor jitsi-key.gpg.key

    With this gpg command, you use --output to generate a file name to save the
    keyring in and --dearmor to unpack the key into a format usable by APT.

    You will now add the Jitsi repository to your server by creating a new APT
    sources file that contains the Jitsi repository. Open and create the new
    file with the following command:

        sudo nano /etc/apt/sources.list.d/jitsi-stable.list

    Add this line to the /etc/apt/sources.list.d/jitsi-stable.list file:

        deb [signed-by=/usr/share/keyrings/jitsi-key.gpg] https://download.jitsi.org stable/

    Save and exit the editor.

    Next, you will follow the same steps to add the Prosody package. Download
    the Prosody GPG key:

        curl https://prosody.im/files/prosody-debian-packages.key -o prosody-debian-packages.key

    Then, add the key to your server’s keyring:

        sudo gpg --output /usr/share/keyrings/prosody-keyring.gpg --dearmor prosody-debian-packages.key

    Next, open a new sources file for Prosody:

        sudo nano /etc/apt/sources.list.d/prosody.list

    Add the following line to the currently empty Prosody sources file:

        deb [signed-by=/usr/share/keyrings/prosody-keyring.gpg] http://packages.prosody.im/debian jammy main

    Save and exit the editor.

    You can now delete the GPG keys that you downloaded as they are no longer
    needed:

        rm jitsi-key.gpg.key prosody-debian-packages.key

    Finally, perform a system update to collect the package list from the new
    repositories and then install the jitsi-meet package:

        sudo apt update
        sudo apt install jitsi-meet

    Press y to confirm the installation of the packages when prompted.

    During the installation of jitsi-meet you will be prompted to enter the
    domain name (for example, jitsi.your-domain) that you want to use for your
    Jitsi Meet instance.

    Use the TAB key to move the cursor from the hostname field to highlight the
    <OK> button. Press ENTER when <OK> is highlighted to submit the hostname.

    You will then be shown a new dialog box that asks if you want Jitsi to
    create and use a self-signed TLS certificate or use an existing one:

    If you do not have a TLS certificate for your Jitsi domain, select the
    Generate a new self-signed certificate option.

    Your Jitsi Meet instance is now installed using a self-signed TLS
    certificate. You will receive browser warnings if you don’t yet have a TLS
    certificate, so you will get a signed TLS certificate in the next step.

4. Obtaining a Signed TLS Certificate

    Jitsi Meet uses TLS certificates to encrypt the call traffic so that no one
    can eavesdrop on your call as it travels over the internet. TLS
    certificates are the same mechanism used by websites to enable
    HTTPS-protected pages.

    Jitsi uses the certbot utility to obtain and manage free but industry
    standard and secure TLS certificates. You need to install this utility
    before Jitsi can get the certificate it needs.

    Install certbot with the following command:
    
        sudo apt install certbot
        sed -i 's/\.\/certbot-auto/certbot/g' /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh
        sudo ln -s /usr/bin/certbot /usr/sbin/certbot

    Press y to confirm the installation of the certbot package when prompted.

    Jitsi Meet supplies a script to download a TLS certificate for your domain
    automatically. Run this certificate installation script provided by Jitsi
    Meet at /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh with the
    following command:

        sudo /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh

5. Configure Jitsi Meet to enable authentication feature.

    vi /etc/prosody/conf.avail/jits.abc.com.cfg.lua

        # line 39 : change to enable authentication
        VirtualHost "dlp.srv.world"
        authentication = "internal_hashed" -- do not delete me

        root@dlp:~# systemctl restart prosody jicofo jitsi-videobridge2
        root@dlp:~# systemctl reload nginx
        # add users
        # prosodyctl register (username) (hostname) (password)
        root@dlp:~# prosodyctl register serverworld dlp.srv.world mypassword

6. Visit Jitsi Meet Web interface





## Prosody 用户相关

如果想使用prosodyctl命令查下，需要下载相关module
一般的prosody的modules的路径在
/usr/lib/prosody/modules
如果你的路径不在可以使用
prosodyctl about查看


进入modules目录

    cd /usr/lib/prosody/modules/
    wget http://prosody.im/files/mod_listusers.lua

    systemctl restart prosody.service jicofo.service jitsi-videobridge2.service

查询已注册的用户

    prosodyctl mod_listusers



adduser JID - Create the specified user account in Prosody
    这个是交互式的
    prosodyctl adduser abc@jitsi.a.com
passwd JID - Set the password for the specified user account in Prosody
deluser JID - Permanently remove the specified user account from Prosody

start - Start Prosody
stop - Stop a running Prosody server
restart - Restart Prosody
reload - Reload Prosody's configuration and re-open log files
status - Reports the running status of Prosody
