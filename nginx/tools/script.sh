#!/bin/sh

mkdir -p $CERT_PATH

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $CERT_PATH/$AUTHOR.key \
    -out $CERT_PATH/$AUTHOR.crt -subj "/C=DE/ST=Baden-Württemberg/L=Heilbronn/O=42Heilbronn/OU=42Heilbronnal Unit/CN=Common Name"

cat <<EOF > /etc/nginx/nginx.conf
worker_processes auto;

events {
    worker_connections 1024;
    multi_accept on;
}

http {

    server {
        listen 443 ssl;
        server_name $AUTHOR;

        ssl_certificate $CERT_PATH/$AUTHOR.crt;
        ssl_certificate_key $CERT_PATH/$AUTHOR.key;

        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_ciphers 'TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384';

        ssl_prefer_server_ciphers off;

        # Other server configurations...
    }
}

EOF

nginx -g 'daemon off;'