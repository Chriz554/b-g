#!/bin/bash
COLOR=$1

if [ "$COLOR" = "blue" ]; then
    UPSTREAM_PORT=9080
elif [ "$COLOR" = "green" ]; then
    UPSTREAM_PORT=9081
else
    echo "Debe indicar blue o green"
    exit 1
fi

# Reemplaza current_app en nginx
sudo sed -i "s|server 127.0.0.1:[0-9]\+;|server 127.0.0.1:$UPSTREAM_PORT;|g" /etc/nginx/conf.d/default.conf

# Recarga nginx
sudo systemctl reload nginx

echo "Nginx apunta ahora a $COLOR"
