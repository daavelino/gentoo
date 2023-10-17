#!/bin/bash


INTERFACE=wlo1

iptables -F

iptables -A INPUT -i $INTERFACE -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -j DROP

iptables-save

/etc/init.d/iptables start
rc-update add iptables default

