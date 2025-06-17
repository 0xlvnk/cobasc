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
