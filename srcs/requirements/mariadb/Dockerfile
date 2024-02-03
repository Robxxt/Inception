FROM debian:11
ENV DB_NAME=wordpress
ENV DB_USER=rdragan
ENV DB_PASSWORD=1234
ENV AUTHOR=rdragan
ENV DOMAIN=42.fr
ENV CERT_PATH=/etc/nginx/ssl
ENV WP_TITLE=helloWorld
ENV WP_ADMIN_EMAIL=rdragan@student.42heilbronn.de
ENV WP_SECOND_USER=hi
ENV WP_SECOND_PASSWORD=123
ENV WP_SECOND_USER_EMAIL=example@example.com
EXPOSE 3306
WORKDIR /db

RUN apt update && \
    apt install -y mariadb-server

COPY tools/setup_db.sh .
RUN chmod +x setup_db.sh

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

# CMD ["./setup_db.sh"]