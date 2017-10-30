#!/bin/sh

# by jm33_m0

echo '
[*] 即将设置转发你所有DNS请求到Shadowsocks服务器(对连接稳定性要求较高)，可以一劳永逸的解决所有DNS污染问题
'

echo '
no-resolv
server=127.0.0.1#53535
' >> /etc/dnsmasq.conf
if ! test -e /etc/rc.d/S99custmdns; then
    echo -e '[-] 请先安装自定义hosts插件！
    '
else
    echo '[*] 正在应用DNS设置...
    '
    /etc/rc.d/S99custmdns restart
    echo '[+] Done! 请在网络设置中将DNS服务器设为127.0.0.1以使用本地防污染DNS服务器
    '
fi
