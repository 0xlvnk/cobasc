#!/bin/bash
clear
echo -e "===== Service Status ====="
services=("ssh" "dropbear" "stunnel4" "xray" "cron" "vnstat")

for srv in "${services[@]}"; do
  if systemctl is-active --quiet $srv; then
    echo -e "$srv\t: Running"
  else
    echo -e "$srv\t: Not Running"
  fi
done
