git: Version control system
docker.io: Docker engine
awscli: AWS command-line interface
python3 and python3-pip: Python 3 and its package manager
net-tools: Network configuration tools
default-jre: Default Java Runtime Environment
maven: Java build tool
npm: Node.js package manager
postgresql-client: PostgreSQL database client
mysql-client: MySQL database client
mongodb-clients: MongoDB client tools
redis-tools: Redis command-line interface
kafkacat: Kafka command-line interface
kubectl: Kubernetes command-line interface
kubectx and kubens: Kubernetes context and namespace management tools
terraform: Infrastructure as Code tool

--------------------------------------------------

#!/bin/bash

# Update package lists
sudo apt update

# Install Git
sudo apt install -y git

# Install Docker
sudo apt install -y docker.io

# Install AWS CLI version 2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install Python 3 and pip
sudo apt install -y python3 python3-pip

# Install net-tools
sudo apt install -y net-tools

# Install Java
sudo apt install -y default-jdk

# Install Maven
sudo apt install -y maven

# Install Node.js and npm
sudo apt install -y nodejs npm

# Install PostgreSQL client
sudo apt install -y postgresql-client

# Install MySQL client
sudo apt install -y mysql-client

# Install MongoDB Shell (mongosh)
sudo apt install -y mongodb-clients

# Install Redis CLI
sudo apt install -y redis-tools

# Install Kafka client
sudo apt install -y kafka-client

# Install kubectl
sudo snap install kubectl --classic

# Install kubectx and kubens
git clone https://github.com/ahmetb/kubectx.git ~/.kubectx
sudo ln -s ~/.kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s ~/.kubectx/kubens /usr/local/bin/kubens

# Install Terraform
sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform


---------------------------------------------------------------------------------------------------------------



#!/bin/bash

# Update package lists
sudo apt update

# Install prerequisites

sudo apt install -y \
sudo apt install git  #git version 2.34.1

sudo snap install docker         # version 24.0.5, or
sudo apt  install podman-docker  # version 3.4.4+ds1-1ubuntu1.22.04.2
sudo apt  install docker.io      # version 24.0.5-0ubuntu1~22.04.1
See 'snap info docker' for additional versions.

sudo snap install aws-cli  # version 1.15.58, or
sudo apt  install awscli   # version 1.22.34-1
See 'snap info aws-cli' for additional versions.





No apt package "kubectl", but there is a snap with that name.
Try "snap install kubectl"


No apt package "kubectx", but there is a snap with that name.
Try "snap install kubectx"


No apt package "terraform", but there is a snap with that name.
Try "snap install terraform"



# Install MongoDB Shell (mongosh)
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt update
sudo apt install -y mongodb-mongosh

echo "Prerequisites installation complete."
