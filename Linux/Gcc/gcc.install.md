

## How to Install GCC Compiler on Ubuntu 18.04 

--- Install multiple gcc versions on Ubuntu


https://www.ultralinux.org/post/how-to-install-gcc-compiler-on-ubuntu-18-04/


### Install GCC Ubuntu

Run following commands to update system, install build-essential and man pages. The build-essential will install gcc, g++ and make.

```
sudo apt update
sudo apt install build-essential
sudo apt-get install manpages-dev

```

### Run gcc --version nowo

gcc --version


### Install Multiple GCC Versions

Check out latest GCC version at...

https://gcc.gnu.org/

To install the latest version, we need to add ubuntu-toolchain-r/test PPA to our system. Run following two commands to do that.

```
sudo apt install software-properties-common
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
```

Now let us install latest gcc, gcc+

```
sudo apt install gcc-7 g++-7 gcc-8 g++-8 gcc-9 g++-9 gcc-10 g++-10 -y 
```

Next we need to add the gcc ones to list of alternatives. Run following to do that.


```
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 8
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10
```

The last digit, sets the priority. The one with highest priority is set by default. So if we do gcc --version, we would see gcc to be version 10. Let us check that.

```
gcc --version
```


To change default version, run following command.

```
sudo update-alternatives --config gcc

```

From the above, choose the gcc version which you want to set as the default version.
