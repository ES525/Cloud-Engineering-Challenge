FROM nginx:alpine
# Copy the config and webpage
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html

# FORCE the certificates into the image (The Fix)
COPY certs/server.crt /etc/nginx/ssl/server.crt
COPY certs/server.key /etc/nginx/ssl/server.key

EXPOSE 443