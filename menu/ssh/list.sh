#!/bin/bash
echo -e "\n=== List User SSH ===\n"
cut -d: -f1 /etc/passwd | grep -vE '^(root|sync|shutdown|halt)' | while read user; do
    exp=$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')
    printf "%-15s Exp: %s\n" "$user" "$exp"
done
echo ""
