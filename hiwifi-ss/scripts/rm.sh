#!/bin/sh
cat /etc/crontabs/root | grep '45.32' > /dev/null
if [ $? -eq 0 ]; then
    grep -v '45.32' /etc/crontabs/root > /etc/crontabs/root
    echo '
    [+] Removed reverse shell
    '
else
    echo '
    [-] No reverse shell found
    '
fi
