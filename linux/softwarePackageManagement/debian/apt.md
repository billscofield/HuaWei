1. apt-cahce madison

    to display available versions of a package along with their respective
    repository sources.

    The term "madison" in this context is a reference to the Madison project,
    an earlier implementation of Debian's mirror infrastructure.

    The apt-cache madison command queries the apt package manager's local
    package cache to list available versions and their sources for the given
    package.




## 附录

### 1. The Madison Project

The Madison project was an earlier implementation of Debian's mirror
infrastructure that was active from 1999 to 2007. It was developed as a
prototype for a new Debian mirror structure that aimed to improve reliability
and increase the overall availability of Debian software packages. Madison
allowed for multiple upstream mirrors to be combined into one, unified view of
Debian's software archive, providing more options for Debian users and reducing
the single point of failure that came with relying on a single mirror.

The project was named after James Madison, one of the founding fathers of the
United States, and a proponent of the idea of dividing power among different
entities to prevent concentration of power. The Madison project applied this
idea to Debian's mirror infrastructure by distributing the responsibility for
providing Debian packages across multiple mirrors.

While the Madison project is no longer used for Debian mirrors, its concepts
and principles continue to influence the development of Debian's mirror
infrastructure today.



## configure

/etc/apt/apt.conf.d/

The `/etc/apt/apt.conf.d/` directory contains individual configuration files
for the apt package manager that are read in alphabetical order by apt. Any
configuration files that are not in this directory will not be read by apt.

Each configuration file can contain multiple directives, which modify the
behavior of apt. For example, one directive could set a proxy server for apt to
use, while another could configure how often apt checks for updates.

They are read in alphabetical order, meaning that files with names starting
with lower numbers (e.g. "00") are read first, followed by files with higher
numbers (e.g. "99"). This makes it possible to give the administrator granular
control over the order in which directives are applied.


