
`docker build -t backend-server -f docker/backend-server/Dockerfile .`
`docker run -d --name backend-server -p  2700:2700 vosk-backend-server`

the model is downloaded from https://alphacephei.com/vosk/models and unzipped to a `model` directory