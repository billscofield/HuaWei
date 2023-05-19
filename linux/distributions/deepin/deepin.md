## nvidia

ERROR: The installation was canceled due to the availability or presence of an
alternate driver installation. Please see /var/log/nvidia-installer.log for
more details.


apt autoremove nvidia-*


blacklist nouveau
blacklist lbm-nouveau
options nouveau modeset=0
alias nouveau off
alias lbm-nouveau off

update-initramfs -u
