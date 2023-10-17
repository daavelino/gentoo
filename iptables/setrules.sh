#!/bin/bash
#
# Please refer to 
# https://wiki.gentoo.org/wiki/Security_Handbook/Firewalls_and_Network_Security
# for a complete overview on the possible rules.

INTERFACE=wlo1

iptables -F

iptables -A INPUT -i $INTERFACE -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -j DROP

iptables-save

/etc/init.d/iptables start
rc-update add iptables default

