#!/bin/bash
source /root/menu/utils/banner.sh

while true; do
  clear
  banner
  echo -e "01. => SSH Menu"
  echo -e "02. => Running Service"
  echo -e "03. => System Info"
  echo -e "00. => Exit"
  echo -ne "\nSelect menu (00-03): "; read opt
  case $opt in
    1) bash /root/menu/ssh/menu.sh ;;
    2) bash /root/menu/utils/status.sh ;;
    3) bash /root/menu/utils/info.sh ;;
    0) exit ;;
    *) echo "Invalid option"; sleep 2 ;;
  esac
done
