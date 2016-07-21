##TL; DR

- 最近极路由发布了极4, 其基于OpenWrt的固件也做了较大幅度的升级，之前的ss插件基本上都已经无法正常使用

- 所以我在*[极路由Shadowsocks家庭无痛翻墙实践](https://luolei.org/hiwifi-shadowsocks/)*的基础上针对新的极路由官方固件做了修改，主要工作包括：

    - 升级了老旧的ss-libev到今年6月的最新版本
    - 改写了适配老版本极路由固件的web控制面板
    - 加入了自己的一些东西以及删掉自己认为没用的东西

- 为什么不用OpenWrt？嗯，我之前一直在用，然而极3用OpenWrt会出现WLAN速度缩水的问题，最终无法忍受而换回原版固件，这也是本文诞生的主要原因了。。

##How to install

>如果你希望看到源码，请点击[Github](https://github.com/jm33-m0/hiwifi_scripts/)。以下仅仅是安装指导

###Step 1. 开启极路由开发者模式

- 安装Shadowsocks插件需要开启开发者权限。请参考[这里](http://bbs.hiwifi.com/thread-74899-1-1.html "极路由官方论坛开发者模式指南")，有十分详细的教程。

###Step 2. SSH登录极路由

- 在Windows上，你需要使用PuTTY获得SSH的功能

- 你可以从[这里](https://jm33.me/files/putty-0.67-installer.msi)下载到PuTTY，然后使用它通过SSH登录到你的极路由。

- 什么？你不会用？

    > 嗯。。我给你一个[教程](http://jingyan.baidu.com/article/e73e26c0eb063324adb6a737.html)

- 登录

    `ssh root@192.168.199.1 -p 1022  #使用root帐号连接路由，端口为1022，密码为后台登陆密码`

###Step 3. 运行脚本来安装插件

- 使用如下命令：

    `cd /tmp && curl -k -o ss.tar.gz https://jm33.me/files/shadow.sh && sh shadow.sh && rm shadow.sh`

- 看一下输出信息，一切正常的话就可以去路由器管理页面开始使用了
