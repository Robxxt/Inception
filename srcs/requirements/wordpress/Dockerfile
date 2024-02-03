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


RUN apt update && \
    apt install -y php-fpm php-mysql curl

COPY ./tools/start.sh /
COPY ./conf/wp-config.php /

RUN chmod +x start.sh
RUN chmod 755 wp-config.php

CMD [ "/start.sh" ]