#!/bin/bash
cd $HOME
DRIVER=MLNX_OFED
OS=$(uname | tr 'a-z' 'A-Z')
read -p "input major version(default 5.0):" -t 7 MAJ_VER
echo
read -p "input minor version(default 2.1.8.0):" -t 7 MIN_VER
echo
if [ -z "$MAJ_VER" ]
then
	MAJ_VER=5.0
fi
if [ -z "$MIN_VER"]
then
	MIN_VER=2.1.8.0
fi
VER=$MAJ_VER-$MIN_VER

OS_DISTRI=$(lsb_release -is | tr 'A-Z' 'a-z')
OS_DISTRI_VER=$(lsb_release -sr)
ARCH=$(uname -i)
EXTENTION=tgz
PACKAGE="$DRIVER"_"$OS"-$VER-"$OS_DISTRI""$OS_DISTRI_VER"-"$ARCH"
PACKAGE_NAME="$PACKAGE"."$EXTENTION"
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
