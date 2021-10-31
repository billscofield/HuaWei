
dpkg-deb - Debian package archive (.deb) manipulation tool

打包

    ./vim
        ./vim/DEBIAN
            control
            conffiles
            preinst
            prerm
            postinst
            postrm
            md5sums
            shlibs
            config
            templates
        /usr
            /bin/vim
        /etc/

    ./vim/DEBIAN 同级目录
        dpkg-deb --build ../vim.deb
