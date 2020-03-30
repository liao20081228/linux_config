#########################################################################
# File Name: urm.sh
# Author: ma6174
# mail: liao20081228@126.com
# Created Time: 2017年06月22日 星期四 04时57分22秒
#########################################################################
#!/bin/bash
currentdir=$PWD
if [ -e $HOME/.Trash ] 
then
	if [ $# == 0 ]
	then
		for file1 in $(ls $HOME/.Trash)
		do
			if [ $file1 != "." -a $file1 != ".." ]
			then
				dir_suffix=${file1%@*}
				file_suffix=${file1#*%}
				mv $HOME/.Trash/$file1 ${dir_suffix//://\/}/$file_suffix 
			fi
		done
		echo "recovery all removed files successfully"
	else
		for file2 in $@
		do
			if [ $file2 == $(basename $file2) ]
			then
				if [ -e $HOME/.Trash/$file2 ]
				then 
					dir_suffix=${file2%@*}
					file_suffix=${file2#*%}
					mv $HOME/.Trash/$file2 ${dir_suffix//://\/}/$file_suffix 
					echo "recovery $file2 successfully"
				else
					echo "error: \"$file2\" not exist!"
				fi
			else
				if [ -e $file2 ]
				then 
					filename=$(basename $file2)
					dir_suffix=${filename%@*}
					file_suffix=${filename#*%}
					mv $file2 ${dir_suffix//://\/}/$file_suffix 
					echo "recovery $file2 successfully"
				else
					echo "error: \"$file2\" not exist!"
				fi
			fi
		done
	fi
else
	echo "error: \"$HOME/.Trash\" not exist!"
fi
