#!/bin/bash

set -x

eval `ssh-agent`
ssh-add ben

sudo docker network create chiroposture_network
sudo docker network create meylorCI

setup_nginx() {
	sudo apt-get install nginx
	sudo cp -r etc-letsencrypt/ /etc/letsencrypt/
	sudo cp -r conf.d/ /etc/nginx/conf.d/
}

git_clone_and_cd() {
	PROJECT_DIR=/data/dreampotential
	mkdir -p $PROJECT_DIR
	cd $PROJECT_DIR

	if [ ! -d $2 ]
	then
	    git clone $1 $2
	    cd $2
	else
	    cd $2
	    git pull
	fi

}

git_clone_and_cd 'git@github.com:Dreampotential-org/meylordrive' 'meylordrive'
sudo ./scripts/start.sh
sudo ./scripts/local_db.sh

git_clone_and_cd 'git@github.com:Dreampotential-org/postvideo' 'postvideo'
sudo bash start.sh

git_clone_and_cd 'git@github.com:Dreampotential-org/agentstat' 'agentstat'
sudo bash scripts/start.sh

git_clone_and_cd 'git@github.com:Dreampotential-org/agentstat-svelte' 'agentstat-svelte'
sudo bash scripts/start.sh

git_clone_and_cd 'git@github.com:Dreampotential-org/useiam' 'useiam'
sudo ./scripts/start-prod.sh

git_clone_and_cd 'git@github.com:Dreampotential-org/useiam-site' 'useiam-site'
sudo bash start.sh

git_clone_and_cd 'git@github.com:Dreampotential-org/useiam-server' 'useiam-server'
sudo ./scripts/start.sh
sudo scripts/local_db.sh

git_clone_and_cd 'git@github.com:Dreampotential-org/python-base' 'python-base'
sudo ./scripts/local_db.sh
sudo ./scripts/start.sh

git_clone_and_cd "git@gitlab.com:a4496/django-zillow.git" "django-zillow"
sudo ./scripts/start.sh
sudo ./scripts/start-pg-bouncer.sh
sudo ./scripts/start-db.sh
bash  start-es.sh

git_clone_and_cd "git@github.com:Dreampotential-org/teacher-ui" "teacher-ui"
sudo ./scripts/start.sh


git_clone_and_cd "git@github.com:Dreampotential-org/teacher-ui-react" "teacher-ui-react"
sudo bash start.sh

git_clone_and_cd "git@github.com:Dreampotential-org/dreampotential-site" "dreampotential-site"
sudo bash start.sh

git_clone_and_cd "git@github.com:Dreampotential-org/socket-link" "socket-link"
sudo docker-compose -f docker-compose.yml up -d

git_clone_and_cd "git@github.com:Dreampotential-org/docker-jitsi" "docker-jitsi"
sudo bash start.sh
