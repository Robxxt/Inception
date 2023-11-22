FROM alpine:3.18

WORKDIR /usr/src/nginx

RUN apk update && \
    apk add nginx && \
    rm -rf /var/cache/apk/*

CMD ["nginx", "-g", "daemon off;"]