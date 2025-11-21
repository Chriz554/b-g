#!/bin/bash
COLOR=$1

if [ "$COLOR" = "blue" ]; then
    NEW_LINE="server 127.0.0.1:3001;"
elif [ "$COLOR" = "green" ]; then
    NEW_LINE="server 127.0.0.1:3002;"
else
    echo "Uso: switch.sh [blue|green]"
    exit 1
fi

sudo sed -i "s|#ACTIVE_APP|$NEW_LINE|" /etc/nginx/conf.d/default.conf
sudo systemctl reload nginx

echo "Nginx apunta ahora a $COLOR"
