#########################################################################
# File Name: rm.sh
# Author: liao20081228
# mail: liao20081228@126.com
# Created Time: 2017年06月22日 星期四 03时22分00秒
#########################################################################
#!/bin/bash
directory=$HOME/.Trash
currentdir=$PWD
if [ ! -e $directory ]
then
	echo "creat $directory"
	mkdir $directory
fi

if [ $# != 0 ]
then
	for file in $@
	do
		if [ -e  $file ] 
		then
			cd $(dirname $file)
			dir=$PWD
			cd $currentdir
			mv $file $directory/${dir//\//:}@$(date +%Y%m%d%u%H%M%S)%$(basename $file)
			echo "rm \"$file\" successfully!"
		else
			echo "error: \"$file\" not exist"
		fi
	done
else
	echo "please input files or directorys!"
fi
