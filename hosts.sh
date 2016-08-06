#!/bin/sh

echo '
[*] Usage: '$0 '<RET>
[!] 如果hosts未生效，请在路由器插件管理页面手动使用自定义hosts插件提交修改
'

# tests if a cron job has been created already
grep "hosts" /etc/crontabs/root > /dev/null
if [ $? -eq 1 ]; then
    echo `date`": [-] cron"
    echo "*/30 * * * sh /etc/hosts.sh" >> /etc/crontabs/root # check for update every 30 min
else
    echo `date`": [+] cron"
fi

# fetch hosts file from github
curl -k -o /tmp/hosts "https://raw.githubusercontent.com/racaljk/hosts/master/hosts"

# append hosts record to a recognized file (if there is an update available)
grep $(date +%Y-%m-%d) /tmp/hosts > /dev/null
if [ $? -eq 1 ]; then
    echo `date`": [-] update" # no update
else
    echo `date`": [+] update" # update available, check if we have it installed already
    grep $(date +%Y-%m-%d) /etc/hosts.d/openapi > /dev/null
    if  [ $? -eq 1 ]; then
        echo `date`": [+] updating..."
        echo "192.168.199.1 client.openapi.hiwifi.com" > /etc/hosts.d/openapi # backup
        cat /tmp/hosts >> /etc/hosts.d/openapi # append new hosts
        /etc/rc.d/S99custmdns restart # restart custom_dns plugin (to restart dnsmasq while preventing deleting our new hosts file)
    fi
fi

# auto start
if ! test -e /etc/$0; then
    cp $0 /etc/
    echo `date`": [-] etc"
else
    echo `date`": [+] etc"
fi
grep "hosts" /etc/rc.local > /dev/null
if [ $? -eq 1  ]; then
    echo `date`": [-] Auto start"
    echo "sh /etc/"$0 > /etc/rc.local && echo "exit 0" >> /etc/rc.local
else
    echo `date`": [+] Auto start"
fi
