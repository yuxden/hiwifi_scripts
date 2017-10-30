#!/bin/bash

# jm33_m0

path=~/ss/
if ! test -e ~/ss; then
    echo "
[*] Creating Shadowsocks folder at $path
"
    mkdir -p ~/ss
fi
if [ "$1" != "-i" ]; then
    if [ "$1" == '' ]; then
        echo '
[*] Usage: '$0' <-i> <user> <port> <password> <http api key>
'
        exit 0
    fi
    user=$1
    port=$2
    password=$3
	apiKey=$4
else
    echo '
[*] Now lets create a Shadowsocks user account
'
    echo -n 'Username: '
    read user
    echo -n 'Port: '
    read port
    echo -n 'Password: '
    read password
	echo -n "SSPlus HTTP API Key: "
	read apiKey
fi

if ! test -e /var/log/ss; then
    mkdir -p /var/log/ss
fi

cat << EOF >> $path/users.cfg
$user:$port:$password
EOF

echo '
[*] Now lets apply our changes and check if theres anything wrong...
'

$path/loadUserDatabase $path/users.cfg 127.0.0.1:5333 $apiKey

netstat -anp | grep ":::$port" > /dev/null
if [ $? -eq 0 ]; then
    echo '
[-] Something went wrong...
'
else
    echo '
[+] Success!
'
fi
