#!/bin/bash

PROJECT_DIR=/data/dreampotential
set -x

do_linux_install() {
   sudo apt-get update
	sudo apt-get -y install htop vim docker docker-compose htop nginx git python3-pip python3-virtualenv python3-certbot-apache net-tools certbot python3-certbot-nginx npm libffi-dev cmake libjpeg-dev zlib1g-dev


   sudo usermod -aG docker $USER
}

setup_ssh() {
	eval `ssh-agent`
	chmod 600 ben
	git config --global core.editor "vim"
	git config --global user.name "Ben viP"
	git config --global user.email "bengg2040@gmail.com"
	ssh-add ben
}

do_mac_install() {

	if [[ "$(uname)" == "Darwin" ]]; then
			  # install homebrew
			  export HOMEBREW_NO_INSTALL_FROM_API=1
			  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

			  # Install Cask
			  brew install caskroom/cask/brew-cask
			  # Install docker toolbox
			  brew cask install docker-toolbox
	fi
}

setup_nginx() {
	sudo apt-get install nginx
	sudo cp -r etc-letsencrypt/ /etc/letsencrypt/
	sudo cp -r conf.d/ /etc/nginx/conf.d/
}

git_clone_and_cd() {
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

setup_ssh
do_mac_install
do_linux_install

sudo docker network create chiroposture_network
sudo docker network create meylorCI

git_clone_and_cd 'git@github.com:Dreampotential-org/MSARHP' 'MSARHP'
cd codes && sudo bash start.sh

git_clone_and_cd 'git@github.com:Dreampotential-org/streamsphere' 'streamsphere'
sudo docker-compose -f docker-compose.dev.yml up -d

git_clone_and_cd 'git@github.com:Dreampotential-org/chatai' 'chatai'
sudo docker-compose -f docker-compose.yml up -d

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

git_clone_and_cd "git@github.com:Dreampotential-org/bikerescue" "bikerescue"
sudo ./scripts/start.sh


# git_clone_and_cd "git@github.com:Dreampotential-org/docker-jitsi" "docker-jitsi"
# sudo bash start.sh

git_clone_and_cd "git@github.com:Dreampotential-org/actionj" "actionj"
sudo ./scripts/start.sh


git_clone_and_cd "git@github.com:Dreampotential-org/imap-service" "imap-service"
sudo docker-compose -f docker-compose.yml up -d
sudo docker-compose -f docker-compose-postgres.yml up -d

git_clone_and_cd "git@github.com:Dreampotential-org/vstream" "vstream"
sudo docker-compose -f docker-compose.yml up -d


git_clone_and_cd "git@github.com:Dreampotential-org/agentstat-admin" "agentstat-admin"
sudo bash ./scripts/start.sh

git_clone_and_cd "git@github.com:nsnw/etherpad-docker-compose.git" "epad"
sudo docker-compose -f docker-compose.yml up -d
