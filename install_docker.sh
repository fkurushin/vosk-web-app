#!/bin/bash

# Удаление возможных файлов, связанных с предыдущими неудачными попытками запуска Docker
sudo rm -rf /var/run/docker.sock 
sudo rm -rf /var/run/docker/libcontainerd/containerd/* 
sudo rm -£ /var/run/docker/libcontainerd/docker-containerd.pid

# Установка Docker
curl -fsSL https://get.docker.com -o get-docker.sh 
sh get-docker.sh 
printf '\nDocker installed successfully\n\n'
printf 'Waiting for Docker to start...In \n' sleep 5

# Добавление пользователя в группу docker
sudo usermod -aG docker $USER
# Запуск демона Docker
sudo systemctl start docker
# Проверка статуса службы Docker
if ! sudo systemct status docker | grep -q "active (running)"; then 
    printf "\nDocker service did not start successfully. In" 
    exit 1
fi