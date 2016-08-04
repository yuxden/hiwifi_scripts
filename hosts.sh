#!/bin/sh

# tests if a cron job has been created already
grep "hosts" /etc/crontabs/root > /dev/null
if [ $? -eq 1 ]; then
    echo "[-] cron"
    echo "1 0 * * 1 sh /etc/hosts.sh" >> /etc/crontabs/root
else
    echo "[+] cron"
fi

# fetch hosts file from github
if ! test -e /tmp/hosts; then
    echo "[-] githubusercontent"
    curl -k -o /tmp/hosts "https://raw.githubusercontent.com/highsea/Hosts/master/hosts"
else
    echo "[+] githubusercontent"
fi

# append hosts record to a recognized file
grep "google"  /etc/hosts.d/openapi > /dev/null
if [ $? -eq 1 ]; then
    echo "[-] openapi"
    cat /tmp/hosts >> /etc/hosts.d/openapi
else
    echo "[+] openapi"
fi

# auto start
if ! test -e /etc/$0; then
    cp $0 /etc/
    echo "[-] etc"
else
    echo "[+] etc"
fi
grep "hosts" /etc/rc.local > /dev/null
if [ $? -eq 1  ]; then
    echo "[-] Auto start"
    echo "sh /etc/"$0 > /etc/rc.local && echo "exit 0" >> /etc/rc.local
else
    echo "[+] Auto start"
fi
