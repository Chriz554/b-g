#!/bin/bash
COLOR=$1

if [ "$COLOR" = "blue" ]; then
    sed -i 's/server 127.0.0.1:3002/server 127.0.0.1:3001/' /etc/nginx/conf.d/default.conf
else
    sed -i 's/server 127.0.0.1:3001/server 127.0.0.1:3002/' /etc/nginx/conf.d/default.conf
fi

sudo systemctl reload nginx
echo "Nginx ahora apunta a $COLOR"