#!/bin/bash
cd $HOME
DRIVER=MLNX_OFED
OS=LINUX

read -p "input major version" -t 7 MAJ_VER
read -p "input minor version" -t 7 MIN_VER

MAJ_VER=5.0
MIN_VER=2.1.8.0

VER=$MAJ_VER-$MIN_VER
DISTRI=$(lsb_release -is | tr 'A-Z' 'a-z')
DISTRI_VER=$(lsb_release -sr)
ARCH=$(uname -i)
EXTENTION=tgz
PACKAGE="$DRIVER"_"$OS"-$VER-$DISTRI$DISTRI_VER-$ARCH
PACKAGE_NAME=$PACKAGE.$EXTENTION
URL_PRE=http://content.mellanox.com/ofed
if [ ! -e ./$PACKAGE_NAME ]
then
	wget $URL_PRE/$DRIVER-$VER/$PACKAGE_NAME
fi
if [ ! -e ./$PACKAGE ]
then
	tar -xf ./$PACKAGE_NAME
fi
cd ./$PACKAGE
if [ -e /etc/init.d/openibd ]
then
	sudo /etc/init.d/openibd stop
	if [ -e /usr/sbin/ofed_uninstall ]
	then
		sudo ofed_uninstall.sh
		sudo ./uninstall.sh
	fi
fi

sudo ./mlnxofedinstall --basic --upstream-libs --without-rshim-dkms \
	--without-iser-dkms --without-isert-dkms --without-srp-dkms \
	--without-srptools --with-perftest --without-nfsrdma --force
sudo /etc/init.d/openibd restart
ofed_info
sudo rm -r $HOME/$PACKAGE
#sudo rm -r $HOME/$PACKAGE_NAME
