#!/bin/sh
# Adapted by jm33_m0
echo ''
echo '===================================='
echo 'Started installation'
echo '..........jm33_m0'
echo '===================================='
echo ''
sleep 1 
echo '[*] Creating temp directory... 创建临时目录ing...'
echo ''
mkdir /tmp/geewan
cd /tmp/geewan
echo '[+] Done! 成功创建临时目录!'
echo '
'
sleep 1
echo '[*] Downloading files... 下载插件ing'
echo '
'
curl -k -o ss.tar.gz https://jm33.me/files/ss.tar.gz
echo '[+] Done! 下载完成'
echo '
'
sleep 1
echo '#############################################################'
echo '
[*] Installing... 安装ing
'
echo '-------------------------------------------------------------
'
echo '[*] Unpacking... 释放安装文件ing'
tar xzvf ss.tar.gz -C /;
echo '-------------------------------------------------------------'
echo ''
echo '[+] Done! 插件安装成功!'
echo '#############################################################'
sleep 1
echo ''
echo ''
echo '[*] Writing uninstall info... 写入卸载信息ing'
echo ''
echo '
' >>/usr/lib/opkg/status
echo 'Package: geewan-ss' >>/usr/lib/opkg/status
echo 'Version: 20160731' >>/usr/lib/opkg/status
echo 'Provides:' >>/usr/lib/opkg/status
echo 'Status: install hold installed' >>/usr/lib/opkg/status
echo 'Architecture: ralink' >>/usr/lib/opkg/status
echo 'Installed-Time: 1422509506' >>/usr/lib/opkg/status
echo 'Auto-Installed: yes' >>/usr/lib/opkg/status
echo '
' >>/usr/lib/opkg/status
echo '[*] Cleanning temporary files... 清理临时文件ing'
echo '
'
rm -rf /tmp/geewan
if test -e /var/run/luci-indexcache;
then rm /var/run/luci-indexcache&&echo '[+] Done! 清理完成 '&&echo '
';
else echo '[-] luci-cache does not exist! 无法找到luci-cache,请确定是否是极路由环境'&&echo '
'
fi
sleep 1
echo '[+] Done! 插件成功安装!'
echo ''

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

echo '
[*] 安装hosts自动更新服务(用以解决使用SS时国内解析域名存在的DNS污染)
'
curl -k https://raw.githubusercontent.com/jm33-m0/gfw_scripts/master/hiwifi-ss/scripts/hosts.sh -o /tmp/hosts.sh && chmod 755 /tmp/hosts.sh && /tmp/hosts.sh
