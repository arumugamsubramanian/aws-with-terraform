#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
systemctl enable apache2
echo "<html><body><h1>Demo Application</h1></body></html>" > /var/www/html/index.html
