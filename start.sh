#!/bin/bash
apt update && apt install git ansible -y
git clone https://Drobkov@bitbucket.org/Drobkov/userplus-webserver-ubuntu.git
rm -rf userplus-webserver-ubuntu/.git
MYSQLROOTPASS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)
sed -i "s/password/$MYSQLROOTPASS/" userplus-webserver-ubuntu/vars/main.yml
ansible-playbook -i  userplus-webserver-ubuntu/hosts userplus-webserver-ubuntu/start.yml