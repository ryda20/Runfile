#!/bin/bash

copy_init_runfile() {
	cp ~/.Runfile/Runfile . && chmod +x ./Runfile
}

## start process ==
echo "working on: $(pwd)"
if [ ! -f "./Runfile" ]; then
	copy_init_runfile
else
	echo -e "Current directory already have Runfile. Remove replace with init Runfile?\n Your data will lost if you replace with init Runfile: [y/n]: "
	read answer
	if [ "${answer}" == "y" ]; then
		copy_init_runfile
		echo "replace with init Runfile"
	fi
fi

if [ ! -f $(pwd)/Runfile ]; then
	echo "Runfile isn't created! Check above error pls!"
else
	echo "Runfile created!"
fi
