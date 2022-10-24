#!/bin/bash


## start process ==
echo "working on: $(pwd)"
msg=""
if [ ! -f "./Runfile" ]; then
	msg="could not copy Runfile from ~/.Runfile/Runfile to $(pwd)"
	cp ~/.Runfile/Runfile . && \
	chmod +x ./Runfile && \
	msg="sucessfull"
else
	echo -e "Current directory already have Runfile. Update Runfile?[y/n]: "
	read answer
	if [ "${answer}" == "y" ]; then
		msg="update Runfile is not sucessful"
		start_of_file_new=$(sed -n '/MUST_START_OF_FILE$/p' ${RF_DIR:-~/.Runfile}/Runfile)
		end_of_file_new=$(sed -n '/MUST_END_OF_FILE$/p' ${RF_DIR:-~/.Runfile}/Runfile)

		runfile="./Runfile"
		cp ${runfile} ${runfile}.tmp && \
		sed \
			-e "s,^.*MUST_START_OF_FILE$,${start_of_file_new}," \
			-e "s,^.*MUST_END_OF_FILE$,${end_of_file_new}," \
			<${runfile}.tmp >${runfile} && \
		rm -f ${runfile}.tmp && \
		echo "Runfile updated" && \
		msg="Update Runfile was sucessful"
	else
		msg="not touch in your Runfile"
	fi
fi

if [ ! -f $(pwd)/Runfile ]; then
	echo "Runfile isn't created! Check above error pls!"
else
	echo "${msg}"
fi
