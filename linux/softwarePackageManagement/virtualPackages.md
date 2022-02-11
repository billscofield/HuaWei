---
A virtual package is a generic name that applies to any one of a group of
packages, all of which provide similar basic functionality. For example, both
the tin and trn programs are news readers, and should therefore satisfy any
dependency of a program that required a news reader on a system, in order to
work or to be useful. They are therefore both said to provide the "virtual
package" called news-reader.

Similarly, smail and sendmail both provide the functionality of a mail
transport agent. They are therefore said to provide the virtual package, "mail
transport agent". If either one is installed, then any program depending on the
installation of a mail-transport-agent will be satisfied by the existence of
this virtual package.

Debian provides a mechanism so that, if more than one package which provide the
same virtual package is installed on a system, then system administrators can
set one as the preferred package. The relevant command is update-alternatives,
and is described further in Some users like mawk, others like gawk; some like
vim, others like elvis; some like trn, others like tin; how does Debian support
diversity?, Section 10.10.

https://www.linuxtopia.org/online_books/linux_system_administration/debian_linux_guides/debian_linux_faq/ch-pkg_basics.en_007.html

---

A virtual package is just like a regular package, except without any actual
content (i.e. your application files and components). It can contain all of the
same metadata that a regular package has, but the contents themselves are
external to the package file.

Most of the time, you won't even know you're using a virtual package. They
appear as regular packages in a feed (unless you look carefully at a metadata
parameter), and they will download/install as a regular package, with all of
the externally-referenced content included.

There are two main key usecases for virtual packages:

Usecase: Bundling Multiple Packages There are several instances where you may
want to bundle a set of packages into a single, logical package.

For example, let's say you've built an application that is customized for six
different customers by overwriting logos, javascript files, or any other
resources within the application. The "base" application is totally unusable on
its own for anything other than testing/QA purposes, and the "resources" are
even more useless. They require being combined with a specific version of the
"base" application to even be tested.

This is easily solved with a virtual package that "bundles" a specific version
of the base application (CrmAppBase) and the client customization (InitechApp)
into a single, logical package (Initech.Crm).

When you deliver the package, it will be exactly what is needed. But you can
easily see the versions/components used to assemble it by looking at the
metadata.

Usecase: Logical Packaging of External Files Another way to use Virtual
Packages is by pointing to well-known, external files.

For example, if your package will contain large, unchanging, multi-gigabyte
assets (like movies, or map files), maintaining and transferring multiple
versions of those packages will be slow and require a lot of disk resources.
Instead, you can use file references to logically package these resources in a
package.

You can also bundle these files alongside your regular package contents through
bundling.


https://docs.inedo.com/docs/upack/virtual-packages/what-is

---
