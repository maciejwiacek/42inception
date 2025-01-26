FROM debian:buster

# Intall nginx and openssl
RUN apt update && apt install -y nginx openssl

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Copy the configuration files and the script to start the server
COPY ./conf/default /etc/nginx/sites-enabled/default

# Copy the start script and make it executable
COPY ./tools/nginx-run.sh /var/www/nginx-run.sh
RUN chmod +x /var/www/nginx-run.sh

# Run the start script
CMD ["/var/www/nginx-run.sh"]
