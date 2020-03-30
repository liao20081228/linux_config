cd  ./blog

for e in `ls`
do
	if [ -d $e ]
	then
		sed -i "s/raw.githubusercontent.com\/liao20081228\/blog\/master\/图片/www.gitee.com\/liao20081228\/blog_pictures\/raw\/master/g" rdma
	else

	fi

done
	`
