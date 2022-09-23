#!/bin/bash

git config --global core.editor "vim"

sudo apt-get update

sudo apt-get install git docker.io python3-pip python3-virtualenv

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
