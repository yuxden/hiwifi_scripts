#!/bin/sh /etc/rc.common
# Copyright (C) 2006-2011 OpenWrt.org
START=90
SERVICE_USE_PID=1
SERVICE_WRITE_PID=1
SERVICE_DAEMONIZE=1
start() {
        service_start /usr/bin/dns2socks 127.0.0.1:7070 8.8.4.4:53 127.0.0.1:53535 -q
}
stop() {
        service_stop /usr/bin/dns2socks
}
