#!/bin/bash

PROJECT_DIR=/data/dreampotential
set -x

do_linux_install() {


   # XXX do something to backup the persons profile 
   cp .profile ~/.profile
   . ~/.profile


   sudo apt-get update
   sudo apt-get -y install htop vim docker-compose htop nginx git python3-pip python3-virtualenv net-tools npm libffi-dev cmake libjpeg-dev zlib1g-dev vim wget git

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

setupcordova() { 
	sudo npm install -g cordova
	wget -c https://services.gradle.org/distributions/gradle-7.4.2-bin.zip -P /tmp
	unzip -d /opt/gradle /tmp/gradle-*.zip

	# need to download android studio & manually download build-tools

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

setupnginx() {
	sudo apt-get install nginx
	sudo cp -r certbot/conf/* /etc/letsencrypt/
	sudo cp -r conf.d/* /etc/nginx/conf.d/
	service nginx restart
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

sudo mkdir -p /data
sudo chown `whoami` /data
setup_ssh
setupnginx
do_mac_install
do_linux_install

# mdadm --create --verbose /dev/md0 --level=0 --raid-devices=2 /dev/sda /dev/sdb
# mkfs.ext4 /dev/md0/
# mkdir /data
# chown arosen:rethinkdb-PG0 /data

ssh-keyscan github.com >> ~/.ssh/known_hosts


git_clone_and_cd 'git@github.com:Dreampotential-org/docker-webtop' 'docker-webtop'
git checkout kde
bash start.sh



git_clone_and_cd 'git@github.com:Dreampotential-org/rtb' 'rtb'
cd codes && sudo bash start.sh


git_clone_and_cd 'git@github.com:Dreampotential-org/Wppf' 'Wppf'
cd codes && sudo bash start.sh

git_clone_and_cd 'git@github.com:Dreampotential-org/dreampotential-site' 'dreampotential-site'
cd codes && sudo bash start.sh

git_clone_and_cd 'git@github.com:Dreampotential-org/MSARHP' 'MSARHP'
cd codes && sudo bash start.sh

git_clone_and_cd 'git@github.com:Dreampotential-org/streamsphere' 'streamsphere'
sudo bash start.sh

git_clone_and_cd 'git@github.com:Dreampotential-org/chatai' 'chatai'
sudo docker-compose -f docker-compose.yml up -d

git_clone_and_cd 'git@github.com:Dreampotential-org/meylordrive' 'meylordrive'
sudo ./scripts/startdb.sh
sudo ./scripts/start.sh

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
