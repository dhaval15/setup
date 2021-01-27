#!/bin/sh
BASE_DIR=$(dirname $0)
CARBON_INSTALLATION_DIRECTORY="$HOME/Dummy"
CARBON_BACKUP_ACTION="ask"

cd "$BASE_DIR"

carbonInstall () {
	echo "$(tput setaf 2)[INFO]: $a installed.$(tput setaf 7)"	
}

carbonAsk() {
	echo "Do you want to backup $1 ?"
	read -p "$(tput setaf 2)[Yes]$(tput setaf 7)  [No]   :" yn
    	case $yn in
        	[Yy]* ) CARBON_BACKUP_ACTION="backup"; return;;
        	[Nn]* ) CARBON_BACKUP_ACTION="delete"; return;;
        	* ) CARBON_BACKUP_ACTION="backup"; return;;
    	esac
}

carbonBackup () {
	if [ $CARBON_BACKUP_ACTION == "delete" ]; then
		rm -rf $1
		echo "$(tput setaf 2)[INFO]: Old $1 deleted.$(tput setaf 7)"	
	elif [ $CARBON_BACKUP_ACTION == "backup" ]; then
		mv $1 $1_backup
		echo "$(tput setaf 2)[INFO]: $1 backed up as $1_backup.$(tput setaf 7)"	
	elif [ $CARBON_BACKUP_ACTION == "ask" ]; then
		carbonAsk $1
		carbonBackup $1
		CARBON_BACKUP_ACTION="ask"
	fi
	
}

carbonClone () {
	if [ -d $2 ] || [ -f $2 ]; then
		carbonBackup $2
	fi
	git clone $@
}

carbonLink () {
	if [ -d $1 ] || [ -f $1 ]; then
		if [ -d $2 ] || [ -f $2 ]; then
			carbonBackup $2
		fi
		ln -sr $1 $2
	else
		echo "$(tput setaf 1)[WARNING]: $1 does not exist.$(tput setaf 7)"	
	fi
}

printSection () {
	echo ""
	echo "$(tput setaf 5)==================== $1 ====================$(tput setaf 7)"	
	echo ""
}

printProgress () {
	echo "$(tput setaf 3)=> $1$(tput setaf 7)"	
}

export -f printSection
export -f printProgress
export -f carbonBackup
export -f carbonInstall
export -f carbonClone
export -f carbonLink
export -f carbonAsk
export CARBON_INSTALLATION_DIRECTORY
export CARBON_BACKUP_ACTION

echo "$(tput setaf 4)### Starting ......$(tput setaf 7)"
carbonClone https://github.com/dhaval15/dots.git $CARBON_INSTALLATION_DIRECTORY/dots
./shell.sh
./desktop.sh
./neovim.sh
./applications.sh
echo ""
echo "$(tput setaf 4)### Finished"
