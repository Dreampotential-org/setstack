#!/bin/bash

sudo docker network create chiroposture_network
sudo docker network create meylorCI

# desktop
git clone git@gitlab.com:devs176/docker-ubuntu.git
cd docker-ubuntu
sudo bash start.sh


# agentstat 
git clone git@gitlab.com:a4496/agentstat.git
cd agentstat
sudo bash scripts/start.sh
cd ~

# useiam services
git clone git@gitlab.com:devs176/useiam.git
cd ~/useiam
sudo ./scripts/start-prod.sh
cd ~

git clone git@gitlab.com:devs176/useiam-server.git
cd ~/useiam-server
sudo ./scripts/start.sh
cd ~

# django zillow services
git clone git@gitlab.com:a4496/python-base.git
cd ~/python-base
sudo ./scripts/local_db.sh
cd ~

git clone git@gitlab.com:a4496/django-zillow.git
cd ~/django-zillow
sudo ./scripts/start.sh
sudo ./scripts/start-pg-bouncer.sh
sudo ./scripts/start-db.sh
# start-es.sh
cd ~


git clone git@gitlab.com:devs176/teacher-ui.git
cd ~/teacher-ui/
sudo ./scripts/start.sh
cd ~

git clone git@gitlab.com:a4496/meylorci.git
cd ~/meylorci
sudo ./scripts/start.sh
sudo ./scripts/local_db.sh
cd ~


