FROM golang:1.13 

COPY entrypoint.sh /entrypoint.sh
RUN go get -u github.com/golang/dep/cmd/dep

ENTRYPOINT ["/entrypoint.sh"]
