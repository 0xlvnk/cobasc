#!/bin/bash
clear
echo "====== SYSTEM INFO ======"
echo "OS       : $(hostnamectl | grep 'Operating System' | cut -d: -f2)"
echo "Kernel   : $(uname -r)"
echo "Uptime   : $(uptime -p)"
echo "ISP      : ServerPoint.com"
echo "IP VPS   : $(curl -s ipv4.icanhazip.com)"
echo "Domain   : vip.klvnstore.my.id"
echo "RAM Used : $(free -m | awk '/Mem:/ {print $3 " / " $2 " MB"}')"
