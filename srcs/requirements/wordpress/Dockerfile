FROM debian:11

RUN apt update && \
    apt install -y php-fpm php-mysql curl

COPY ./tools/start.sh /
COPY ./conf/wp-config.php /


CMD [ "/script.sh" ]