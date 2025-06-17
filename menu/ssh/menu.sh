#!/bin/bash
clear
echo "====== SSH MENU ======"
echo "1. Create SSH Account"
echo "2. Delete SSH Account"
echo "3. List SSH User"
echo "0. Back"
echo -n "Select: "; read input

case $input in
  1) bash /root/menu/ssh/create.sh ;;
  2) bash /root/menu/ssh/delete.sh ;;
  3) bash /root/menu/ssh/list.sh ;;
  0) ;;
  *) echo "Invalid option"; sleep 2 ;;
esac
