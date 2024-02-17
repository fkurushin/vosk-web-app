#!/bin/bash

sudo apt-get update

sudo apt-get install -y python3 python3-pip git libavdevice-dev libavfilter-dev libopus-dev libvpx-dev pkg-config

pip3 install aiortc aiohttp google-crc32c numpy

git clone git@github.com:fkurushin/vosk-web-app.git

cd vosk-web-app

python3 server.py --servers servers.json
