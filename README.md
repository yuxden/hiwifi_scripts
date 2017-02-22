# gfw-script
### 一些用来建设**更正常网络环境**的脚本

- **No warranty / 不保证有效**

## Status / 更新

- Feb 22 2017: 目前在极路由3上使用LEDE项目，推荐有动手能力的用户尝试，请参考[https://jm33.me/ji-lu-you-3-lede-shadowsocks-mentohust-han-suo-xu-wen-jian-tarballxia-zai.html](https://jm33.me/ji-lu-you-3-lede-shadowsocks-mentohust-han-suo-xu-wen-jian-tarballxia-zai.html)
- Oct 31 2016: 开始使用openwrt chaos calmer固件，极路由系列暂时不会有新的工具放出，我会添加openwrt的相关脚本
- 请留意[jm33_m0](https://jm33.me)以获得更新信息

## 功能说明

--------------------

### 极路由系列

- `dns.sh`

    把你的DNS请求通过shadowsocks转发到目标DNS服务器，彻底解决DNS污染

- `hosts.sh`

    安装并实现自动更新hosts文件，来自于[racaljk/hosts](https://raw.githubusercontent.com/racaljk/hosts/master/hosts "raw file")

![./hosts.sh](https://jm33.me/img/hosts-sh.png)

![ping](https://jm33.me/img/hosts.png)

- `shadow.sh`

    安装Shadowsocks插件，请参考[jm33_m0 - 极路由4使用Shadowsocks插件（含web配置面板）](https://jm33.me/ji-lu-you-4shi-yong-shadowsockscha-jian-han-webpei-zhi-mian-ban.html)

    ![](https://jm33.me/img/ss1.png)

    ![](https://jm33.me/img/ss3.png)
------------------

### OpenWRT及其它

- `conn_chk.sh`

    检测国内外网络连接

- `pac-gfwlist`

    PAC文件，来自[Cloverr0/pac-gfwlist](https://github.com/Cloverr0/pac-gfwlist)

- `paste.sh`

    粘贴文本到[Pastebin](http://pastebin.com)
