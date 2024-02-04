#!/bin/sh

mkdir -p "$CERT_PATH"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "$CERT_PATH/$AUTHOR.key" \
    -out "$CERT_PATH/$AUTHOR.crt" -subj "/C=DE/ST=Baden-Württemberg/L=Heilbronn/O=42Heilbronn/OU=42Heilbronn Unit/CN=Common Name"

cat <<EOF > /etc/nginx/nginx.conf
worker_processes auto;

events {
    worker_connections 1024;
    multi_accept on;
}

http {

    server {
        listen 443 ssl;
        root    /var/www/html;
        index index.php index.html;
        server_name $AUTHOR.$DOMAIN;

        ssl_certificate "$CERT_PATH/$AUTHOR.crt";
        ssl_certificate_key "$CERT_PATH/$AUTHOR.key";

        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_ciphers 'TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384';
        ssl_session_timeout 10m;
        keepalive_timeout 70;
        ssl_prefer_server_ciphers off;

        # Other server configurations...
        location / {
            try_files \$uri /index.php?\$args /index.html;
            add_header Last-Modified \$date_gmt;
            add_header Cache-Control 'no-store, no-cache';
            if_modified_since off;
            expires off;
            etag off;
        }
        location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass wordpress:9000;
            fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
            fastcgi_param PATH_INFO \$fastcgi_path_info;
            fastcgi_buffer_size 128k;
            fastcgi_buffers 4 256k;
            fastcgi_busy_buffers_size 256k;
        }
    }
}

EOF

nginx -g 'daemon off;'
