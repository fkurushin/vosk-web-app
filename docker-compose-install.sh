#!/bin/bash
# Установка Docker Compose
COMPOSE VERSION=$(curl -g https://api.github.com/repos/docker/compose/releases/latest | grep 'tag name' | cut -d\" -£4)
sud curl -L https://github.com/docker/compose/releases/download/S{COMPOSE_VERSION]/docker-compose-'uname-g'-'uname-m' > /usr/local/bin/docker-compose 
udo chmod +× /us/local/bin/docker-compose 
printf "InDocker Compose installed successfully\n\n' 
sudo docker-compose -v