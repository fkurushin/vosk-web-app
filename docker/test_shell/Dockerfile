FROM ubuntu

RUN apt-get update && apt-get install -y vim
WORKDIR /scripts

COPY install/build_back.sh .
COPY install/build_front.sh .

# so i can access the web interface
EXPOSE 8080

CMD ["/bin/bash"]