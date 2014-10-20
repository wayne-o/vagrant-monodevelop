#!/usr/bin/env bash
apt-get update

apt-get install -y mono-complete monodevelop mono-addins-utils gtk-sharp2 gnome-sharp2 autoconf automake git

mozroots --import --sync

yes | certmgr -ssl https://go.microsoft.com
yes | certmgr -ssl https://nugetgallery.blob.core.windows.net
yes | certmgr -ssl https://nuget.org
yes | certmgr -ssl https://www.myget.org/F/aspnetvnext/

mozroots --import --machine --sync

yes | certmgr -ssl -m https://go.microsoft.com
yes | certmgr -ssl -m https://nugetgallery.blob.core.windows.net
yes | certmgr -ssl -m https://nuget.org
yes | certmgr -ssl -m https://www.myget.org/F/aspnetvnext/

git clone https://github.com/mono/monodevelop.git /home/vagrant/monodevelop

cd /home/vagrant/monodevelop

git submodule update --init --recursive

./configure --profile=stable ; make 

make install

mkdir /tmp/nuget

sudo chown vagrant /tmp/nuget

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

apt-get update

apt-get -y install google-chrome-stable
