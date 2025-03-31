#!/bin/bash
#OWNER:ASHOK
#MAILID:ashok.tech33@gmail.com
#USECASE:isalling,configuring,start,verifying Nginx
#cREATE DATE:01-04-2024
#COMMENTS:nginx-setup

echo "update the packages"

sudo apt update -y

echo "installing nginx"

sudo apt install nginx -y

echo "start nginx service"

sudo systemctl start nginx.service

echo "enable the nginx service"

sudo systemctl enable nginx.service

#if new server nettools are not available in ubuntu

echo "installing net-tools"

sudo apt install net-tools

echo "verifying nginx port is running or not"

sudo netstat -ntpl

echo "verifying nginx procees is running on not"

sudo ps -ef | grep nginx

echo "check the nginx accsessing in local/Http ststus code"

sudo curl -I localhost
sudo curl -I localhost:80
sudo curl -I http:localhost:80

sudo curl -I 127.0.0.1
sudo curl -I 127.0.0.1:80
sudo curl -I http:127.0.0.1:80

ip_address=$(hostname -I | awk '{print $1}')

curl -I $echo ${ip_address}:8080
curl -I http://$echo${ip_address}:8080
sudo curl -I $echo ${ip_address}:80

echo "nginx installing,start,enable,verify port/proses/status codes verifying success"

acessing nginx from outside

server ip:80(nginxt port)

                                                                   
