#!/usr/bin/env bash

# Parse options
while getopts "m:" opt; do
    case "$opt" in
        m) MODE=$OPTARG ;;
        *) echo "Invalid option"; exit 1 ;;
    esac
done

# Shift positional arguments to get domain and wordlist
shift $((OPTIND - 1))
domain=$1
wordlist=$2
directory="${domain}_results"
mkdir -p $directory

case "$MODE" in
	dir)
		gobuster dir -u "$domain" -w "$wordlist" >> "$directory/directories"
		;;
	dns)
		gobuster dns -d "$domain" -w "$wordlist" >> "$directory/subdomains"
		;;
	vhost)
		gobuster vhost -u "$domain" -w "$wordlist" >> "$directory/vhost_apps"
		;;
	all)
		gobuster dir -u "$domain" -w "$wordlist" >> "$directory/directories"
		gobuster dns -d "$domain" -w "$wordlist" >> "$directory/subdomains"
		gobuster vhost -u "$domain" -w "$wordlist" >> "$directory/vhost_apps"
		;;
	*)
        echo "Error: Invalid mode '$MODE'."
        echo "Valid modes are: dir, dns, vhost, all"
        echo "Example: ./auto_gobuster -m dns <target_domain> <wordlist>"
        exit 1
		;;
 esac