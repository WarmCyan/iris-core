#!/bin/bash

failurecolor=$1
character="\uf0ec"

. ~/.env

pingstate=`cat $TMP_DIR/connectionstate.dat`


#echo $pingstate

# toggle if clicked
if [ $BLOCK_BUTTON -eq 1 ]; then
	if [[ $pingstate == "on" ]]; then
		echo "off" > $TMP_DIR/connectionstate.dat
		pingstate="off"
	else
		echo "on" > $TMP_DIR/connectionstate.dat
		pingstate="on"
		echo -e "<span font-desc='fontawesome'>$character </span> <span color='#888888'>pinging...</span>"
	fi
fi

if [[ $pingstate == "on" ]]; then
	time=$(ping -c 1 8.8.8.8 2>/dev/null | sed -n "s/^.*time=\([0-9\.]*\) ms.*$/\1/p")

	if [[ "${time}" != "" ]]; then
		#echo "Ping $time ms"
		echo -e "<span font-desc='fontawesome'>$character </span> <span color='#888888'>$time ms</span>"
	else
		echo "<span color='$failurecolor'>No connection</span>"
	fi
else
	#echo "Ping off"
	echo -e "<span color='#888888'><span font-desc='fontawesome'>$character </span> off</span>"
fi

