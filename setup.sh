#!/bin/bash


function banner {
	printf "running n00b installer"
	printf "Author: mr. ey3\n"
	printf "love from ULTIMATE HACKERS\n"
	printf "version 3.0(beta)\n\n"

}

banner

#sudo su
sudo apt-get update
if hash openvpn 2>/dev/null; then
        printf "openvpn:        checked\n"
        else
        sudo apt-get install openvpn -y
fi

if hash figlet 2>/dev/null; then
        printf "figlet:         checked\n"
        else
        sudo apt-get install figlet -y
fi

if hash xterm 2>/dev/null; then
        printf "xterm:          checked\n"
        else
        sudo apt-get install figlet -y
fi

#directory related mods
rm -f -r /opt/noob
mkdir /opt/noob

chmod 777 /opt/noob

cp -r vpnstcp /opt/noob
cp -r vpnsudp /opt/noob
cp -r credentials /opt/noob

chmod 777 /opt/noob/vpnstcp
chmod 777 /opt/noob/vpnsudp
chmod 777 /opt/noob/credentials

cp tcp.sh /opt/noob
cp udp.sh /opt/noob
cp run.sh /opt/noob

#permissions
chmod +x /opt/noob/tcp.sh
chmod +x /opt/noob/udp.sh
chmod +x /opt/noob/run.sh

rm -f /usr/bin/noob
ln -s /opt/noob/run.sh /usr/bin/noob

printf "To find out the help enter 'noob'\n"
