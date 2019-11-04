FROM golang:1.13 

RUN apt update && apt install -y  mariadb-server redis-server
RUN go get -u github.com/golang/dep/cmd/dep

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
