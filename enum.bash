#!/bin/bash
echo -n "Ip address = "
read IP
echo -n "Name File = "
read Name
ports=$(nmap -p- --min-rate=1000 -T4 $IP | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//);
nmap -p$ports -sC -sV $IP -oN $Name.nmap

