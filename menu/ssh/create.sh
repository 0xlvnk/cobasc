#!/bin/bash
read -p "Username : " user
read -p "Password : " pass
read -p "Durasi (hari): " masa

useradd -e `date -d "$masa days" +%Y-%m-%d` -s /bin/false -M $user
echo -e "$pass\n$pass" | passwd $user >/dev/null 2>&1
exp=$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')

clear
echo "========================"
echo "  Detail SSH  Account"
echo "========================"
echo "Domain        : vip.klvnstore.my.id"
echo "Username      : $user"
echo "Password      : $pass"
echo "========================"
echo "ISP           : ServerPoint.com"
echo "Region        : Singapore"
echo "========================"
echo "Port HTTPS    : 443,8443,2083,2053,2095"
echo "Port HTTP     : 80,8880,8080,2082,2096"
echo "Port TLS/SSL  : 222,777"
echo "Port Dropbear : 109,143,69"
echo "Port UDP      : 1-65535"
echo "UDPGW         : 7100-7300"
echo "========================"
echo "Exp           : $exp"
echo "========================"
