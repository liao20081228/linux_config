#!/bin/bash
if [ -e ~/Downloads/linux_config ]
then
	cd ~/Downloads/linux_config
	git pull
	/usr/local/bin/gitpush.sh
fi

if [ -e ~/Downloads/blog ]
then
	cd ~/Downloads/blog
	git pull
	/usr/local/bin/gitpush.sh
fi

if [ -e ~/Downloads/practice ]
then 
	cd ~/Downloads/practice
	git pull
	/usr/local/bin/gitpush.sh
fi

if [ -e ~/Downloads/rfts ]
then 
	cd ~/Downloads/rfts
	git pull
	/usr/local/bin/gitpush.sh
fi
