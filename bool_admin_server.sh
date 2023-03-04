#!/bin/env bash

ROOT_PATH=/www/webhook/dev_bool_admin/bool_admin_server

cd $ROOT_PATH

git checkout master

git fetch --all 

git reset --hard origin/master 

git pull 

git branch

#rm -rf $ROOT_PATH/composer.lock

#rm -rf $ROOT_PATH/vendor

#rm -rf $ROOT_PATH/runtime/*

#composer install

echo "执行完毕!"