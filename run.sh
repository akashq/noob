#!/bin/bash



function banner {
	figlet nOOb
	printf "Author: mr. ey3\n"
	printf "love from ULTIMATE HACKERS\n"
	printf "version 3.0(beta)\n\n"

}


function initialization {
	printf "\nLoading script, wait!\n"
	rl=$(</opt/noob/.loc)
	
	#current location
	while true; do
		cl=`wget -qO- ipinfo.io/ip && wget -qO- ipinfo.io/country`
		file=$(</opt/noob/.file)
		
		if [ "$cl" == "$rl" ]
		then
			printf "connecting :: $file\n"
			sleep 5
		else
			printf "\n\nconnected :: $file\n"
			printf "Initialized :)\n"
		break
		fi
		done
}


function kill {
	printf "Shutting down n00b\n"

	if pgrep -x "tcp.sh" > /dev/null || pgrep -x "openvpn" > /dev/null || pgrep -x "udp.sh" > /dev/null
	then
		killall -q tcp.sh
		killall -q udp.sh
		killall -q openvpn
		killall -q run.sh
		rm -f .prcl
		rm -f .loc
		printf "Done :)\n"
		killall noob
	else
		printf "\nare your high! its not even running\n"
		killall noob
	fi

}


function ip {
	ext_ip=$(wget -qO- ipinfo.io/ip && wget -qO- ipinfo.io/country)

	printf "\nCurrent public IP: $ext_ip\n"

}


function status {
	if pgrep -x "tcp.sh" > /dev/null || pgrep -x "openvpn" > /dev/null || pgrep -x "udp.sh" > /dev/null
	then
	
		#required location
		rl=$(</opt/noob/.loc)
		
		#current location
		cl=`wget -qO- ipinfo.io/ip && wget -qO- ipinfo.io/country`
		
		if [ "$cl" == "$rl" ]
		then
			printf "\nIts up\n"
			printf "But not fully loaded\n"
			file=$(</opt/noob/.file)
			printf "current file: $file\n"
		else
			printf "Its up\n"
			printf "You are surfing under the tunnel\n"
			file=$(</opt/noob/.file)
			printf "current file: $file\n"
			ip
		fi
	else
		printf "\nIt looks like, its down...\n\n"
	fi
	
	
	
}


function change {
	protocol=$(</opt/noob/.prcl)
		if [[ "$protocol" == 1 ]]
	    then
			
			#kill
			if pgrep -x "tcp.sh" > /dev/null || pgrep -x "openvpn" > /dev/null || pgrep -x "udp.sh" > /dev/null || pgrep -x "run.sh" > /dev/null
			then
				killall -q tcp.sh
				killall -q udp.sh
				killall -q openvpn
			fi
			
			#restart
			printf "\nChanging server\n"
			rl=`wget -qO- ip.frozenbox.org`
			sudo -b xterm -e sudo -b /opt/noob/tcp.sh 
			initialization
		else
			
			#kill
			if pgrep -x "tcp.sh" > /dev/null || pgrep -x "openvpn" > /dev/null || pgrep -x "udp.sh" > /dev/null || pgrep -x "run.sh" > /dev/null
			then
				killall -q tcp.sh
				killall -q udp.sh
				killall -q openvpn
			fi
			
			#restart
			printf "\nChanging server\n"
			rl=`wget -qO- ip.frozenbox.org`
			sudo -b xterm -e sudo -b /opt/noob/udp.sh
			initialization
		fi
}

case "$1" in
	-a)
		banner
		
		#required location
		rl=`wget -qO- ipinfo.io/ip && wget -qO- ipinfo.io/country`
		echo "$rl" > "/opt/noob/.loc"
		
		#
		printf "1.TCP\n2.UDP\n\nEnter protocol you want to use: "
		read protocol
		echo "$protocol" > "/opt/noob/.prcl"
		
		if [[ "$protocol" == 1 ]]
	    then
			sudo -b xterm -e sudo -b /opt/noob/tcp.sh 
		else
			sudo -b xterm -e sudo -b /opt/noob/udp.sh
		fi
		initialization
	;;
	-d)
		banner
		kill
	;;
	-s)
		banner
		status
	;;
	-i)
		banner
		ip
	;;
	-c)
		banner
		change
	;;
   *)
   banner
echo -e "
noob (v 3.0)
author: mr. ey3

Usage:
┌──[root@shad0w]─[$PWD]
└──╼ \$ noob {-a|-d|-c|-s|-i}

	-a Activate the n00b	
	-d Deactivate the n00b
	-c Change to another location
	-s Check the status of n00b
	-i Check your ip and location
	
" >&2

exit 1
;;
esac

