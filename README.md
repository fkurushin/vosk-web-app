## ML part

The model is downloaded from https://alphacephei.com/vosk/models and unzipped to a `model` directory

## Backend

`docker build -t backend-server -f Dockerfile.backend .`

`docker run -d --name backend-server -p  2700:2700 backend-server`

## Frontend

`docker build -t frontend-server -f Dockerfile.frontend .`

`docker run -d --name frontend-server -p  8080:8080 frontend-server`