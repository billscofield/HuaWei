
Usage: dpkg-architecture [<option>...] [<command>]

Commands:
  -l, --list                list variables (default).
  -L, --list-known          list valid architectures (matching some criteria).
  -e, --equal <arch>        compare with host Debian architecture.
  -i, --is <arch-wildcard>  match against host Debian architecture.
  -q, --query <variable>    prints only the value of <variable>.
  -s, --print-set           print command to set environment variables.
  -u, --print-unset         print command to unset environment variables.
  -c, --command <command>   set environment and run the command in it.
  -?, --help                show this help message.
      --version             show the version.

Options:
  -a, --host-arch <arch>    set host Debian architecture.
  -t, --host-type <type>    set host GNU system type.
  -A, --target-arch <arch>  set target Debian architecture.
  -T, --target-type <type>  set target GNU system type.
  -W, --match-wildcard <arch-wildcard>
                            restrict architecture list matching <arch-wildcard>.
  -B, --match-bits <arch-bits>
                            restrict architecture list matching <arch-bits>.
  -E, --match-endian <arch-endian>
                            restrict architecture list matching <arch-endian>.
      --print-format <format>
                            use <format> for --print-set and --print-unset,
                              allowed values: shell (default), make.
  -f, --force               force flag (override variables set in environment).




TERMS
       **build machine**
           The machine the package is built on.

       **host machine**
           The machine the package is built for.

       **target machine**
           The machine the compiler is building for.  This is only needed when building a cross-toolchain, one that will be built on the build
           architecture, to be run on the host architecture, and to build code for the target architecture.

       Debian architecture
           The Debian architecture string, which specifies the binary tree in the FTP archive. Examples: i386, sparc, hurd-i386.

       Debian architecture tuple
           A Debian architecture tuple is the fully qualified architecture with all its components spelled out.  This differs with Debian architectures in
           that at least the cpu component does not embed the abi.  The current tuple has the form abi-libc-os-cpu.  Examples: base-gnu-linux-amd64,
           eabihf-musl-linux-arm.


