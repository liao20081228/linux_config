#!/bin/bash

#read -p "please input nextcloud version which you want to download or/and install like \"17.0.2\"： " NC_VER
#sudo apt update -y
#sudo apt upgrade -y

#install_target=(ssh vim apache2 mysql-server libapache2-mod-php php-gd \
                     #php-json php-mysql php-curl php-mbstring php-intl php-imagick \
				#php-xml php-pgsql php-sqlite php-fileinfo php-bz2 php-ldap \
				#php-smbclient php-ftp php-imap php-exif php-gmp php-apcu \
				   #php-redis php-zip ffmpeg libreoffice axel unzip redis)


#for iter in ${install_target[@]}
#do
	#sudo apt install -y  $iter
#done

#if [ ! -e ~/Downloads ] 
#then
	#mkdir ~/Downloads
#fi

#cd ~/Downloads

#if [ -z $NC_VER ]
#then
	#echo -en "\033[31;1m VERSION is required!\n \033[0m"
	#exit
#fi


#if [ ! -e nextcloud-${NC_VER}.tar.bz2 ]
#then
	#axel -n 10 https://download.nextcloud.com/server/releases/nextcloud-${NC_VER}.tar.bz2
#fi

#if [ ! -e nextcloud-${NC_VER}.tar.bz2.sha256 ]
#then
	#axel -n 10 https://download.nextcloud.com/server/releases/nextcloud-${NC_VER}.tar.bz2.sha256
#fi

#sha256sum -c nextcloud-${NC_VER}.tar.bz2.sha256 < nextcloud-${NC_VER}.tar.bz2
#if [ $? -ne  0 ]
#then
	#rm nextcloud-${NC_VER}.tar.bz2
	#rm nextcloud-${NC_VER}.tar.bz2.sha256
	#echo -en "\033[31;1m the Package can not pass the  sha 256 verification, please re-download\n \033[0m "
	#exit
#fi

#if [ ! -e /srv/www/nextcloud ]
#then
	#sudo mkdir /srv/www
	#sudo tar -xjf ./nextcloud-${NC_VER}.tar.bz2 -C /srv/www/
	#sudo chown -R  www-data:www-data /srv/www/nextcloud
#fi
#if [ ! -e /home/www-data/nextcloud/data ]
#then
	#sudo mkdir -p /home/www-data/nextcloud/data
	#sudo chown -R  www-data:www-data /home/www-data/nextcloud/data
#fi

#mkdir /etc/apache2/cert/
#sudo openssl req -new -x509 -days 3650 -nodes -out /etc/apache2/cert/cert.crt  -keyout /etc/apache2/cert/cert.key
#sudo chmod -R 600 /etc/apache2/cert/*
#sudo chomd -R 700 /etc/apache2/cert

#git clone https://github.com/nextcloud/vm.git ~/vm

cd ~/vm

NO_CHECK_OPEN_PORT="sed -i \"hhh\" $SCRIPTS/nextloud-startup-script.sh"
sed -i "/reboot/a $NO_CHECK_OPEN_PORT" ./nextcloud_install_production.sh 



