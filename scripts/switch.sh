#!/bin/bash

set -e

ENV_FILE=".env"

# Si no existe el archivo .env, crearlo
if [ ! -f "$ENV_FILE" ]; then
    echo "CURRENT_PRODUCTION=blue" > "$ENV_FILE"
fi

# Cargar variables del .env
source "$ENV_FILE"

# Asegura permisos de ejecución siempre que se ejecute
chmod +x ./deploy_blue.sh ./deploy_green.sh

COLOR="$CURRENT_PRODUCTION"

if [ "$COLOR" = "blue" ]; then
    ./deploy_blue.sh
    UPSTREAM_PORT=9080
    START_CONTAINER="app_blue"
    STOP_CONTAINER="app_green"
elif [ "$COLOR" = "green" ]; then
    ./deploy_green.sh
    UPSTREAM_PORT=9081
    START_CONTAINER="app_green"
    STOP_CONTAINER="app_blue"
else
    echo "Debe indicar blue o green"
    exit 1
fi

echo "→ Iniciando $START_CONTAINER..."
docker start "$START_CONTAINER" 2>/dev/null || echo "$START_CONTAINER ya estaba iniciado"

echo "→ Deteniendo $STOP_CONTAINER..."
docker stop "$STOP_CONTAINER" 2>/dev/null || echo "$STOP_CONTAINER ya estaba detenido"

# Cambiar upstream en nginx
echo "→ Cambiando NGINX a puerto $UPSTREAM_PORT…"
sudo sed -i "s|server 127.0.0.1:[0-9]\+;|server 127.0.0.1:$UPSTREAM_PORT;|g" /home/cris/Blue-Green/nginx/default.conf

# Recargar nginx
echo "→ Recargando NGINX…"
sudo systemctl reload nginx

echo "✔ NGINX ahora apunta a $COLOR (puerto $UPSTREAM_PORT)"
