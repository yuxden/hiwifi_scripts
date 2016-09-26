#!/bin/sh

curl -k -o dnscrypt.tar.gz https://jm33.me/files/dnscrypt.tar.gz
tar xzvpf dnscrypt.tar.gz -C /

curl -k -o libsodium.tar.gz https://jm33.me/files/libsodium.tar.gz
tar xzvpf libsodium.tar.gz -C /
