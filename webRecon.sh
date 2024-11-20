# Web App Recon Tools

## ffuf
ffuf -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://10.10.80.133/FUZZ
ffuf -w /usr/share/wordlists/SecLists/Usernames/Names/names.txt -X POST -d "username=FUZZ&email=x&password=x&cpassword=x" -H "Content-Type: application/x-www-form-urlencoded" -u http://10.10.70.78/customers/signup -mr "username already exists"

## dirb
dirb http://10.10.80.133/ /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt

## gobuster
gobuster dir --url http://10.10.80.133/ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt

