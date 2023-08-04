# pacman

    pacman {-h --help}
    pacman {-V --version}
    pacman {-D --database} <options> <package(s)>
    pacman {-F --files}    [options] [file(s)]
    pacman {-Q --query}    [options] [package(s)]
    pacman {-R --remove}   [options] <package(s)>
    pacman {-S --sync}     [options] [package(s)]
    pacman {-T --deptest}  [options] [package(s)]
    pacman {-U --upgrade}  [options] <file(s)>


[pacman](https://wiki.archlinux.org/title/Pacman)

The goal of pacman is to make it possible to easily manage packages, whether
they are from the official repositories or the user's own builds.

Pacman is written in the C programming language and uses the bsdtar tar format
for packaging.

## 1. Usage

### 1.1 Installing packages

A package is an archive containing:

    - all of the (compiled) files of an application
    - metadata about the application, such as application name, version, dependencies, etc.
    - installation files and directives for pacman
    - (optionally) extra files to make your life easier, such as a start/stop script

Arch's package manager pacman can install, update, and remove those packages.
Using packages instead of compiling and installing programs yourself has
various benefits:

    - easily updatable: pacman will update existing packages as soon as updates
      are available

    - dependency checks: pacman handles dependencies for you, you only need to
      specify the program and pacman installs it together with every other
      program it needs

    - clean removal: pacman has a list of every file in a package; this way, no
      files are unintentionally left behind when you decide to remove a
      package.

Note:

    - Packages often have optional dependencies which are packages that provide
      additional functionality to the application but not strictly required for
      running it. **When installing a package, pacman will list a package's
      optional dependencies, but they will not be found in pacman.log.** Use
      the **Querying package databases** command to view the optional
      dependencies of a package.

    - When installing a package which you require only as a (optional)
      dependency of some other package (i.e. not required by you explicitly),
      it is recommended to use the **--asdeps** option. For details, see the
      **Installation reason** section.


Warning:

    when installing packages in arch, avoid refreshing the package list without
    upgrading the system (for example, when a package is no longer found in the
    official repositories). in practice, do not run `pacman -sy package_name`
    instead of `pacman -syu package_name`, as this could lead to dependency
    issues. see system maintenance#partial upgrades are unsupported and
    bbs#89328.

#### 1.1.1 Installing specific packages

    pacman -S package_name1 package_name2 ...

To install a list of packages with regex

    pacman -S $(pacman -Ssq package_regex)

#### 


### 1.4 Querying package databases

Pacman queries
    - -Q: local package database with the -Q flag
    - -S: the sync database with the -S flag
    - -F: the files database with the -F flag

To display extensive information about a given package:
    pacman -Si package_name


-s, --search <regexp>

    Search each locally-installed package for **names** or **descriptions**
    that match **regexp**. When including multiple search terms, only packages
    with descriptions matching ALL of those terms are returned.


To search for already installed packages:
    $ pacman -Qs string1 string2 ...

To search for package file names in remote packages:
    用来所有某个文件属于哪个软件
    $ pacman -F string1 string2 ...
    会在已经安装的软件后边标识 [installed]

To display extensive information about a given package:
    $ pacman -Si package_name
For locally installed packages:
    $ pacman -Qi package_name

Passing two -i flags will also display the list of backup files and their modification states:
    $ pacman -Qii package_name

    比如 pacman -Qii openssh 会比 pacman -Qi 多出如下信息

    Backup Files    :
    UNMODIFIED      /etc/pam.d/sshd
    UNMODIFIED      /etc/ssh/ssh_config
    MODIFIED        /etc/ssh/sshd_config

To retrieve a list of the files installed by a package:
    $ pacman -Ql package_name

To retrieve a list of the files installed by a remote package:
    $ pacman -Fl package_name

To verify the presence of the files installed by a package:
    $ pacman -Qk package_name

    liujiao# pacman -Qk vim
    vim: 187 total files, 0 missing files

Passing the k flag twice will perform a more thorough check.

    liujiao# pacman -Qkk openssh
    backup file: openssh: /etc/ssh/sshd_config (Modification time mismatch)
    backup file: openssh: /etc/ssh/sshd_config (Size mismatch)
    backup file: openssh: /etc/ssh/sshd_config (MD5 checksum mismatch)
    backup file: openssh: /etc/ssh/sshd_config (SHA256 checksum mismatch)
    openssh: 58 total files, 0 altered files


To query the database to know which package a file in the file system belongs to:
    $ pacman -Qo /path/to/file_name

    liujiao# pacman -Qo /etc/ssh/sshd_config
    /etc/ssh/sshd_config is owned by openssh 9.3p2-1


To query the database to know which remote package a file belongs to:
    $ pacman -F /path/to/file_name

    liujiao# pacman -F /etc/ssh/sshd_config
    etc/ssh/sshd_config is owned by core/openssh 9.3p2-1


To list all packages no longer required as dependencies (orphans):
    $ pacman -Qdt

    --nodeps
        skip dependency version checks. Package names are still checked. Specify this option twice to skip all dependency checks.

    -t, --unrequired
        Restrict or filter output to print only packages neither required nor optionally required by any currently installed package. 

To list all packages explicitly installed and not required as dependencies:
    $ pacman -Qet

### 1.4.1 Pactree



## 2.
