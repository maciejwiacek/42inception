#!/bin/bash

if [ ! -f /etc/ssl/private/nginx.crt ]; then
    echo "Generating SSL certificate..."

    openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=PL/ST=Mazowieckie/L=Warsaw/O=42Warsaw/CN=mwiacek.42.fr"

    echo "SSL certificate generated."
fi

echo "Starting Nginx..."
nginx -g "daemon off;"
