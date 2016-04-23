#!/bin/sh

conn_log=/var/log/conn_chk.log
if [ ! -f /var/log/conn_chk.log ]; then
    touch $conn_log
fi

cron=/var/spool/cron/crontabs/root
grep conn_chk.sh $cron > /dev/null
if [ $? -eq 1 ]; then
    echo '*/10 * * * * /etc/init.d/conn_chk.sh' >> $cron
fi

pidof ss-redir > /dev/null
if [ $? -eq 0 ]; then
    #echo 'google is ready, checking if baidu is accessible...'
    wget -q --spider http://baidu.com
    if [ $? -eq 0 ]; then
        #echo 'baidu is ready'
        echo 'Everything looks okay at '$(date) >> $conn_log
        exit 0
    else
        #echo 'baidu is down, restarting mentohust and ss-redir...'
        kill $(pidof mentohust)
        mentohust&
        /etc/init.d/ss-redir.sh restart
        #echo 'test if your connectivity is normal again'
        echo 'mentohust exited accidentically at '$(date)', I have recovered it for you' >> $conn_log
        exit 0
    fi
else
    #echo 'google is down, trying to restart ss-redir...'
    /etc/init.d/ss-redir.sh restart
    #echo 'checking if baidu is accessible...'
    wget -q --spider http://baidu.com
    if [ $? -eq 0 ]; then
        #echo 'baidu is ready, exiting...'
        echo 'ss-redir exited accidentically at '$(date)', I have recovered it for you' >> $conn_log
        exit 0
    else
        #echo 'all down, trying to fix that...'
        kill $(pidof mentohust)
        mentohust&
        /etc/init.d/ss-redir.sh restart
        #echo 'should be okay now, exiting...'
        echo 'Lost internet access accidentically at '$(date)', I have recovered it for you' >> $conn_log
        exit 0
    fi
fi
