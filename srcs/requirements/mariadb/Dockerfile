FROM debian:11

EXPOSE 3306
WORKDIR /db

RUN apt update && \
    apt install -y mariadb-server

COPY tools/setup_db.sh .
RUN chmod +x setup_db.sh

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

CMD ["./setup_db.sh"]