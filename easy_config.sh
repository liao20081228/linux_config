#########################################################################
# File Name: install.sh
# Author: liao20081228
# mail: liao20081228@126.com
# Created Time: 2017年06月26日 星期一 21时46分01秒
#########################################################################
CDIR=$PWD
function one_call()
{
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
	for ((i=0 ;i < 120; i++))
	do
		echo -n "#"
	done
	echo ""
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
	for ((i=0 ;i < 120; i++))
	do
		echo -n "#"
	done
	echo ""
	local COND=""
	read -p "$1($2):" -t 7 COND
	if [ $? -gt 128 ]
	then
		echo -e "\n"
	fi

	local COND=${COND:-"$2"}
	if [ $COND = "yes" -o $COND = "y" -o $COND = "ye" -o $COND = "YES" -o $COND = "YE" -o $COND = "Y" ]
	then 
		COND="YES"
	else
		COND="NO"
	fi	
	printf "%-60s" "$1" >> ~/config.log
	printf "==  %s\n" "$COND" >> ~/config.log 
	if [ $COND = "YES"  ] 
	then
		if [ "$4" = "gitconfig" ]
		then
			read -p "input git user.email:" useremail
			read -p "input git user.name:"  username
			git config --global user.name "$username"
			git config --global user.email "$useremail"
		
		elif [ "$4" = "gensshkey" ]
		then
			cd ~
			read -p "input email used to generate ssh key:" email
			ssh-keygen -t rsa -b 4096 -C "$email"
			cd $CDIR
		else
			eval "$3"
		fi
	fi
	unset COND
	unset cmd
	unset prompt
}

touch ~/config.log
cmd="sudo dpkg-reconfigure dash"
prompt="switch between dash and  bash"   
one_call "$prompt" "no" "$cmd"

cmd="sudo passwd root"
prompt="set root password"   
one_call "$prompt" "no" "$cmd"


cmd="cd ~/Downloads ;tar -xzf VMwareTools*; 
	cd vmware-tools-distrib; 
	sudo ./vmware-install.pl;
	cd ~/Downloads;
	sudo rm -r vmware-tools-distrib VMwareTools*.tar.gz;
	cd $CDIR" 

prompt="install vmware-tools and delete files" 
one_call "$prompt" "no" "$cmd"

cmd="sudo apt -y update"
prompt="update software list" 
one_call "$prompt" "yes" "$cmd"

cmd="sudo apt -y upgrade"
prompt="upgrade software"
one_call "$prompt" "no" "$cmd"

cmd="sudo apt -y install git"
prompt="install git"
one_call "$prompt" "yes" "$cmd"


prompt="config git"
one_call "$prompt" "no" "nullcmd" "gitconfig"


prompt="copy  custom headers"
cmd="cd $CDIR;sudo ln -sf $CDIR/include/*.h  /usr/local/include"
one_call "$prompt" "yes" "$cmd"

prompt="install C++ manpages"
cmd="sudo apt -y install cppman"
one_call "$prompt" "no" "$cmd"

prompt="install C manpages"
cmd="sudo apt -y install manpages manpages-dev"
one_call "$prompt" "no" "$cmd"

prompt="install posix manpages"
cmd="sudo apt -y install manpages-posix manpages-posix-dev"
one_call "$prompt" "no" "$cmd"

prompt="install c++ boost  library"
cmd="sudo apt -y install libboost-all-dev"
one_call "$prompt" "yes" "$cmd"


prompt="install ssh"
cmd="sudo apt -y install ssh ;ps -elf |grep ssh"
one_call "$prompt" "yes" "$cmd"


prompt="generate ssh key"
one_call "$prompt" "no" "nullcmd" "gensshkey"

prompt="install vim"
cmd="sudo apt -y install vim; vim --version |grep pyhton"
one_call "$prompt" "yes" "$cmd"

prompt="install net-tools"
cmd="sudo apt -y install net-tools "
one_call "$prompt" "no" "$cmd"


prompt="install iproute2"
cmd="sudo apt -y install iproute2"
one_call "$prompt" "no" "$cmd"



prompt="install some  custom apps/"
cmd="chmod 0755 ./app/remove/rm.sh;
	chmod 0755 ./app/remove/crm.sh;
	chmod 0755 ./app/remove/lrm.sh;
	chmod 0755 ./app/remove/urm.sh;
	chmod 0755 ./app/gitpush.sh;
	sudo ln -sf $CDIR/app/remove/*.sh /usr/local/bin/;
	sudo ln -sf $CDIR/app/gitpush.sh /usr/local/bin/;"
one_call "$prompt" "yes" "$cmd"

prompt="install gcc g++"
cmd="sudo apt -y install gcc g++"
one_call "$prompt" "yes" "$cmd"


prompt="install python and python-dev"
cmd="sudo apt -y install python python-dev"
one_call "$prompt" "yes" "$cmd"

prompt="install python3 and python3-dev"
cmd="sudo apt -y install python3 python3-dev"
one_call "$prompt" "yes" "$cmd"

prompt="install cmake cmake-curses-gui cmake-gui cmake-qt-gui"
cmd="sudo apt -y install cmake cmake-curses-gui cmake-gui"
one_call "$prompt" "yes" "$cmd"

prompt="install  bulid-essential"
cmd="sudo apt -y install build-essential"
one_call "$prompt" "yes" "$cmd"

prompt="install clang"
cmd="sudo apt -y install clang libclang-dev;"
one_call "$prompt" "yes" "$cmd"

prompt="config  vim"
cmd="git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
	ln -sf  $CDIR/vimrc ~/.vimrc;
	mkdir ~/.vim/myUltiSnips;
	ln -sf $CDIR/ultisnips_files/*.snippets ~/.vim/myUltiSnips;"
one_call "$prompt" "yes" "$cmd"

prompt="install vim Plugin YouCompleteMe"
cmd="git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe;
	cd  ~/.vim/bundle/YouCompleteMe;
	git submodule update --init --recursive;
	python3 install.py --clang-completer;
	cd $CDIR;
	ln -sf  $CDIR/ycm_files/ycm_extra_conf_c.py ~/.vim/bundle/YouCompleteMe/third_party/ycmd;
	ln -sf $CDIR/ycm_files/ycm_extra_conf_cpp.py ~/.vim/bundle/YouCompleteMe/third_party/ycmd;"
one_call "$prompt" "yes" "$cmd"

prompt="install code scan tools: cscope ctags"
cmd="sudo apt -y install cscope ctags"
one_call "$prompt" "no" "$cmd"

prompt="update bashrc"
cmd="cat ./custom_bashrc >> $HOME/.bashrc;cd ~;source $HOME/.bashrc"
one_call "$prompt" "no" "$cmd"

prompt="install crotab"
cmd="cd $CDIR;crontab ./crontab/crontab.txt"
one_call "$prompt" "yes" "$cmd"

prompt="install vim plugins:  press [ENTER] and type PluginInstall"
cmd="vim"
one_call "$prompt" "yes" "$cmd"


cat ~/config.log
/bin/rm ~/config.log
