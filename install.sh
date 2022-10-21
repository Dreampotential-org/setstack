#!/bin/bash

git config --global core.editor "vim"
git config --global user.name "Ben viP"
git config --global user.email "bengg2040@gmail.com"

sudo apt-get update

sudo apt-get install git docker.io python3-pip python3-virtualenv certbot python3-certbot-apache net-tools
sudo apt install certbot python3-certbot-nginx npm

# python-base
sudo apt install libffi-dev cmake libjpeg-dev zlib1g-dev

sudo usermod -aG docker $USER

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
