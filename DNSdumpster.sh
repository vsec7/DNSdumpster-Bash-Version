#!/bin/bash
# DnsDumpster Subdomain Enumeration 
# Coded by Versailles
# Sec7or ~ Surabaya Hacker Link

RED='\033[0;31m'
ORANGE='\033[0;33m'
PURPLE='\033[0;35m'
GREEN='\e[32m'
NC='\033[0m'

csrf=$(curl -s https://dnsdumpster.com | grep -Po "csrfmiddlewaretoken' value='\K[^']*")
sub=$(curl -s --cookie "csrftoken=$csrf" -H "Referer: https://dnsdumpster.com" --data  "csrfmiddlewaretoken=$csrf&targetip=$1" https://dnsdumpster.com | grep -Po '<td class="col-md-4">\K[^<]*')

printf "${PURPLE}`figlet -f small "DNSdumpster"`${NC}\n";
printf "${GREEN}Subdomain Enumeration ${NC}\n";
printf "${GREEN}Coded By Versailles ${NC}\n\n";
if [[ -z "$sub" ]]; then
printf "${RED}[!] NOT FOUND !! :( ${NC}\n";
else
echo $sub | tr " " "\n" >> sub-$1.txt
printf "${GREEN}[*] FOUND : `cat sub-$1.txt | wc -l` Subdomain ${NC}\n\n";
printf "${ORANGE}`cat sub-$1.txt` ${NC}\n";
printf "${GREEN}Saved On sub-$1.txt !! ${NC}\n";
fi
