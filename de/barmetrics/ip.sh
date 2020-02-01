#!/bin/bash

failurecharacter="\uf071"
failurecolor="#e33636"

. ~/.env

extipstate=`cat $TMP_DIR/extipstate.dat`

# toggle if clicked
if [ $BLOCK_BUTTON -eq 1 ]; then
	if [[ $extipstate == "on" ]]; then
		echo "off" > $TMP_DIR/extipstate.dat
		extipstate="off"
	else
		echo "on" > $TMP_DIR/extipstate.dat
		extipstate="on"
	fi
fi

if [[ $extipstate == "on" ]]; then
	ip=$(curl -s http://ipecho.net/plain)

	if [[ "${ip}" != "" ]]; then
		echo $ip
	else
	echo -e "<span font-desc='fontawesome' color='$failurecolor'>$failurecharacter</span>"
	fi
else
	echo "(IP hidden)"
fi
