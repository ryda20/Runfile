#!/bin/bash

install_process() {
	# 1. clone project to ~/.Runfile
	mkdir ~/.Runfile
	if [ ! -z "$(which git)" ]; then
		git clone https://gitlab.com/ryda20/runfile.git ~/.Runfile
	elif [ ! -z "$(which curl)" ]; then
		curl https://gitlab.com/ryda20/runfile/-/archive/master/runfile-master.zip \
			--output /tmp/Runfile.zip
		unzip -u /tmp/Runfile.zip -d ~/.Runfile
		rm /tmp/Runfile.zip
	else
		echo "Pls install git or curl to download Runfile"
	fi
}
update_process() {
	echo "removing old one"
	rm -rf ~/.Runfile
	install_process
}

local_process() {
	rm -rf ~/.Runfile
	mkdir -p ~/.Runfile
	cp -rf * ~/.Runfile/
}

alias_set() {
	local rf_alias='
#__====RF_START====
alias run-init="cp ~/.Runfile/run-init.sh . && chmod +x ./run-init.sh && ./run-init.sh && rm ./run-init.sh"
alias run=./Runfile
#__ working mode: loop or normal
export RF_MODE="normal"
#__ space when print out help contents
export RF_TAG_WIDTH=8
export RF_LINE_WIDTH=90
export RF_COLUMN_WIDTH=30
export RF_COLUMN_NUMB=3
#__ github source dir
export RF_REPOS_DIR=~/.Runfile
export RF_AUTO_UPDATE="no"
#__====RF_END====
'
	local processed_file=""
	for f in ~/.[^.]*rc ; do
		# take a realpath for case f is a symbolic link, can check with -L
		# realpath isn't available for all linux or macos system
		# so, i will use readlink -f function
		f=$(readlink -f ${f})

		# check if $f is already processed (case linked to same file)
		if [[ "${processed_file}" == *"${f}"* ]]; then
			echo "File ${f} was processed!"
			continue
		fi
		
		echo "alias setting up on: ${f}"
		# remove empty line and clear all space before each line
		cp ${f} ${f}.tmp && \
		sed \
			-e '/^$/d' \
			-e 's/^[ \t]*//' \
			-e '/^alias run-init=.*$/d' \
			-e '/^alias run=.*$/d' \
			-e '/^export RF_.*$/d' \
			-e '/^#__.*$/d' \
		<${f}.tmp >${f} && \
		rm -f ${f}.tmp
		# append new alias
		echo -e "${rf_alias}" >> ${f}
		processed_file="${processed_file}${f} "
	done;
}

main() {
	if [ "${1}" == "update" ]; then
		update_process
	elif [ "${1}" == "local" ]; then
		local_process
	else
		# check if Runfile is not install yet
		if [ ! -f ~/.Runfile/Runfile ]; then
			install_process
		else
			echo ".Runfile already exist on your system. Do you want to update [y/n] "
			read answer
			if [ "${answer}" == "y" ]; then
				update_process
			else
				echo "do nothing"
				exit
			fi
		fi
	fi
}
## update mode is default
## start process
main ${@}
alias_set
echo "${1} was finished!"
exit
