#!/bin/sh
# Adapted by jm33_m0
echo ''
echo '===================================='
echo 'Started installation'
echo '===================================='
echo ''
sleep 3 
echo 'Creating temp directory... 创建临时目录ing...'
echo ''
mkdir /tmp/geewan
cd /tmp/geewan
echo 'Done! 成功创建临时目录!'
echo '
'
sleep 3
echo 'Downloading files... 下载插件ing'
echo '
'
curl -k -o ss.tar.gz https://jm33.me/files/ss.tar.gz
echo 'Done! 下载完成'
echo '
'
sleep 2
echo 'Installing... 安装ing'
tar xzvf ss.tar.gz;
cp ../shadowsocks.htm /usr/lib/lua/luci/view/admin_web/network/
cp ../index.htm /usr/lib/lua/luci/view/admin_web/network/
cp ../style.css /www/turbo-static/turbo/web/css/
cp ../ss-* /usr/bin/
echo 'Done! 插件安装成功!'
echo '
'
sleep 2
echo 'Writing uninstall info... 写入卸载信息ing'
echo '
'
echo '
' >>/usr/lib/opkg/status
echo 'Package: geewan-ss' >>/usr/lib/opkg/status
echo 'Version: master-20130924-eb9d31869e1d7590cd8c2fb1e7d226ac6cf32fad-20141024' >>/usr/lib/opkg/status
echo 'Provides:' >>/usr/lib/opkg/status
echo 'Status: install hold installed' >>/usr/lib/opkg/status
echo 'Architecture: ralink' >>/usr/lib/opkg/status
echo 'Installed-Time: 1422509506' >>/usr/lib/opkg/status
echo 'Auto-Installed: yes' >>/usr/lib/opkg/status
echo '
' >>/usr/lib/opkg/status
echo 'Cleanning temporary files... 清理临时文件ing'
echo '
'
rm -rf /tmp/geewan
if test -e /var/run/luci-indexcache;
then rm /var/run/luci-indexcache&&echo 'Done! 清理完成 '&&echo '
';
else echo 'luci-cache does not exist! 无法找到luci-cache,请确定是否是极路由环境'&&echo '
'
fi
sleep 1
echo 'Done! 插件成功安装!'
