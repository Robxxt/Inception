FROM debian:11

WORKDIR /web

RUN apt update && \
    apt install -y nginx openssl

COPY tools/script.sh /web/script.sh

RUN chmod +x /web/script.sh

EXPOSE 443

CMD ["/web/script.sh"]