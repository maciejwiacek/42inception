#!/bin/bash

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
    echo "Nginx: setting up SSL...";

    openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
        -keyout /etc/ssl/private/nginx.key \
        -out /etc/ssl/certs/nginx.crt \
        -subj "/C=PL/ST=Mazowieckie/L=Warsaw/O=42Warsaw/CN=mwiacek.42.fr";

    echo "Nginx: SSL is set up!";
else
    echo "Nginx: SSL is already set up!";
fi

if ! nginx -t; then
    echo "Nginx: configuration is invalid!";
    exit 1;
fi

echo "Nginx: starting...";
nginx -g "daemon off;"
