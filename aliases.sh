#!/bin/bash
shopt -s expand_aliases
alias dbuild='docker-compose build'
alias dup='docker-compose up -d'
alias dstop='docker-compose stop'
alias drun='docker-compose run -d --service-ports nginx'
alias dcomposer='docker-compose run composer'
alias dcomposer-create='docker-compose run composer create-project laravel/laravel /var/www --prefer-dist'
alias dpermit='chmod -R 777 www'
alias dartisan='docker-compose run artisan'
alias dnodejs='docker-compose run nodejs'
alias dgulp='docker-compose run nodejs gulp'
alias dgulp-watch='docker-compose run -d nodejs gulp watch'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dstats='docker stats $(docker ps -q)'
alias dkill='docker stop $(docker ps -q)'
alias drm='docker rm $(docker ps -a -q)'

