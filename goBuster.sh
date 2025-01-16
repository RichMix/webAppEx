# goBuster

gobuster -u http://fakebank.thm -w wordlist.txt dir


dump added 

Correct Gobuster Syntax:
gobuster dir -u <URL> -w <path-to-wordlist>

Command Type:
Use dir to perform directory brute-forcing.
-u: Specifies the target URL.
-w: Specifies the wordlist file.
Steps to Fix:
Ensure the Wordlist Exists:

Verify that the wordlist.txt file exists and is accessible:
ls -l wordlist.txt

If it doesn’t exist, download a common wordlist like SecLists or use /usr/share/wordlists/dirb/common.txt:
apt install seclists

ls /usr/share/seclists/Discovery/Web-Content/

Run Gobuster with Correct Syntax:
If using the default wordlist common.txt:
gobuster dir -u <URL> -w /usr/share/wordlists/dirb/common.txt

If using a custom wordlist:
gobuster dir -u <URL> -w /path/to/wordlist.txt
Additional Options (Optional):
Add a specific file extension:
gobuster dir -u <URL> -w /path/to/wordlist.txt -x php,html,txt

Change the number of threads for faster scanning:
gobuster dir -u <URL> -w /path/to/wordlist.txt -t 50


gobuster --version
If not installed, reinstall it with apt install gobuster


Gobuster Commands
1. Directory Enumeration (Web Directories):
Scan for web directories that might contain configuration files, credentials, or other sensitive information:

gobuster dir -u http://10.10.22.55 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
2. Directory Enumeration with File Extensions:
Look for specific file types (e.g., .php, .html, .txt) that might reveal login pages or credentials:

gobuster dir -u http://10.10.22.55 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x php,html,txt
3. Directory Enumeration (HTTPS):
If the target uses HTTPS, ensure the -k flag is used to ignore SSL certificate issues:

gobuster dir -u https://10.10.22.55 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -k
4. Virtual Host Enumeration (Subdomains):
Look for subdomains that might host sensitive files or alternative interfaces:

gobuster vhost -u http://10.10.22.55 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
5. DNS Subdomain Enumeration:
Find subdomains associated with the target:

gobuster dns -d 10.10.22.55 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
6. Bruteforce Specific Hidden Files:
Search for hidden or backup files that might contain sensitive information, such as .bak, .old, or .zip files:

gobuster dir -u http://10.10.22.55 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x bak,old,zip,tar,gz
7. Custom Wordlist for Credential Files:
If you suspect credentials are stored in specific files (e.g., password.txt, id_rsa, etc.), create a custom wordlist and use:

gobuster dir -u http://10.10.22.55 -w custom-credential-wordlist.txt


## Notes from prev challenge using local hos in regards to hidden files found

/.htpasswd, /.htaccess, and /.hta: These files are restricted (403 status). They often contain sensitive configurations or credentials.
/robots.txt: Accessible (200 status). Check for disallowed directories or files listed here.
/server-status: Restricted (403). Often provides server information if accessible.
Directories:

/images: Redirects (301) to http://10.10.57.104/images/. Check for content within this directory.
Other Files:

/index.html: Main webpage of the server (200 status). This might contain hints or useful information.
Next Steps:
1. Access robots.txt:
Use curl or your browser to check its content:

curl http://10.10.57.104/robots.txt
Look for disallowed or hidden directories/files that might contain sensitive information.

2. Explore /images Directory:
Access http://10.10.57.104/images/ in your browser.
Use tools like wget or curl to recursively download the directory for offline inspection:

wget -r http://10.10.57.104/images/
3. Inspect /index.html:
Download and analyze the index.html file for hidden comments, links, or references:

curl -O http://10.10.57.104/index.html
Open the file in a text editor:

nano index.html
4. Focus on Restricted Files (.htpasswd, .htaccess, .hta):
These files are often protected but can sometimes be accessed through misconfigurations.
Attempt path traversal to access them:

curl http://10.10.57.104/..%2f.htpasswd
curl http://10.10.57.104/..%2f.htaccess
5. Check for Exploitable Vulnerabilities:
If /server-status is accessible, it might reveal server configurations.
Try exploiting common web vulnerabilities (e.g., LFI, RFI, SQLi) based on hints from the server's files and structure.

After you will likely search for CVEs to spawn a reverse shell to quire user and root flags.
