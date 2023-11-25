# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    generate_ssl_certificate.sh                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rdragan <rdragan@student.42heilbronn.de    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/24 18:21:19 by rdragan           #+#    #+#              #
#    Updated: 2023/11/24 18:34:37 by rdragan          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

if [ ! -d "ssl-certs" ]; then
    mkdir ssl-certs
fi

if [ ! -f "ssl-certs/secret.pem" ]; then
    # Generate private key
    openssl genpkey -algorithm RSA -out ssl-certs/secret.pem
fi

if [ ! -f "ssl-certs/certificate.csr" ]; then
    # Generate a certificate signing request (CSR)
    openssl req -new -key ssl-certs/secret.pem -out ssl-certs/certificate.csr
fi

if [ ! -f "ssl-certs/certificate.crt" ]; then
    # Generate a self signed certificate
    openssl x509 -req -days 365 -in ssl-certs/certificate.csr -signkey ssl-certs/secret.pem -out ssl-certs/certificate.crt
fi