#!/bin/bash

# Run this script from anywhere, as somebody who can sudo

path=/home/markshow/markshow
tmp=/tmp/markshow

echo 'Cloning repo from github...'
rm -fr $tmp
git clone git@github.com:ericvicenti/markshow.git $tmp
echo '...done!'
echo ''

echo 'Removing development files...'
sudo rm $tmp/README.md
sudo rm -fr $tmp/docs
echo '...done!'
echo ''

echo 'Switching configs to production mode...'
sudo mv $tmp/configs/env.prod.js $tmp/configs/env.js
sudo mv $tmp/package.prod.json $tmp/package.json
echo '...done!'
echo ''

echo 'Installing dependency modules...'
cd $tmp
sudo npm install -l
echo '...done!'
echo ''

echo 'Stopping monit...'
sudo /etc/init.d/monit stop
sudo monit stop markshow
echo '...done!'
echo ''

echo 'Stopping app server...'
sudo stop markshow
echo '...done!'
echo ''

echo 'Backing up old version...'
sudo mv $path $path`date +"%Y%m%d%H%M%S"`
echo '...done!'
echo ''

echo 'Changing permissions...'
sudo chown -R markshow:markshow $tmp
echo '...done!'
echo ''

echo 'Switch to latest version...'
sudo mv $tmp $path
echo '...done!'
echo ''

echo 'Starting app server...'
sudo start markshow
echo '...done!'
echo ''

echo 'Starting monit...'
sudo /etc/init.d/monit start
sudo monit start markshow
echo '...done!'
echo ''