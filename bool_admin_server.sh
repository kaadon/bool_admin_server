#!/bin/env bash

cd /www/webhook/dev_bool_admin/bool_admin_server

git checkout master

git fetch --all 

git reset --hard origin/master 

git pull 

git branch

echo "执行完毕!"