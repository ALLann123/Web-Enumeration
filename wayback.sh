#!/usr/bin/env bash
domain=$1

directory=${domain}_archives

mkdir -p "$directory"
echo "===Wayback Archives URLS====" >> "$directory/wayback_results"

echo "[+]Starting Tool"

waybackurls "$domain" json >> "$directory/wayback_results"

echo "[+]Done"