# [https://pypi.org/project/rez/](about rez)

A cross-platform packaging system that can build and install multiple version
of packages, and dynamically configure resolved environments at runtime.

Using Rez you can create standalone environments configured for a given set of
packages.

However, unlike many other package managers, packages are not installed into
these standalone environments.

Instead, all package versions are installed into a central repository, and
standalone environments reference these existing packages.

This means that configured environments are lightweight, and very fast to
create, often taking just a few seconds to configure despite containing
hundreds of packages.


1. The Basics

    Packages are stored in repositories on disk.

    Each package has a single concise(简明的) definition file (package.py) that
    defines its dependencies, its commands (how it configures the environment
    containing it), and other metadata.

    For example, the following is the package definition file for the popular
    requests python module:


    ```
    name = "requests"
    version = "2.8.1"
    authors = ["Kenneth Reitz"]
    requires = [
        "python-2.7+"
    ]
    def commands():
        env.PYTHONPATH.append("{root}/python")
    ```

    This package requires python-2.7 or greater. When used, the 'python'
    subdirectory within its install location is appended to the PYTHONPATH
    environment variable.

    When an environment is created with the rez API or rez-env tool, a
    dependency resolution algorithm tracks package requirements and resolves to
    a list of needed packages. The commands from these packages are
    concatenated and evaluated, resulting in a configured environment. Rez is
    able to configure environments containing hundreds of packages, often
    within a few seconds. Resolves can also be saved to file, and when
    re-evaluated later will reconstruct the same environment once more.


## 安装配置

pip install rez  -i https://pypi.tuna.tsinghua.edu.cn/simple


