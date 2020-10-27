# What is docker.io in relation to docker-ce and docker-ee?

https://stackoverflow.com/questions/45023363/what-is-docker-io-in-relation-to-docker-ce-and-docker-ee

Older versions of the Docker binary were called docker or docker-engine or docker-io

docker-io package is still the name used by Debian/Ubuntu for the docker release provided on their official repos.

docker-ce is a certified release provided directly by docker.com and can also be built from source.

Main reason for using the name docker-io on Debian/Ubuntu platform was to avoid a name conflict with docker system-tray binary.

http://manpages.ubuntu.com/manpages/precise/man1/docker.1.html

Docker has an enterprise version (EE) and a free community Edition version(CE)

Prior to installing Docker Community Edition (docker-ce from docker.com) you may need to remove older binaries.

Centos/RHL:

https://docs.docker.com/engine/installation/linux/docker-ce/centos/

sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
Ubuntu/Debian:

https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/

$ sudo apt-get remove docker docker-engine docker.io containerd runc
Dry-run comparison on ubuntu:

$ sudo apt-get install docker.io --dry-run
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  bridge-utils cgroupfs-mount containerd pigz runc ubuntu-fan
Suggested packages:
  ifupdown aufs-tools debootstrap docker-doc rinse zfs-fuse | zfsutils
The following NEW packages will be installed:
  bridge-utils cgroupfs-mount containerd docker.io pigz runc ubuntu-fan
0 upgraded, 7 newly installed, 0 to remove and 70 not upgraded.
Inst pigz (2.4-1 Ubuntu:18.04/bionic [amd64])
Inst bridge-utils (1.5-15ubuntu1 Ubuntu:18.04/bionic [amd64])
Inst cgroupfs-mount (1.4 Ubuntu:18.04/bionic [all])
Inst runc (1.0.0~rc7+git20190403.029124da-0ubuntu1~18.04.2 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Inst containerd (1.2.6-0ubuntu1~18.04.2 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Inst docker.io (18.09.7-0ubuntu1~18.04.4 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Inst ubuntu-fan (0.12.10 Ubuntu:18.04/bionic [all])
Conf pigz (2.4-1 Ubuntu:18.04/bionic [amd64])
Conf bridge-utils (1.5-15ubuntu1 Ubuntu:18.04/bionic [amd64])
Conf cgroupfs-mount (1.4 Ubuntu:18.04/bionic [all])
Conf runc (1.0.0~rc7+git20190403.029124da-0ubuntu1~18.04.2 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Conf containerd (1.2.6-0ubuntu1~18.04.2 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Conf docker.io (18.09.7-0ubuntu1~18.04.4 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Conf ubuntu-fan (0.12.10 Ubuntu:18.04/bionic [all])

$ sudo apt-get install docker-ce --dry-run
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  aufs-tools cgroupfs-mount containerd.io docker-ce-cli libltdl7 pigz
The following NEW packages will be installed:
  aufs-tools cgroupfs-mount containerd.io docker-ce docker-ce-cli libltdl7 pigz
0 upgraded, 7 newly installed, 0 to remove and 70 not upgraded.
Inst pigz (2.4-1 Ubuntu:18.04/bionic [amd64])
Inst aufs-tools (1:4.9+20170918-1ubuntu1 Ubuntu:18.04/bionic [amd64])
Inst cgroupfs-mount (1.4 Ubuntu:18.04/bionic [all])
Inst containerd.io (1.2.10-3 Docker CE:bionic [amd64])
Inst docker-ce-cli (5:19.03.5~3-0~ubuntu-bionic Docker CE:bionic [amd64])
Inst docker-ce (5:19.03.5~3-0~ubuntu-bionic Docker CE:bionic [amd64])
Inst libltdl7 (2.4.6-2 Ubuntu:18.04/bionic [amd64])
Conf pigz (2.4-1 Ubuntu:18.04/bionic [amd64])
Conf aufs-tools (1:4.9+20170918-1ubuntu1 Ubuntu:18.04/bionic [amd64])
Conf cgroupfs-mount (1.4 Ubuntu:18.04/bionic [all])
Conf containerd.io (1.2.10-3 Docker CE:bionic [amd64])
Conf docker-ce-cli (5:19.03.5~3-0~ubuntu-bionic Docker CE:bionic [amd64])
Conf docker-ce (5:19.03.5~3-0~ubuntu-bionic Docker CE:bionic [amd64])
Conf libltdl7 (2.4.6-2 Ubuntu:18.04/bionic [amd64])
The docker-ce binaries will tend to be the latest versions and include docker-ce-cli.
