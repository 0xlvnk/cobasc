#!/bin/bash

# Persiapan folder
mkdir -p /root/menu/{ssh,vmess,tls,utils}

# === utils/banner.sh ===
cat <<'EOF' > /root/menu/utils/banner.sh
#!/bin/bash
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
CYAN='\e[36m'
NC='\e[0m'
print_banner() {
    echo -e "${CYAN}=============================="
    echo -e "        $1"
    echo -e "==============================${NC}"
}
EOF

# === utils/info.sh ===
cat <<'EOF' > /root/menu/utils/info.sh
#!/bin/bash
DOMAIN=$(cat /etc/xray/domain)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10)
REGION=$(curl -s ipinfo.io/country)
CITY=$(curl -s ipinfo.io/city)
IPVPS=$(curl -s ifconfig.me)
EOF

# === ssh/create.sh ===
cat <<'EOF' > /root/menu/ssh/create.sh
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
EOF

# === menu.sh ===
cat <<'EOF' > /root/menu/menu.sh
#!/bin/bash
source /root/menu/utils/banner.sh

clear
print_banner "VPS MENU"

echo -e "1) SSH Menu"
echo -e "x) Exit"
read -rp "Select menu: " menu

case $menu in
    1)
        clear
        print_banner "SSH MENU"
        echo -e "1) Create SSH Account"
        echo -e "x) Back"
        read -rp "Select option: " opt
        case $opt in
            1) /bin/bash /root/menu/ssh/create.sh ;;
            x) /bin/bash /root/menu/menu.sh ;;
            *) echo "Invalid option" ;;
        esac
    ;;
    x) exit ;;
    *) echo "Invalid menu" ;;
esac
EOF

# === Permission ===
chmod +x /root/menu/menu.sh
chmod +x /root/menu/*/*.sh

echo -e "\e[32mInstaller selesai. Jalankan: \e[1m/root/menu/menu.sh\e[0m"
