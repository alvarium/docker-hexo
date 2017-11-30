#!/usr/bin/env bash

base=/usr/share/nginx/html
source=$app/source
config=$app/_config.yml

if [ ! -d $base ]; then
  echo '/usr/share/nginx/html folder not found!' && exit 1
fi

if [! -d $source ]; then
  echo '/source folder not found! Are you sure you shared the volume?' && exit 1
fi

echo 'Building source files...'
cd $base
if hexo generate --debug; then
  echo 'Build of files was successfull, starting nginx server...'
else
  echo 'There was an error building your site' && exit 1
fi

nginx -g daemon off
