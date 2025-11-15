#!/bin/bash
if [[ $1 == "blue" ]]; then
    sudo sed -i 's/3002/3001/' /etc/nginx/nginx.conf
    echo "Switched to BLUE"
elif [[ $1 == "green" ]]; then
    sudo sed -i 's/3001/3002/' /etc/nginx/nginx.conf
    echo "Switched to GREEN"
else
    echo "Use: ./switch.sh [blue|green]"
    exit 1
fi

sudo systemctl restart nginx