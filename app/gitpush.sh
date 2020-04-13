#########################################################################
# File Name: git.sh
# Author: ma6174
# mail: liao20081228@126.com
# Created Time: 2017年04月03日 星期一 17时34分53秒
#########################################################################
#!/bin/bash
function display_split_line()
{
	if [ ! "$2" ]
	then
		echo -e "\033[31;1m $1 \033[0m"
		return 0
	fi
	local i=0
	local total=118
	local arglen=$(expr length "$1")
	local len=$(($total - $arglen))
	local reset=$(($len % 2))
	
	if [ $reset == 0 ]
	then
		local  len1=$(expr $len / 2)
		local  len2=$len1
	else
		local  len1=$(expr $len / 2)
		local  len2=$(expr $len1 + 1)
	fi
	for ((i=0 ;i < $len1; i++))
	do
		echo -n "#"
	done
	echo -en "\033[31;1m $1 \033[0m"
	for ((i=0 ;i < $len2; i++))
	do
		echo -n "#"
	done
	echo ""
}

curdir=$PWD

if [ $# -eq 0  ]
then
	gitdir=$PWD
else
	gitdir=$1
	if [ "$1" == "." ]
	then
		gitdir=$PWD
	fi
fi

function lookup_gitdir()
{
	cd $1
	if [ -d ./.git ]
	then
		return 0
	else
		if [ "$PWD" == "/" ]
		then
			echo "error: \"$gitdir\" is not a git repository !"
			cd $curdir
			exit 1
		else
			lookup_gitdir ..
		fi
	fi
}

if [ -d $gitdir ]
then
	lookup_gitdir  $gitdir
else
	echo "error: \"$gitdir\" is not existence !"
	exit 1
fi

display_split_line "start sync git repository: $gitdir" "yes"

if [ "$(git status|grep "nothing to commit, working tree clean")" ]
then
	display_split_line "end sync git repository: $gitdir" "yes"
	exit 0
fi

display_split_line "get the current status of repository"
git status

display_split_line "add files to cache"
git add *

display_split_line "get the current status of repository"
git status

display_split_line "commit the files in cache to current local repository"
read -p "use the custom comments?(default: no)" -t 7 COND
echo
if [ ! $COND ]
then
       COND="no"
fi

if [ $COND = "yes" -o $COND = "y" -o $COND = "ye" -o $COND = "YES" -o $COND = "YE" -o $COND = "Y"  ] 
then
	read -p "please input custom commentse:" comment
fi

if [ ! $comment ]
then
	comment="$(date)"
fi
git commit --signoff -m "$comment"

display_split_line "push local repository to remote repository"
COND=""
read -p "multiple remote repositories synchronization?(default: yes)" -t 7 COND
echo
read -p "please input hostname pushed (default: origin):" -t 7  hostname
echo
read -p "please input local branch name pushed (default: master):" -t 7  localbranchname
echo
read -p "please input remote branch name pushed (default: master):" -t 7 remotebranchname
echo
if [ ! $hostname ]
then
	hostname="origin"
fi
if [ ! $localbranchname ]
then
	localbranchname="master"
fi
if [ ! $remotebranchname ]
then
	remotebranchname="master"
fi
if [ ! $COND ]
then
       COND="yes"
fi

if [ $COND = "yes" -o $COND = "y" -o $COND = "ye" -o $COND = "YES" -o $COND = "YE" -o $COND = "Y"  ]
then
	temp=$(basename $gitdir)
	if [ -z "$(echo $(git remote -v) | grep gitee.com)" ]
	then
		git remote set-url --add $hostname git@gitee.com:liao20081228/$temp.git 
	fi
	if [ -z "$(echo $(git remote -v) | grep github.com)" ]
	then
		git remote set-url --add $hostname git@github.com:liao20081228/$temp.git 
	fi
	#if [ -z "$(echo $(git remote -v) | grep gitlab.com)" ]
	#then 
		#git remote set-url --add $hostname git@gitlab.com:liao20081228/$temp.git 
	#fi
fi

git push $hostname $localbranchname:$remotebranchname
display_split_line "end sync git repository: $gitdir" "yes"
cd $curdir
