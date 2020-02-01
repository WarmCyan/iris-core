#!/bin/bash

failurecharacter="\uf071"
failurecolor="#e33636"

ip=$(ip route get 1 2>/dev/null | sed -n "s/^.*src \([0-9\.]*\).*$/\1/p")

if [[ "${ip}" != "" ]]; then
	echo -e "$ip" 
else
	echo -e "<span font-desc='fontawesome' color='$failurecolor'>$failurecharacter</span>"
fi
