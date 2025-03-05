#!/bin/bash

function menu(){
	echo -e "-------------------MENU----------------------"
	echo "1. Make a file"
	echo "2. Display contents"
	echo "3. Copy the file"
	echo "4. Rename the file"
	echo "5. Delete the file"
	echo "6. Exit"

	read -p "Enter your option: " option
}

function create_file(){
	read -p "Enter a file name: " filename
	if [[ -e ${filename} ]]; then
		echo " File Already exists!!"
		menu
	else
		echo "Enter some data"
		echo "Ctrl + d to save and exit"
		cat > ${filename}
		menu
	fi
}

function display(){
	read -p "Enter a file name: " filename
	if [[ -e ${filename} ]]; then
		cat ${filename}
		menu
	else 
		echo "file doesn't exists "
		menu
	fi
}

function copy(){
	read -p "Enter the Source file: " srcf

	if [[ -e ${srcf} && -r ${srcf} ]]; then
		read -p "Enter the destination file: " desf
		if [[ -e ${desf} ]]; then
			echo " $( cp -rf ${srcf} ${desf}) successfully copied "
			menu
		else 
			echo " invalid target file"
			menu
		fi
	else 
		echo" Invalid source file!!"
		menu
	fi

}

function rename(){
	read -p "Enter the file to rename: " filename
	if [[ -e ${filename} ]]; then
		read -p "Enter the new name for file: " newnm
		echo  " $(mv ${filename} ${newnm}) successfully renamed the file"
		menu
	else 
		echo "Invalid file name"
		menu
	fi

}

function delete(){
	read -p "Enter the file name: " filename
	if [[ -e ${filename} ]]; then
		echo "$(rm -rf ${filename})  successfully deleted"
	        menu
	else 
		echo " Invalid file name"
		menu
	fi
}
menu

while true; do
	case $option in
		"1")
			create_file
			;;
		"2")
			display
			;;
		"3")
			copy
			;;
		"4")
			rename
			;;
		"5")
			delete
			;;
		"6")
			exit
			;;
	esac
done
