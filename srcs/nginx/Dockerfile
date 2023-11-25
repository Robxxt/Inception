# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rdragan <rdragan@student.42heilbronn.de    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/24 17:30:07 by rdragan           #+#    #+#              #
#    Updated: 2023/11/24 18:20:56 by rdragan          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Use the Alpine Linux base image
FROM alpine:latest

# Install Nginx
RUN apk update && apk add nginx

# Create the necessary directories
RUN mkdir -p /run/nginx

# Expose the port that Nginx will listen on
EXPOSE 443

# Copy ssl-cert
COPY conf/ssl-certs /etc/nginx/ssl-certs
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Start Nginx in the foreground
# With daemon off we make sure to run nginx in the foreground
# We want to run nginx in foreground because the main process of the container
# is expected by docker to be running on the foreground.
# one reason is because in that way we make sure to output the logs to the stdout or stderr
# of the container and review them with docker logs
CMD ["nginx", "-g", "daemon off;"]