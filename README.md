# Web-Enumeration
Bash Scripting to automate further information gathering.
target_information.sh script is used to get background information of the web application. We begin by providing the domain of the web application as the script input, the script begins by carrying out nslookup of the IP which provides the server IP address. After getting the server IP we do a whois scan with it which provides details about the domain. The Server IP also is used inthe nmap scan to discover which ports are open and the services running onthem. After carrying out all the above the script writes down the results in files and saves them in a directory with the name similar to the domain. Then tool lastly does a reverse dns lookup to look for other web applications running onthe server with the same IP address.
    
    kali> sudo apt update
    kali> sudo apt install nmap
![target](https://github.com/user-attachments/assets/47db7466-d0e7-43e6-8303-d036a992143e)

# Subdomain Enumeration
Looking for subdomains onthe web applications provides you with a new angle to attack the web application. The script sub_domain_enumeration.sh handles this process. We use the web site crt.sh which provides web certificates and all the related sub domains and also we use the tool sublist3r to do an additional passive reccon(we are not engaging with the target directly but relying on other sources of enumeration to get information). After getting the results we can use the sort command in linux to filter out duplicates and get a final list of subdomains.

    kali> sudo apt install sublist3r
![subdomain](https://github.com/user-attachments/assets/3bbaee12-f220-43d1-8d25-7ea0b8213e1c)

# Taking Screenshots of sub domains
Next script screenshots.sh, uses EyeWitness tool to grab screenshots from a list of urls. These provides us with a quick scan for interesting pages amoung the list of enumerated paths of the web application.

    kali> sudo apt install eyewitness
![screenshot](https://github.com/user-attachments/assets/d0d6a654-da0b-49fa-af03-619109c24f8d)

After getting the screenshot they can be viewed inthe browser window using report.html
![screenshot result](https://github.com/user-attachments/assets/a867c984-7c1b-4cca-b21d-1d654b387f29)

# Waybackurl
The wayback machine is an archive of the entire internet. Basically they go to every website and they crawl it while taking screenshots and logging the data to a database. We can use this data to find interesting files but you can also find vulnerabilities by looking at the data example:If you see the GET parameter “msg=” you can test for XSS. 

    kali> sudo apt install golang -y          #install go first before running the command to install the tool

    kali> sudo  go install github.com/tomnomnom/waybackurls@latest && sudo cp /root/go/bin/waybackurls /usr/bin
![wayback script](https://github.com/user-attachments/assets/566dc546-4a2b-4dae-8e22-a00a9d26adbc)

View results of the scan
![wayback results](https://github.com/user-attachments/assets/8615afca-db74-45f5-ad10-fa79d0ddc10a)



