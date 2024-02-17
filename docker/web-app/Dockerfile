FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y python3 python3-pip git libavdevice-dev libavfilter-dev libopus-dev libvpx-dev pkg-config &&\
    apt-get clean && apt-get autoclean

RUN pip3 install aiortc aiohttp google-crc32c numpy

WORKDIR /app

COPY *.py .
COPY servers.json .
COPY static/* static/

ENTRYPOINT ["python3", "/app/server.py", "--servers", "/app/config/docker.json"]
