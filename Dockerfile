FROM alpine:latest

# Install busybox-extras for httpd web server
RUN apk add --no-cache busybox-extras

# Create web root and index file
RUN mkdir -p /www && echo "Proctor Service Running" > /www/index.html

# Expose container port 80
EXPOSE 80

# Print startup message and launch web server to keep container running
CMD ["sh", "-c", "echo 'Proctor Service Running' && httpd -f -p 80 -h /www"]
