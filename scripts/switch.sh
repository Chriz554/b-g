#!/bin/bash
COLOR=$1

if [ "$COLOR" = "blue" ]; then
    sed -i 's/server 127.0.0.1:9081/server 127.0.0.1:9080/' /etc/nginx/conf.d/default.conf
else
    sed -i 's/server 127.0.0.1:9080/server 127.0.0.1:9081/' /etc/nginx/conf.d/default.conf
fi

sudo sed -i "s|#ACTIVE_APP|$NEW_LINE|" /etc/nginx/conf.d/default.conf
sudo systemctl reload nginx

echo "Nginx apunta ahora a $COLOR"
