#!/bin/bash
sudo su
yum update -y
yum install httpd -y
echo "<html><h1>Welcome Soumya</h1></html>" > /var/www/html/index.html
service httpd start
chkconfig httpd on