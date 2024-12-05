#!/usr/bin/env bash

# Prompt the user to input the file name
read -p "[+] Enter file containing subdomains >> " file

# Filter valid URLs and save to a new file
grep -Eo '([a-zA-Z0-9.-]+\.[a-zA-Z]{2,})' "$file" > filtered_urls.txt

# Pause for a moment (optional)
sleep 2

# Use EyeWitness to capture screenshots from the filtered URLs
eyewitness --web -f filtered_urls.txt -d ./screenshots

echo "[+] Screenshots saved to './screenshots'"
