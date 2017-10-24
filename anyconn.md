# Read me
- if you get `untrusted server blocked` error, tap `change settings`, then uncheck `block untrusted servers`
- whenever prompted `do you wish to proceed`, yes you want to

# Android version

[download link](https://jm33.me/files/com.cisco.anyconnect.vpn.android.avf_4.0.09029-345_minAPI14.apk) (if you were able to downoad it from other trusted sources, you can download it yourself)

set up your vpn connection

- install Cisco Anyconnect client

![anyconnect icon](./img/android_anyconn_icon.jpg)

- open the app, go to settings

![settings](./img/android_settings.jpg)

- allow untrusted servers

![allow](./img/android_allow.jpg)

- add a VPN connection, set server address

![add](./img/android_add.jpg)

- tap `Advanced Preferences`, then `Certificate`
- tap `Import`, then `URI`

![import cert](./img/android_import.jpg)

![uri](./img/android_uri.jpg)

- type the download link to your cert
- type the password to extract cert, and make sure the cert is selected for your connection
- save your vpn profile
- connect

# iOS version

download Cisco Anyconnect app from App Store

- open Anyconnect app
- in `Settings` tab, allow untrusted servers, like this

![untrusted](./img/ios_allow_untrusted.jpg)

- in `Diagnostics` tab, import your user cert,

![user cert](./img/ios_user_cert.jpg)

- import user cert from given URI, you will need a password to extract your cert
- go back to `Home` tab, create new VPN

![new vpn](./img/ios_create_vpn.jpg)

- type server address, then tap `Advanced`
- tap `Certificate`, then choose your user cert
- save your VPN profile and try to connect


# BB10 version

download Cisco Anyconnect from BB World

set up vpn

1. install Anyconnect app, then go to vpn settings
2. download cert from given URL, then type the password to extract
3. choose Cisco Anyconnect as your VPN type
4. allow untrusted servers
5. type server address
6. save and connect
