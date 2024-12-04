#!/usr/bin/env bash

domain=$1
echo "Creating a new directory"
directory="${domain}_reccon"
mkdir -p "$directory"

# Get the server IP address
echo "===Server IP===" > "$directory/background_information"
server_ip=$(nslookup "$domain" | grep -E 'Address: [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | awk '{print $2}')

echo "Server IP is $server_ip" >> "$directory/background_information"
echo "" >> "$directory/background_information"
echo "=========" >> "$directory/background_information"

# Start WHOIS enumeration
echo "+++Starting a WHOIS Enumeration+++" >> "$directory/background_information"
whois "$server_ip" >> "$directory/background_information"
echo "==Key Information=="

echo "" >> "$directory/background_information"
echo "===Starting Port Scanning===" >> "$directory/background_information"

# Run nmap and filter the output
nmap "$server_ip" | grep -E "^\S+\s+\S+\s+\S+$" >> "$directory/background_information" || echo "No matching lines found in nmap results." >> "$directory/background_information"

#lets find other web applications onthe server
echo "" >> "$directory/background_information"
echo "===Other WEB applications onthe Server===" >> "$directory/background_information"

API_KEY="d1bfebb7689a6892c7ede8b76685cce78b9671ef"

curl -s "https://api.viewdns.info/reverseip/?host=${server_ip}&apikey=${API_KEY}&output=json" | jq '.response.domains[]' >> "$directory/background_information"
echo "[+]Script is success"