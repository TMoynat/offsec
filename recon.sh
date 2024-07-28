#!/usr/bin/bash

read -p "Target IP: " targetip
read -p "SecList path (default /usr/share/wordlists/seclists/): " seclist
seclist=${seclist:-/usr/share/wordlists/seclists/}


## NMAP Reconn
nmap -sCV $targetip

## Directory & Files exploration
gobuster dir -u $targetip -w "${seclist}Discovery/Web-Content/raft-medium-directories.txt" -x php,html,txt,json
enum4linux $targetip

## Subdomain enumeration
gobuster vhost -u $targetip -w "${seclist}Discovery/DNS/bitquark-subdomains-top100000.txt" --append-domain