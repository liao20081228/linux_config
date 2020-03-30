#########################################################################
# File Name: lrm.sh
# Author: ma6174
# mail: liao20081228@126.com
# Created Time: 2017年06月22日 星期四 04时51分34秒
#########################################################################
#!/bin/bash
if [ -e $HOME/.Trash ]
then
	ls $HOME/.Trash
else
	echo "error:\"$HOME/.Trash\" not exist!"
fi
