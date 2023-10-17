#!/bin/bash

set -x


ssh-add ben

sudo docker network create chiroposture_network
sudo docker network create meylorCI


cd ~
git clone git@github.com:Dreampotential-org/meylordrive
cd ~/meylordrive
sudo ./scripts/start.sh
sudo ./scripts/local_db.sh
cd ~

# postvideo
git clone git@github.com:Dreampotential-org/postvideo
cd postvideo
sudo bash start.sh
cd ~


# agentstat
git clone git@github.com:Dreampotential-org/agentstat
cd agentstat
sudo bash scripts/start.sh
cd ~

# agentstat-svelte
git clone git@github.com:Dreampotential-org/agentstat-svelte
cd agentstat-svelte
sudo bash scripts/start.sh
cd ~




# useiam services
# git clone git@gitlab.com:devs176/useiam.git
# cd ~/useiam
# sudo ./scripts/start-prod.sh
# cd ~

# git clone git@gitlab.com:devs176/useiam-server.git
# cd ~/useiam-server
# sudo ./scripts/start.sh
# cd ~

git clone git@github.com:Dreampotential-org/python-base
cd ~/python-base
sudo ./scripts/local_db.sh
cd ~

git clone git@gitlab.com:a4496/django-zillow.git
cd ~/django-zillow
sudo apt-get install nginx
sudo ./scripts/start.sh
sudo ./scripts/start-pg-bouncer.sh
sudo ./scripts/start-db.sh
sudo cp -r etc-letsencrypt/ /etc/letsencrypt/
sudo cp -r conf.d/ /etc/nginx/conf.d/jj@jj-HP-Laptop-15-dy2xxx
# start-es.sh
cd ~


git clone git@github.com:Dreampotential-org/teacher-ui
cd ~/teacher-ui/
sudo ./scripts/start.sh
cd ~

git clone git@github.com:Dreampotential-org/teacher-ui-react
cd ~/teacher-ui/
sudo bash start.sh
cd ~


git clone git@github.com:Dreampotential-org/dreampotential-site
cd ~/teacher-ui/
sudo bash start.sh
cd ~

git clone git@github.com:Dreampotential-org/socket-link
cd ~/socket-link/
sudo docker-compose -f docker-compose.yml up -d
cd ~


git clone git@github.com:Dreampotential-org/docker-jitsi
cd ~/docker-jitsi
sudo bash start.sh
cd ~







