#!/bin/bash
COLOR=$1

if [ "$COLOR" = "blue" ]; then
<<<<<<< HEAD
    sed -i 's/server 127.0.0.1:9081/server 127.0.0.1:9080/' /etc/nginx/conf.d/default.conf
else
    sed -i 's/server 127.0.0.1:9080/server 127.0.0.1:9081/' /etc/nginx/conf.d/default.conf
=======
    NEW_LINE="server 127.0.0.1:3001;"
elif [ "$COLOR" = "green" ]; then
    NEW_LINE="server 127.0.0.1:3002;"
else
    echo "Uso: switch.sh [blue|green]"
    exit 1
>>>>>>> e1b59b4b3440297f57f563922c6e9b2f1f34733c
fi

sudo sed -i "s|#ACTIVE_APP|$NEW_LINE|" /etc/nginx/conf.d/default.conf
sudo systemctl reload nginx

echo "Nginx apunta ahora a $COLOR"
