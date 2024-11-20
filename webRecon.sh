# Web App Recon Tools

## ffuf
ffuf -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://10.10.80.133/FUZZ

## dirb
dirb http://10.10.80.133/ /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt

## gobuster
gobuster dir --url http://10.10.80.133/ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt