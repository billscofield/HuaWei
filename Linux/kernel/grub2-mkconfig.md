
https://linuxhint.com/grub2_mkconfig_tutorial/

If you’re using Linux for quite a while and it is your daily task to install and test new Linux distributions, then you might have seen at times all the installed operating systems are not listed in the GRUB menu. It may be due to GRUB not being installed correctly, or GRUB not able scan the hard drives correctly.
If it ever happened to you, do not freak out! It is really very easy to solve. The GRUB 2 bootloader has special tools for scanning the hard drives installed on your computer for bootable operating systems installed on your hard drives.

In this article, I will show you how to solve the problems stated above and use grub2-mkconfig tool to solve it.  I will be using Debian 9 Stretch for the demonstration, but it should work on any modern Linux distribution with GRUB 2 installed. Let’s get started.

## What grub2-mkconfig Does:

grub2-mkconfig is a really simple tool. All it does is scan the hard drives of your computer for installed bootable operating systems (including Window, Mac OS and any Linux distributions) and generates a GRUB 2 configuration file. That’s it.


## Difference Between grub2-mkconfig and grub-mkconfig:

Even though GRUB 2 is installed on your computer, the grub2-mkconfig command may not be available in your favorite Linux distribution. But the grub-mkconfig command may be available in your Linux distribution. There is no difference between grub-mkconfig and grub2-mkconfig if GRUB 2 is installed.



## Using grub2-mkconfig:

The grub2-mkconfig or the grub-mkconfig command only has one important option. The -o or long format the –output option. It is used to tell GRUB 2 where the generated GRUB configuration file should be saved.

By default, grub2-mkconfig or the grub-mkconfig command prints the generated configuration file to STDOUT, which is the terminal of your Linux operating system.


If you want, you can export the generated GRUB 2 configuration to a file. 

> grub2-mkconfig -o FILE_PATH
> grub2-mkconfig -output FILE_PATH



## Updating GRUB 2 Configuration File (BIOS):

If you’re using old BIOS based motherboards, then the GRUB 2 bootloader configuration file should be in the /boot/grub/grub.cfg file


## Updating GRUB 2 Configuration File (UEFI):

On UEFI based motherboards, updating the GRUB 2 configuration is a little bit trickier.

On EFI based Linux installs, the GRUB 2 configuration file is in the /boot/efi/EFI/<YOUR_OS>/grub.cfg

Here, <YOUR_OS> is the name of the directory where the grub.cfg is located. The directory name will be different for each Linux distribution. The trick is to determine the name of the directory that is being used at boot time. If you haven’t been playing around with different Linux distribution, chances are higher that there will be only one directory. Otherwise, there will be many directories from which you will have to determine the active one.




