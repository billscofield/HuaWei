#!/usr/bin/env bash

SCRIPT_PATH=$(dirname $(readlink -f $0))
MAYA_TGZ_FILE=Autodesk_Maya_2023_3_Update_Linux_64bit.tgz

# temporary uncompress path
UNCOMPRESS_PATH=${SCRIPT_PATH}/tmp/
mkdir -p ${UNCOMPRESS_PATH}
tar xf MAYA_TGZ_FILE -C ${UNCOMPRESS_PATH}

# delete licensing rpm
rm -rf ${UNCOMPRESS_PATH}/Packages/Licensing

: '
Files there is in Packages/Licensing

adskflexnetclient-11.16.0-0.x86_64.rpm*
adlmapps25-25.0.3-0.x86_64.rpm*
adsklicensing12.1.0.7121-0-0.x86_64.rpm*

adskflexnetserverIPV6-11.18.0-0.x86_64.rpm*
install.sh*
pkg.adlmapps.xml*
pkg.adskflexnetclient.xml*
pkg.licensing.xml*
readme.txt*

    install.sh
        rpm -i "adskflexnetclient-11.16.0-0.x86_64.rpm"
        rpm -i "adlmapps25-25.0.3-0.x86_64.rpm"
        rpm -i "adsklicensing12.1.0.7121-0-0.x86_64.rpm"
'
