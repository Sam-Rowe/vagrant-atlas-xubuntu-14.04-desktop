#!/bin/bash
#
# Setup the the box. This runs as root

apt-get -y update
apt-get --assume-yes upgrade

# Bit of a tidy up first
apt-get -y purge avahi-daemon #conflicts with 7digital Windows AD .local domain
apt-get -y purge gnumeric
apt-get -y purge abiword
apt-get -y purge thunderbird

# Add the low-level libs
apt-get -y install libavcodec-extra
apt-get -y install gdebi-core
apt-get -y install zlib1g-dev
apt-get -y install build-essential
apt-get -y install libssl-dev
apt-get -y install libreadline-dev
apt-get -y install libyaml-dev
apt-get -y install libsqlite3-dev
apt-get -y install sqlite3
apt-get -y install libxml2-dev
apt-get -y install libxslt1-dev
apt-get -y install libcurl4-openssl-dev
apt-get -y install python-software-properties
apt-get -y install libffi-dev
apt-get -y install autoconf

#os level services
apt-get -y install openssh-server
apt-get -y install openssh-client

#geek tools
apt-get -y install git-core
apt-get -y install git
apt-get -y install git-gui
apt-get -y install ack-grep
apt-get -y install curl
apt-get -y install geany
apt-get -y install tree
apt-get -y install tmux
apt-get -y install vim
apt-get -y install rar
apt-get -y install unzip

apt-get -y install aptitude
apt-get -y install synaptic

#Eye candy
debconf-set-selections <<< 'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true'
apt-get -y install xubuntu-restricted-extras
apt-get -y install gnome-system-monitor
apt-get -y install vlc
apt-get -y install gksu
apt-get -y install gparted
apt-get -y install remmina
apt-get -y install libreoffice

#tidy up before we leave
apt-get -y autoremove
apt-get -y autoclean
apt-get -y clean
