Task                                                                Red Hat/Fedora                                          Ubuntu/Debian

Adding, Removing and Upgrading Packages				
Refresh list of available packages                                  Yum refreshes each time it’s used apt-get update
Install a package from a repository                                 yum install package_name                                apt-get install package_name
Install a package file                                              yum install package.rpmrpm -i package.rpm               dpkg --install package.deb
Remove a package                                                    rpm -e package_name                                     apt-get remove package_name
Check for package upgrades                                          yum check-update                                        apt-get -s upgradeapt-get -s dist-upgrade
Upgrade packages                                                    yum updaterpm -Uvh [args]                               apt-get dist-upgrade
Upgrade the entire system                                           yum upgrade                                             apt-get dist-upgrade

Package Information				
Get information about an available package                          yum search package_name                                 apt-cache search package_name
Show available packages                                             yum list available                                      apt-cache dumpavail
List all installed packages                                         yum list installedrpm -qa                               dpkg --list
Get information about a package                                     yum info package_name                                   apt-cache show package_name
Get information about an installed package                          rpm -qi package_name                                    dpkg --status package_name
List files in an installed package                                  rpm -ql package_name                                    dpkg --listfiles package_name
List documentation files in an installed package                    rpm -qd package_name                                    -
List configuration files in an installed package                    rpm -qc package_name                                    -
Show the packages a given package depends on                        rpm -qR package_name                                    apt-cache depends
Show other packages that depend on agiven package                   rpm -q -whatrequires [args]                             apt-cache rdepends
    (reverse dependency)      

Package File Information				
Get information about a package file                                rpm -qpi package.rpm                                    dpkg –info package.deb
List files in a package file rpm -qpl package.rpm                   dpkg –contents package.deb
List documentation files in a package file                          rpm -qpd package.rpm                                    -
List configuration files in a package file                          rpm -qpc package.rpm -
Extract files in a package rpm2cpio package.rpm | cpio -vid         dpkg-deb –extract package.deb dir-to-extract-to
Find package that installed a file rpm -qf filename                 dpkg –search filename
Find package that provides a particular file                        yum provides filename                                   apt-file search filename

Misc. Packaging System Tools				
Show stats about the package cache                                  -                                                       apt-cache stats
Verify all installed packages                                       rpm -Va                                                 debsums
Remove packages from the local cache directory                      yum clean packages apt-get clean
Remove only obsolete packages from the local cache directory        -                                                       apt-get autoclean
Remove header files from the local cache directory                  yum clean headers                                       apt-file purge
    (forcing a new download of same on next use)                    

General Packaging System Information				
Package file extension                                              .rpm                                                    .deb
Repository location configuration                                   /etc/yum.conf                                           /etc/apt/sources.list


https://www.byvoid.com/zht/blog/yum-apt-cmp
