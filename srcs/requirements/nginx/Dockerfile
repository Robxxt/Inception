FROM debian:11

RUN apt update && \
    apt install -y nginx openssl

COPY tools/script.sh script.sh

RUN chmod +x script.sh

EXPOSE 443

CMD ["./script.sh"]