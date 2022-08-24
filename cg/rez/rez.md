## [rez](https://lingyunfx.com/03%20rez-getting-started/)

1. git clone https://gitee.com/billscofield/rez.git ~/

    pytho3 install.py
    ...
    SUCCESS!
    Rez executable installed to: /opt/rez/bin/rez/rez
    Rez python package installed to: /opt/rez/lib/python3.6/site-packages/rez

    To activate Rez, add the following path to $PATH:
    /opt/rez/bin/rez

    You may also want to source the completion script (for bash):
    source /opt/rez/completion/complete.sh


rez --version


rez-bind --quickstart

    Successfully converted the following software found on the current system into Rez packages:

    PACKAGE     URI
    -------     ---
    arch        /root/packages/arch/x86_64/package.py
    os          /root/packages/os/centos-7/package.py
    pip         /root/packages/pip/19.1.1/package.py
    platform    /root/packages/platform/linux/package.py
    python      /root/packages/python/2.7.5/package.py
    rez         /root/packages/rez/2.111.3/package.py
    rezgui      /root/packages/rezgui/2.111.3/package.py
    setuptools  /root/packages/setuptools/41.0.1/package.py

    To bind other software, see what's available using the command 'rez-bind --list', then run 'rez-bind <name>'.

