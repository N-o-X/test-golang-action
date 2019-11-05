FROM debian:10

RUN apt update && apt install -y curl git golang mariadb-server redis-server

RUN adduser --disabled-password icingadb

USER icingadb

RUN mkdir -p /home/icingadb/go/bin
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
