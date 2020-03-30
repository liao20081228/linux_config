#########################################################################################
# File Name: test.sh
# Author: ma6174
# mail: liao20081228@126.com
# Created Time: 2017年07月26日 星期三 16时11分26秒
#########################################################################################
#!/bin/bash
for filename in /usr/include/openssl/*
do
	echo "#include<openssl/$(basename $filename)>" >> /home/liao/Backup/linuxconfig/openssl.h
done
