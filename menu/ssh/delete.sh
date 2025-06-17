#!/bin/bash
read -p "Username yang akan dihapus: " user
userdel -f $user && echo "Akun $user berhasil dihapus."
