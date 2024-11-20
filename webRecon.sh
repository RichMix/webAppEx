# Web App Recon Tools

## ffuf
ffuf -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://10.10.80.133/FUZZ
ffuf -w /usr/share/wordlists/SecLists/Usernames/Names/names.txt -X POST -d "username=FUZZ&email=x&password=x&cpassword=x" -H "Content-Type: application/x-www-form-urlencoded" -u http://10.10.70.78/customers/signup -mr "username already exists"
# In the above example, the -w argument selects the file's location on the computer that contains the list of usernames that we're going to 
# check exists. The -X argument specifies the request method, this will be a GET request by default, but it is a POST request in our example. 
# The -d argument specifies the data that we are going to send. In our example, we have the fields username, email, password and cpassword. 
# We've set the value of the username to FUZZ. In the ffuf tool, the FUZZ keyword signifies where the contents from our wordlist will 
# be inserted in the request. The -H argument is used for adding additional headers to the request. 
# In this instance, we're setting the Content-Type so the web server knows we are sending form data. 
# The -u argument specifies the URL we are making the request to, and finally, the -mr argument is the text on the page we are looking for to 
# validate we've found a valid username.



## dirb
dirb http://10.10.80.133/ /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt

## gobuster
gobuster dir --url http://10.10.80.133/ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt

