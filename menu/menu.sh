#!/bin/bash
source /root/menu/utils/banner.sh

clear
print_banner "VPS MENU"

echo -e "01. => SSH Menu"
echo -e "x.  => Exit"
read -rp "Select menu: " menu

if [[ $menu == "01" ]]; then
    clear
    print_banner "SSH MENU"
    echo -e "[1] Create SSH Account"
    echo -e "[x] Back"
    read -rp "Select option: " opt

    case $opt in
        1) bash /root/menu/ssh/create.sh ;;
        x) bash /root/menu/menu.sh ;;
        *) echo "Invalid option" ;;
    esac
fi
