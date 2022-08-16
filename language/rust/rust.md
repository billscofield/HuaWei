## Install

➜  Downloads sh rustup-init.sh
info: downloading installer

Welcome to Rust!

This will download and install the official compiler for the Rust
programming language, and its package manager, Cargo.

Rustup metadata and toolchains will be installed into the Rustup
home directory, located at:

    /root/.rustup

This can be modified with the RUSTUP_HOME environment variable.

The Cargo home directory is located at:

    /root/.cargo

This can be modified with the CARGO_HOME environment variable.

The cargo, rustc, rustup and other commands will be added to
Cargo's bin directory, located at:

    /root/.cargo/bin

This path will then be added to your PATH environment variable by
modifying the profile files located at:

    /root/.profile
    /root/.bashrc
    /root/.zshenv

You can uninstall at any time with rustup self uninstall and
these changes will be reverted.

Current installation options:


    default host triple: x86_64-unknown-linux-gnu
      default toolchain: stable (default)
                profile: default
   modify PATH variable: yes

1) Proceed with installation (default)
    2) Customize installation
    3) Cancel installation



to check the rust version

    rustc -V
    rustc --version
        rustc 1.63.0 (4b91a6ea7 2022-08-08)
                        commit


Note, you will need to activate the (Rust environment) for your current shell. This is done using the following command to activate the rust environment:

    source ~/.profile
    source ~/.cargo/env


rustup update

rustup self uninstall

## 



