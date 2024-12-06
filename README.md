# Web-Enumeration
Bash Scripting to automate further information gathering.
target_information.sh script is used to get background information of the web application. We begin by providing the domain of the web application as the script input, the script begins by carrying out nslookup of the IP which provides the server IP address. After getting the server IP we do a whois scan with it which provides details about the domain. The Server IP also is used inthe nmap scan to discover which ports are open and the services running onthem. After carrying out all the above the script writes down the results in files and saves them in a directory with the name similar to the domain. Then tool lastly does a reverse dns lookup to look for other web applications running onthe server with the same IP address.
    
    kali> sudo apt update
    kali> sudo apt install nmap
![target](https://github.com/user-attachments/assets/47db7466-d0e7-43e6-8303-d036a992143e)


