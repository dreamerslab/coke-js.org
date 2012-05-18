#!/bin/bash

# Copy this script to $HOME and run it

path=/srv/www/coke-js.org
tmp=/srv/www/tmp

echo 'Cloning repo from github...'
git clone git@github.com:dreamerslab/coke-js.org.git $tmp
echo '...done!'
echo ''

echo 'Removing development files...'
sudo rm -fr $tmp/source
sudo rm -fr $tmp/doc
echo '...done!'
echo ''

echo 'Stopping nginx...'
sudo nginx -s stop
echo '...done!'
echo ''

echo 'Backing up old version...'
mv $path $path`date +"%Y%m%d%H%M%S"`
echo '...done!'
echo ''

echo 'Switch to latest version...'
mv $tmp $path
echo '...done!'
echo ''

echo 'Starting nginx...'
sudo nginx
echo '...done!'
echo ''