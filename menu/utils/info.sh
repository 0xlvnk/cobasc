#!/bin/bash

DOMAIN=$(cat /etc/xray/domain)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10)
REGION=$(curl -s ipinfo.io/country)
CITY=$(curl -s ipinfo.io/city)
IPVPS=$(curl -s ifconfig.me)
