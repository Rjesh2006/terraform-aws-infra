#!bin/bash
sudo apt update 
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx 

echo "<h1> Here we have created this nginix for the server ec2 during  provisioning time via the terraform. </h1>" > /var/www/html/index.html   #now putiin some think here so that if aces the public ip of the ec2 server it will displayed on the page 


