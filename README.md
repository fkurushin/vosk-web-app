## ML part

The model is downloaded from https://alphacephei.com/vosk/models and unzipped to a `model` directory

## Backend

`docker build -t backend-server -f Dockerfile.backend .`

`docker run -d --name backend-server -p  5050:5050 backend-server`

## Frontend

`docker build -t frontend-server -f Dockerfile.frontend .`

`docker run -d --name frontend-server -p  8080:8080 frontend-server`

https://minikube.sigs.k8s.io/docs/start/

## Deploy on a local k8s cluster

minikube start –driver=docker

`docker build -t backend-server -f Dockerfile.backend .`
`docker build -t frontend-server -f Dockerfile.frontend .`

<!-- docker save frontend-server:latest > images/frontend-server:latest.tar
docker save backend-server:latest > images/backend-server:latest.tar -->

docker save frontend-server:latest | (eval $(minikube docker-env) && docker load)
docker save backend-server:latest | (eval $(minikube docker-env) && docker load)

<!-- docker load -i images/frontend-server:latest.tar

docker commit 43ac12e4115b frontend-server:latest -->

<!-- kubectl apply -f deploy/backend/svc.yml -->

<!-- kubectl apply -f deploy/frontend/svc.yml -->

<!-- kubectl get pods -->

<!-- minikube dashboard -->



