#!/bin/bash
#OWNER:ASHOK
#MAILID:ashok.tech33@gmail.com
#USECASE:isalling,configuring,start,verifying Nginx
#cREATE DATE:01-04-2024
#COMMENTS:nginx-setup

#update the packages
sudo apt update -y
#installing java
sudo apt install fontconfig openjdk-17-jre -y
#check java version
java -version
#insatll jenkins
#add jenkins-key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
#add jenkins repo
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
#update again packages
sudo apt-get update -y
#enter jenkins install command
sudo apt-get install jenkins -y
#start jenkins serbice
sudo systemctl start jenkins.service
#enable jenkins
sudo systemctl enable jenkins.service
#check jenkins port running or not
#if new server nettools are not available in ubuntu
#installing net-tools
sudo apt install net-tools
netstat -ntpl
#checking jenkins process running or not
ps -ef | grep jenkins
#accessing from local/check Http status codes

curl -I localhost:8080
curl -I http://localhost:8080


curl -I 127.0.0.1:8080
curl -I http://127.0.0.1:8080

ip_address=$(hostname -I | awk '{print $1}')

curl -I $echo ${ip_address}:8080
curl -I http://$echo${ip_address}:8080

echo "jenkins install,start,enable,vrify port/process and local accessing is sucussfully"
