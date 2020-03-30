for e in `ls`
do
	if [ -d $e ]
	then
		for ee in `ls $e`
		do
			sed -i "s/raw.githubusercontent.com\/liao20081228\/blog\/master\/图片/gitee.com\/liao20081228\/blog_pictures\/raw\/master/g" $e/$ee
			sed -i "s/www.github.com\/liao20081228\/blog\/raw\/master\/图片/gitee.com\/liao20081228\/blog_pictures\/raw\/master" $e/$ee
		done
	else
		sed -i "s/raw.githubusercontent.com\/liao20081228\/blog\/master\/图片/gitee.com\/liao20081228\/blog_pictures\/raw\/master/g" $e
		sed -i "s/www.github.com\/liao20081228\/blog\/raw\/master\/图片/gitee.com\/liao20081228\/blog_pictures\/raw\/master" $e
	fi
done
