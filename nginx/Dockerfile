FROM debian:11

ENV AUTHOR=rdragan
ENV DOMAIN=42.fr
ENV KEY_PATH=/etc/nginx/ssl
ENV CERT_PATH=/etc/nginx/ssl

WORKDIR /web

RUN apt update && \
    apt install -y nginx openssl

COPY tools/script.sh /web/script.sh

RUN chmod +x /web/script.sh

EXPOSE 443

CMD ["/web/script.sh"]