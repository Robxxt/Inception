FROM debian:11

RUN apt update && \
    apt install -y php-fpm php-mysql curl

COPY ./tools/start.sh /
COPY ./conf/wp-config.php /
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

RUN chmod +x start.sh

CMD [ "/start.sh" ]