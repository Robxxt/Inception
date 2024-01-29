# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rdragan <rdragan@student.42heilbronn.de    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/29 15:58:20 by rdragan           #+#    #+#              #
#    Updated: 2024/01/29 16:31:59 by rdragan          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

mkdir -p $CERT_PATH

openssl genpkey -algorithm RSA -out $CERT/$AUTHOR.key -aes256
openssl req -new -key -out $CERT_PATH/$AUTHOR.key $CERT_PATH/$AUTHOR.crt
openssl x509 -req -days 365 -in $CERT_PATH/$AUTHOR.csr -signkey $CERT_PATH/$AUTHOR.key -out $CERT_PATH/$AUTHOR.crt

cat <<EOF > /etc/nginx/nginx.conf
events {
    worker_processes auto;
    worker_connections 1024;
    multi_accept on;
}

http {

    server {
        listen 443 ssl;
        server_name $AUTHOR;

        ssl_certificate $CERT/$AUTHOR.crt;
        ssl_certificate_key $CERT_PATH/$AUTHOR.key;

        ssl_protocols TLSv1.2;
        ssl_ciphers 'TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384';
        ssl_prefer_server_ciphers off;

        # Other server configurations...
    }
}
EOF

nginx -g 'daemon off;'