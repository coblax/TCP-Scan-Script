#!/bin/bash
ip="10.10.10.95" #change your IP
masscan -p1-65535 $ip --rate=1000 -e tun0 > ports.txt
ports=$(cat ports.txt | awk -F " " '{print $4}' | awk -F "/" '{print $1}' | sort -n | tr '\n' ',' | sed 's/,$//');
nmap -sC -sV -p$ports $ip
