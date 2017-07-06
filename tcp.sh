#!/bin/bash



cc=`wget -qO- http://ipinfo.io/country`

	
function startvpn {
#selecting random directory	
		dir='/opt/noob/vpnstcp'
		file=`/bin/ls -1 "$dir" | sort --random-sort | head -1`
		path="$dir/$file"
		echo "$file" > "/opt/noob/.file"
#starting vpn	
		openvpn --config $path --auth-user-pass /opt/noob/credentials/credstcp/cred-vpngate.txt --proto tcp-client --connect-retry 0 --connect-timeout 5 --connect-retry-max 1 --auth-nocache
	
}


function check {
	while true; do
	loc=`wget -qO- http://ipinfo.io/country`

	if [ "${loc,,}" = "${cc,,}" ];
	then
		killall -q openvpn
		startvpn
	fi

done

}
	
		
startvpn 
check 
