
[debian 词汇表]( https://wiki.debian.org/Glossary)


###

1.  What is the difference between a Debian suite and a Debian distribution?

See the glossary entries for
distribution(https://wiki.debian.org/Glossary#distribution) and
suite(https://wiki.debian.org/Glossary#suite) (the wiki license is unclear, so
I’ll avoid copying them here).

“Suite” has a formal definition in the context of Release files: it’s a section
of a repository. Less formally, it corresponds to one of the release “trains”:
    oldoldstable (currently Debian 9), 
    oldstable (currently Debian 10),
    stable (currently Debian 11), 
    testing (the forthcoming Debian 12),
    unstable, 
    experimental, and the -security and -updates variants. 

A distribution is typically a suite which can stand alone, i.e. not
experimental, and not the security and update suites.


2. [apt-spy](https://tracker.debian.org/pkg/apt-spy)

This package is not part of any Debian distribution. Thus you will not find
much information here. The package is either very new and has not appeared on
mirrors yet, or it is an old package that eventually got removed. The old news
are kept for historic purpose only.


3. [apt.conf](https://wiki.debian.org/AptConfiguration)

Apt accepts configuration files (without extension) in /etc/apt/apt.conf.d/.
These are processed by Apt in numeric/alphabetical order. **/etc/apt/apt.conf is
also valid but deprecated.**

These files contain directives used by all tools in the Apt suite, you can get
a list of all current values with 

    ` apt-config dump


    1. Dpkg::Pre-Install-Pkgs {"mycommand";};: executes mycommand before package installation/unpacking by Dpkg.

    1. Dpkg::Pre-Invoke {"mycommand";};: executes mycommand before apt calls dpkg

    1. Dpkg::Post-Invoke {"mycommand";};: executes mycommand after apt calls dpkg

    1. Acquire::http::Proxy "http://proxy:8080";: sets the proxy for HTTP downloads

    1. Acquire::https::Proxy "https://proxy:8443";: sets the proxy for HTTPS downloads

    1. Acquire::http::Timeout "2";: sets the timeout for HTTP downloads

    1. Acquire::https::Timeout "2";: sets the timeout for HTTPS downloads

    1. Acquire::ftp::Timeout "2";: sets the timeout for FTP downloads


If you really have to use FTP, this sets the FTP proxy:

```
 Acquire::ftp
 {
   Proxy "ftp://proxy:2121/";
   ProxyLogin
   {
      "USER $(SITE_USER)@$(SITE)";
      "PASS $(SITE_PASS)";
   }
 }
```


