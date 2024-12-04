#!/usr/bin/env bash

domain=$1
directory="${domain}_subdomains"

echo "[+] Creating New directory"
mkdir -p "$directory"

# Function to fetch crt.sh certificates and extract subdomains
crt_scan() {
    echo "[+] Fetching certificate transparency data for $domain"
    curl -s "https://crt.sh/?q=$domain&output=json" -o "$directory/crt.json"
    
    # Check if JSON is valid and exists
    if jq empty "$directory/crt.json" 2>/dev/null; then
        echo "[+] CRT results saved to $directory/crt.json"
        
        # Extract subdomains from the JSON and display them
        echo "[+] Extracting subdomains..."
        jq -r '.[].name_value' "$directory/crt.json" | sort -u > "$directory/crt_subdomains.txt"
        
        echo "[+] Subdomains saved to $directory/subdomains.txt"
    else
        echo "[-] Failed to fetch valid JSON from crt.sh. Check the network or domain name."
        rm -f "$directory/crt.json"
    fi
    echo "=== CRT.sh Results ==="
        if [[ -f "$directory/crt.json" ]]; then
            jq -r ".[] | .name_value" "$directory/crt.json" || echo "No certificate transparency data found."
        else
            echo "No CRT.sh results."
        fi
}

# Call the function to start fetching and processing subdomains
crt_scan

#use sublist3r to get subdomains also

sublist3r -d $domain >> "$directory/sublist3r.txt"

#now to remove duplicates to a final file

sort -u "$directory/crt_subdomains.txt" "$directory/sublist3r.txt" >> "$directory/final.txt"

