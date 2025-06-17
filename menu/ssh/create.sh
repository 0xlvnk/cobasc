#!/bin/bash

source /root/menu/utils/info.sh
source /root/menu/utils/banner.sh

print_banner "Create SSH Websocket Account"

read -rp "Username      : " user
read -rp "Password      : " pass
read -rp "Expired (days): " exp

if id "$user" &>/dev/null; then
    echo -e "${RED}User already exists!${NC}"
    exit 1
fi

useradd -e $(date -d "$exp days" +"%Y-%m-%d") -s /bin/false -M "$user"
echo -e "$pass\n$pass" | passwd "$user" &>/dev/null

exp_date=$(date -d "$exp days" +"%b %d, %Y")

clear
echo -e "${GREEN}========================"
echo -e "  Detail SSH  Account"
echo -e "========================${NC}"
echo -e "Domain        : $DOMAIN"
echo -e "Username      : $user"
echo -e "Password      : $pass"
echo -e "${CYAN}========================"
echo -e "ISP           : $ISP"
echo -e "Region        : $CITY/$REGION"
echo -e "IP VPS        : $IPVPS"
echo -e "========================"
echo -e "Port HTTPS    : 443,8443,2083,2053,2095"
echo -e "Port HTTP     : 80,8880,8080,2082,2096"
echo -e "Port TLS/SSL  : 222,777"
echo -e "Port Dropbear : 109,143,69"
echo -e "Port UDP      : 1-65535"
echo -e "UDPGW         : 7100-7300"
echo -e "========================"
echo -e "Exp           : $exp_date"
echo -e "========================${NC}"
