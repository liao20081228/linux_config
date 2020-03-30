#!/bin/bash
GITDIRS=(linux_config blog practice rfdts blog_pictures wangdao_study_note)
for e in $GITDIRS
do
	if [ -e ~/Downloads/$e ]
	then
		cd ~/Downloads/linux_config
		git pull
		/usr/local/bin/gitpush.sh
	fi
done

