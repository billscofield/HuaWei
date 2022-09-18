

## 安装

linux


git clone https://github.com/debauchee/barrier.git
# this builds from master,
# you can get release tarballs instead
# if you want to build from a specific tag/release
cd barrier
git submodule update --init --recursive
./clean_build.sh
cd build
sudo make install # install to /usr/local/
