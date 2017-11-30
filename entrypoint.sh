#!/usr/bin/env bash

base=/app
source=$base/source
config=$base/_config.yml

if [ ! -d $base ]; then
  echo '/app folder not found!' && exit 1
fi

if [ ! -d $source ]; then
  echo '/source folder not found! Are you sure you shared the volume?' && exit 1
fi

echo 'Building source files...'
cd $base
if ! npm install; then
  echo 'NPM install returned an error, exiting...' && exit 1
fi
if hexo generate --debug; then
  echo "Build of files was successfull, nginx server should start now at port ${PORT}"
else
  echo 'There was an error building your site' && exit 1
fi

nginx -g "daemon off;"
