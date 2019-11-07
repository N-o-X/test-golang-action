FROM debian:10

RUN apt update && apt install -y curl git golang mariadb-server redis-server

RUN adduser --disabled-password icingadb
RUN usermod -a -G root icingadb

USER icingadb

RUN mkdir -p /home/icingadb/go/bin
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

COPY entrypoint.sh /entrypoint.sh

USER root

ENTRYPOINT ["/entrypoint.sh"]
